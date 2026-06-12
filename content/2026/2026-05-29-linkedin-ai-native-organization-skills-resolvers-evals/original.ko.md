# "진짜" AI 네이티브 조직을 "현실적으로" 구축하려면 어떻게 해야할까요

Source: https://www.linkedin.com/posts/jyoung105_%EC%A7%84%EC%A7%9C-ai-%EB%84%A4%EC%9D%B4%ED%8B%B0%EB%B8%8C-%EC%A1%B0%EC%A7%81%EC%9D%84-%ED%98%84%EC%8B%A4%EC%A0%81%EC%9C%BC%EB%A1%9C-%EA%B5%AC%EC%B6%95%ED%95%98%EB%A0%A4%EB%A9%B4-%EC%96%B4%EB%96%BB%EA%B2%8C-%ED%95%B4%EC%95%BC%ED%95%A0%EA%B9%8C%EC%9A%94-share-7465931947920314368-UDCY/?utm_source=share&utm_medium=member_android&rcm=ACoAAAXt8v0BjTAFa8U2A--Uyng7OCcG4aSv6gE
Canonical URL: https://kr.linkedin.com/posts/jyoung105_%EC%A7%84%EC%A7%9C-ai-%EB%84%A4%EC%9D%B4%ED%8B%B0%EB%B8%8C-%EC%A1%B0%EC%A7%81%EC%9D%84-%ED%98%84%EC%8B%A4%EC%A0%81%EC%9C%BC%EB%A1%9C-%EA%B5%AC%EC%B6%95%ED%95%98%EB%A0%A4%EB%A9%B4-%EC%96%B4%EB%96%BB%EA%B2%8C-%ED%95%B4%EC%95%BC%ED%95%A0%EA%B9%8C%EC%9A%94-activity-7465931950000799744-k5Yn
Author: Jeongmin Lee
Author URL: https://kr.linkedin.com/in/jyoung105
Published: 2026-05-29T01:08:07.042Z
Archived: 2026-05-29
Extraction method: LinkedIn public JSON-LD `SocialMediaPosting.articleBody`
Quality: `manual_correction_needed`

## Original LinkedIn Body

"진짜" AI 네이티브 조직을 "현실적으로" 구축하려면 어떻게 해야할까요

사업자 등록 후 영업일 기준 20일간 AX 협업 문의가 계속 들어왔습니다.
신규 프로덕트 기획부터 조직 전체의 AI 네이티브 전환까지 폭이 넓었어요.

정말 의외였던 건 금융권입니다.
1조원 중후반대 AUM 사모펀드도 있었고 국내 탑 금융사도 몇 군데 있었어요.

하지만 솔직히 처음엔 막막했습니다.
AX가 정확히 무엇인지 저도 잘 모르기 때문이에요.
1인으로서 버텨내기 위해 AI를 쓰는 것과 이미 굴러가는 조직이 AI로 한 단계 성장하는 것은 다른 문제이기 때문입니다.

그래서 현재까지 AI 발전 속도를 고려하고 주위 사례를 참고해서 생각한 결과 둘 중 하나였습니다. 이미 많은 기업이 진행하고 계신 내용이에요.
기존 문서와 시스템을 AI에 맞게 자산화하거나
AI 사용 문화를 시작하거나.

아래 2개 강연을 참고해서 AX 효용성을 높일 수 있는 구조를 정리해보았고 차주에 예시 시스템을 오픈 소스로 공개할 예정입니다.
YC AI Playbook: https://lnkd.in/gjJyHpDC
Stanford CS153: https://lnkd.in/ghE_sM_N

❶ Skill 은 곧 직원입니다

직원 한 명이 능력 하나를 갖듯 skill 하나가 작업 하나를 합니다.

예를 들어 Gary Tan 은 YC 파트너들이 나눈 수천 건의 대화를 3~4개월 동안 모아 Office Hours 라는 skill 하나로 압축했다고 설명했어요. 거기서 90%를 다시 줄였다고요. 직원이 수년간 쌓은 노하우가 하나의 skill 로 바뀌는 거죠.

조직을 구성하듯 skill 을 늘리면 됩니다.
저는 조직 공통 스킬과 직원별 심층 인터뷰에 기반한 별도 스킬을 제작할 예정입니다.

❷ resolver 는 곧 조직도입니다

어떤 파일이 무엇을 맡고 언제 다음 단계로 넘길지를 정하는 escalation 규칙이죠.

구체적인 사례가 있어요. CLAUDE.md 에 지시를 전부 넣으면 4만 토큰이 넘어 경고가 뜹니다. 해결법은 '변경 로그 작성 시 changelog.md 를 열어라'처럼 필요할 때만 해당 파일을 불러오게 하는 거예요. 한 사람이 모든 일을 아는 대신 조직도를 보고 담당자를 찾아가는 것과 같습니다.

저는 파일명 규칙과 파일 시스템, 그리고 이에 기반한 tool 로직이 정의된 MCP 서버를 구축할 예정입니다.

❸ Filing rules 는 곧 내부 프로세스입니다

정보가 어디에 존재하는지를 확실하게 안내합니다. 파일명과 폴더가 곧 회사의 일하는 방식이 돼요.

실제로 Diana Hu 는 에이전트가 회사의 모든 산출물에 읽기 접근이 가능해야 한다고 강조했어요. YC 엔지니어링 팀은 GitHub 코드, Discord 대화, 회의 녹취를 한곳에 연결한 뒤 스프린트를 절반으로 줄이고 산출량을 10배 늘렸다고요.

