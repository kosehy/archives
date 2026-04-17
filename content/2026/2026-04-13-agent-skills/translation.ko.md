# agent-skills

원문: https://github.com/addyosmani/agent-skills
저장일: 2026-04-13
번역 메모: 직역보다 자연스러운 한국어 흐름을 우선해 다듬은 번역본.

AI 코딩 에이전트를 위한 프로덕션급 엔지니어링 스킬 모음이다.

이 저장소에서 말하는 “스킬”은 숙련된 엔지니어가 소프트웨어를 만들 때 사용하는 워크플로, 품질 게이트, 베스트 프랙티스를 담은 구조화된 단위다. 이를 패키징해 두어, AI 에이전트가 개발 전 단계에서 일관되게 따를 수 있도록 한다.

```text
DEFINE PLAN BUILD VERIFY REVIEW SHIP
┌──────┐   ┌──────┐   ┌──────┐   ┌──────┐   ┌──────┐   ┌──────┐
│ Idea │ ─▶│ Spec │ ─▶│ Code │ ─▶│ Test │ ─▶│ QA   │ ─▶│ Go   │
│Refine│   │ PRD  │   │ Impl │   │Debug │   │ Gate │   │ Live │
└──────┘   └──────┘   └──────┘   └──────┘   └──────┘   └──────┘
/spec /plan /build /test /review /ship
```

저장소는 7개의 슬래시 명령을 개발 생애주기에 대응시킨다.

- `/spec` — 코드보다 명세를 먼저
- `/plan` — 작고 원자적인 작업으로 분해
- `/build` — 한 번에 하나의 얇은 단면씩 구현
- `/test` — 테스트는 증거다
- `/review` — 코드 건강도 개선
- `/code-simplify` — 영리함보다 명료함
- `/ship` — 빠를수록 더 안전하다

또한 API 설계, 프론트엔드 작업 등 실제 작업 맥락에 따라 적절한 스킬이 자동 활성화된다고 설명한다.

## 여러 도구 환경에서의 설치

저장소는 다양한 에이전트 환경에서의 설치 방법을 문서화한다.

- Claude Code (권장)
- Cursor
- Gemini CLI
- Windsurf
- OpenCode
- GitHub Copilot
- Kiro IDE & CLI
- Codex / 기타 에이전트

Claude Code용으로는 마켓플레이스 설치 명령이 제시되며, SSH 설정 문제가 있을 경우 HTTPS를 대신 쓰는 방법도 안내한다. 로컬 개발 시에는 저장소를 직접 클론하고 Claude에 plugin 디렉터리를 지정하는 방식도 가능하다.

## 핵심 스킬

저장소는 최상위 명령들이 개발 생애주기를 아우르는 20개의 구조화된 스킬을 활성화한다고 설명한다. 포함된 스킬은 다음과 같다.

- idea-refine
- spec-driven-development
- planning-and-task-breakdown
- incremental-implementation
- test-driven-development
- context-engineering
- source-driven-development
- frontend-ui-engineering
- api-and-interface-design
- browser-testing-with-devtools
- debugging-and-error-recovery
- code-review-and-quality
- code-simplification
- security-and-hardening
- performance-optimization
- git-workflow-and-versioning
- ci-cd-and-automation
- deprecation-and-migration
- documentation-and-adrs
- shipping-and-launch

각 스킬은 단순 참고 문서가 아니라, 단계, 검증 게이트, anti-rationalization table까지 포함한 구조화된 워크플로로 설명된다.

## 전문 페르소나와 참고 자료

저장소에는 타깃 리뷰를 위한 전문 페르소나도 포함되어 있다.

- code-reviewer
- test-engineer
- security-auditor

그리고 다음과 같은 quick-reference 자료도 제공한다.

- testing-patterns.md
- security-checklist.md
- performance-checklist.md
- accessibility-checklist.md

## 스킬의 공통 구조

저장소는 모든 스킬이 일관된 구조를 따른다고 설명한다.

- name과 description이 들어간 frontmatter
- Overview
- When to Use
- Process
- Rationalizations
- Red Flags
- Verification

그리고 다음과 같은 설계 원칙을 강조한다.

- prose가 아니라 process여야 한다
- anti-rationalization을 포함해야 한다
- verification은 협상 불가다
- progressive disclosure를 따른다

## 저장소 구조

```text
agent-skills/
├── skills/
├── agents/
├── references/
├── hooks/
├── .claude/commands/
└── docs/
```

이 저장소는 AI 코딩 에이전트가 기본적으로 가장 짧은 경로를 택하려 하고, 그 과정에서 명세, 테스트, 보안 검토 같은 신뢰성 확보 절차를 건너뛰기 쉽다고 본다. Agent Skills는 바로 그 지점에 senior engineer 수준의 규율을 부여하려는 시도다.

또한 Google 계열 엔지니어링 문화에서 나온 여러 개념, 예를 들어 Hyrum’s Law, Beyonce Rule, test pyramid, change sizing, Chesterton’s Fence, trunk-based development, Shift Left, feature flags, deprecation을 코드 부채 관리로 보는 관점 등을 각 스킬의 실제 워크플로에 녹여 넣었다고 설명한다.

결국 이 저장소의 주장은 스킬은 구체적이어야 하고, 검증 가능해야 하며, 실전에서 검증돼 있어야 하고, 꼭 필요한 만큼만 최소한으로 담겨야 한다는 것이다.

MIT 라이선스다.
