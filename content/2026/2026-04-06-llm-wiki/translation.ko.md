# llm-wiki

- 원문: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- 아카이브일: 2026-04-06
- 언어: 한국어
- 문서 유형: 개념 노트 / 개인 지식 시스템 / LLM 워크플로

## 핵심 아이디어

이 문서는 LLM으로 개인 지식베이스를 구축하는 하나의 패턴을 제안한다.

핵심은 질문할 때마다 원문 문서에서 다시 검색해 답을 만드는 대신, **raw source와 사용자 사이에 지속적으로 유지되는 wiki를 두는 것**이다. LLM은 새 자료를 읽고, 핵심 지식을 추출하고, 구조화된 markdown 페이지를 갱신하며, 페이지 사이의 연결을 유지한다.

중요한 차이는 지식이 매 질문마다 처음부터 다시 유도되는 것이 아니라, **지속적으로 축적되고 관리되는 산출물로 컴파일된다**는 점이다.

## 일반적인 RAG와 무엇이 다른가

문서는 이 아이디어를 일반적인 RAG 패턴과 대비한다.

보통의 RAG 시스템은:
- raw document를 저장하고
- 질문 시점에 관련 조각을 찾고
- 그때그때 답을 합성한다

이 방식도 작동하지만, 미묘한 질문이 들어올 때마다 LLM은 다시 관련 자료를 찾고 연결해야 한다.

반면 이 문서가 제안하는 wiki 방식은:
- 새 source를 넣을 때마다 LLM이 wiki에 통합하고
- entity page, concept page, summary를 계속 갱신하며
- 모순을 미리 표시하고
- synthesis를 매번 새로 만드는 대신 누적시킨다

즉 wiki는 임시 답변 레이어가 아니라, 시간이 갈수록 더 강해지는 지식 산출물이 된다.

## 인간의 역할과 LLM의 역할

문서는 사람이 wiki를 직접 거의 쓰지 않는다고 본다.

대신:
- 사람은 source를 고르고, 탐색하고, 질문한다
- LLM은 요약, 분류, 상호참조, 유지보수를 담당한다

저자는 실전적으로는 한쪽에 LLM 에이전트를 열고, 다른 쪽에 Obsidian을 열어둔다고 설명한다. 그 구성에서:
- Obsidian은 IDE이고
- LLM은 프로그래머이며
- wiki는 코드베이스다

## 사용 가능한 맥락들

문서는 이 패턴이 다양한 상황에 적용될 수 있다고 본다.

- 개인 자기이해와 자기추적
- 장기 연구 주제 정리
- 책을 읽으며 인물, 테마, 연결관계를 정리하는 companion wiki
- 회사나 팀의 내부 wiki 유지보수
- 경쟁사 분석, due diligence, 여행 계획, 강의 노트, 취미 연구

공통점은 지식이 시간이 지나며 축적되고, 흩어진 메모보다 구조를 필요로 한다는 점이다.

## 세 가지 레이어

문서는 세 가지 핵심 레이어를 정의한다.

### 1. Raw sources

변경되지 않는 원천 자료들이다.
예:
- 기사
- 논문
- 이미지
- 데이터 파일
- 클리핑한 노트

LLM은 읽기만 하고 수정하지 않는다.

### 2. The wiki

LLM이 생성하고 유지하는 markdown 파일들의 디렉토리다.

여기에는 예를 들어:
- summary
- entity page
- concept page
- comparison
- synthesis page
- overview page
등이 들어갈 수 있다.

이 레이어는 LLM이 만들고, 갱신하고, 교차 링크를 유지한다.

### 3. The schema

LLM에게 wiki를 어떻게 구조화하고 유지할지 가르치는 설정 문서다.

예시로는 `CLAUDE.md`, `AGENTS.md` 같은 파일이 언급된다.

이 schema는 다음을 정의한다.
- 구조
- 규칙
- ingest workflow
- maintenance rule
- query behavior

