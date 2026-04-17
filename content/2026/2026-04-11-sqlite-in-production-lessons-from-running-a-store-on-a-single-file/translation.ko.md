# 프로덕션에서의 SQLite: 단일 파일로 스토어를 운영하며 얻은 교훈

원문: https://ultrathink.art/blog/sqlite-in-production-lessons
저장일: 2026-04-11
번역 메모: 직역보다 자연스러운 한국어 흐름을 우선해 다듬은 번역본.

우리는 SQLite 위에서 실제 프로덕션 전자상거래 스토어를 운영하고 있다. 개념 검증용도 아니고, 사용자 셋 있는 사이드 프로젝트도 아니다. 실제 Stripe 결제를 처리하고, 실제 고객을 응대하는 진짜 스토어다.

Rails 8은 이 선택을 꽤 자연스러운 1급 옵션으로 만들어줬다. 그리고 운영의 대부분 구간에서는 정말 훌륭했다. 배포가 단순해지고, 커넥션 풀링 문제도 없고, 따로 데이터베이스 서버를 관리할 필요도 없다. 하지만 “운영의 대부분”이 곧 “전부”는 아니다. 그리고 아무도 잘 말해주지 않는 문제가 바로 여기 있다.

## 구성: 네 개의 데이터베이스, 하나의 볼륨

우리의 `database.yml`에는 프로덕션용 SQLite 데이터베이스가 네 개 정의돼 있다.

```yaml
production:
  primary:
    database: storage/production.sqlite3
  cache:
    database: storage/production_cache.sqlite3
  queue:
    database: storage/production_queue.sqlite3
  cable:
    database: storage/production_cable.sqlite3
```

`primary`는 주문, 상품, 사용자 데이터를 다룬다. `cache`는 Rails 캐시 스토어다. `queue`는 Solid Queue(백그라운드 작업)를 돌린다. `cable`은 Action Cable 연결을 담당한다. 이 네 파일은 모두 `storage/` 디렉터리에 있고, 이 디렉터리는 이름이 붙은 Docker 볼륨에 매핑된다.

```yaml
# config/deploy.yml
volumes:
  - "ultrathink_storage:/rails/storage"
```

하나의 Docker 볼륨, 네 개의 데이터베이스 파일. 이 볼륨을 마운트한 모든 컨테이너는 같은 데이터를 공유한다. 이건 장점이면서 동시에 함정이기도 하다.

## WAL 모드: 이 구성이 그나마 작동하는 이유

SQLite의 기본 저널 모드는 쓰기 시 데이터베이스 전체를 잠근다. 쓰기 하나가 모든 읽기를 막는다. 동시 요청을 처리하는 웹 앱에서는 사실상 사용할 수 없는 방식이다.

WAL(Write-Ahead Logging)은 이 모델을 바꾼다. 작성자는 데이터베이스 파일을 바로 수정하는 대신 별도의 `-wal` 파일에 먼저 기록한다. 읽는 쪽은 계속 메인 파일을 읽는다. 즉 여러 reader와 하나의 writer가 동시에 동작할 수 있다. Rails 8은 SQLite 데이터베이스에 대해 기본적으로 WAL을 활성화한다.

우리 트래픽 규모의 스토어에서는 WAL 모드가 꽤 여유 있게 버텨준다. 상품 페이지 조회, 장바구니 작업, 결제 흐름 같은 요청에서 동시 읽기는 거의 막히지 않고, 대부분의 요청이 읽기라 쓰기 충돌도 크지 않다.

데이터베이스 설정의 `timeout: 5000`은 writer가 락을 잡기 위해 최대 5초를 기다리게 해준다. 그 이후에는 `SQLITE_BUSY`가 발생한다. 우리는 정상 운영 중에는 이 한도에 걸린 적이 없다. 특히 읽기 비중이 높은 워크로드에서는 SQLite의 처리 한계가 사람들이 흔히 생각하는 것보다 훨씬 높다.

## 주문 두 건을 잃어버린 날

2월 4일, 우리는 두 시간 동안 main 브랜치에 11개의 커밋을 푸시했다. 각 푸시는 GitHub Actions를 통해 배포를 트리거한다. Kamal은 blue-green 배포를 수행한다. 새 컨테이너를 띄우고, 헬스체크를 통과시키고, 그다음 기존 컨테이너를 내린다. 이 전환 구간에서는 두 컨테이너가 동시에 실행된다. 둘 다 `ultrathink_storage`를 마운트하고, 둘 다 같은 SQLite 파일을 연다.

배포가 한 번에 하나씩만 일어날 때는 괜찮다. 겹치는 구간이 짧고, WAL이 동시 접근을 어느 정도 처리해준다. 기존 컨테이너는 요청을 비우는 동안 새 컨테이너가 트래픽을 넘겨받는다.

하지만 두 시간에 11번 배포하면 문제가 달라진다. 겹침 구간 위에 또 겹침 구간이 생긴다. 컨테이너 A가 아직 요청을 처리하는 동안 컨테이너 B가 뜨고, B가 완전히 안정화되기 전에 C 배포가 시작된다. 같은 WAL 파일을 연 프로세스 셋이 동시에 쓰기를 시도하는 상황이 된 것이다.

주문 16번과 17번은 Stripe에서 정상적으로 완료됐다. 고객 결제도 이뤄졌다. Payment intent 상태도 성공이었다. 하지만 주문 레코드는 데이터베이스에 남지 않았다. WAL 파일 경합 어딘가에서 쓰기 결과가 사라졌다.

우리는 `sqlite_sequence`를 통해 이 사실을 확인했다.

```sql
SELECT * FROM sqlite_sequence WHERE name='orders';
-- seq: 17

SELECT MAX(id) FROM orders;
-- 15
```

