# LLM Wiki, GBrain, 개인 AI OS - LinkedIn post 7459871247955386369

Source: https://www.linkedin.com/posts/gb-jeong_%EC%A0%9C%EA%B0%80-linkedin-%EA%B8%80-%EC%95%BD-200%EA%B0%9C%EB%A5%BC-%EB%A7%8C%EB%93%A4-%EB%95%8C-%EC%93%B0%EB%8D%98-%EC%8B%9C%EC%8A%A4%ED%85%9C%EC%9D%84-llm-wiki-share-7459614379492229120-SuyQ?utm_source=share&utm_medium=member_android&rcm=ACoAAAXt8v0BjTAFa8U2A--Uyng7OCcG4aSv6gE
Saved: 2026-05-15

## LinkedIn SSR metadata

- Submitted URL: https://www.linkedin.com/posts/gb-jeong_%EC%A0%9C%EA%B0%80-linkedin-%EA%B8%80-%EC%95%BD-200%EA%B0%9C%EB%A5%BC-%EB%A7%8C%EB%93%A4-%EB%95%8C-%EC%93%B0%EB%8D%98-%EC%8B%9C%EC%8A%A4%ED%85%9C%EC%9D%84-llm-wiki-share-7459614379492229120-SuyQ?utm_source=share&utm_medium=member_android&rcm=ACoAAAXt8v0BjTAFa8U2A--Uyng7OCcG4aSv6gE
- Canonical LinkedIn JSON-LD ID: https://kr.linkedin.com/posts/gb-jeong_%EC%A0%9C%EA%B0%80-linkedin-%EA%B8%80-%EC%95%BD-200%EA%B0%9C%EB%A5%BC-%EB%A7%8C%EB%93%A4-%EB%95%8C-%EC%93%B0%EB%8D%98-%EC%8B%9C%EC%8A%A4%ED%85%9C%EC%9D%84-llm-wiki-activity-7459871247955386369-rgvi
- LinkedIn OpenGraph URL: https://kr.linkedin.com/posts/gb-jeong_%EC%A0%9C%EA%B0%80-linkedin-%EA%B8%80-%EC%95%BD-200%EA%B0%9C%EB%A5%BC-%EB%A7%8C%EB%93%A4-%EB%95%8C-%EC%93%B0%EB%8D%98-%EC%8B%9C%EC%8A%A4%ED%85%9C%EC%9D%84-llm-wiki-activity-7459871247955386369-rgvi
- Author: Goobong Jeong (https://kr.linkedin.com/in/gb-jeong)
- Published: 2026-05-12T07:45:03.197Z
- Headline: 제가 LinkedIn 글 약 200개를 만들 때 쓰던 시스템을 LLM Wiki, GBrain과 비교하면서 다시 뜯어보고 있습니다.
- Exposed interactions: [{"@type": "InteractionCounter", "interactionType": "http://schema.org/LikeAction", "userInteractionCount": 76}, {"@type": "InteractionCounter", "interactionType": "https://schema.org/CommentAction", "userInteractionCount": 1}]
- Exposed comment count: 1
- Extraction method: public LinkedIn SSR `application/ld+json` SocialMediaPosting plus OpenGraph metadata.
- Extraction caveat: LinkedIn public SSR can hide social context behind login. Treat body as recovered, but comments/reactions as incomplete.

## Shortlinks mentioned in the post

- `https://lnkd.in/guSEB25F` -> https://github.com/garrytan/gbrain
- `https://lnkd.in/gX5GyrGe` -> https://x.com/garrytan/status/2053127519872614419

## Post body, verbatim

제가 LinkedIn 글 약 200개를 만들 때 쓰던 시스템을 LLM Wiki, GBrain과 비교하면서 다시 뜯어보고 있습니다. writings/ 209개 파일을 훑어보니 skills, memory, CLAUDE.md/AGENTS.md, repo-as-operating-system, harness portability는 이미 꽤 쌓였고, 약한 건 entity propagation, compiled truth schema, 정량 feedback loop였습니다. 저는 저만의 AI OS를 만드는 여정이라고 생각했는데, YC CEO Garry Tan은 이 길을 먼저 가보고 GBrain으로 오픈소스화했습니다.

제목은 Meta-Meta-Prompting입니다.

하지만 제가 보기엔 메타 프롬프팅 이야기가 아닙니다. 개인 AI OS 이야기입니다.

원문에서 Garry는 자기 시스템을 10만 페이지 브레인, 100개 넘는 스킬, 15개 cron job으로 설명합니다. 현재 GBrain README는 그 패턴을 17,888 pages, 4,383 people, 723 companies, 21 cron jobs, 34 skills, 30분 설치 가능한 오픈소스 시스템으로 일반화합니다.

핵심은 세 가지였습니다.

1. Brain은 노트 폴더가 아닙니다.

GBrain의 source of truth는 markdown repo입니다. 사람, 회사, 미팅, 글, 아이디어가 각각 페이지가 되고, 그 위에 Postgres, pgvector, hybrid search, typed link graph가 붙습니다. 사람은 markdown을 직접 읽고 고칠 수 있고, sync가 그 변경을 다시 검색 인덱스로 가져갑니다.

페이지 구조도 중요합니다. 위에는 compiled truth. 지금까지의 최선의 이해입니다. 아래에는 timeline. append-only evidence trail입니다. 새 미팅이 들어오면 과거 문장을 덮어쓰는 게 아니라 현재 이해를 갱신하고, 근거는 타임라인에 남깁니다.

여기서 파일 캐비넷과 brain이 갈립니다. 파일 캐비넷은 저장합니다. Brain은 상태를 바꿉니다. README가 P@5 49.1%, R@5 97.9% 같은 retrieval 벤치마크를 길게 넣은 이유도 이 때문입니다. 많이 저장하는 게 아니라, 사람/회사/개념 사이의 typed link를 만들어 vector search만으로 못 푸는 질문을 풀겠다는 겁니다.

2. Book mirror는 요약이 아닙니다.

원문에서 제일 인상적인 부분은 Pema Chodron 책 22개 챕터를 읽고 30,000-word brain page로 만든 장면입니다. 왼쪽에는 저자의 생각. 오른쪽에는 Garry의 실제 삶, YC 운영, 창업자 대화, 독서 기록, 치료사와 다루던 주제가 붙습니다.

40분 만에 가능했던 이유는 모델이 똑똑해서만이 아닙니다. 이미 그의 업무 맥락, 독서 기록, 미팅 노트, 관계 그래프가 로드돼 있었기 때문입니다. README의 book-mirror도 같은 방향입니다. 책의 내용을 보존하면서, 오른쪽 컬럼에서 그 사람의 brain에 있는 언어와 경험으로 매핑합니다.

3. Skill은 그냥 프롬프트 저장소가 아닙니다.

Garry가 "skills are the prompts"라고 말하는 이유가 여기 있습니다. 한 번 길게 쓴 프롬프트가 아니라, 반복 가능한 운영 지식이 skill file로 남습니다.

GBrain은 brain-ops, meeting-ingestion, media-ingest, enrich, book-mirror, perplexity-research, skillify 같은 skills를 갖고 있습니다. Skillify는 실패를 한 번 고친 뒤 SKILL.md, trigger, script, test, resolver check까지 남기는 루프입니다. "다음부터 이 실수 하지 마"가 채팅에 묻히지 않고 실행 가능한 자산으로 바뀝니다.

여기서 thin harness도 이해됩니다. OpenClaw나 Hermes가 모든 책, 미팅, 사람 정보를 직접 알고 있다는 뜻이 아닙니다. 메시지를 받고, 어떤 skill이 처리해야 하는지 고르고, 실행을 dispatch합니다. 라우터에 가깝습니다. 지식은 brain과 skills에 있고, runtime은 얇게 연결합니다.

README의 Minions도 같은 방향입니다. 매번 판단이 필요한 일은 sub-agent에게 맡기고, 같은 입력이면 같은 절차로 끝나는 deterministic work는 job queue로 뺍니다. 모델은 판단에 쓰고, 반복 실행은 시스템에 맡기는 구조입니다.

4. 이걸 읽고 제 deep-thought를 다시 봤습니다.
/morning-briefing은 캘린더, 슬랙, 메일을 모아 하루를 준비하고, /weekly-sync는 여러 에이전트가 병렬로 팀 정보를 모읍니다. linkedin-write는 글쓰기 스타일과 source-backed 작성 규칙을 기억하고 개선할 때마다 버전을 남깁니다.

이건 아직 Garry의 GBrain 수준은 아닙니다. 저는 아직 사람, 회사, 미팅 페이지가 자동으로 서로 업데이트되는 entity propagation이 약합니다. compiled truth + append-only timeline도 모든 자산에 일관되게 적용돼 있지 않습니다. 하지만 이렇게 분석하고나니 내 워크플로우를 금방 업데이트할 수 있을 것 같습니다.

더 좋은 프롬프트를 쓰는 게 아니라, 내 일을 AI가 배울 수 있는 파일 시스템으로 바꾸는 것.
AI를 잘 쓰는 사람보다, 자기 일을 AI가 배울 수 있는 형태로 남기는 사람이 이깁니다.

gbrain: https://lnkd.in/guSEB25F
Meta-Meta-Prompting: The Secret to Making AI Agents Work: https://lnkd.in/gX5GyrGe

## Public comments exposed by LinkedIn SSR

### Comment 1: Jonathan Shroyer

- Published: 2026-05-14T15:17:27.616Z
- Like count: 0

이런 정리 진짜 좋아요. GBrain 보는 재미가 이런 구조랑 "진짜 내 일 하는 방식"이 파일과 흐름에 다 녹아 있다는 느낌이에요. 기존 지식 관리랑 완전히 다른 결. 파일이 쌓이는 게 아니라 관계랑 상태가 계속 바뀐다는 개념이 제일 크게 다가왔어요. 👏
