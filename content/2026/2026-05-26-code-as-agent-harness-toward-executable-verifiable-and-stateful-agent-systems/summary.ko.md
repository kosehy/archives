# 요약 - Code as Agent Harness: Toward Executable, Verifiable, and Stateful Agent Systems

## 한 줄 요약
이 논문은 LLM 에이전트에서 코드가 더 이상 결과물만이 아니라, 추론, 행동, 환경 모델링, 상태 보존, 검증, 다중 에이전트 협업을 가능하게 하는 실행 가능한 harness라는 관점으로 기존 연구를 재정리한 survey다.

## 핵심 관점
논문은 에이전트 시스템을 세 층으로 나누어 본다.

1. **Harness interface**
   - 코드는 자연어보다 실행 가능하고, 중간 상태를 검사할 수 있으며, 파일, 스크립트, 테스트, 로그, API schema처럼 상태를 남길 수 있다.
   - 그래서 에이전트의 추론은 단순 텍스트 chain-of-thought가 아니라 프로그램 위임 추론, formal proof, iterative code-grounded reasoning으로 바뀐다.
   - 행동은 tool call, shell command, robot policy, GUI action 같은 executable action으로 접지된다.
   - 환경은 structured world representation, execution trace, simulator, verifier로 모델링된다.

2. **Harness mechanisms**
   - 장기 작업의 신뢰성은 모델만으로 결정되지 않는다. Planning, memory/context engineering, tool use, plan-execute-verify loop, telemetry 기반 harness optimization이 함께 작동해야 한다.
   - 특히 plan-execute-verify는 debugging loop를 넘어, 계획을 계약처럼 만들고, sandbox execution을 permissioned state transition으로 취급하며, deterministic sensor와 verifier를 통해 수정 여부를 결정하는 제어 구조로 설명된다.
   - self-evolving harness는 runtime telemetry, 실패 케이스, 비용, tool trace, validator 결과를 이용해 prompt, context, tool set, workflow topology, tests를 수정하지만, regression gate와 governance 없이는 위험하다고 본다.

3. **Scaling the harness**
   - 단일 에이전트는 context limit, 역할 전문화 부족, 독립 검증 부족 때문에 장기 소프트웨어 작업에서 한계를 가진다.
   - 다중 에이전트는 planner, coder, tester, reviewer, security agent처럼 역할을 나누고, shared code artifact와 execution feedback을 중심으로 협업한다.
   - 논문은 단순 채팅 로그 공유보다 repository, blackboard, execution trace, memory, verifier obligation을 포함한 shared code-centric harness substrate가 필요하다고 주장한다.

## 왜 중요한가
이 survey의 유용성은 새 benchmark 수치보다 개념 정리에 있다. 에이전트의 병목을 "모델 성능" 하나로 보지 않고, 다음 질문으로 옮긴다.

- 어떤 state를 harness가 보존해야 하는가?
- 어떤 tool action은 허용, 보류, 거부되어야 하는가?
- verifier가 실제로 무엇을 보장하고 무엇을 보장하지 못하는가?
- multi-agent coordination에서 shared state conflict를 어떻게 처리할 것인가?
- harness 자체가 진화할 때 regression을 어떻게 막을 것인가?

## Hermes 관점에서의 시사점
Hermes Agent는 이미 이 논문이 말하는 code-as-harness 구조에 가깝다. 도구 호출, queue, file-backed memory, skills, subagents, cron jobs, Graphify, archive workflow가 모두 model output을 실행 가능한 상태 변화로 바꾸는 harness component다.

실무적으로는 다음 설계 원칙을 강화할 수 있다.

- **계획은 계약이어야 한다**: plan 파일이나 TODO가 단순 메모가 아니라 scope, verifier, rollback 조건을 포함해야 한다.
- **검증은 pass/fail 하나로 끝내면 안 된다**: tests, static checks, source trace, human review, graph query, artifact read-back을 claim별로 연결해야 한다.
- **메모리와 context compaction은 state engineering 문제다**: 무엇을 durable memory에 남기고, 무엇을 session/search/work-journal/queue에 남기는지 분리해야 한다.
- **subagent orchestration에는 transactional shared state가 필요하다**: 파일 diff뿐 아니라 assumptions, evidence, verifier obligations, conflict policy를 함께 기록해야 한다.
- **self-evolving skill이나 workflow는 regression gate가 필요하다**: SkillOpt류 접근과 연결하면, Hermes skills를 자동 개선할 때도 평가 corpus, rollback, 기존 행동 보존 조건이 필요하다.

## 주의해서 읽을 점
- 이 논문은 survey다. 자체 실험 성능을 검증하는 paper라기보다, 2026년까지의 agent harness 연구를 구조화한 roadmap에 가깝다.
- 많은 대표 시스템과 분류표가 나오지만, completeness나 비교 공정성은 저자 선별에 의존한다.
- "code" 범위를 executable/machine-checkable artifacts로 넓게 쓰기 때문에, 사용 시 raw perception이나 human intent까지 코드로 과도하게 환원하지 않는 경계가 중요하다.
