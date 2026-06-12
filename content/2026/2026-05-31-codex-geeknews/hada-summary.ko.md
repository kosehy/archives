# GeekNews preservation: Codex, 활용 사례 모음 대폭 확장

- GeekNews URL: https://news.hada.io/topic?id=29847
- Original source linked by GeekNews: https://developers.openai.com/codex/use-cases
- Shared URL: https://share.google/VCkVZPspeQVYAj8FG
- Saved: 2026-05-31

## GeekNews body

- OpenAI가 **Codex의 활용 사례** 페이지를 대폭 개편해, 기존 12개에서 **52개의 유스케이스**로 확장 공개
- 이제 단순한 코딩 보조를 넘어 **엔지니어링·디자인·데이터·재무·운영·QA·세일즈 등 전사 팀이 일감을 위임하는 플랫폼**으로 포지셔닝이 이동
- Computer Use(Mac 자동화), Gmail 받은편지함 관리, Slack, Zoom, 문서, 스프레드시트, 재무 모델링(DCF·현금흐름·예산), iOS/macOS 네이티브 개발, 영업·마케팅용 워크플로, QA, 자동화, 배포, Evals, ChatGPT 앱까지 실제 업무 흐름을 Codex에 맡기는 형태로 정리

### 1. [Codex를 업무 동료로 설정하기 (Automation / Integrations)](https://developers.openai.com/codex/use-cases/proactive-teammate)

난이도: Easy | 소요시간: Long-running

- Slack, Gmail, Calendar, Notion, GitHub, Linear, 로컬 노트 등 업무가 실제로 흘러가는 도구들을 한 Codex 스레드에 연결해 “내 업무 맥락을 아는 동료”처럼 쓰는 방식임
- 첫 실행에서는 Codex가 놓치기 쉬운 중요한 요청, 바뀐 문서, 묻힌 결정, 막힌 핸드오프를 찾아오게 하고, 사용자가 유용한 것과 노이즈를 피드백함
- 이후 같은 스레드에 자동화를 걸어 정기적으로 컨텍스트를 확인하게 만들 수 있음. 판단이 필요한 결정은 Codex가 임의로 처리하지 않고 사용자에게 올리도록 설계함
- 적합 대상: 여러 도구에 흩어진 업무 맥락을 계속 추적해야 하는 개인, 운영자, 매니저, PM, 엔지니어

### 2. [피드백을 액션으로 바꾸기 (Data / Integrations)](https://developers.openai.com/codex/use-cases/feedback-synthesis)

난이도: Easy | 소요시간: 30m

- Slack 채널, GitHub/Linear 이슈, 설문 CSV, 고객 인터뷰 노트, Google Drive 문서 등 여러 출처의 피드백을 모아 Google Sheet나 Doc 형태의 검토 가능한 산출물로 정리함
- Codex가 피드백을 테마, 근거 링크, 후속 질문, 담당 액션으로 묶고, 검토된 내용을 Slack 업데이트나 이슈 초안으로 이어갈 수 있음
- 피드백 소스가 계속 바뀌는 경우 같은 스레드에 자동화를 걸어 신규 테마나 근거가 강해진 항목만 알려주게 할 수 있음
- 적합 대상: 베타 피드백, 고객 VOC, 이슈 스레드, 리서치 노트를 제품 액션으로 바꿔야 하는 팀

### 3. [지저분한 데이터 정리 및 준비 (Data / Knowledge Work)](https://developers.openai.com/codex/use-cases/clean-messy-data)

난이도: Easy | 소요시간: 5m

- CSV나 스프레드시트에 날짜 형식 혼재, 통화 문자열, 중복 행, 빈 값, 요약 행, 별칭 등이 섞여 있을 때 원본을 보존한 채 정리된 사본을 만들게 함
- 사용자는 이미 보이는 문제와 원하는 결과 형식, 예를 들어 정리된 CSV, 업로드용 파일, 새 시트 탭을 명확히 지정함
- Codex는 정리된 파일과 데이터 품질 메모를 함께 남겨 이후 분석이나 업로드 전에 사람이 검토할 수 있게 함
- 적합 대상: 여러 시스템에서 받은 데이터 파일을 분석이나 운영 시스템 입력용으로 다듬어야 하는 팀

### 4. [표 형식 데이터 질의하기 (Data / Knowledge Work)](https://developers.openai.com/codex/use-cases/analyze-data-export)

난이도: Easy | 소요시간: 30m

- CSV, 스프레드시트, 대시보드 export, Google Sheet, 로컬 데이터 파일에 대해 질문을 던지면 Codex가 컬럼을 확인하고 계산, 집계, 차트 생성을 수행함
- 단순 답변에 그치지 않고 HTML 기반 브라우저 시각화를 만들어 Codex 앱에서 바로 열어볼 수 있게 하는 흐름을 권장
- 첫 분석 이후 지역, 코호트, 제품, 주차, 모델 버전, 고객군 등으로 추가 비교를 이어가도록 같은 스레드에서 후속 분석을 시킬 수 있음
- 적합 대상: 빠른 계산, 간단한 차트, 미팅용 요약이 필요한 데이터 기반 업무

### 5. [GitHub Pull Request 리뷰하기 (Integrations / Workflow)](https://developers.openai.com/codex/use-cases/github-code-reviews)

난이도: Easy | 소요시간: 5s

- GitHub 조직이나 리포지토리에 Codex code review를 연결해 PR마다 자동 리뷰를 받거나, PR 댓글에서 수동으로 리뷰를 요청할 수 있음
- 주요 초점은 보안 리그레션, 누락된 테스트, 위험한 동작 변경, 문서 누락 등 사람이 놓치기 쉬운 검토 신호를 추가로 얻는 것
- `AGENTS.md`에 리뷰 우선순위와 파일별 규칙을 적어두면 Codex 리뷰 기준을 리포지토리에 맞게 커스터마이즈할 수 있음
- 적합 대상: 머지 전 추가 검토 신호가 필요한 팀, 운영 중인 대형 코드베이스

