# 요약 — Headroom

원문: https://github.com/chopratejas/headroom
저장일: 2026-06-02

Headroom은 AI 에이전트를 위한 로컬 우선, 가역 컨텍스트 압축 레이어를 표방하는 GitHub 프로젝트다. 도구 출력, 로그, RAG 청크, 파일, 대화 이력 등이 LLM에 들어가기 전에 압축되어 토큰 사용량을 줄이면서 답변 품질을 유지하는 것을 목표로 한다.

## 핵심 주장

- 선택된 에이전트 워크로드에서 60-95% 토큰 절감.
- 라이브러리, 프록시, 에이전트 래퍼, MCP 서버 방식 제공.
- local-first 처리: 데이터가 사용자의 환경에 남는다고 설명.
- CCR을 통한 가역 압축: 원본을 보존하고 필요 시 다시 검색.
- Claude, Codex, Gemini, Cursor, Aider, Copilot CLI, OpenClaw 등 여러 에이전트 사이의 공유 메모리.
- `headroom learn`으로 실패 세션을 분석해 `CLAUDE.md`, `AGENTS.md` 같은 지시 파일에 correction을 기록.

## 구조

README는 CacheAligner, ContentRouter, SmartCrusher, CodeCompressor, Kompress-base, IntelligentContext/RollingWindow, 교차 에이전트 메모리, MCP 도구로 이루어진 파이프라인을 설명한다. ContentRouter가 콘텐츠 유형을 보고 JSON, 코드, prose, 이미지 등에 맞는 압축기를 고르고, CCR은 압축 때문에 빠진 세부 정보를 원본에서 다시 가져오게 한다.

## 저장소가 제시하는 근거

README는 code search, SRE incident debugging, GitHub issue triage, codebase exploration에 대한 토큰 절감 표와 GSM8K, TruthfulQA, SQuAD v2, BFCL의 작은 벤치마크 표를 제시한다. 다만 이는 저장소 제공 주장으로 보아야 하며, 실제 도입 전에는 독립 재현이 필요하다.

## 왜 중요한가

에이전트 중심 워크플로우에서 병목은 모델 성능만이 아니다. 컨텍스트 윈도우 비용, 장황한 도구 출력, RAG 노이즈, 에이전트 간 반복 컨텍스트 전달이 큰 비용이 된다. Headroom의 가역 압축 주장이 실제로 성립한다면, 장기 실행 코딩 에이전트나 Hermes식 작업 루프에서 기본 인프라 레이어가 될 수 있다.
