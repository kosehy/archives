# AI 에게 맥락을 제대로 주고 싶다면, 관계를 Graph 로 만드세요 - LinkedIn activity 7463347912517771265

## Source metadata

- Platform: LinkedIn public post
- Author: Jeongmin Lee
- Published: 2026-05-21T22:00:04.625Z
- Submitted URL: https://www.linkedin.com/posts/jyoung105_ai-%EC%97%90%EA%B2%8C-%EB%A7%A5%EB%9D%BD%EC%9D%84-%EC%A0%9C%EB%8C%80%EB%A1%9C-%EC%A3%BC%EA%B3%A0-%EC%8B%B6%EB%8B%A4%EB%A9%B4-%EA%B4%80%EA%B3%84%EB%A5%BC-graph-%EB%A1%9C-%EB%A7%8C%EB%93%9C%EC%84%B8%EC%9A%94-%EC%BD%94%EB%93%9C-share-7463289605736321025-rFXg
- Submitted URL query: redacted from durable archive metadata (`utm_*`, `rcm` removed)
- Submitted path ID: 7463289605736321025
- Canonical LinkedIn JSON-LD ID: https://kr.linkedin.com/posts/jyoung105_ai-%EC%97%90%EA%B2%8C-%EB%A7%A5%EB%9D%BD%EC%9D%84-%EC%A0%9C%EB%8C%80%EB%A1%9C-%EC%A3%BC%EA%B3%A0-%EC%8B%B6%EB%8B%A4%EB%A9%B4-%EA%B4%80%EA%B3%84%EB%A5%BC-graph-%EB%A1%9C-%EB%A7%8C%EB%93%9C%EC%84%B8%EC%9A%94-%EC%BD%94%EB%93%9C-activity-7463347912517771265-rill
- LinkedIn OpenGraph URL: https://kr.linkedin.com/posts/jyoung105_ai-%EC%97%90%EA%B2%8C-%EB%A7%A5%EB%9D%BD%EC%9D%84-%EC%A0%9C%EB%8C%80%EB%A1%9C-%EC%A3%BC%EA%B3%A0-%EC%8B%B6%EB%8B%A4%EB%A9%B4-%EA%B4%80%EA%B3%84%EB%A5%BC-graph-%EB%A1%9C-%EB%A7%8C%EB%93%9C%EC%84%B8%EC%9A%94-%EC%BD%94%EB%93%9C-activity-7463347912517771265-rill
- Canonical activity ID: 7463347912517771265
- Archived date: 2026-05-22
- Source language: ko
- Extraction method: `linkedin_ssr_jsonld_manual`
- Quality status: `manual_correction_needed`
- Extraction caveat: Public LinkedIn SSR exposed body, image, interaction counters, and 1 public comment(s). LinkedIn social context can still be hidden or login-gated, so the archive does not claim complete comment/reaction coverage.

## Post body

AI 에게 맥락을 제대로 주고 싶다면, 관계를 Graph 로 만드세요

코드 및 에이전트 상태 관리가 잘 안되는 분들은 아래 2개의 Graph 도구를 꼭 활용해보세요.

AI 와 함께 개발하면 상태 문제가 발생합니다.
코드베이스에서는 AI 가 같은 파일을 반복해서 열면서 토큰이 녹아요.
에이전트에서는 실행이 길어질수록 맥락을 잃습니다.

보통 이 둘을 별개 문제로 보지만 본질은 같습니다.
AI 가 다루는 대상 사이의 관계가 구조화되지 않은 거예요.
Graph 로 이걸 풀고 있는 프로젝트 2개를 정리했습니다.

❶ Graph 의 효과는 관계를 명시적으로 바꾸는 데서 옵니다

GraphRAG 가 벡터 검색보다 정확한 이유가 여기 있어요.
데이터를 노드와 엣지로 연결하면 AI 가 "A 는 B 와 연결되고 B 는 C 에 의존한다"는 관계를 탐색 없이 바로 파악합니다.
Ontology 기반 추론도 유사한 원리고요.

관계가 명시적이면 매번 처음부터 찾을 필요가 없어져요.
이번에 소개하는 두 프로젝트도 이 원리를 사용하되 적용 대상이 다릅니다.

❷ codegraph 는 코드 관계를 그래프로 만듭니다

github repo: https://lnkd.in/gWgT4msM

Codex 나 Claude Code 로 큰 프로젝트를 열면 AI 가 grep, glob, Read 를 반복합니다.
프로젝트가 커질수록 이 문제가 심해지는 걸 체감하게 돼요.

codegraph 는 tree-sitter 로 소스 코드의 AST parsing(구문 분석)을 통해 함수와 클래스를 노드로 추출하고 호출과 상속 관계를 엣지로 연결합니다.

