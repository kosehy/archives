# Superpowers - Korean Summary

## 한 줄 요약

`obra/superpowers`는 코딩 에이전트에게 “무작정 코딩하지 말고, 문제 정의 -> 설계 -> 계획 -> TDD -> 서브에이전트 실행 -> 리뷰 -> 완료 검증”을 강제하는 agentic skills framework이자 소프트웨어 개발 방법론 저장소다.

## 핵심 포인트

- 공식 설명: “An agentic skills framework & software development methodology that works.”
- README 기준 핵심 흐름: 아이디어 단계에서 바로 코드 작성으로 뛰지 않고, 진짜 문제를 묻고, 짧게 검토 가능한 spec을 만들고, 실행 가능한 implementation plan을 만든 뒤, TDD와 subagent-driven development로 구현한다.
- 다중 에이전트/도구 지원: Claude Code, Codex CLI/App, Factory Droid, Gemini CLI, OpenCode, Cursor, GitHub Copilot CLI 등 여러 coding-agent harness에 맞춘 설치/플러그인 파일이 있다.
- 저장소 구조상 핵심 자산은 `skills/` 아래의 개별 `SKILL.md` 파일들이다. 주요 skill은 brainstorming, writing-plans, test-driven-development, systematic-debugging, subagent-driven-development, requesting/receiving-code-review, verification-before-completion 등이다.
- Contributor guidelines(`CLAUDE.md`)는 agent-generated slop PR을 강하게 경계한다. PR 전 문제 실재성, 중복 PR, core 적합성, 전체 diff 검토, 명시 승인 등을 요구한다.

## 현재 GitHub API snapshot

- Stars: 193,114
- Forks: 17,173
- Open issues: 270
- License: `MIT`
- Default branch: `main`
- Package version: `5.1.0`
- Recursive tree entries: 193, truncated: `False`

## Hermes 관점에서의 의미

이 저장소는 Hermes의 skill-first, planning-first, verification-first 운영 철학과 매우 가깝다. 특히 “skill을 먼저 로드하라”, “계획 없는 구현을 경계하라”, “서브에이전트는 독립 컨텍스트로 실행하라”, “완료 전 검증하라”는 패턴이 Hermes의 article/archive, coding, workflow 운영 규칙과 직접 연결된다.

## 사용 시 caveat

- Stars/forks/issues/workflow 상태는 GitHub API snapshot이다. 시간이 지나면 달라진다.
- README의 성능/자율작업 관련 표현은 repository self-description이다. 독립 벤치마크로 검증된 수치로 쓰면 안 된다.
- 이 repo가 좋은 workflow를 제공한다는 점과, 특정 조직에서 품질 향상을 보장한다는 주장은 별개다. 실제 효과는 agent, task, review policy, CI, human approval 방식에 의존한다.
