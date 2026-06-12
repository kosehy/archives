# Headroom - AI 에이전트를 위한 컨텍스트 압축 레이어

원문: https://github.com/chopratejas/headroom
저장일: 2026-06-02
원문 언어: 영어
저장소: `chopratejas/headroom`
라이선스: Apache-2.0
주 언어: Python
GitHub 스냅샷: stars 4379, forks 351, updated 2026-06-02T06:09:50Z

## 보존 메모

- 이 문서는 GitHub README를 한국어로 읽기 쉽게 옮긴 번역본이다.
- 직접 페이지 추출은 GitHub UI의 빈 항목만 많이 남겨 부분 추출에 그쳤기 때문에, GitHub API로 README와 저장소 메타데이터를 다시 캡처했다.
- 본문 이미지/GIF는 `figures/` 아래 로컬 파일로 보존했다.
- 60-95% 토큰 절감, 벤치마크 정확도 유지, 60B+ 토큰 절감 등은 저장소 작성자의 주장이다. 독립 재현 전에는 검증 완료 사실로 보지 않는다.

```text
HEADROOM
AI 에이전트를 위한 컨텍스트 압축 레이어
```

**60-95% 더 적은 토큰 · 라이브러리 · 프록시 · MCP · 6개 알고리즘 · local-first · reversible**

AI 에이전트와 LLM은 `llms.txt` 또는 라이브 문서 인덱스/전체 문서 블롭을 읽도록 안내되어 있다.

---

> Headroom은 AI 에이전트가 읽는 도구 출력, 로그, RAG 청크, 파일, 대화 이력 등을 LLM에 도달하기 전에 압축한다. 목표는 같은 답을 유지하면서 토큰을 훨씬 적게 쓰는 것이다.

<p align="center">
  <img src="figures/HeadroomDemo-Fast.gif" alt="Headroom in action" width="820">
  <br/><sub>라이브 예시: 10,144 토큰 → 1,260 토큰, 같은 FATAL 발견.</sub>
</p>

## 무엇을 하는가

- **라이브러리**: Python 또는 TypeScript에서 `compress(messages)`를 직접 호출한다.
- **프록시**: `headroom proxy --port 8787`로 코드 변경 없이 프록시를 둔다.
- **에이전트 래핑**: `headroom wrap claude|codex|cursor|aider|copilot`로 주요 코딩 에이전트를 감싼다.
- **MCP 서버**: `headroom_compress`, `headroom_retrieve`, `headroom_stats` 도구를 MCP 클라이언트에 제공한다.
- **교차 에이전트 메모리**: Claude, Codex, Gemini 등 여러 에이전트가 공유하는 저장소와 자동 중복 제거를 제공한다.
- **`headroom learn`**: 실패한 세션을 채굴해서 `CLAUDE.md`, `AGENTS.md` 등에 교정 내용을 쓴다.
- **가역 압축(CCR)**: 원본은 삭제하지 않고, 필요하면 LLM이 다시 가져오게 한다.

## 작동 방식

```text
사용자의 에이전트 / 앱
  Claude Code, Cursor, Codex, LangChain, Agno, Strands, 자체 코드 등
       │ prompts · tool outputs · logs · RAG results · files
       ▼
   Headroom - 로컬에서 실행, 데이터는 사용자의 환경에 남음
       CacheAligner → ContentRouter → CCR
                     ├─ SmartCrusher   JSON
                     ├─ CodeCompressor AST
                     └─ Kompress-base  text, HF
       Cross-agent memory · headroom learn · MCP
       ▼
   압축된 프롬프트 + 검색 도구
       ▼
   LLM provider - Anthropic, OpenAI, Bedrock 등
```

핵심 구성요소는 다음과 같다.

- **ContentRouter**: 콘텐츠 유형을 감지하고 적절한 압축기를 고른다.
- **SmartCrusher / CodeCompressor / Kompress-base**: JSON, AST, prose를 각각 압축한다.
- **CacheAligner**: provider KV cache가 더 잘 맞도록 prefix를 안정화한다.
- **CCR**: 원본을 로컬에 저장하고 필요하면 `headroom_retrieve`로 다시 가져오게 한다.

## 60초 시작 방법

```bash
pip install "headroom-ai[all]"          # Python
npm install headroom-ai                 # Node / TypeScript

headroom wrap claude                    # 코딩 에이전트 래핑
headroom proxy --port 8787              # 코드 변경 없는 프록시
# 또는 Python에서: from headroom import compress

headroom stats
```

세부 extras는 `[proxy]`, `[mcp]`, `[ml]`, `[agno]`, `[langchain]`, `[evals]`이고, Python 3.10 이상을 요구한다.

## 근거로 제시된 결과

README는 실제 에이전트 워크로드에서 다음과 같은 절감 사례를 제시한다.

| Workload | Before | After | Savings |
|---|---:|---:|---:|
| Code search 100 results | 17,765 | 1,408 | 92% |
| SRE incident debugging | 65,694 | 5,118 | 92% |
| GitHub issue triage | 54,174 | 14,761 | 73% |
| Codebase exploration | 78,502 | 41,254 | 47% |

표준 벤치마크에서는 다음과 같이 정확도 보존을 주장한다.

| Benchmark | Category | N | Baseline | Headroom | Delta |
|---|---|---:|---:|---:|---|
| GSM8K | Math | 100 | 0.870 | 0.870 | ±0.000 |
| TruthfulQA | Factual | 100 | 0.530 | 0.560 | +0.030 |
| SQuAD v2 | QA | 100 | - | 97% | 19% compression |
| BFCL | Tools | 100 | - | 97% | 32% compression |