### 6. [받은편지함 관리하기 (Automation / Integrations)](https://developers.openai.com/codex/use-cases/manage-your-inbox)

난이도: Easy | 소요시간: 5m

- Gmail을 연결해 답장이 필요한 메일을 찾고, 최근 보낸 메일이나 승인된 글쓰기 예시를 참고해 사용자의 톤으로 답장 초안을 작성함
- 메일만으로 맥락이 부족하면 Slack, Google Drive, 프로젝트 노트 같은 업무 도구에서 최신 결정, 담당자, 파일, 블로커를 찾아오게 할 수 있음
- 첫 실행은 캘리브레이션으로 보고, 어떤 메일은 무시해야 하는지, 어떤 톤이 맞는지 피드백한 뒤 정기 자동화로 발전시킴
- 적합 대상: 받은편지함 분류와 답장 초안 작성을 반복적으로 처리하고 싶은 사람

### 7. [반응형 프론트엔드 디자인 구현하기 (Front-end / Design)](https://developers.openai.com/codex/use-cases/frontend-designs)

난이도: Intermediate | 소요시간: 1h

- 스크린샷, 디자인 브리프, 레퍼런스 이미지를 입력해 기존 리포지토리의 디자인 시스템, 토큰, 컴포넌트를 재사용하는 반응형 UI로 변환함
- Codex가 Playwright로 실제 브라우저를 열고 데스크톱/모바일 브레이크포인트에서 구현 결과를 레퍼런스와 비교하며 반복 수정함
- 모호한 부분은 새 디자인 시스템을 만들기보다 기존 패턴에 맞춰 가장 단순한 구현을 선택하고, 가정 사항을 명시하도록 지시하는 것이 좋음
- 적합 대상: 신규 프론트엔드 화면 구현, 기존 앱에 디자인된 화면을 붙이는 작업

### 8. [대형 코드베이스 이해하기 (Engineering / Analysis)](https://developers.openai.com/codex/use-cases/codebase-onboarding)

난이도: Easy | 소요시간: 5m

- 낯선 리포지토리나 기능 영역에 들어갈 때 Codex에게 요청 흐름, 모듈 책임, 데이터 검증 위치, 부작용, 다음에 읽어야 할 파일을 설명하게 함
- 단순한 전체 요약보다 특정 시스템 영역을 지정할수록 더 실용적인 설명을 얻을 수 있음
- 후속 질문으로 비즈니스 로직 위치, 검증 지점, 놓치기 쉬운 백그라운드 작업, 변경 후 실행할 테스트를 확인하는 흐름을 권장
- 적합 대상: 신규 엔지니어 온보딩, 기능 변경 전 코드 흐름을 빠르게 파악해야 하는 개발자

### 9. [Mac 앱 셸 만들기 (macOS / Code)](https://developers.openai.com/codex/use-cases/macos-sidebar-detail-inspector)

난이도: Advanced | 소요시간: 1h

- Build macOS Apps 플러그인을 사용해 Mac-native SwiftUI 앱 셸을 만들고, `NavigationSplitView` 기반의 사이드바, 디테일 패널, 인스펙터 구조를 잡음
- 메뉴, 툴바, 키보드 단축키, Settings scene처럼 데스크톱 앱에서 자연스러운 구조를 초기에 설계하도록 지시함
- iPad나 웹 앱을 단순히 늘린 형태가 아니라 창, 선택 상태, 명령, 설정이 안정적으로 동작하는 Mac 앱 구조를 목표로 함
- 적합 대상: 에디터, 라이브러리, 관리자 도구, 리뷰 도구처럼 사이드바와 인스펙터가 필요한 Mac 앱

### 10. [Codex로 내 컴퓨터 조작하기 (Knowledge Work / Workflow)](https://developers.openai.com/codex/use-cases/use-your-computer-with-codex)

난이도: Easy | 소요시간: 5m

- Computer Use를 통해 Codex가 Mac 앱을 직접 보고, 클릭하고, 입력하면서 여러 앱과 창을 넘나드는 작업을 수행하게 함
- 전용 플러그인이 없는 일반 앱 UI 안에 있는 작업, 예를 들어 Notes에서 정보를 가져와 다른 시스템에 입력하거나 Messages 내용을 확인하고 답장을 작성하는 흐름에 적합
- 요청은 `@Computer`로 시작하고, 원하는 결과와 중단해야 할 위험한 작업을 함께 적는 것이 좋음
- 적합 대상: 앱 UI 안에서만 가능한 반복 작업, 여러 창과 파일을 오가는 지식 노동

### 11. [버그 트리아지 자동화하기 (Automation / Quality)](https://developers.openai.com/codex/use-cases/automation-bug-triage)

난이도: Intermediate | 소요시간: 1h

- Sentry 알림, Slack 스레드, Linear/GitHub 이슈, PR 실패 체크, 로그, 지원 티켓 등 버그 신호가 모이는 장소를 Codex가 순회하게 함
- 먼저 수동 스윕으로 후보 목록을 만들고, 같은 스레드에서 어떤 항목이 유용한지 조정한 뒤 정기 자동화로 전환함
- 충분히 신뢰되면 Codex가 Linear 이슈, Slack 업데이트, GitHub 댓글, 핸드오프 노트 초안까지 작성하게 할 수 있음
- 적합 대상: 여러 도구에 흩어진 버그 리포트를 매일 우선순위화해야 하는 제품/엔지니어링 팀

### 12. [슬라이드 덱 생성하기 (Data / Integrations)](https://developers.openai.com/codex/use-cases/generate-slide-decks)

난이도: Easy | 소요시간: 30m

