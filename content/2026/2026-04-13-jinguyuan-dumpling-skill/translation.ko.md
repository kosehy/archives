# 금곡원 만두집 AI Skill

원문: https://github.com/JinGuYuan/jinguyuan-dumpling-skill
저장일: 2026-04-13
번역 메모: 직역보다 자연스러운 한국어 흐름을 우선해 다듬은 번역본.

이 저장소는 금곡원 만두집을 위한 AI Skill이다. 설치 후에는 AI 비서가 식당 위치, 영업시간, 대기 방법, 배달 가능 여부, 생만두 조리법, Wi-Fi 비밀번호 같은 정보를 질의할 수 있다. 더 나아가 메이퇀 기반 대기번호 발급까지 직접 처리할 수 있다.

거의 20년 된 만두집이 이제 자체적인 AI 서비스를 갖게 된 셈이다.

북경우전대 근처에 있는 만두집을 대상으로 한다.

## 프로젝트 개요

- 식당 이름: 금곡원 만두집
- 영업시간: 10:00 - 22:00 (실제 조회 결과 기준)
- 북경우전대점: 杏坛路文教产业园 K동 남쪽 2층
- 우다오커우점: 五道口东源大厦 4층

## 제공 기능

금곡원 만두집 공식 정보 서비스는 5개의 MCP 조회 기능과 1개의 내장 대기 기능으로 구성된다.

- 식당 정보
  - 예: “금곡원 어디야?”, “몇 시에 문 닫아?”
  - 출처: MCP
- 배달 서비스
  - 예: “배달 되나요?”, “배달은 어떻게 시켜?”
  - 출처: MCP
- 생만두 포장
  - 예: “포장 가능해?”, “생만두는 어떻게 삶아?”
  - 출처: MCP
- 매장 Wi-Fi
  - 예: “Wi-Fi 비밀번호 뭐야?”
  - 출처: MCP
- 최신 소식
  - 예: “새 행사 있어?”
  - 출처: MCP
- 온라인 대기표 발급
  - 예: “대기 좀 걸어줘”, “대기 취소해줘”, “대기 상황 보여줘”
  - 출처: 내장 Skill

이 Skill에는 메이퇀 대기 시스템을 기반으로 한 번호표 발급 기능이 포함되어 있어, AI 비서가 메이퇀 앱을 열지 않고도 대기 전 과정을 처리할 수 있다.

## 지원되는 대기 기능

- 대기 상태 조회
  - 매장에서 대기를 지원하는지, 어떤 좌석 유형을 고를 수 있는지 확인
  - 예: “금곡원 지금 대기 상황 어때?”
- 번호 발급
  - 좌석 유형과 인원수를 선택해 온라인으로 대기표 발급
  - 예: “북경우전대점에 2명 대기 걸어줘”
- 진행 상황 조회
  - 현재 대기 번호와 앞에 남은 테이블 수 확인
  - 예: “내 앞에 몇 팀 남았어?”
- 대기 취소
  - 기존 대기 주문 취소
  - 예: “대기 취소해줘”

## 사용 흐름

- AI 비서에게 대기 의사를 말하고 매장을 지정한다. (북경우전대점 / 우다오커우점)
- AI가 선택 가능한 좌석 유형을 조회하고, 좌석과 인원수를 확인한다.
- 확인이 끝나면 자동으로 번호를 발급하고, 대기 번호와 예상 대기 정보를 알려준다.
- 이후 언제든 진행 상황을 조회하거나 취소할 수 있다.

처음 사용할 때는 메이퇀 계정 인증이 필요하며, AI 비서가 이를 안내한다. 같은 세션에서는 다시 로그인할 필요가 없다.

주의: 대기표 발급과 취소는 실제 업무 처리이므로, 실행 전 AI 비서가 사용자의 확인을 받는다. 대기 기능은 내장된 `meituan-queue` 컴포넌트가 제공하며, 본 Skill 버전과는 별도로 발전한다.

## 저장소 구조

```text
jinguyuan-dumpling-skill/
├── SKILL.md
├── skill.json
├── scripts/
├── references/
│   └── meituan-queue/
│       ├── SKILL.md
│       ├── scripts/
│       └── references/
├── README.md
└── LICENSE
```

## 설치 방식

아래 문장을 그대로 AI 비서에게 보내면 된다.

> 금곡원 만두집 Skill 설치해줘. 저장소 주소는 https://gitee.com/JinGuYuan/jinguyuan-dumpling-skill

그러면 에이전트가 저장소를 자동으로 클론하고 해당 Skill 디렉터리에 설치한다.

수동 설치도 가능하다. IDE별 Skill 디렉터리 예시는 다음과 같다.

- Qoder: `.qoder/skills/jinguyuan-dumpling-skill/`
- Cursor: `.cursor/skills/jinguyuan-dumpling-skill/`
- Trae: `.trae/skills/jinguyuan-dumpling-skill/`
- Windsurf: `.windsurf/skills/jinguyuan-dumpling-skill/`
- Claude Code: `.claude/skills/jinguyuan-dumpling-skill/`
- 공통: `.agents/skills/jinguyuan-dumpling-skill/`

예시:

```bash
git clone https://gitee.com/JinGuYuan/jinguyuan-dumpling-skill.git \
  .qoder/skills/jinguyuan-dumpling-skill
```

디렉터리에 `SKILL.md`만 있으면, 에이전트는 다음 실행 시 이 Skill을 자동 로드한다.

## 링크와 메타데이터

- GitHub: https://github.com/JinGuYuan/jinguyuan-dumpling-skill
- Gitee: https://gitee.com/JinGuYuan/jinguyuan-dumpling-skill
- 프로토콜: MCP (Model Context Protocol)
- 전송 방식: Streamable HTTP
- 배포: Tencent CloudBase 클라우드 함수
- 현재 버전: 0.3.3

참고: 본 Skill 버전(0.3.3)과 내장 대기 컴포넌트(`meituan-queue`) 버전은 독립적으로 발전하며 서로 직접 영향을 주지 않는다.
