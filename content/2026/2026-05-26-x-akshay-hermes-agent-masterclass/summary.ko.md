# 한국어 요약 - Hermes Agent Masterclass

## 한 줄 요약

Akshay의 X Article은 Hermes Agent를 “사용할수록 좋아지는 개인 AI 에이전트 프레임워크”로 소개하면서, 지속 메모리, 자체 생성/관리되는 skills, GEPA 기반 오프라인 최적화, 프로필을 통한 다중 에이전트 운영, Telegram/cron 연동까지 하나의 튜토리얼로 묶어 설명한다.

## 핵심 내용

### 1. 문제의식: 대부분의 에이전트는 세션이 끝나면 잊는다

글은 일반 AI 에이전트의 가장 큰 약점을 “사용자의 선호, 프로젝트 규칙, 이전에 힘들게 찾아낸 해결책을 다음 세션에서 다시 모른다”는 점으로 잡는다. Hermes는 이를 단순 채팅봇이 아니라 장기적으로 누적되는 작업 환경으로 만든다는 메시지를 내세운다.

### 2. Hermes의 차별점: 메모리 + skills + GEPA

글이 제시하는 Hermes의 핵심 조합은 세 가지다.

- **Persistent memory**: 사용자 프로필과 환경 노트 같은 핵심 정보를 계속 보존한다.
- **Self-evolving skills**: 복잡한 작업을 해결한 뒤 절차를 Markdown skill로 저장하고 다음에 재사용한다.
- **GEPA**: 실행 trace를 바탕으로 skill/prompt를 오프라인에서 평가하고 개선하는 companion 최적화 파이프라인으로 설명된다.

이 조합을 통해 “에이전트가 경험을 쌓고, 정리하고, 더 나은 절차로 굳히는 루프”가 만들어진다는 것이 글의 중심 주장이다.

### 3. 아키텍처 설명

본문은 Hermes가 하나의 `AIAgent` core loop을 중심으로 CLI, messaging gateway, batch/cron, IDE integration 등이 같은 핵심 에이전트로 들어간다고 설명한다. ReAct 스타일 루프, tool call 실행, context compression, provider abstraction, terminal backend 교체 가능성 등을 언급한다.

### 4. Identity layer: SOUL.md

글은 메모리나 skill 이전에 에이전트의 “성격/운영 원칙”을 정하는 identity layer가 필요하다고 설명한다. 예시로 `SOUL.md`를 제시하고, 이것이 시스템 프롬프트의 앞부분에 들어가 에이전트의 톤과 판단 기준을 고정한다고 설명한다.

### 5. 세 단계 memory 구조

글의 memory 설명은 세 단계다.

- **Tier 1**: `MEMORY.md`, `USER.md` 같은 작은 always-in-context 메모리
- **Tier 2**: SQLite/FTS 기반 session search
- **Tier 3**: 외부 memory provider plugin

핵심은 “중요한 사실은 작게 압축해서 항상 넣고, 나머지는 필요할 때 검색한다”는 구조다.

### 6. Skill loop와 Curator

Skills는 절차적 기억으로 설명된다. 에이전트가 5회 이상 tool call이 걸리는 복잡한 작업, 오류 해결, 사용자 correction, 비자명 workflow 발견 같은 상황에서 skill을 만들 수 있고, 이후 같은 상황에서 다시 로드해 재사용한다는 설명이다.

Curator는 오래되거나 중복된 skills를 정리하는 유지보수 시스템으로 소개된다. 단, 본문 설명은 글 작성 시점의 구현/문서 기준일 수 있으므로 실제 운영 전에 현재 Hermes docs와 로컬 checkout을 확인해야 한다.

### 7. GEPA

GEPA는 Hermes runtime 자체가 아니라 companion repository의 오프라인 최적화로 소개된다. 글은 GEPA가 에이전트의 자기평가를 믿는 대신 execution trace를 읽고 실패 지점을 분석해 skill/prompt 후보를 만들며, LLM-as-judge와 constraint gate를 거쳐 PR로 반영하는 구조라고 설명한다.

### 8. 설치와 다중 에이전트 운영

후반부는 hands-on 튜토리얼이다.

- 설치 스크립트 실행
- `hermes setup`
- Telegram bot 연결
- profile 세 개 생성: designer, programmer, researcher
- 각 profile에 별도 Telegram bot과 별도 personality 부여
- programmer profile은 Claude Code CLI에 실행을 위임
- designer profile은 reference image를 보고 style skill 생성
- researcher profile은 cron으로 매일 AI/ML digest 작성

## 읽을 때 주의할 점

- 이 글은 공식 문서가 아니라 X Article 형식의 튜토리얼/홍보성 설명이다.
- 코드 예시와 명령어는 작성 시점 기준일 수 있으므로, 실제 적용 전에는 현재 Hermes CLI와 config 문서를 확인해야 한다.
- 별도 profile gateway를 여러 개 띄우는 구조는 Telegram bot token 충돌 문제가 있으므로, 같은 봇/같은 그룹 내 topic 분리에는 topic prompt나 단일 gateway routing이 더 안전할 수 있다.
- GitHub star 수, skill hub 개수, GEPA 세부 구현 등은 시간에 따라 변한다.

## 보존 품질

- X Article Draft.js 본문을 fxtwitter/vxtwitter API에서 복원했다.
- 직접 X HTML, X article HTML, oEmbed, fxtwitter/vxtwitter JSON을 `source/`에 함께 저장했다.
- 이미지 15개, 동영상 2개, 총 media 17개를 로컬 `figures/`에 보존했다.
- 현재 GitHub API 기준 `NousResearch/hermes-agent` stars: 167955.