- Codex가 PowerPoint 파일을 코드로 직접 편집하고, 이미지 생성을 결합해 기존 덱을 업데이트하거나 새 덱을 만듦
- 로고 위치, 특정 슬라이드의 텍스트/이미지 배치, 기존 브랜딩 유지, 오버플로 및 폰트 대체 검사 같은 납품 전 규칙을 명시함
- 슬라이드는 편집 가능한 `.pptx`로 남기는 것을 권장하며, 반복 가능한 레이아웃 규칙을 Codex가 슬라이드별로 적용함
- 적합 대상: 구조화된 입력이나 노트를 발표 자료로 바꾸는 팀, 기존 덱을 대량 수정해야 하는 작업

### 13. [Slack에서 코딩 작업 시작하기 (Integrations / Workflow)](https://developers.openai.com/codex/use-cases/slack-coding-tasks)

난이도: Easy | 소요시간: 5m

- Slack 앱을 설치하고 리포지토리와 환경을 연결한 뒤, 스레드에서 `@Codex`를 멘션해 코드 작업을 시작함
- 요청, 제약 조건, 원하는 결과가 스레드에 충분히 들어 있으면 Codex가 해당 컨텍스트를 바탕으로 클라우드 태스크를 실행함
- 결과 링크를 열어 검토하고, 필요한 추가 수정은 같은 Slack 스레드에서 이어갈 수 있음
- 적합 대상: Slack 논의에서 바로 이슈 트리아지, 버그 수정, 작은 구현 작업을 넘기고 싶은 팀

### 14. [작은 UI 변경 빠르게 반복하기 (Front-end / Design)](https://developers.openai.com/codex/use-cases/make-granular-ui-changes)

난이도: Easy | 소요시간: 5m

- 기존 앱의 구조가 이미 잡혀 있을 때 spacing, alignment, color, copy, responsive behavior, state 같은 작은 UI 변경을 하나씩 빠르게 처리함
- Codex-Spark처럼 빠른 모델을 사용해 “한 번에 하나의 시각적 노트, 하나의 작은 편집, 하나의 브라우저 확인” 루프를 권장
- 변경 범위를 정확히 지정하고 기존 컴포넌트, 토큰, 레이아웃 primitive, 데이터 흐름을 보존하도록 요구함
- 적합 대상: 디자인 리뷰 중 나온 세밀한 UI 수정, 제품 리뷰 현장에서 바로 반영해야 하는 변경

### 15. [신규 입사자 온보딩 조율하기 (Integrations / Data)](https://developers.openai.com/codex/use-cases/new-hire-onboarding)

난이도: Intermediate | 소요시간: 30m

- 승인된 신규 입사자 목록, 온보딩 트래커, 매니저/팀 매핑, 장비 및 계정 준비 상태, 캘린더 마일스톤을 모아 검토 가능한 온보딩 패킷을 만듦
- 첫 패스는 읽기 전용으로 두고, 실제 초대, DM, 이메일, 채널 생성, 시스템 업데이트는 검토 후 명시적으로 승인하는 구조를 권장
- 팀별 요약, 준비 상태 gap, 환영 공간 이름, 초대 목록, 첫 주 체크리스트, 공지 초안을 함께 준비할 수 있음
- 적합 대상: People, Recruiting, IT, Workplace Operations, 신규 입사자를 맞이하는 매니저

### 16. [새 개념 학습하기 (Knowledge Work / Data)](https://developers.openai.com/codex/use-cases/learn-a-new-concept)

난이도: Intermediate | 소요시간: 30m

- 논문, 강의 자료, 긴 문서처럼 밀도 높은 자료를 Codex가 읽고 문제의식, 기여, 방법, 실험, 한계, 선행 개념을 정리하게 함
- Subagents를 활용해 본문 구조 파악, 선행 지식 조사, 그림/수식 분석, 최종 보고서 작성 역할을 나눌 수 있음
- 결과물은 Markdown 보고서, Mermaid 다이어그램, concept map, claim-to-evidence 표처럼 나중에 다시 검토할 수 있는 형태가 좋음
- 적합 대상: 낯선 연구 분야, 복잡한 기술 개념, 긴 코스 자료를 빠르게 학습해야 하는 사람

### 17. [API 통합 업그레이드하기 (Evaluation / Engineering)](https://developers.openai.com/codex/use-cases/api-integration-migrations)

난이도: Intermediate | 소요시간: 1h

- 기존 OpenAI API 통합을 최신 권장 모델과 API 기능으로 옮기면서 동작 보존과 리그레션 검증을 함께 수행함
- 단순히 모델명만 바꾸는 것이 아니라, 현재 엔드포인트, tool 가정, 응답 형식, 프롬프트, 평가 경로를 먼저 인벤토리화함
- `openai-docs`를 사용해 최신 모델/프롬프트 가이드를 확인하고, Promptfoo 같은 eval pipeline으로 변경 전후 동작을 검증하는 흐름을 권장
- 적합 대상: 구형 모델/엔드포인트를 사용하는 제품, 모델 업그레이드에 회귀 테스트가 필요한 팀

### 18. [앱 또는 웹사이트 배포하기 (Front-end / Integrations)](https://developers.openai.com/codex/use-cases/deploy-app-or-website)

난이도: Intermediate | 소요시간: 30m

- 리포지토리, 스크린샷, 디자인 브리프, 제품 아이디어, API 문서, 데이터 소스를 바탕으로 Codex가 웹 앱을 만들거나 수정하고 Vercel preview URL까지 배포함
- 배포 전 프로젝트 점검, 빌드/테스트, 실패 로그 분석, preview 검증을 수행하게 하는 것이 핵심임
- 배포 후에도 같은 스레드에서 모바일 레이아웃 수정, 최신 데이터 반영, 실패한 build log 수정 등을 이어갈 수 있음
- 적합 대상: 아이디어나 디자인을 공유 가능한 웹 preview로 빠르게 만들고 싶은 팀

