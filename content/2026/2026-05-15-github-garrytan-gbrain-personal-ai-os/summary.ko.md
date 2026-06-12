# GBrain 요약

## 한 줄 요약

`garrytan/gbrain`은 Garry Tan의 OpenClaw/Hermes 운영 경험을 일반화한 개인 AI OS/에이전트 브레인 저장소다. Markdown 지식 저장소, Postgres/PGLite, 하이브리드 검색, typed knowledge graph, skill routing, cron/dream-cycle 유지보수, MCP/OAuth 서버, 평가 캡처를 한 제품 안에 묶는다.

## 핵심 내용

- 공식 설명: `Garry's Opinionated OpenClaw/Hermes Agent Brain`
- 저장소 상태: fetch 시점 기준 15,659 stars, 2,098 forks, open issues 423, MIT license.
- 런타임: TypeScript/Bun 기반 CLI 패키지 `gbrain` v0.33.3.0; 주요 의존성으로 MCP SDK, PGLite, pgvector, AI SDK 계열, Express, Zod 등을 포함한다.
- README가 제시하는 핵심 주장: Garry의 실제 OpenClaw/Hermes 운영 브레인에서 출발했고, production brain 규모와 검색/그래프 벤치마크, 34 skills, 30분 설치, BrainBench/LongMemEval/Eval capture 등을 내세운다. 이 숫자는 현재 아카이브에서는 README self-report로 보존했다.
- 아키텍처 축: Markdown brain repo + embedded/local Postgres 또는 Supabase + deterministic entity/link extraction + hybrid retrieval + MCP tools + autonomous cron/dream-cycle.
- 에이전트 운영 축: `AGENTS.md`/`CLAUDE.md`, skills resolver, `skillify`, `minions`, durable agents, `gbrain agent`, `gbrain jobs supervisor`가 장기 작업과 반복 실패를 구조화한다.

## Hermes 관점에서 중요한 포인트

1. **메모리와 스킬을 같은 운영체계로 본다.** 단순 저장소가 아니라 skill routing, filing rules, dream-cycle, eval gate까지 포함한 'agent brain' 패키지다.
2. **Graphify/Hermes archive와 직접 연결된다.** raw corpus, typed links, hybrid retrieval, query/eval loop는 현재 Hermes article archive와 장기 기억 설계에 바로 비교할 수 있다.
3. **운영 안전장치가 강하다.** eval capture는 opt-in, OAuth MCP는 scope/logging을 강조하고, bulk content를 git 밖으로 분리하는 storage tiering이 있다.
4. **다만 벤치마크와 production 규모는 README 주장이다.** GBrain eval repo나 실제 데이터 재현 없이 숫자를 확정 사실처럼 쓰면 안 된다.

## 읽는 순서

1. `article_index.md`
2. `summary.ko.md`
3. `knowledge-card.ko.md`
4. `original.en.md`의 metadata와 README self-description claim lines
5. `tree-snapshot.md`
6. 필요 시 `github-api-metadata.json`과 `source/` raw artifacts
