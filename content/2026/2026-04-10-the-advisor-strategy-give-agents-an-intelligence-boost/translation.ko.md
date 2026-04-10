# advisor strategy: 에이전트의 지능을 끌어올리는 방법

원문: https://claude.com/blog/the-advisor-strategy
저장일: 2026-04-10
번역 메모: 직역보다 자연스러운 한국어 흐름을 우선해 다듬은 번역본. 공유된 제목은 Sonnet과 Opus를 직접 언급했지만, 접근 가능한 공식 페이지 제목은 더 넓은 표현을 사용하고 있다.

Opus를 advisor로 두고 Sonnet이나 Haiku를 executor로 두면, 훨씬 낮은 비용으로 Opus에 가까운 수준의 지능을 에이전트에 부여할 수 있다.

Anthropic은 더 나은 지능 대비 비용 균형을 원한 개발자들이 이른바 advisor strategy로 수렴하고 있다고 설명한다. 즉, Opus를 advisor로 두고 Sonnet이나 Haiku를 executor로 두는 방식이다. 이렇게 하면 에이전트의 비용은 Sonnet 수준에 가깝게 유지하면서도, Opus에 근접한 수준의 판단력을 얻을 수 있다.

이번에 Anthropic은 이 패턴을 Claude Platform에서 한 줄짜리 API 변경으로 쓸 수 있도록 advisor tool을 도입했다.

## advisor strategy로 비용 효율적인 에이전트 만들기

advisor strategy에서는 Sonnet이나 Haiku가 executor로서 작업 전체를 끝까지 수행한다. 도구를 호출하고, 결과를 읽고, 해결책에 도달할 때까지 반복하는 주체는 executor다. 그러다가 executor가 스스로 합리적으로 풀 수 없는 의사결정 지점에 이르면, advisor로서 Opus에게 조언을 요청한다. Opus는 공유된 컨텍스트를 보고 계획, 수정 방향, 혹은 중단 신호를 돌려주고, 그 뒤 executor가 다시 작업을 이어간다. advisor는 직접 도구를 호출하지 않고, 사용자에게 보여줄 결과를 만들지도 않으며, executor에게만 지침을 제공한다.

이 구조는 일반적인 sub-agent 패턴을 뒤집는다. 보통은 더 큰 오케스트레이터 모델이 작업을 분해해 더 작은 워커 모델에 위임하지만, advisor strategy에서는 더 작고 비용 효율적인 모델이 직접 흐름을 주도하다가 필요할 때만 상위 모델로 escalation한다. 작업 분해, 워커 풀, 복잡한 orchestration logic 없이도 frontier 수준의 추론을 정말 필요한 순간에만 호출하고, 나머지 구간은 executor 비용 수준으로 유지할 수 있다.

Anthropic의 평가에 따르면, Sonnet에 Opus advisor를 붙였을 때 SWE-bench Multilingual에서 Sonnet 단독 대비 2.7%p 상승했고, agentic task당 비용은 11.9% 줄었다.

## advisor tool

Anthropic은 이 advisor strategy를 API에 advisor tool이라는 서버사이드 도구 형태로 도입하고 있다. Sonnet과 Haiku는 특정 작업에서 도움이 필요할 때 이 도구를 호출하도록 학습돼 있다.

Anthropic 평가에서는 Sonnet + Opus advisor 조합이 BrowseComp와 Terminal-Bench 2.0에서 Sonnet 단독보다 더 높은 점수를 기록하면서도, task당 비용은 더 낮았다.

이 전략은 Haiku executor와도 동작한다. BrowseComp에서 Opus advisor를 붙인 Haiku는 41.2%를 기록해, 단독 점수 19.7%의 두 배를 넘겼다. 점수는 Sonnet 단독보다 29% 낮지만, task당 비용은 85% 더 저렴하다. Haiku 단독보다 advisor 비용이 추가되긴 하지만, 전체 비용은 여전히 Sonnet보다 훨씬 낮기 때문에, 대량 처리 작업에서 지능과 비용 사이 균형을 맞추는 데 유력한 선택지가 될 수 있다.

Messages API 요청에 `advisor_20260301`을 선언하면, 모델 handoff는 단일 `/v1/messages` 요청 안에서 처리된다. 별도의 round-trip이나 별도 context management가 필요 없다. executor 모델이 advisor 호출 여부를 스스로 결정하고, 호출 시 Anthropic이 정제된 컨텍스트를 advisor 모델로 보내 계획을 받아온 뒤, executor가 같은 요청 안에서 작업을 이어간다.

## 가격과 제어

advisor 토큰은 advisor 모델 요금으로, executor 토큰은 executor 모델 요금으로 청구된다. advisor는 일반적으로 400~700 토큰 정도의 짧은 계획만 생성하고, 실제 긴 출력은 더 저렴한 executor가 담당하기 때문에, 전체 비용은 advisor 모델을 처음부터 끝까지 직접 돌리는 것보다 훨씬 낮게 유지된다.

`max_uses`를 설정하면 요청당 advisor 호출 횟수를 제한할 수 있고, advisor 토큰은 usage 블록에서 별도로 보고돼 계층별 비용 추적도 가능하다.

또한 advisor tool은 Messages API 안의 다른 tool entry와 동일하게 동작하므로, 같은 루프 안에서 웹 검색, 코드 실행, Opus 상담을 함께 사용할 수 있다.

## 사용자 반응

Bolt의 Eric Simmons는 복잡한 작업에서는 아키텍처 의사결정이 훨씬 좋아졌고, 단순한 작업에서는 오버헤드가 거의 없다고 평가했다. Genspark의 Kay Zhu는 agent turns, tool calls, 전체 점수에서 직접 만든 planning tool보다 더 나은 개선이 나왔다고 말했다. Eve Legal의 Anuraj Pandey는 구조화 문서 추출 작업에서 Haiku 4.5가 필요할 때만 Opus 4.6의 지능을 빌려와 frontier 모델 수준 품질을 5배 낮은 비용으로 달성할 수 있었다고 설명했다.

## 시작 방법

advisor tool은 현재 Claude Platform에서 beta로 제공된다. 시작하려면:

- beta 헤더 `anthropic-beta: advisor-tool-2026-03-01` 추가
- Messages API 요청에 `advisor_20260301` 추가
- 사용 사례에 맞게 system prompt 수정

Anthropic은 Sonnet 단독, Sonnet executor + Opus advisor, Opus 단독 세 구성을 기존 eval suite에 모두 돌려 비교할 것을 권장한다.

## 각주 요약

- SWE-bench Multilingual: Sonnet 4.6 단독은 adaptive thinking 사용. Sonnet 4.6 + Advisor는 코딩용 권장 system prompt를 쓰고 thinking은 꺼둠. 두 경우 모두 bash와 file editing 도구를 사용했고, 9개 언어 300개 문제를 5회 반복 평균.
- BrowseComp: 모든 실험에서 thinking off, web search, web fetch 사용. Sonnet 4.6은 medium effort. Sonnet 4.6 + Advisor는 코딩용 권장 system prompt 사용, Haiku 4.5 + Advisor는 미사용. 1,266개 문제 단일 시도 기준.
- Terminal-Bench 2.0: 모든 실험에서 thinking off, bash, file editing 도구 사용. Sonnet 4.6은 medium effort. advisor run은 코딩용 권장 system prompt 미사용. 89개 작업을 각각 5회 시도 평균.