### 19. [Figma 디자인을 코드로 전환하기 (Front-end / Design)](https://developers.openai.com/codex/use-cases/figma-designs-to-code)

난이도: Intermediate | 소요시간: 1h

- Figma MCP 서버를 통해 정확한 노드의 디자인 컨텍스트, 변수, 에셋, variant를 가져온 뒤 기존 리포지토리의 디자인 시스템에 맞춰 코드로 번역함
- `get_design_context`, 필요 시 `get_metadata`, `get_screenshot` 순서로 구조와 레퍼런스를 확보하고 구현을 시작하는 방식이 권장됨
- Playwright로 브라우저에서 구현 결과를 Figma 레퍼런스와 비교하며 반응형 동작과 인터랙션 차이를 반복 수정함
- 적합 대상: Figma에서 완성된 화면이나 플로를 기존 코드베이스에 구현해야 하는 디자인/프론트엔드 팀

### 20. [Computer Use로 앱 QA하기 (Automation / Quality)](https://developers.openai.com/codex/use-cases/qa-your-app-with-computer-use)

난이도: Intermediate | 소요시간: 30m

- Computer Use가 실제 인터페이스를 보고 클릭, 입력, 스크롤하며 주요 사용자 플로를 실행하고 실패 지점을 기록함
- 환경, 테스트할 핵심 플로, 버그 리포트 형식, 심각도 기준, 재현 단계와 기대/실제 결과를 명확히 지시함
- 기능 버그와 UI 문제를 모두 포착할 수 있으며, 결과는 QA 리포트나 엔지니어에게 넘길 triage summary 형태로 정리함
- 적합 대상: 릴리스 전 핵심 플로 검증, 수동 QA를 구조화하고 싶은 팀

### 21. [데이터셋 분석 및 리포트 산출하기 (Data / Analysis)](https://developers.openai.com/codex/use-cases/datasets-and-reports)

난이도: Intermediate | 소요시간: 1h

- 지저분한 데이터 파일을 불러와 정제, 조인, 탐색적 분석, 시각화, 모델링을 거쳐 의사결정에 쓰이는 보고서나 대시보드로 패키징함
- Codex가 프로젝트의 Python 환경, 패키지 매니저, 출력 폴더, 스크립트 관례를 먼저 파악하게 하는 것이 중요
- 반복되는 notebook 정리, spreadsheet export, 최종 보고서 packaging은 reusable skill로 옮기면 같은 분석 흐름을 재사용하기 쉽음
- 적합 대상: 데이터 정리부터 차트, 메모, 보고서까지 재현 가능한 분석 산출물이 필요한 분석가/제품팀

### 22. [메시지에서 나온 작업 처리하기 (Knowledge Work / Integrations)](https://developers.openai.com/codex/use-cases/complete-tasks-from-messages)

난이도: Easy | 소요시간: 5m

- Messages 스레드에 들어 있는 예약, 조사, 일정 조율, 영수증 제출, 정보 취합 같은 숨은 할 일을 Computer Use가 찾아 처리함
- 특정 발신자나 스레드를 지정하고, 작업 완료 후 원래 메시지 스레드에 보낼 답장 초안을 작성하게 할 수 있음
- 결제, 주문, 예약 확정처럼 되돌리기 어려운 행동은 반드시 멈추고 승인받도록 지시하는 것이 중요
- 적합 대상: 개인 메시지에서 생긴 작은 실행 작업을 놓치지 않고 처리하고 싶은 사람

### 23. [아이디어에서 PoC 만들기 (Front-end / Engineering)](https://developers.openai.com/codex/use-cases/idea-to-proof-of-concept)

난이도: Intermediate | 소요시간: 1h

- GPT Image/ImageGen으로 먼저 고품질 UI mockup을 만들어 시각적 방향을 잡고, 그 mock을 기준으로 Build Web Apps나 Game Studio 플러그인으로 작동하는 프로토타입을 구현함
- 단순 문서 계획보다 실제 클릭 가능한 PoC가 더 많은 답을 주는 초기 제품 아이디어에 적합
- 최종적으로 구현할 이미지는 새 turn에 첨부해 Codex가 레퍼런스로 직접 참조하게 하는 것이 좋음
- 적합 대상: 대시보드, 도구, 웹 앱, 게임 아이디어를 빠르게 시각화하고 검증하고 싶은 팀

### 24. [브라우저 기반 게임 만들기 (Engineering / Code)](https://developers.openai.com/codex/use-cases/browser-games)

난이도: Intermediate | 소요시간: Long-running

- 게임 브리프에서 바로 코딩하지 않고, 먼저 플레이어 목표, 메인 루프, 조작, 승패 조건, 렌더링, 에셋 계획이 담긴 `PLAN.md`를 작성하게 함
- ImageGen으로 컨셉 아트, 스프라이트, 배경, UI 에셋을 만들고, Playwright로 실제 브라우저에서 조작감과 화면 상태를 테스트하며 반복함
- 게임은 코드, UI, 자산, 밸런싱, 배포까지 계속 확인해야 하므로 Codex의 장기 반복 작업에 잘 맞는 예시임
- 적합 대상: 브라우저 게임을 처음부터 만들거나 프로토타입 조작감과 비주얼을 반복 검증해야 하는 작업

### 25. [어려운 문제를 반복 개선하기 (Engineering / Analysis)](https://developers.openai.com/codex/use-cases/iterate-on-difficult-problems)

난이도: Advanced | 소요시간: Long-running

