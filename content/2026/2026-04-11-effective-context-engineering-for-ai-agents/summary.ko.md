# AI 에이전트를 위한 효과적인 컨텍스트 엔지니어링 — 요약

원문: https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents
기준 파일: `archive/2026/2026-04-11-effective-context-engineering-for-ai-agents/translation.ko.md`
저장일: 2026-04-11

## 한 문단 요약
Anthropic은 AI 시스템이 단발성 프롬프팅에서 장기 실행 에이전트로 이동할수록, 핵심 엔지니어링 과제가 프롬프트 문구 최적화에서 컨텍스트 큐레이션으로 이동한다고 본다. 컨텍스트 엔지니어링이란 에이전트가 올바르게 행동할 가능성을 가장 높이는 최소한의 고신호 토큰 집합을 선택하고, 갱신하고, 압축하고, 검색하는 작업이다. 이 글은 왜 컨텍스트가 희소 자원인지, 프롬프트·도구·예시·검색 전략을 그 희소성에 맞춰 어떻게 설계해야 하는지, 그리고 긴 시간축의 에이전트가 왜 compaction, note-taking, sub-agent 구조를 필요로 하는지를 설명한다.

## 핵심 포인트
- 컨텍스트 엔지니어링은 프롬프트 문구를 넘어 모델이 보는 전체 정보 상태를 다루는 개념이다.
- LLM은 attention 한계와 context rot를 겪기 때문에, 더 많은 컨텍스트가 항상 더 좋은 것은 아니다.
- 좋은 시스템은 간결한 프롬프트, 명확한 도구, 강한 예시, just-in-time 또는 hybrid retrieval 전략에 의존한다.
- 장기 실행 에이전트는 compaction, memory, sub-agent 같은 명시적 구조가 있어야 일관성을 유지할 수 있다.

## 한 줄 정리
모델에게 더 많은 토큰을 주는 것이 아니라, 필요한 토큰을 필요한 순간에 주는 것이 핵심이다.
