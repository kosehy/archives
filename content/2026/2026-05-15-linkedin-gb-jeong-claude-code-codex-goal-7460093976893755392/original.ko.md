# LinkedIn post 7460093976893755392 - Claude Code/Codex `/goal`과 종료 조건 설계

Source: https://www.linkedin.com/posts/gb-jeong_claude-code%EA%B0%80-%EC%B2%98%EC%9D%8C%EC%9C%BC%EB%A1%9C-codex%EB%A5%BC-%EB%94%B0%EB%9D%BC%ED%96%88%EB%8A%94%EB%8D%B0%EC%9A%94-%EA%B7%B8-%EA%B8%B0%EB%8A%A5%EC%9D%B4-share-7459998226222567425-9ZoA?[REDACTED_QUERY]
Saved: 2026-05-15

## LinkedIn metadata

- Platform: LinkedIn public post
- Author: Goobong Jeong
- Author URL: https://kr.linkedin.com/in/gb-jeong
- Date published: 2026-05-12T22:30:05.903Z
- LinkedIn canonical URL: https://kr.linkedin.com/posts/gb-jeong_claude-code%EA%B0%80-%EC%B2%98%EC%9D%8C%EC%9C%BC%EB%A1%9C-codex%EB%A5%BC-%EB%94%B0%EB%9D%BC%ED%96%88%EB%8A%94%EB%8D%B0%EC%9A%94-%EA%B7%B8-%EA%B8%B0%EB%8A%A5%EC%9D%B4-activity-7460093976893755392-Q7wE
- Original shared URL: https://www.linkedin.com/posts/gb-jeong_claude-code%EA%B0%80-%EC%B2%98%EC%9D%8C%EC%9C%BC%EB%A1%9C-codex%EB%A5%BC-%EB%94%B0%EB%9D%BC%ED%96%88%EB%8A%94%EB%8D%B0%EC%9A%94-%EA%B7%B8-%EA%B8%B0%EB%8A%A5%EC%9D%B4-share-7459998226222567425-9ZoA?[REDACTED_QUERY]
- Activity ID: 7460093976893755392
- Public JSON-LD commentCount: 7
- Public JSON-LD comments exposed: 5
- Public JSON-LD interactions: LikeAction: 238; CommentAction: 7
- Feedshare image: `figures/feedshare-image.jpg` (downloaded from LinkedIn `image.url`; query tokens redacted in stored metadata)

## Extraction caveat

This capture uses the public LinkedIn SSR JSON-LD `SocialMediaPosting` object. The post body and 5 comments were recovered from the public HTML, but LinkedIn reports `commentCount: 7`. Because comments/reactions can be login-gated or incomplete, quality is marked `manual_correction_needed` even though the post body itself was recovered cleanly.

## Post body as exposed by LinkedIn JSON-LD

Claude Code가 처음으로 Codex를 따라했는데요. 그 기능이 "/goal"입니다. 랄프 루프입니다. 기념으로 좋은 아티클을 발견해서 공유합니다. Ralphthon에도 반영해야겠어요. Codex에 /goal 기능으로 몇 시간씩 돌리는 사람도 있다는데, 잘 안 되는 케이스의 대부분은 모델이 약해서가 아니라 종료 조건이 비어있기 때문입니다.

"Using Codex Goals Effectively" 블로그와 Codex 공식 문서 "Follow a goal" 두 글을 같이 읽고 나서 보이는 게 있어서 정리합니다.

먼저 /goal의 작동 모델부터 보면요. 내부는 4단계 루프입니다.

1. execute — agent가 행동을 함
2. score — 결과에 점수를 매김
3. check — 그 점수가 목표를 충족했는지 비교
4. continue / terminate — 충족이면 멈추고, 아니면 1번으로

여기서 사람들이 가장 자주 혼동하는 게 score와 goal입니다. 점수는 모델이 알아서 매길 수 있어도, "몇 점이면 끝인가"는 사용자가 박아줘야 합니다. 저울은 모델이 들고 있고, 눈금은 프롬프트가 새깁니다. 눈금 없는 저울은 무한히 잽니다.

종료 조건이 비어있으면 두 가지 정반대의 실패 모드가 나옵니다.

1. 너무 일찍 포기 — 몇 분 일하다 "다 한 것 같다"며 종료
2. 절대 멈추지 않음 — 끝없이 수정하면서 방향성 없이 헤맴

겉으로는 완전히 반대로 보이지만, 뿌리는 같습니다. 종료 판단을 모델 직감에 맡겼기 때문입니다. 보수적인 직감은 1번, 적극적인 직감은 2번으로 갈립니다. 처방도 같습니다. 정량 목표를 박으세요.

"코드를 개선해줘"는 종료 조건이 없습니다. "specific_file의 런타임을 20% 줄이되 기존 테스트 무회귀"는 종료 조건이 박혀있습니다.

근데 정성적인 작업은 어떻게 정량화하나요? 블로그 저자가 보여준 트릭이 인상적이었습니다. NeurIPS 논문을 ICML 포맷으로 변환할 때, 그는 ICML 스타일 LaTeX 파일에서 200개 이상의 포맷 규칙을 markdown 체크리스트로 추출했습니다. 그리고 목표를 바꿨습니다.

"ICML 포맷에 맞춰라" → "checklist 200/200 체크해라"

모델은 "글이 전체적으로 좋은가?"는 못 판단해도, "이 한 줄 규칙이 충족됐는가?"는 200번 다 잘합니다. 미시 yes/no의 누적이 거시 판단을 대체합니다.