자동 증가 카운터는 17개의 ID가 할당됐다고 말했지만, 실제 테이블에는 15개 행만 있었다. 주문 두 건이 생성된 뒤 사라진 것이다. Stripe에는 돈이 있었지만, 우리 데이터베이스에는 주문이 없었다.

## 해결책: 너무 자주 배포하지 말 것

해결책은 기술적이기보다 절차적이었다. 10분마다 main에 푸시하지 않는 것이다.

우리는 관련 변경을 묶고, 짧은 시간 안에 푸시를 난사하지 말자는 규칙을 추가했다. 이 규칙은 모든 AI 에이전트가 따르는 거버넌스 파일인 `CLAUDE.md`에도 적어뒀다.

> main에 빠른 연속 푸시를 하지 말 것. 2시간에 11번 푸시하면서 Kamal 배포가 겹쳤고, SQLite 동시 접근이 발생했다. Stripe 결제는 성공했지만 주문 16/17은 유실됐다.

이건 SQLite 자체의 문제라기보다, SQLite가 드러내는 배포 파이프라인 문제에 가깝다. Postgres에서 blue-green 배포를 하면 이 상황이 훨씬 자연스럽게 처리된다. 연결이 TCP 소켓을 통해 하나의 Postgres 서버로 모이기 때문에 데이터베이스 엔진이 쓰기 순서를 관리해준다. 반면 SQLite의 쓰기 순서는 공유 Docker 볼륨 위 파일 시스템 락에 의존하는데, 컨테이너 겹침이 생기면 여기서 문제가 터진다.

## sqlite_sequence: 포렌식 도구로서의 가치

`sqlite_sequence` 테이블은 SQLite에서 가장 과소평가된 디버깅 도구 중 하나다. 각 테이블에서 지금까지 한 번이라도 할당된 가장 높은 auto-increment 값을 기록한다. 그 행이 나중에 사라졌더라도 말이다.

우리는 이걸 과거 작업 큐 작업 수를 세는 데 쓴다. 에이전트는 수천 개의 작업을 완료하고 지우지만, `sqlite_sequence`는 그 흔적을 기억한다.

```ruby
def count_historical_tasks
  result = ActiveRecord::Base.connection.execute(
    "SELECT seq FROM sqlite_sequence WHERE name='work_queue_tasks'"
  )
  result.first&.fetch("seq", 0) || 0
end
```

`WorkQueueTask.count`는 현재 남아 있는 약 300개 행만 보여준다. 하지만 sequence는 3,700개 이상, 즉 지금까지 생성된 전체 작업 수를 보여준다. 이 둘이 예상과 다르게 벌어지면, 무언가가 지워지지 말아야 할 행을 지운 것일 수 있다.

## 아무도 잘 말해주지 않는 함정들

`ILIKE`가 없다. PostgreSQL에 익숙한 개발자는 본능적으로 `WHERE name ILIKE '%term%'`를 쓴다. SQLite에서는 문법 오류가 난다. 대신 `WHERE LOWER(name) LIKE '%term%'`를 써야 한다.

`json_extract`는 네이티브 타입을 반환한다. `json_extract(data, '$.id')`는 값이 숫자로 저장돼 있으면 정수를 돌려준다. 이를 문자열과 비교하면 조용히 실패한다. 문자열 비교가 필요하면 항상 `CAST(json_extract(...) AS TEXT)`를 써야 한다.

`kamal app exec`는 실행할 때마다 새 컨테이너를 띄운다. 우리 `t3.small`(2GB RAM)에서는 웹 컨테이너가 약 780MB를 쓴다. 빠른 DB 질의를 위해 exec 컨테이너 하나를 더 띄우면 약 500MB가 추가된다. 배포 중 exec가 둘 동시에 뜨면? 2GB 머신에서 2.5GB를 쓰는 셈이 된다. 그러면 OOM killer가 웹 프로세스를 죽인다.

`ActiveRecord timeout: 5000`은 안전장치이지 해결책이 아니다. `SQLITE_BUSY`가 자주 발생한다면 설정으로 가릴 수 있는 문제가 아니라 동시성 설계 문제다. 애플리케이션 수준에서 writer contention을 줄여야 한다.

## 그래도 다시 SQLite를 고를까?

그렇다. 단일 서버 배포이고 쓰기량이 중간 수준이라면, SQLite는 인프라 복잡성 한 덩어리를 통째로 없애준다. 커넥션 풀 튜닝도 없고, 데이터베이스 서버 업그레이드도 없고, replication lag도 없다. 백업도 `sqlite3 production.sqlite3 '.backup backup.sqlite3'`면 된다. `sqlite3 .backup` API는 WAL 모드와 동시 쓰기 상황을 안전하게 처리하지만, 단순한 `cp`는 반쯤 기록된 파일을 잡아버릴 수 있다. (Hacker News 피드백 후 갱신된 내용으로, 안전한 방법은 `sqlite3 .backup`이다.)

제약은 분명하다. 서버는 하나여야 하고, 배포 속도도 조심해야 한다. 언젠가 수평 확장이나 진짜 multi-writer 동시성이 필요해지면 Postgres로 옮길 것이다. Rails에서는 그 전환도 비교적 단순하다. adapter를 바꾸고, 마이그레이션을 돌리고, SQLite 전용 문법이 있는 쿼리만 손보면 된다.

그전까지는 단일 파일 하나로도 모든 게 돌아간다. 다만 그게 어떤 시스템인지 정확히 존중해야 한다.

다음 글 예고: Claude에서 직접 쇼핑할 수 있도록 스토어 API를 MCP 서버로 패키징하고 npm에 배포한 이야기.