재현 명령은 `python -m headroom.evals suite --tier 1`이며, README는 전체 벤치마크와 방법론 문서를 연결한다.

<p align="center">
  <img src="figures/headroom-savings.png" alt="60B+ tokens saved — community leaderboard" width="820">
  <br/><b>커뮤니티 전체 60B+ 토큰 절감 라이브 리더보드</b>
</p>

## 에이전트 호환성

| Agent | `headroom wrap` | Notes |
|---|:---:|---|
| Claude Code | ● | `--memory`, `--code-graph` |
| Codex | ● | Claude와 메모리 공유 |
| Cursor | ● | 설정을 출력하고 사용자가 한 번 붙여넣음 |
| Aider | ● | 프록시를 시작하고 실행 |
| Copilot CLI | ● | 프록시를 시작하고 실행 |
| OpenClaw | ● | ContextEngine 플러그인으로 설치 |

OpenAI-compatible 클라이언트는 `headroom proxy`로 사용할 수 있고, MCP-native 환경은 `headroom mcp install`로 연결한다.

## 언제 쓰면 좋은가, 언제 피하면 좋은가

좋은 경우:

- AI 코딩 에이전트를 매일 사용하고, 코드 변경 없이 토큰 비용을 줄이고 싶을 때
- 여러 에이전트 사이에 공유 메모리가 필요할 때
- 원본을 다시 가져올 수 있는 가역 압축이 필요할 때

피하는 것이 나은 경우:

- 단일 provider의 native compaction만 쓰고 교차 에이전트 메모리가 필요 없을 때
- 로컬 프로세스를 실행할 수 없는 샌드박스 환경에서 일할 때

## 통합 방식

README는 Python 앱, TypeScript 앱, Anthropic/OpenAI SDK, Vercel AI SDK, LiteLLM, LangChain, Agno, Strands, ASGI 앱, multi-agent 시스템, MCP 클라이언트와의 통합 경로를 제시한다.

## 내부 구성

- **SmartCrusher**: 배열, 중첩 객체, 혼합 타입을 포함한 JSON 압축.
- **CodeCompressor**: Python, JS, Go, Rust, Java, C++용 AST 기반 압축.
- **Kompress-base**: agentic trace로 학습한 HuggingFace 텍스트 압축 모델.
- **Image compression**: ML router 기반 40-90% 감소.
- **CacheAligner**: Anthropic/OpenAI KV cache hit 향상을 위한 prefix 안정화.
- **IntelligentContext**: 학습된 중요도 기반 context fitting.
- **CCR**: 원본 검색이 가능한 가역 압축.
- **Cross-agent memory**: 에이전트 provenance와 자동 중복 제거를 포함한 공유 저장소.
- **SharedContext**: multi-agent workflow 간 압축 컨텍스트 전달.
- **`headroom learn`**: Claude, Codex, Gemini 실패 세션에서 correction을 채굴한다.

## 파이프라인 내부

Headroom은 `compress()`, SDK, proxy 전반에 걸쳐 하나의 request lifecycle을 제공한다고 설명한다.

```text
Setup → Pre-Start → Post-Start → Input Received → Input Cached → Input Routed
→ Input Compressed → Input Remembered → Pre-Send → Post-Send → Response Received
```

변환 계층에는 CacheAligner, ContentRouter, SmartCrusher, CodeCompressor, Kompress-base, IntelligentContext / RollingWindow가 포함된다. Provider/tool-specific 동작은 `headroom/providers/` 아래로 분리되어 core orchestration이 lifecycle, sequencing, policy에 집중하도록 설계되어 있다.

## 설치

```bash
pip install "headroom-ai[all]"
npm install headroom-ai
docker pull ghcr.io/chopratejas/headroom:latest
```

`pipx` 사용자는 지원되는 인터프리터를 명시하라고 안내한다.

```bash
pipx install --python python3.13 "headroom-ai[all]"
```

## headroom learn

<p align="center">
  <img src="figures/headroom_learn.gif" alt="headroom learn in action" width="720">
</p>

`headroom learn`은 실패한 세션을 채굴해 `CLAUDE.md`, `AGENTS.md`, `GEMINI.md`에 correction을 기록하는 기능이다.

## 문서

README는 Quickstart, Proxy, MCP tools, Memory, Failure learning, Configuration, Architecture, compression internals, CCR, cache optimization, benchmarks, limitations 문서로 연결한다.

## 비교 대상

Headroom은 자신을 다음과 같이 차별화한다.

- Headroom: 모든 컨텍스트를 대상으로 하며 proxy, library, middleware, MCP 방식으로 배포 가능하고 local/reversible이라고 주장한다.
- RTK: CLI command output 중심, local이지만 reversible은 아님.
- lean-ctx: CLI commands, MCP tools, editor rules 중심, local이지만 reversible은 아님.
- Compresr / Token Co.: hosted API 중심, local/reversible 아님.
- OpenAI Compaction: provider-native conversation history 중심, local/reversible 아님.

또한 Headroom은 shell output rewriting을 위해 RTK binary를 포함하고 있으며, lean-ctx도 선택적 CLI context tool로 사용할 수 있다고 밝힌다.

## 기여와 커뮤니티

```bash
git clone https://github.com/chopratejas/headroom.git && cd headroom
pip install -e ".[dev]" && pytest
```

Devcontainer는 기본 환경과 Qdrant/Neo4j를 포함한 `memory-stack` 구성이 있다. 커뮤니티는 live leaderboard, Discord, HuggingFace의 Kompress-base 모델 카드로 연결된다.

## 라이선스

Apache 2.0.