다음은 피드백 루프입니다.

루프가 며칠짜리면 학습이 느립니다. 그래서 proxy를 씁니다. 풀 데이터셋(며칠) 대신 작은 셋(몇 분)으로 검증하는 식입니다. 다만 proxy fidelity를 가끔 검증해야 합니다. 작은 셋에서 1등인 아키텍처가 풀 셋에서 평범하면, 빠른 루프가 오히려 잘못된 방향으로 수렴시킵니다.

마지막이 장기 기억입니다.

저자는 세 종류의 마크다운 파일을 agent에게 줍니다.

PLAN.md — 앞으로 뭘 할지 (미래)
EXPERIMENT_NOTES.md — 지금 무슨 생각 중인지 (현재)
EXPERIMENTS.md — 뭘 시도했고 결과가 뭐였는지 (과거)

세 개 중 EXPERIMENTS.md가 가장 중요하다고 합니다. 며칠 도는 agent의 가장 비싼 실수는 이미 실패한 걸 또 시도하는 거예요. 컨텍스트는 압축되지만, "X 방법은 Y 이유로 실패했다"는 학습이 사라지면 같은 함정에 또 빠집니다. 연구실 노트 3권 중 실험 일지가 사라지면 처음부터 다시 해야 하는 것과 같습니다.

저는 이게 agent만의 이야기가 아니라고 봅니다.

deep-thought를 매일 굴리면서 같은 구조를 반복해서 마주칩니다. compound 스킬은 검증된 인사이트를 knowledge/solutions/에 누적합니다. 새 작업 시작 전 learnings-researcher가 과거 인사이트를 자동 검색합니다. wiki-pipeline은 source-safe 신호를 raw layer로 떨어뜨려 같은 분석을 두 번 하지 않게 합니다. 전부 EXPERIMENTS.md의 변형입니다.

그래서 /goal이 풀린 이 시점이 중요합니다. AI agent가 몇 분이 아니라 며칠씩 도는 시대로 넘어가고 있어요. 그러면 새 핵심 역량은 "프롬프트를 잘 쓰는 것"이 아니라 "agent를 잘 굴리는 것"이 됩니다. 그리고 잘 굴리는 것의 대부분은 세 가지입니다.

1. 종료 조건을 정량화한다 (체크리스트로 정성을 정량으로 바꾸는 트릭 포함)
2. 피드백 루프를 빠르게 하되, proxy fidelity를 가끔 검증한다
3. 검증된 학습을 파일에 누적한다 (EXPERIMENTS.md 패턴)

agent가 며칠을 도는 시대, 무게는 프롬프트가 아니라 종료 조건에 있습니다.

## Public comments exposed by LinkedIn JSON-LD

### Comment 1: Seunghoon Choi

- Published: 2026-05-12T22:53:46.321Z
- Like count exposed: 3

흥미로운 글 감사합니다. 이 블로그 인 것 같아 첨부합니다

https://www.linkedin.com/pulse/using-codex-goals-effectively-chris-hayduk-np7re?utm_source=share&utm_medium=member_ios&utm_campaign=share_via

### Comment 2: Victor M.

- Published: 2026-05-13T06:59:15.685Z
- Like count exposed: 2

“ICML 포맷에 맞춰라”보다 “checklist 200/200을 만족시켜라”로 바꾼 예시가 정말 흥미롭네요.
정성적인 목표를 정량적인 종료 조건으로 바꾸는 과정 자체가 핵심 같다는 생각이 듭니다.

### Comment 3: 심규서

- Published: 2026-05-13T21:56:06.891Z
- Like count exposed: 0

좋은 인사이트를 얻었습니다. 며칠씩 돌아가는 agent라면 api token 비용도 고려되어야 할 요소일 것 같다는 생각이 듭니다. 점점더 local LLM 활용에 대해 어떻게 좀 더 효율적으로 활용해야할지 깊은 고민이듭니다. 고맙습니다.

### Comment 4: Hyuksool Kwon

- Published: 2026-05-13T04:16:17.486Z
- Like count exposed: 0

Score를 사용자가 조절할 수 있을까요?

### Comment 5: JaeHwan So

- Published: 2026-05-13T04:24:33.412Z
- Like count exposed: 0

미시 Yes/No → 거시적 작업 완료라는 부분이 인상깊습니다. 말씀주신대로 엔지니어링에만 국한된 얘기가 아니라는 것에 공감됩니다.


## Referenced / related links

- Chris Hayduk, `Using Codex Goals Effectively`: https://www.linkedin.com/pulse/using-codex-goals-effectively-chris-hayduk-np7re
- Local archive of the Pulse article: `archive/2026/05/w3/2026-05-15-linkedin-pulse-chris-hayduk-np7re/`
- OpenAI Codex use case, `Follow a goal`: https://developers.openai.com/codex/use-cases/follow-goals
- OpenAI Markdown snapshot: `source/openai-codex-follow-goals.md`
- Claude Code docs, `Keep Claude working toward a goal`: https://code.claude.com/docs/en/goal
- Claude Code Markdown snapshot: `source/claude-code-goal.md`

## LinkedIn image URL

https://media.licdn.com/dms/image/v2/D5622AQF67yGQfhBXHg/feedshare-shrink_800/B56Z4c828QH4Ag-/0/1778602176566?[REDACTED_QUERY]
