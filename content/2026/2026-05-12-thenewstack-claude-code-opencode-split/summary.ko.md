# Knowledge Card - Claude Code vs OpenCode: managed harness vs provider-neutral harness

## 핵심 통찰

이 글의 핵심은 `Claude Code 대 OpenCode`를 단순한 기능 비교가 아니라 **AI 코딩 에이전트의 제어권 계층을 누가 소유하느냐**의 문제로 읽어야 한다는 점이다. Anthropic은 Claude Code를 모델, 런타임, 메모리, 멀티에이전트 오케스트레이션, 사용량 한도, 엔터프라이즈 관리 기능까지 묶은 관리형 harness로 강화하고 있다. 반대로 OpenCode는 같은 코딩 에이전트 경험을 여러 모델 공급자 위에서 바꿔 끼울 수 있는 provider-neutral harness로 포지셔닝한다.

## 새로 추가된 프레임

- **Managed harness**: 모델 공급자가 harness, 실행환경, 메모리, 정책, 과금, 엔터프라이즈 기능을 함께 통제하는 경로.
- **Sovereign/provider-neutral harness**: 사용자가 harness를 보유하고 Claude, OpenAI, Google, local model 등 공급자를 교체하는 경로.
- **Switching-cost reducer**: OpenCode의 전략적 가치는 모델 성능 그 자체보다 vendor lock-in 비용을 낮추는 데 있다.
- **Docker vs Podman analogy**: 통합형 플랫폼과 사용자 주권형 도구가 서로를 완전히 대체하지 않고 다른 시장에서 병존할 수 있다는 비유.

## 왜 중요한가

Hermes/agent 운영 관점에서 이 글은 “좋은 모델을 쓰느냐”보다 한 단계 위의 질문을 던진다. 업무 자동화와 코딩 에이전트가 실제 운영 레이어가 될수록, 특정 모델 회사가 harness, OAuth, rate limit, memory, plugin policy, runtime을 함께 통제하는 구조는 생산성만큼이나 종속 리스크를 만든다. 반대로 provider-neutral harness는 거칠고 보안/품질 검증 부담이 커질 수 있지만, 모델 교체권과 비용 협상력을 남긴다.

## 사용자의 기존 관심사와 연결

- Hermes 자체 운영: Claude Code, Codex, OpenCode 등 여러 agent CLI를 allowlist/routing 방식으로 운용하는 현재 전략과 직접 연결된다.
- article archive의 Goose/OpenCode 계열 자료: OpenCode, Goose, Claude Code, Cline, Aider는 모두 “agent runtime을 누가 통제하는가”라는 같은 축 위에 있다.
- 사업/교육 운영: 학생 또는 팀에게 특정 SaaS형 AI 도구만 가르칠지, provider-neutral workflow를 가르칠지의 커리큘럼 판단과도 연결된다.

## 실행/검증 후속

1. OpenCode를 Hermes의 “비상/대체 harness” 후보로만 볼지, 실제 업무 agent routing 후보로 볼지 구분한다.
2. 모델 성능 비교보다 먼저 확인할 항목: auth 방식, rate-limit resilience, local config portability, MCP/extension 정책, 로그/감사 가능성, security posture.
3. Claude Code와 OpenCode를 같은 과제로 small-corpus 실험해, 생산성 차이와 lock-in 비용을 분리해서 평가한다.

## 한 줄 요약

AI 코딩 도구의 다음 경쟁축은 “어느 모델이 더 똑똑한가”만이 아니라, **코딩 agent harness의 제어권을 벤더에게 맡길 것인가, 사용자가 보유할 것인가**이다.
