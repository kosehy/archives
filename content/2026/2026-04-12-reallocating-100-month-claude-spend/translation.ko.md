# Claude Code 월 100달러 지출을 Zed와 OpenRouter로 재배분하기

원문: https://braw.dev/blog/2026-04-06-reallocating-100-month-claude-spend/
저장일: 2026-04-12
번역 메모: 직역보다 자연스러운 한국어 흐름을 우선해 다듬은 번역본.

저자는 요즘 Claude 한도에 예전보다 더 빨리 걸리는 느낌에 실망했다고 말한다. 본인은 업무용으로 Claude Code와 Claude 데스크톱 앱을 함께 쓰고 있고, 그 특권(?)을 위해 월 100달러를 내지만 결국 중간에 한도에 막힌다는 것이다. 이런 경험을 하는 사람이 본인만은 아니며, Reddit과 Twitter 등에서도 비슷한 사례를 쉽게 찾을 수 있다고 한다. 특히 자신의 사용 패턴이 하루 종일 균등하게 쓰는 방식이 아니라 특정 시간대에 몰아서 쓰는 “bursty” 패턴이라, 코딩 도중 갑자기 한도에 걸리는 경험이 더 답답하다고 설명한다.

이 글은 그 월 100달러 지출을 다른 도구와 모델로 재배분하면서 동시에 더 큰 유연성을 얻는 방법에 대한 설명이다.

## 에이전트 하니스를 고르고 다른 모델 탐색하기

저자는 선택지가 많은 편을 좋아한다. Opus가 agentic coding에서는 분명 시장 선두라고 보지만, 작업 복잡도에 따라 비용과 속도의 균형을 맞출 수 있는 다른 모델도 함께 쓰고 싶다고 한다. 그래서 여러 모델을 하나의 agent harness 안에서 어떻게 쓸 수 있을지 살펴본다.

여기서 “agent harness”란, LLM과의 메시지 송수신을 조율하고, 도구 정의를 주입하고, 실제 도구 호출을 실행하고, 실패한 작업 재시도까지 포함하는 워크플로를 오케스트레이션하는 시스템을 뜻한다.

Claude Code가 대표적인 예다. 사용자의 메시지를 받아 파일 읽기와 쓰기 같은 작업을 조율하고, LLM 호출까지 포함해 전체 흐름을 운영한다.

## Zed와 OpenRouter

요금제는 월 10달러다.

저자는 Zed를 써보면 VSCode와 그 포크들이 얼마나 느리고 버벅이는지 새삼 느끼게 된다고 말한다. Zed의 내장 agent harness는 기본적이지만 괜찮고, 에이전트가 파일을 수정하는 과정을 따라가 볼 수 있으며, agent behavior를 커스터마이즈하는 새 프로필도 만들 수 있다고 한다. Cursor처럼 현재 세션에서 적용 중인 규칙과 컨텍스트 사용량도 보여준다.

또 Claude Code나 Mistral Vibe 같은 다른 도구를 계속 쓰고 싶다면, Zed는 Agent Client Protocol(ACP)을 통해 이를 에디터 안에 직접 통합할 수 있다고 한다. 가장 큰 단점은 VSCode에 비해 extension 생태계가 빈약하다는 점이지만, 일반적인 언어와 흔한 작업에는 충분하다고 본다.

Zed는 제공된 크레딧을 다 쓰면 사용량 기반 과금도 제공하지만, 저자는 Zed 안에서 OpenRouter를 직접 쓰는 방식을 더 선호한다. 이유는 Zed의 토큰 가격이 API를 직접 쓰는 것보다 더 비싸기 때문이다. 또 하나의 장점은 더 “원래”에 가까운 컨텍스트 윈도우를 쓸 수 있다는 점이다. 예를 들어 Zed의 자체 통합에서는 Gemini 3.1 컨텍스트가 200k 토큰으로 제한됐지만, OpenRouter를 쓰면 1M 전체 컨텍스트를 활용할 수 있었다고 한다.

### OpenRouter

글 중간에는 Hacker News 피드백을 반영해 OpenRouter가 5.5% 수수료를 부과한다는 정정도 들어간다.

