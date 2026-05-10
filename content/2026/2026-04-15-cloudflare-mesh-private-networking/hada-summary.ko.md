# GeekNews 본문 정리

- GeekNews 링크: https://news.hada.io/topic?id=28537
- 원본 링크: https://blog.cloudflare.com/mesh/
- 제목: Cloudflare Mesh 출시 - 사용자, 노드, 에이전트, Workers를 위한 안전한 프라이빗 네트워킹

- AI 에이전트가 **프라이빗 네트워크 리소스**에 안전하게 접근해야 하는 시대에, 기존 VPN·SSH 터널 같은 도구는 사람이 아닌 자율 소프트웨어에 적합하지 않은 구조적 한계 존재

- Cloudflare Mesh는 하나의 경량 커넥터로 개인 디바이스, 원격 서버, 에이전트를 모두 연결하는 **양방향 프라이빗 네트워킹** 솔루션

- Workers VPC를 확장하여 **Agents SDK로 구축한 에이전트**가 Mesh 네트워크에 직접 접근 가능하며, 단일 바인딩의 `fetch()` 호출로 내부 서비스 연결 지원

- 기존 Cloudflare One 사용자는 추가 설정 없이 Gateway 정책, Access 규칙, 디바이스 포스처 체크가 Mesh 트래픽에 자동 적용

- 50개 노드 및 50명 사용자까지 무료 제공과 330개 이상 도시의 글로벌 에지 라우팅으로, 스타트업부터 엔터프라이즈까지 즉시 도입 가능

## 에이전트 시대의 프라이빗 네트워크 접근 문제

- AI 에이전트가 스테이징 데이터베이스 쿼리, 내부 API 호출, 홈 네트워크 서비스 접근 등 프라이빗 리소스에 도달해야 하는 워크플로가 급증

- 기존 도구들의 한계:
  - VPN은 인터랙티브 로그인 필요
  - SSH 터널은 수동 설정 필요
  - 서비스를 퍼블릭으로 노출하면 보안 리스크 발생
  - 에이전트가 연결된 후 실제로 무엇을 하는지에 대한 가시성 부재

## 세 가지 핵심 워크플로

- 개인 에이전트 원격 접근: Mac mini에서 OpenClaw를 실행하고 모바일·노트북에서 접근할 때, 퍼블릭 노출 시 셸·파일 시스템·네트워크 접근이 모두 열려 잘못된 설정 하나로 보안 위험 발생

- 코딩 에이전트의 스테이징 환경 접근: Claude Code, Cursor, Codex 같은 도구가 프라이빗 클라우드 VPC 내 서비스에 접근하려면 인터넷 노출이나 전체 VPC 터널링이 필요한 상황

- 배포된 에이전트의 프라이빗 서비스 연결: Agents SDK 기반 Workers 에이전트가 내부 API·데이터베이스에 접근할 때 범위 지정된 권한, 감사 추적, 자격증명 유출 방지 필요

## Cloudflare Mesh 구조와 동작 방식

- 하나의 경량 커넥터(바이너리)로 개인 디바이스, 원격 서버, 사용자 엔드포인트를 모두 연결

- 연결된 디바이스들은 프라이빗 IP를 통해 Cloudflare의 글로벌 네트워크(330개 이상 도시)를 경유하여 양방향 통신

- 기존 WARP Connector는 Cloudflare Mesh node로, WARP Client는 Cloudflare One Client로 명칭 변경

- 구체적 활용 시나리오:
  - iOS용 Cloudflare One Client로 모바일에서 로컬 Mac mini의 OpenClaw에 보안 연결
  - macOS용 Cloudflare One Client로 노트북의 코딩 에이전트가 스테이징 데이터베이스·API에 접근
  - Linux 서버의 Mesh 노드로 외부 클라우드 VPC를 서로 연결, 에이전트가 외부 프라이빗 네트워크의 리소스와 MCP에 접근

## Mesh와 Tunnel의 차이

- Cloudflare Tunnel: Cloudflare 에지에서 특정 프라이빗 서비스(웹 서버, 데이터베이스)로의 단방향 트래픽 프록시에 적합

- Cloudflare Mesh: 모든 디바이스와 노드가 프라이빗 IP로 서로 접근할 수 있는 양방향, 다대다 네트워크 제공

- 각 리소스별로 별도 Tunnel을 설정할 필요 없이, Mesh에 연결된 모든 리소스에 접근 가능

## Cloudflare 네트워크 활용: NAT 순회 문제 해결

- 대부분의 인터넷은 NAT 뒤에 위치하며, 두 디바이스가 모두 NAT 뒤에 있으면 직접 연결 실패 시 릴레이 서버에 의존

- 릴레이 인프라의 PoP가 제한적이면 상당 부분의 트래픽이 릴레이를 거쳐 지연과 신뢰성 저하 발생

- Cloudflare Mesh는 모든 트래픽을 Cloudflare 글로벌 네트워크로 라우팅하여 별도의 릴레이 서버 없이 일관된 성능 제공

- 크로스 리전·멀티 클라우드 트래픽에서 퍼블릭 인터넷 라우팅보다 지속적으로 우수한 성능

## 핵심 제공 사항