문서는 이 파일이 generic chatbot을 disciplined wiki maintainer로 바꾸는 핵심이라고 본다.

## 핵심 워크플로

문서는 세 가지 핵심 워크플로를 강조한다.

### Ingest

새 source를 raw collection에 넣는다.

그러면 LLM은:
- 읽고
- 사용자와 핵심 내용을 논의하고
- summary page를 쓰고
- index를 갱신하고
- 관련 entity/concept page를 업데이트하고
- log에 기록을 남긴다

하나의 source가 여러 wiki 페이지를 동시에 바꿀 수 있다.

### Query

사용자는 wiki를 대상으로 질문한다.

LLM은 관련 페이지를 찾고 읽은 뒤, citation과 함께 답을 합성한다.

중요한 점은, 좋은 답변은 다시 wiki에 새 페이지로 저장되어야 한다는 것이다. 즉 exploration도 ingest처럼 지식베이스를 더 풍부하게 만든다.

### Lint

LLM은 주기적으로 wiki의 건강 상태를 점검한다.

점검 항목 예시는 다음과 같다.
- page 간 모순
- 오래된 주장
- orphan page
- 빠진 cross-reference
- 따로 페이지가 필요한 중요 개념
- 추가 조사로 채울 수 있는 공백

이 작업이 wiki가 커져도 일관성을 유지하게 만든다.

## 탐색을 돕는 파일들

문서는 두 개의 특별한 파일도 제안한다.

### `index.md`

wiki 전체 페이지를 카테고리별로 정리한 콘텐츠 중심 카탈로그다.

한 줄 요약과 메타데이터를 함께 넣으면, 사용자와 LLM이 모두 heavy retrieval infrastructure 없이도 관련 페이지를 찾기 쉬워진다.

### `log.md`

ingest, query, lint pass를 시간순으로 기록하는 append-only 로그다.

지식베이스가 어떤 식으로 진화했는지 추적하는 데 도움이 된다.

## 보조 도구와 생태계

문서는 몇 가지 도구도 함께 언급한다.

- Obsidian: 브라우징, graph view, plugin 활용
- qmd: 로컬 markdown 검색
- Obsidian Web Clipper: source 수집
- 로컬 이미지 다운로드: 더 안정적인 멀티모달 참조
- Marp: slide deck 생성
- Dataview: frontmatter query
- git: 버전 관리, branching, 협업

핵심은 wiki가 여전히 단순한 markdown repo라는 점이다. 그래서 시스템 전체가 단순하고 투명하게 유지된다.

## 왜 이게 중요한가

문서는 지식베이스 유지의 가장 힘든 부분이 읽기나 사고가 아니라 bookkeeping이라고 본다.
즉:
- cross-reference 업데이트
- summary 최신화
- 모순 표시
- 많은 페이지 간 일관성 유지

이 부담이 커지기 때문에 인간은 wiki를 버리게 된다.

LLM은 다중 파일 수정과 링크 유지 비용을 거의 0에 가깝게 낮춤으로써 이 경제성을 바꾼다.

## 역사적 프레이밍

이 아이디어는 Vannevar Bush의 Memex와 연결된다. 문서 자체만큼 문서 사이의 연결이 중요한, 개인적이고 curated된 지식 시스템이라는 점에서 그렇다.

이 프레이밍에서 LLM은 그동안 비어 있던 maintenance labor를 대신해 주는 존재다.

## 최종 takeaway

이 문서의 핵심 제안은 잘 유지되는 개인 또는 조직 wiki가 raw material과 이후 reasoning 사이의 지속적 지식 레이어가 될 수 있다는 점이다.

모든 질문을 매번 새로운 retrieval 문제로 취급하는 대신, LLM이 지식을 계속 읽고, 정리하고, 갱신해 가며 시간이 지날수록 더 가치 있는 산출물로 만든다는 것이다.