- 명확한 평가 시스템, 점수 스크립트, 검토 가능한 아티팩트를 제공해 Codex가 점수 기반 개선 루프를 돌도록 함
- deterministic check와 LLM-as-a-judge 점수를 함께 사용하고, overall score와 judge average에 대한 stopping rule을 둠
- Codex가 각 반복에서 현재 출력 확인, 점수 측정, 한 가지 개선 적용, 재평가, 로그 기록을 반복하게 하는 구조임
- 적합 대상: 한 번에 끝나지 않는 최적화 문제, 시각적/주관적 품질을 여러 번 개선해야 하는 작업

### 26. [워크플로를 Skill로 저장하기 (Engineering / Workflow)](https://developers.openai.com/codex/use-cases/reusable-codex-skills)

난이도: Easy | 소요시간: 5m

- 잘 작동했던 Codex 스레드, 리뷰 규칙, 테스트 명령, 릴리스 체크리스트, 디자인 규칙, 글쓰기 예시, 리포지토리별 스크립트를 재사용 가능한 skill로 저장함
- `$skill-creator`를 사용해 언제 발동해야 하는지, 어떤 자료와 명령을 써야 하는지, 어떤 출력이 필요한지 구조화함
- 홈 디렉토리의 skill은 모든 repo에서 쓸 수 있고, 프로젝트 내부 skill은 팀과 함께 커밋해 공유할 수 있음
- 적합 대상: 매번 긴 프롬프트를 붙여넣는 대신 반복 업무를 Codex에게 기억시키고 싶은 팀

### 27. [문서 최신화하기 (Engineering / Code)](https://developers.openai.com/codex/use-cases/update-documentation)

난이도: Easy | 소요시간: 30m

- 코드 변경, 테스트, 릴리스 노트, PR/이슈 맥락을 함께 읽고 README, 개발자 문서, migration note, runbook을 업데이트함
- Codex가 기존 문서에서 관련 feature name, config key, command, example을 먼저 찾고 최소한의 문서 표면만 수정하게 하는 것이 좋음
- 공개 문서라면 내부 로드맵, 고객 정보, 비공개 맥락이 섞이지 않도록 명시적으로 제한함
- 적합 대상: 제품 동작 변화에 맞춰 문서를 함께 관리해야 하는 기술 문서/엔지니어링 팀

### 28. [iOS 앱 빌드하기 (iOS / Code)](https://developers.openai.com/codex/use-cases/native-ios-apps)

난이도: Advanced | 소요시간: 1h

- Codex가 SwiftUI iOS 앱을 scaffold하고, `xcodebuild`나 Tuist 기반 CLI-first 빌드/실행 루프를 구성함
- 기존 프로젝트라면 scheme, simulator, screenshot, UI automation 정보를 XcodeBuildMCP로 확인하며 작업하도록 할 수 있음
- SwiftUI expert, Liquid Glass, SwiftUI performance 같은 iOS 관련 skill을 붙이면 UI 구현, 최신 API 적용, 성능 점검을 더 안정적으로 진행할 수 있음
- 적합 대상: 그린필드 SwiftUI 앱, 시뮬레이터 기반 검증이 필요한 기존 iPhone/iPad 프로젝트

### 29. [코드베이스 리팩터링하기 (Engineering / Code)](https://developers.openai.com/codex/use-cases/refactor-your-codebase)

난이도: Advanced | 소요시간: 1h

- 죽은 코드, 중복 로직, 거대한 모듈, 오래된 abstraction, legacy pattern을 찾아 작은 리뷰 가능한 단위로 정리함
- 리팩터링은 stack migration이 아니라 동작을 유지하면서 시스템의 모양을 개선하는 작업이므로, public behavior를 유지하라고 명시해야 함
- ExecPlan이나 reusable skill을 써서 큰 정리 작업을 체크포인트 단위로 나누고 테스트와 검증을 반복하는 흐름을 권장
- 적합 대상: 기능 추가가 점점 비싸지는 오래된 코드베이스, 동작 보존형 정리가 필요한 팀

### 30. [iOS App Intents 추가하기 (iOS / Code)](https://developers.openai.com/codex/use-cases/ios-app-intents)

난이도: Advanced | 소요시간: 1h

- 앱 안의 핵심 액션과 엔티티를 식별해 Shortcuts, Siri, Spotlight, widgets, controls 같은 시스템 surface에서 사용할 수 있게 만듦
- 화면 전체가 아니라 사용자가 앱을 열지 않고도 실행하고 싶어 할 몇 가지 action과 system이 이해해야 할 object를 먼저 설계함
- Codex가 기존 앱의 모델, navigation, 데이터 access 경로를 분석하고 첫 intent surface를 작게 구현하게 하는 흐름임
- 적합 대상: 이미 유용한 기능이 있지만 iOS 시스템 자동화와 검색에 잘 드러나지 않는 앱

### 31. [macOS 앱 빌드하기 (macOS / Code)](https://developers.openai.com/codex/use-cases/native-macos-apps)

난이도: Advanced | 소요시간: 1h

- SwiftUI 기반 macOS 앱을 만들 때 `WindowGroup`, `Window`, `Settings`, `MenuBarExtra`, `DocumentGroup` 같은 scene model을 먼저 선택하게 함
- `xcodebuild`나 `swift build`와 프로젝트 로컬 `script/build_and_run.sh`를 통해 shell-first 빌드/실행 루프를 구성함
- 앱이 커질수록 창, 메뉴, 사이드바, Settings, AppKit interop, signing 문제를 데스크톱 앱 관점에서 다룸
- 적합 대상: 데스크톱 네이티브 구조가 필요한 신규 Mac 앱, 기존 Mac 앱의 UI/빌드/배포 개선

### 32. [Liquid Glass 적용하기 (iOS / Code)](https://developers.openai.com/codex/use-cases/ios-liquid-glass)

난이도: Advanced | 소요시간: 1h