- 50개 노드·50명 사용자 무료: 모든 Cloudflare 계정에 포함
- 글로벌 에지 라우팅: 330개 이상 도시, 최적화된 백본 라우팅, 성능 저하되는 폴백 경로 없음
- Day 1부터 보안 제어: Gateway 정책, DNS 필터링, DLP, 트래픽 검사, 디바이스 포스처 체크를 동일 플랫폼에서 활성화 가능
- 고가용성: 동일 토큰으로 여러 커넥터를 active-passive 모드로 실행, 동일 IP 라우트를 광고하여 장애 시 자동 페일오버

## Workers VPC 통합

- Workers VPC를 확장하여 Mesh 네트워크 전체를 Workers와 Durable Objects에서 접근 가능

- `wrangler.jsonc` 파일에서 `cf1:network` 예약 키워드로 Mesh 네트워크에 바인딩

- Worker 코드 내에서 `env.MESH.fetch(...)` 형태로 프라이빗 호스트에 직접 접근 가능

- Tunnel 기반 VPC 바인딩과 병행 사용 가능하여 네트워크 보안 방식 선택의 폭 확대

- 이를 통해 프라이빗 데이터베이스, 내부 API, MCP에 보안 접근하는 크로스 클라우드 에이전트 및 MCP 구축 가능

## 전체 아키텍처 구성 요소

- Mesh 노드: 서버, VM, 컨테이너에서 헤드리스 버전의 Cloudflare One Client를 실행하고 Mesh IP를 할당받아 서비스 간 양방향 프라이빗 IP 통신

- 디바이스: 노트북·폰에서 Cloudflare One Client를 실행하여 Mesh 노드에 직접 접근, SSH·데이터베이스 쿼리·API 호출을 프라이빗 IP로 처리

- Workers 에이전트: Workers VPC Network 바인딩을 통해 프라이빗 서비스에 접근, 네트워크는 에이전트의 도달 범위를 제어하고 MCP 서버는 에이전트의 행위를 제어

## 향후 로드맵

### 호스트네임 라우팅

- 올여름 Cloudflare Tunnel의 호스트네임 라우팅을 Mesh로 확장 예정
- `wiki.local`, `api.staging.internal` 같은 프라이빗 호스트네임 라우팅 지원 예정
- 동적 IP, 오토 스케일링 그룹, 임시 컨테이너 환경에서의 라우팅 복잡성 완화

### Mesh DNS

- 올해 후반 Mesh 참여 노드와 디바이스에 자동으로 라우팅 가능한 내부 호스트네임 부여 예정
- DNS 설정이나 수동 레코드 없이 접근 가능하도록 하는 방향

### ID 인식 라우팅

- 각 노드, 디바이스, 에이전트에 고유 ID를 부여하여 IP 범위가 아닌 접속 주체 기반 정책 작성 목표
- 에이전트 ID 모델 구상:
  - Principal/Sponsor: 행위를 승인한 사람
  - Agent: 행위를 수행하는 AI 시스템
  - Scope: 에이전트가 허용된 작업 범위

### Mesh 컨테이너 지원

- 현재는 VM·베어메탈 Linux 서버 중심
- Kubernetes 파드, Docker Compose, CI/CD 러너용 Mesh Docker 이미지 준비 중

## 시작 방법

- Cloudflare Mesh: Cloudflare 대시보드의 Networking > Mesh에서 시작, 50개 노드·50명 사용자까지 무료
- Agents SDK + Workers VPC: `npm i agents`로 설치, Workers VPC 퀵스타트와 리모트 MCP 서버 가이드 참고
- 기존 Cloudflare One 사용자: 기존 설정과 호환되며, Gateway 정책·디바이스 포스처 체크·Access 규칙이 Mesh 트래픽에 자동 적용

## 댓글

### yoonhyuk

원래 집 컴퓨터에 터널 세팅해두고 RDP만 썻는데... 에이전트도 한번 해봐야겠네요!

### yangeok

가격만 무료고 보안만 좋으면 무조건 쓰죠 ㅎㅎ

이런거 보면 devops도 어떤 방향으로 바뀔지 대략적 감이 오네요

### xguru

메쉬라 그러길래 Tailscale 이랑 비슷한건가 싶었는데 살짝 다른거군요.
테일스케일 같은 P2P 방식이 아니라, CF 에지 네트워크를 경유하는 구조라
Gateway 정책이나 DLP 같은 보안 기능이 자동 적용되고,
Workers/Agents SDK에서 fetch() 한 줄로 프라이빗 서비스 호출이 되는 게 차별점.
전 그냥 테일스케일 쓰는 거로..

### minhoryang

저는 오히려 tailscale의 derp relay역할을 cloudflare edge가 해주니까 더 강력한 경쟁자가 등장한건 아닌가 싶었습니다. Tailscale도 P2P가 안되면 derp relay를 통해 통신을 보내니까요. “릴레이 인프라의 PoP(Point of Presence)가 제한적이면 상당 부분의 트래픽이 릴레이를 거쳐 지연과 신뢰성 저하 발생” 이부분이 특히 tailscale을 말하는 것 같더라구요. 저는 둘 다 섞어쓸 것 같습니다. 바로 실험갑니다

#### minhoryang 대댓글

cloudflare edge도 100.96.0.0 100. 으로 시작하는 대역을 사용하네요. tailscale과 같이 쓰려고 했는데, 설치부터 사용까지 애로사항이 조금씩 있습니다. 저처럼 동시에 쓰려는 분들은 참고바랍니다.