하지만 저는 조직의 운영 방침을 근본적으로 변경할 수는 없습니다. 그래서 파일 업로드 시 형태에 따라 이벤트 트리거 방식의 AI read 전용 파일을 구축하는 시스템을 도입하여 지속 가능한 정보 자산화 시스템에 집중할 예정입니다.

❹ check-resolvable 은 곧 감사와 컴플라이언스입니다

일이 들어오기 전에 시스템 자체를 점검합니다. skill 목록에 빠진 역할은 없는지, 같은 일을 하는 skill 이 중복으로 쌓이진 않았는지, 있다고 등록한 기능이 실제로 작동하는지를 봐요.

Gary Tan 은 이걸 DRY(중복 금지)와 MECE(빠짐 없이 겹침 없이)로 설명했습니다. skill 을 만들고 코드를 작성하는 건 전체 10단계 중 2개뿐이고 나머지 8개가 unit test 와 LLM eval 같은 검증 작업이에요.

금융 조직에서 인력의 10~20%가 감사와 컴플라이언스에 투입되는 것과 같은 구조라고 직접 비유했습니다. 저는 자체 KPI 를 설정하는 과정에서 어느 정도에 도달했는지 판단 가능한 평가 지표를 가짜 데이터와 함께 만들어 둘 예정입니다.

❺ Trigger eval 은 곧 인사 평가입니다

일이 들어온 뒤 실행 결과를 점검합니다. 요청이 왔을 때 resolver 가 맞는 skill 을 호출했는지, 그 skill 이 기대한 품질로 응답했는지를 보는 거예요.

Gary Tan 은 resolver 에 등록해 놓는 것만으로는 부족하고 "실제로 호출이 되는지까지 별도로 평가해야 한다"고 했습니다. 그 자체가 latent space 위에서 돌아가는 불확실한 작업이기 때문이에요.

Diana Hu 는 여기서 확인할 항목을 구체적으로 짚었습니다. AI 가 지시를 따랐는지, 정답이 맞는지, 도메인 규칙을 지켰는지. 다만 이 판단은 아직 사람이 직접 해야 한다고 강조했어요.

향후 이 부분은 결국 커뮤니케이션 역량에서 많이 판가름 될 것 같습니다.

제가 최근에 다시 조직 단위에서 효용성이 높을 분야를 고민하고 혼자 실험해보는 방식은 다음과 같습니다.
기존 데이터는 그대로
→ 파일명과 파일 시스템 정리
→ 포인터 기반 지시 파일 (resolver)
→ 반복 작업 skillify
→ DB 와 주요 작업을 tool 과 기업 전용 MCP 서버로
→ 결과 확인용 프롬프트 템플릿과 대시보드

원래는 저를 위한 AI OS 프로덕트를 만들던 1인 빌더였어요.
그런데 문의를 받다 보니 본의 아니게 가장 전문적인 사용자분들을 대상으로 인터뷰를 하게 되었습니다.
그 과정에서 AI 조직이라는 것이 무엇인지를 다시 한 번 생각해보고 이해할 수 있는 좋은 기회가 됐습니다.

아, 맞다.
한 가지 경험을 추가적으로 공유하자면 기업 고객 차원에서 시스템 구축과는 별개로 구축한 시스템 및 기본적인 AI 도구의 사용법에 대한 "강의" 를 추가적으로 많이 요청해주셨습니다.
좋은 솔루션을 "구축" 만 하면 되지 않을까 라는 저의 편견에서 사용자가 정확하게 이해할 수 있는 "전달" 이 중요하다는 것을 다시 한 번 느꼈습니다.

꼭 필요한 AI 정보를 지속적으로 업로드하고 있습니다.
저와 "1촌" 이 되면 유용한 정보를 놓치지 않을 거에요.

## Public JSON-LD Comments

- samuel park (2026-05-29T04:03:48.157Z): 요새 고민중인 주제인데 좋은 인사이트인것 같습니다.
감사합니다.

## Public JSON-LD Metadata

- JSON-LD type: `SocialMediaPosting`
- Comment count: `1`
- Preserved comments: `1`
- Author follower count in JSON-LD: `8615`
- Interaction statistics: `[{"@type": "InteractionCounter", "interactionType": "http://schema.org/LikeAction", "userInteractionCount": 35}, {"@type": "InteractionCounter", "interactionType": "https://schema.org/CommentAction", "userInteractionCount": 1}]`
- Attached image URL: https://media.licdn.com/dms/image/v2/D5622AQEeQSQTbVcvmQ/feedshare-shrink_800/B56Z5xRizEGkAc-/0/1780016885401?e=2147483647&v=beta&t=5wJBHPDt3HQ-DutZPlvfL8UMI5qW70vONjHTRgC370s
- Referenced shortlinks:
  - YC AI Playbook: `https://lnkd.in/gjJyHpDC` -> `https://www.youtube.com/watch?v=B246K_G7mHU`
  - Stanford CS153: `https://lnkd.in/ghE_sM_N` -> `https://www.youtube.com/watch?v=Lri2LNYtERM`

## Access caveat

LinkedIn JSON-LD includes `hasPart.cssSelector = .details` with `isAccessibleForFree = false`. This archive preserves the public structured-data body, one public comment, Jina Reader markdown, the recovered feedshare image, and referenced YouTube transcripts, but does not claim to reproduce login-only UI details, hidden reactions, or any non-public interaction context.