- iOS 26 및 Xcode 26 기준으로 기존 SwiftUI 앱을 빌드하고, 표준 컨트롤에서 자동으로 얻는 system glass와 직접 바꿔야 할 custom UI를 구분함
- custom blur/material stack을 네이티브 `glassEffect`, `GlassEffectContainer`, glass button style, `glassEffectID` transition으로 옮기도록 함
- 이전 iOS 버전 지원이 필요하다면 `#available(iOS 26, *)`와 fallback path를 명확히 유지해야 함
- 적합 대상: iOS 26 Liquid Glass로 기존 앱의 high-traffic flow를 안전하게 마이그레이션하려는 팀

### 33. [Mac 텔레메트리 추가하기 (macOS / Code)](https://developers.openai.com/codex/use-cases/macos-telemetry-logs)

난이도: Advanced | 소요시간: 30m

- Mac 앱의 window open, sidebar selection, menu command, sync milestone 같은 흐름에 Apple `Logger` 기반 high-signal 로그를 추가함
- Codex가 앱을 빌드/실행하고 Console 또는 log stream에서 실제 이벤트가 기대 순서대로 발생했는지 증명하게 함
- 민감한 payload는 피하고, subsystem/category를 명확히 잡아 agentic debugging loop에서 다음 패치를 근거 있게 결정하게 만드는 방식임
- 적합 대상: 코드 리뷰만으로는 흐름을 추적하기 어려운 Mac 앱 기능, 로그 기반 디버깅 루프

### 34. [iOS 시뮬레이터에서 디버깅하기 (iOS / Code)](https://developers.openai.com/codex/use-cases/ios-simulator-bug-debugging)

난이도: Advanced | 소요시간: 1h

- Codex와 XcodeBuildMCP가 scheme/simulator를 찾고 앱을 빌드/실행한 뒤, UI hierarchy를 읽고 tap, type, swipe, screenshot, log capture를 수행함
- 필요하면 LLDB를 붙여 stack frame, local variables, breakpoint를 확인하고 vague bug report를 재현 가능한 작은 수정으로 바꿈
- 변경 후 같은 시뮬레이터 경로를 다시 실행해 버그가 사라졌다는 증거를 남기는 것이 핵심임
- 적합 대상: 특정 탭/스크롤/입력 흐름에서만 발생하는 iOS UI 버그, crash/hang/navigation 문제

### 35. [의존성 사고 감사하기 (Engineering / Quality)](https://developers.openai.com/codex/use-cases/dependency-incident-audits)

난이도: Advanced | 소요시간: 1h

- 공개 패키지 advisory나 supply chain incident가 발생했을 때 바로 패치부터 하지 않고, 먼저 보수적인 read-only audit plan을 만들게 함
- Codex가 권위 있는 출처와 일반 논평을 구분하고, exposure를 증명하거나 배제할 evidence를 정의한 뒤 manifest, lock file, CI workflow, script를 점검함
- untrusted code 실행, install, build, test는 명시적 승인 전까지 피하는 것이 기본임
- 적합 대상: 보안/엔지니어링 팀, dependency incident에 빠르게 대응해야 하는 유지보수자

### 36. [회의 브리프 준비하기 (Integrations / Knowledge Work)](https://developers.openai.com/codex/use-cases/meeting-prep-briefs)

난이도: Easy | 소요시간: 30m

- Calendar invite만으로 부족한 회의 맥락을 Drive 문서, Slack 스레드, Gmail, 이전 노트에서 모아 objective, agenda, open questions, notes template로 정리함
- Codex가 sources inventory를 먼저 만들고, 확인된 맥락, source gap, open question을 분리하게 함
- 회의 준비 자료는 짧고 스캔 가능해야 하며, 어떤 출처에서 온 내용인지 추적 가능해야 함
- 적합 대상: 매니저, PM, 운영자, 인터뷰어, 회의 전 맥락을 빠르게 정리해야 하는 사람

### 37. [이벤트 플레이북 실행하기 (Integrations / Knowledge Work)](https://developers.openai.com/codex/use-cases/event-launch-playbooks)

난이도: Intermediate | 소요시간: 1h

- 이벤트 계획 채널, 승인된 문서/덱/시트/템플릿, 캘린더 마감일을 모아 source-backed playbook을 만듦
- 공개 event page copy와 내부 운영 체크리스트, 담당자, approval, open questions를 분리해 관리하는 것이 핵심임
- 반복 이벤트라면 같은 스레드에 자동화를 걸어 deadline, 승인, 누락된 자료, launch checklist 상태를 추적하게 할 수 있음
- 적합 대상: 커뮤니티, DevRel, 마케팅, 운영팀의 이벤트 프로그램 관리

### 38. [코드 마이그레이션 실행하기 (Engineering / Code)](https://developers.openai.com/codex/use-cases/code-migrations)

난이도: Advanced | 소요시간: 1h

- legacy stack에서 target stack으로 옮길 때 routing, data model, auth, config, background job, build, deploy, test, external contract를 먼저 인벤토리화함
- compatibility layer, module-by-module port, branch-by-abstraction, strangler-style replacement 같은 incremental strategy를 선택함
- 각 checkpoint마다 parity validation을 수행하고, migration 자체가 요구하는 visible change는 명시적으로 예외 처리함
- 적합 대상: 프레임워크/런타임/언어/빌드 시스템 전환을 통제된 단위로 진행해야 하는 팀

### 39. [SwiftUI 화면 리팩터링하기 (iOS / Code)](https://developers.openai.com/codex/use-cases/ios-swiftui-view-refactor)

난이도: Advanced | 소요시간: 1h