저자가 OpenRouter를 선호하는 이유는 선택 가능한 모델과 제공자가 매우 많고, 선불 크레딧이 365일 동안 사용하지 않으면 만료되는 구조이기 때문이다. Anthropic처럼 월별 한도 창이 정해져 있으면, 쓰면 리셋까지 기다려야 하고 안 쓰면 그 달 기회를 그냥 흘려보내는 느낌인데, OpenRouter는 필요할 때 충전하고, 안 쓰면 다음으로 넘길 수 있다는 점이 더 낫다고 본다.

데이터 노출 위험을 줄이기 위해 저자는 OpenRouter가 입력/출력을 “제품 개선”에 쓰는 옵션에 동의하지 않았고, workspace guardrail에서 Zero Data Retention(ZDR) endpoints only 설정도 켰다고 한다. 이 때문에 일부 모델은 못 쓰게 되지만, 감수할 만한 대가라고 본다.

## Cursor

요금제는 20달러, 60달러, 200달러다.

저자는 2025년에 Cursor의 강력한 자동완성 경험 때문에 VSCode와 Copilot에서 Cursor로 넘어갔다고 한다. 이후 Cursor가 단순 자동완성에서 agentic coding 쪽으로 발전하면서, 여러 모델을 실험할 수 있다는 점을 좋게 봤다.

Cursor 2.0은 크게 주목하지 않았지만, Rust로 다시 작성되고 agent orchestration에 집중한 Cursor 3.0은 다시 써볼 마음이 생겼다고 말한다. VSCode 포크이기 때문에 확장 프로그램 생태계도 그대로 활용할 수 있다.

특히 저자는 Cursor의 rule application 방식이 마음에 든다고 강조한다. 많은 harness는 “apply intelligently” 방식으로 AI가 설명을 읽고 규칙 적용 여부를 결정하게 하지만, Cursor는 특정 파일이나 경로 정규식에만 규칙을 적용하는 식의 정교한 제어도 제공한다. 예를 들어 `*.py`나 `**/models.py`에만 적용되는 규칙을 지정해 컨텍스트 사용을 더 효율적으로 만들 수 있다는 것이다.

단점은 포함 사용량 이후 API-rate 과금이 가능하더라도 최소 20달러를 내야 하고, 사용하지 않은 가치가 다음 달로 넘어가지 않는다는 점이다.

## Claude Code와 OpenRouter

저자는 Claude Code가 Anthropic 모델에 최적화되어 있어 다른 제공자에서는 완전히 잘 동작하지 않을 수도 있다고 적는다. 그럼에도 Claude Code 하니스를 계속 쓰고 싶다면, Anthropic API 대신 OpenRouter를 쓰도록 설정할 수 있다고 설명한다.

이를 위한 환경변수 예시는 다음과 같다.

```bash
export OPENROUTER_API_KEY=""
export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
export ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"
export ANTHROPIC_API_KEY="" # Important: Must be explicitly empty

export ANTHROPIC_DEFAULT_OPUS_MODEL="anthropic/claude-opus-4.6"
export ANTHROPIC_DEFAULT_SONNET_MODEL="anthropic/claude-sonnet-4.6"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="anthropic/claude-haiku-4.5"
export CLAUDE_CODE_SUBAGENT_MODEL="anthropic/claude-opus-4.6"
```

그리고 `claude /status`를 통해 인증 토큰과 base URL이 OpenRouter 쪽을 가리키는지 확인하라고 권한다.

## OpenCode 같은 다른 CLI 도구들

글은 OpenRouter와 함께 쓸 수 있는 여러 CLI coding harness도 언급한다.

- OpenCode: 저자가 가장 자주 쓰는 도구
- Crush: 성능은 좋지만 custom model 설정이 번거롭다고 평가

또 보통 자체 모델만 쓰도록 제한하는 도구라도, OpenRouter 호환을 시도하는 포크가 종종 있으니 확인해볼 가치가 있다고 말한다.

## 최종 지출 재배분

저자는 현재 Zed에 월 10달러를 내는 데 만족하고 있고, Cursor 3의 방향도 지켜보고 싶어서 Cursor 20달러 구독도 유지하고 있다고 한다. 그리고 남은 70달러는 매달 OpenRouter 크레딧으로 충전해 둔다. 이렇게 하면 그 돈은 사라지지 않고, 필요할 때까지 이월된다.

결론적으로, Claude 한도에 자주 걸리지만 여전히 필요할 때는 Opus도 쓰고 싶다면, Zed와 OpenRouter 조합으로 일부 지출을 재배분해보는 것은 충분히 시도해볼 만하다는 것이 저자의 권고다.