SQLite 에 저장된 이 그래프를 MCP 서버를 통해 AI 코딩 도구와 연결하면 codegraph_explore 한 번으로 관련 코드를 전부 가져올 수 있어요.

❸ 도구 호출 92% 감소, 탐색 속도 71% 단축

평가에 사용된 6개 실제 코드베이스 평균, 도구 호출 92% 감소, 탐색 71% 단축이라는 엄청난 비용 감소 효과를 거두었습니다.

설치는 npx @colbymchenry/codegraph 한 줄이면 끝나고 Claude Code, Codex 등에서 전부 쓸 수 있습니다.

❹ ActiveGraph 는 에이전트 상태를 그래프로 만듭니다

github repo: https://lnkd.in/gDgCUGzn

에이전트가 몇 시간 이상 실행되면 이전에 뭘 했는지, 어떤 판단을 왜 내렸는지 추적이 안 돼요.
직접 돌려보면 이게 얼마나 심각한지 체감하게 됩니다.

ActiveGraph 는 task, claim, evidence 같은 객체를 노드로 두고 supports, contradicts, depends_on 관계를 엣지로 연결해요.
모든 변경은 append-only 이벤트 로그에 기록되고 behavior 가 이벤트에 반응하면서 다음 행동을 결정하는 구조입니다.

❺ fork-and-diff 가 이 프로젝트의 차별점입니다

Git 에서 branch 를 따듯이 에이전트 실행 중간에 분기를 만들 수 있어요.
예를 들어 에이전트가 A 라는 판단을 내린 시점에서 "B 로 판단했다면 어땠을까"를 복제본으로 돌려보고 결과를 비교하는 겁니다.
분기 이전까지의 LLM 호출은 cache 로 재활용하기 때문에 비용이 두 배로 들지 않아요.

그리고 일반 워크플로우는 "1단계 끝나면 2단계로" 순서가 코드에 고정되어 있는데 ActiveGraph 는 그래프에 변화가 생기면 그 변화에 맞는 behavior 가 자동으로 실행됩니다. 순서를 미리 짜지 않아도 돼요.

❻ 두 프로젝트는 결국 같은 원리를 씁니다

codegraph 는 코드 간 관계를,
ActiveGraph 는 에이전트 상태 간 관계를
명시적 엣지로 연결해요.

이렇듯 Graph 를 적용할 경우,
암묵적으로 가려진 관계를 명시적으로 바꾸면서 AI 가 매번 재탐색할 이유가 사라지며 성능 또한 개선할 수 있습니다.

그래서
AI 와 함께하는 개발 과정에서 토큰 낭비가 심하다면 codegraph 부터 설치하세요.
AI 에이전트를 장시간 돌리는 프로젝트라면 ActiveGraph 로 백업 플랜을 마련하세요.

꼭 필요한 AI 정보를 지속적으로 업로드하고 있습니다.
저와 "1촌" 이 되면 유용한 정보를 놓치지 않을 거에요.

## Resolved links

- `https://lnkd.in/gWgT4msM` -> `https://github.com/colbymchenry/codegraph`
- `https://lnkd.in/gDgCUGzn` -> `https://github.com/yoheinakajima/activegraph`

## Public comments exposed by JSON-LD

- DongHwan (진동환) Jin (2026-05-22T10:50:40.592Z): 좋은 인사이트 감사합니다. / 결국 AI도 관계(Context)를 얼마나 구조화해서 이해시키느냐가 핵심이라는 생각이 듭니다. /  / Graph 기반 접근이 앞으로 Agent AI 시대에 더욱 중요해질 것 같네요.

## Feedshare image

- Local file: `figures/linkedin-feedshare.jpg`
- Remote LinkedIn image URL was used only for download; durable metadata strips media query tokens.
- OCR/visual summary: black-and-neon-green slide. Left panel says “AI 에게 맥락을 Graph 로 주자”, “노드와 엣지로 연결하면 AI는 다시 찾지 않고 바로 이해합니다”, and “핵심: 암묵적 관계를 명시적 구조로 바꾸기”. Right panel compares “01 codegraph - 코드 관계를 그래프로 만듭니다” with bullets “함수와 클래스를 노드로 추출”, “호출과 상속을 엣지로 연결”, “도구 호출 92%↓, 탐색 71%↓”, and “02 ActiveGraph - 에이전트 상태를 그래프로 만듭니다” with bullets “task, claim, evidence를 노드화”, “supports, contradicts, depends_on 연결”, “fork-and-diff로 판단 분기 비교”. Footer says “Graph로 맥락을 주면 재탐색이 줄어듭니다”.