- 거대한 SwiftUI screen 파일을 동작과 레이아웃을 유지한 채 작은 section view와 명시적인 data flow로 나눔
- Build iOS Apps 플러그인의 SwiftUI view refactor skill은 MV-first 접근을 권장하고, 불필요한 view model 추가를 피하며, side effect를 `body` 밖으로 이동하게 함
- 작은 검증 루프를 붙여 UI가 바뀌지 않았고 기능 동작도 유지됐는지 확인하는 것이 중요
- 적합 대상: `body`에 레이아웃, 분기, async 작업, inline action이 섞인 SwiftUI 화면

### 40. [내부 컨텍스트에서 PRD 초안 작성하기 (Integrations / Knowledge Work)](https://developers.openai.com/codex/use-cases/draft-prds-from-sources)

난이도: Easy | 소요시간: 30m

- Linear 프로젝트, Slack 계획 채널, Notion/Google Drive 문서, 회의 노트, 리서치 자료를 모아 reviewable PRD를 작성함
- 문제, 사용자, 요구사항, UX, 기술 고려사항, launch plan, timeline, 결정 사항, open questions 같은 section contract를 명확히 주는 것이 좋음
- source appendix를 먼저 검토해 Codex가 어떤 맥락을 사용했는지 확인하고, 그 다음 requirements와 open questions를 다듬음
- 적합 대상: 팀 내부 논의에서 나온 정보를 PRD, proposal, launch brief, decision memo로 바꾸는 PM/제품팀

### 41. [현금흐름 예측하기 (Data / Knowledge Work)](https://developers.openai.com/codex/use-cases/cash-flow-forecast)

난이도: Intermediate | 소요시간: 30m

- beginning cash, expected receipts, payroll, vendor payments, debt, tax, capex, working capital, timing assumptions를 입력해 editable cash-flow forecast workbook을 만듦
- 원본 cadence를 보존하고, safety balance breach와 cash pressure를 유발하는 assumption을 보여주는 summary tab을 만들게 함
- 생성된 `.xlsx`를 Codex에서 열어 formula, scenario, timing assumption을 검토하고 같은 스레드에서 수정함
- 적합 대상: 13주 또는 월간 cash forecast를 만드는 finance/operations 팀

### 42. [DCF valuation 모델 만들기 (Data / Knowledge Work)](https://developers.openai.com/codex/use-cases/dcf-model)

난이도: Intermediate | 소요시간: 30m

- historical financials, valuation assumptions, modeling notes를 입력해 revenue growth, margin, capex, working capital, WACC, terminal value가 포함된 DCF workbook을 만듦
- Codex가 모델 tab, formula, assumption, valuation summary를 포함한 editable `.xlsx`를 만들고, 사용자가 Codex에서 직접 검토/수정함
- 같은 스레드에서 formula link 확인, assumption 변경, scenario 추가, 모델 tightening을 이어갈 수 있음
- 적합 대상: valuation workbook을 빠르게 만들고 검토해야 하는 analyst/finance 팀

### 43. [예산 대비 실적 검토하기 (Data / Knowledge Work)](https://developers.openai.com/codex/use-cases/budget-vs-actuals-review)

난이도: Easy | 소요시간: 30m

- budget plan, actuals export, close notes를 입력해 actuals를 plan category에 매핑하고 variance를 계산한 review workbook을 만듦
- 원본 input, mapping, variance formula, summary tab을 보존하고 reconciliation issue와 open finance question을 구분함
- category mapping 수정, department cut 추가, finance summary draft 작성을 같은 스레드에서 이어갈 수 있음
- 적합 대상: 월마감 리뷰, 예산 대비 지출 차이를 리더십에 설명해야 하는 finance 팀

### 44. [목표 따라가기 (Engineering / Automation)](https://developers.openai.com/codex/use-cases/follow-goals)

난이도: Advanced | 소요시간: Long-running

- `/goal`을 사용해 Codex가 한 턴에서 멈추지 않고 검증 가능한 종료 조건까지 장기 작업을 이어가도록 함
- objective, stopping condition, 먼저 읽어야 할 파일/문서/로그/계획, 진행을 증명하는 command나 artifact를 명확히 지정함
- migration, large refactor, deployment retry loop, experiment, game, prototype처럼 Codex가 체크포인트 단위로 독립 진행할 수 있는 작업에 적합
- 적합 대상: 몇 시간 동안 계속 진행해야 하지만 목표와 검증 루프가 분명한 코딩 작업

### 45. [AI 애플리케이션에 Evals 추가하기 (Evaluation / Quality)](https://developers.openai.com/codex/use-cases/ai-app-evals)

난이도: Intermediate | 소요시간: 1h

- 기존 AI 앱의 prompt, model call, tool, retrieval, agent, product requirement를 분석해 Promptfoo eval suite를 추가함
- 전체 시스템을 한 번에 평가하려 하기보다 classification, extraction, summarization, routing, grounding, tool use, format rule 같은 사용자-visible behavior 하나부터 시작함
- Codex가 config와 test data를 만들고 로컬에서 eval을 실행한 뒤, 이후에도 쓸 수 있는 명령을 남기게 함
- 적합 대상: 모델/프롬프트/retrieval/agent 변경 전 회귀 테스트를 만들고 싶은 AI 앱 팀

### 46. [사용자 스토리를 UI mock으로 전환하기 (Integrations / Knowledge Work)](https://developers.openai.com/codex/use-cases/user-stories-to-ui-mocks)

난이도: Easy | 소요시간: 30m

- Slack, Linear, Google Drive, customer-call notes 등에 흩어진 피드백을 모아 user story와 constraint로 정리한 뒤 ImageGen으로 UI mock 방향을 생성함
- 명확한 user story가 있으면 바로 시작하고, 없으면 Codex가 먼저 context를 모아 문제와 요구를 정규화하게 함
- 선택된 mock은 새 turn에 다시 첨부해 기존 코드베이스의 디자인 시스템과 컴포넌트를 재사용하는 working prototype으로 구현함
- 적합 대상: 산재한 제품 피드백을 시각적 방향으로 바꾸고 팀이 검토할 mock이 필요한 제품/디자인/엔지니어링 팀

### 47. [앱을 ChatGPT로 가져오기 (Integrations / Code)](https://developers.openai.com/codex/use-cases/chatgpt-apps)

난이도: Advanced | 소요시간: 1h

- 하나의 좁은 사용자 outcome을 중심으로 ChatGPT 앱을 설계하고, MCP server, optional web component, tool metadata를 end-to-end로 만듦
- Codex는 tool surface와 metadata 설계, MCP server scaffold, widget 구현, ChatGPT 연결, golden prompt 테스트를 맡기 좋음
- v1에서 widget이 정말 필요한지, 인증과 배포가 필요한지, 로컬 HTTPS 테스트와 developer mode 검증이 가능한지를 먼저 정함
- 적합 대상: 첫 ChatGPT 앱을 만들거나 MCP server/tool metadata를 과하게 키우지 않고 시작하려는 팀

### 48. [Expo로 React Native 앱 만들기 (Mobile / Engineering)](https://developers.openai.com/codex/use-cases/react-native-expo-apps)

난이도: Intermediate | 소요시간: 1h

- Expo 플러그인을 사용해 React Native 앱을 scaffold하고 Expo Router, Expo-native package convention, Expo Go 기반 빠른 테스트 루프를 따름
- custom native code, store distribution, Expo Go가 지원하지 않는 capability가 필요할 때만 dev client나 EAS build로 이동함
- Codex가 native-feeling navigation, loading/empty/error states를 포함한 하나의 완성된 workflow를 만들고 가장 빠른 경로로 검증하게 함
- 적합 대상: 네이티브 IDE 작업 전에 Expo로 모바일 앱을 빠르게 프로토타이핑하거나 출시 준비하려는 개발자

### 49. [Codex가 쓸 수 있는 CLI 만들기 (Engineering / Code)](https://developers.openai.com/codex/use-cases/agent-friendly-clis)

난이도: Intermediate | 소요시간: 1h

- Codex가 반복적으로 접근해야 하는 API, 로그 소스, export inbox, 로컬 DB, 팀 script를 composable CLI로 감싸 어떤 repo에서도 실행 가능하게 만듦
- 좋은 CLI는 paged search, exact read by ID, predictable JSON, download, local index, draft-before-write 같은 agent-friendly 동작을 제공함
- `$cli-creator`로 CLI를 만들고 `$skill-creator`로 언제 이 CLI를 써야 하는지 기록한 companion skill을 함께 만듦
- 적합 대상: 같은 서비스나 데이터 소스를 Codex가 자주 읽고 검색하고 안전하게 조작해야 하는 팀

### 50. [Slack 액션 아이템 우선순위화하기 (Automation / Integrations)](https://developers.openai.com/codex/use-cases/slack-action-triage)

난이도: Easy | 소요시간: 30m

- Slack DM, 그룹 DM, 채널 mention, thread reply를 읽어 직접 요청, 암묵적 follow-up, 이미 해결된 항목, 아직 live한 action을 구분함
- Codex가 최신 thread tail까지 읽고 unresolved 여부를 판단한 뒤, 긴급도와 영향도를 기준으로 ranked action queue를 만듦
- 초안 답장이나 handoff를 만들 수 있지만, 실제 post/send는 검토 후 진행하도록 제한하는 것이 좋음
- 적합 대상: Slack으로 일이 들어오는 launch, support, product, operations, community workstream

### 51. [검증 가능한 운영 워크플로 실행하기 (Automation / Integrations)](https://developers.openai.com/codex/use-cases/verified-operations-workflows)

난이도: Intermediate | 소요시간: 30m

- access update, invite batch, quota change, customer setup, routing check, migration follow-up 같은 반복 운영 작업을 Codex가 실행하게 함
- input table, approval source, policy, 실행할 script/API/CLI/skill, dry run 여부, retry boundary를 명확히 주고 누락된 필드는 추측하지 않게 함
- 결과 CSV, log file, dashboard link, screenshot, PR check처럼 사람이 확인할 수 있는 verification artifact를 요구함
- 적합 대상: 구조화된 입력과 명확한 승인/감사 흔적이 필요한 운영 업무

### 52. [회의를 후속 작업으로 전환하기 (Automation / Integrations)](https://developers.openai.com/codex/use-cases/zoom-meeting-follow-ups)

난이도: Intermediate | 소요시간: 5m

- Zoom transcript와 AI Companion summary를 사용해 고객 미팅에서 나온 key takeaway, risk, opportunity, decision, action item을 구조화함
- Codex가 follow-up email, account plan, CRM update, Slack notification 초안을 만들되, 전송이나 기록은 사용자가 검토한 뒤 진행하게 함
- Zoom cloud recording, transcript, AI Companion summary와 Gmail, Slack, Google Docs, CRM 같은 destination tool을 함께 연결하면 효과가 커짐
- 적합 대상: discovery, renewal, implementation, executive sponsor call 이후 반복적인 후속 작업을 처리해야 하는 고객-facing 팀

## GeekNews comments

### goldenjade (2026-05-30T12:17:59+09:00)

좋은 자료입니다. 참고가 많이 되었습니다.

저는 윈도우즈 서버 2022를 사용하고 있는데, Codex Desktop이 안깔려서 반만 사용하는 느낌이에요. 혹시, 설치방법 아는분 계시나요?

### jessyt (2026-05-26T11:34:07+09:00)

참고할만한 내용이 정말 많네요.

### hcode (2026-05-25T20:50:43+09:00)

생각이 확장되는 것 같아서 좋다.

### qlghwp123 (2026-05-25T20:20:59+09:00)

너무 좋네요. 안그래도 Codex 결제 예정인데, 유용하게 쓸 것 같습니다.
