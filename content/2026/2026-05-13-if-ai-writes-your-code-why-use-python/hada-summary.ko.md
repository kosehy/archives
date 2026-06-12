# GeekNews 보존: AI가 코드를 작성한다면, 왜 Python을 쓰는가?

## Metadata
- Shared URL: https://share.google/z2QaJ1boF7ARWjaob
- GeekNews URL: https://news.hada.io/topic?id=29426
- Original source URL: https://medium.com/@NMitchem/if-ai-writes-your-code-why-use-python-bf8c4ba1a055
- Preserved date: 2026-05-13

## GeekNews 본문
- AI 보조 개발로 언어 선택 기준이 사람의 작성 속도에서 AI의 수정 능력과 런타임 성능으로 이동함
- 2026년 Claude Opus 4.7, GPT-5.5, Gemini 3.1, DeepSeek V4가 SWE-bench Verified 80% 를 넘김
- Rust는 컴파일러 피드백 루프가 AI의 자기수정을 돕고, Go와 Swift도 빠른 타입 검사로 에이전트에 유리함
- TypeScript 컴파일러의 Go 포팅, Rust 기반 C 컴파일러, Rue, Ladybird JS 엔진 포팅처럼 대규모 전환이 이미 진행 중
- Python·JavaScript 생태계도 Rust 도구와 래퍼 의존이 커지지만, Prisma·PyTorch·소규모 언어 같은 예외는 남아 있음

## AI 보조 개발이 바꾼 언어 선택 기준

- 새 프로젝트의 기본 선택지는 오랫동안 Python이나 TypeScript였음 생태계가 크고, 채용 풀이 넓으며, 빠르게 데모를 만들 수 있었기 때문 Rust, Go, C++는 10~100배 성능을 줄 수 있었지만 학습 기간, 작은 인재 시장, 까다로운 빌드 시스템이 비용으로 작용함 그래서 먼저 Python 버전을 출시하고 “나중에 성능을 개선하겠다”고 했지만, 실제로는 그대로 유지되는 경우가 많았음
- AI가 어려운 언어를 다루기 시작하면서 이 거래가 흔들림 언어 선택에서 “사람이 빨리 작성할 수 있는가”보다 “AI가 잘 작성·수정할 수 있는가”와 런타임 성능의 비중이 커짐

## 어려운 언어가 AI에게 먼저 쉬워짐

- 2년 전 GPT-4는 Rust 함수 작성 중 존재하지 않는 crate 이름을 지어내는 수준이었음
- 2026년 4월에는 Claude Opus 4.7, GPT-5.5, Gemini 3.1, DeepSeek V4가 몇 주 간격으로 SWE-bench Verified에서 80%를 넘김
- 연구소들은 시스템 작업을 명시적으로 최적화하는 중 동시성 버그 경쟁 상태 계획 단계에서 발견되는 아키텍처 결함
- [CtrlAltDwayne](http://twitter.com/CtrlAltDwayne)은 Rust가 2026년에 강한 이유를 메모리 안전성이나 성능보다 컴파일러 피드백 루프에서 찾음 AI가 C++보다 Rust를 더 잘 작성함 Rust의 컴파일러 오류 메시지가 모델의 실시간 자기수정을 돕는 신호가 됨 Rust는 AI 보조 개발에 맞게 10년 먼저 “우연히 설계된” 언어처럼 작동함
- 같은 논리는 정도 차이는 있지만 Go와 Swift에도 적용됨 강한 타입 시스템과 빠른 컴파일·검사 루프가 에이전트에게 촘촘한 반복 사이클을 제공함 사람에게 어려웠던 시스템 언어가 에이전트에게는 오히려 쉬운 대상이 될 수 있음

## 실제로 출시된 사례들

- Microsoft의 TypeScript 컴파일러 Go 포팅 Microsoft는 [TypeScript 7.0 beta](https://devblogs.microsoft.com/typescript/announcing-typescript-7-0-beta/)를 출시하며 10년 된 TypeScript 코드베이스를 Go로 포팅함 TypeScript 7.0 beta는 6.0보다 대략 10배 빠름 [Anders Hejlsberg의 판단](https://thenewstack.io/microsoft-typescript-devs-explain-why-they-chose-go-over-rust-c/)에 따르면 Go는 엔지니어링 비용의 일부만으로 대부분의 성능 이점을 제공함 가장 큰 JS/TS 조직 중 하나가 대표 도구에 더 어렵고 빠른 언어를 선택할 만큼 노력 대비 효과의 계산이 바뀜
- Claude 에이전트 16개로 만든 Rust 기반 C 컴파일러 Anthropic 연구자 Nicholas Carlini는 [16개의 Claude 에이전트를 병렬로 조율](https://www.anthropic.com/engineering/building-c-compiler)해 Rust로 프로덕션 C 컴파일러를 작성함 규모는 10만 줄이며, x86·ARM·RISC-V에서 Linux 6.9를 부팅함 QEMU, FFmpeg, SQLite, PostgreSQL, Redis를 컴파일하고 Doom도 실행함 총비용은 거의 2,000개의 Claude Code 세션에 걸쳐 2만 달러 미만이었음 Rust로 작성한 C 컴파일러는 과거에는 대학원 논문급 작업이었지만, 이제 예외적인 작업만은 아니게 됨
- Steve Klabnik의 Rue The Rust Programming Language 공동 저자이자 13년차 Rust 베테랑인 Steve Klabnik은 Claude와 함께 [Rue라는 새 시스템 언어](https://www.theregister.com/2026/01/03/claude_copilot_rue_steve_klabnik)를 2주 만에 만듦 결과물은 대략 7만 줄의 Rust였음 그는 이번 2주 작업이 이전에 한두 달 들였던 시도보다 더 멀리 갔다고 밝힘
- Ladybird JavaScript 엔진의 Rust 포팅 Ladybird 브라우저 창시자이자 C++ 엔지니어인 Andreas Kling은 Claude Code와 Codex에 수백 개의 작은 프롬프트를 주며 Ladybird의 JavaScript 엔진을 C++에서 Rust로 2주 만에 포팅함 결과는 대략 2만 5천 줄의 Rust였고, C++ 원본과 바이트 단위 동등성을 달성함 test262와 Ladybird 테스트를 합쳐 6만 5천 개 이상에서 회귀가 없었음 같은 작업을 손으로 했다면 여러 달이 걸렸을 것이라고 밝힘

## 약해지는 “생태계” 논리

- Python과 JavaScript의 가장 강한 논리는 언어 자체보다 생태계였음 FastAPI, Django, PyTorch, React, Next.js, npm의 400만 패키지 같은 기반이 있었음 팀이 기능을 며칠 만에 출시할 수 있었던 이유는 생태계가 문제의 90%를 이미 해결했기 때문
- 이 장점은 지난 10년간 결정적이었지만, 최근 2년 사이 약해지고 있음
- Python 생태계 내부도 점점 Rust 기반 구성요소에 의존함 `pydantic`의 전체 검증 코어는 Rust 라이브러리임 pandas 대안인 Polars는 Rust로 작성됨 Hugging Face tokenizers와 orjson도 Rust임 [JetBrains 2025 Python survey](https://blog.jetbrains.com/pycharm/2025/08/the-state-of-python-2025/)에 따르면 Python 바이너리 확장에서 Rust 사용률은 1년 만에 27%에서 33% 로 증가함
- 개발 도구 기반도 같은 방향으로 움직임 Charlie Marsh가 2022년 설립한 Astral은 Rust로 작성된 ruff, uv, ty를 출시했고, 세 도구의 월간 다운로드 수는 0에서 수억 회로 증가함 [2026년 3월 19일 OpenAI가 Astral을 인수](https://openai.com/index/openai-to-acquire-astral/)했으며, uv가 Codex의 컴퓨트 시간을 주당 약 100만 분 절약한다고 봄 10주 전에는 [Anthropic이](https://www.anthropic.com/news/anthropic-acquires-bun-as-claude-code-reaches-usd1b-milestone) [Bun](https://github.com/oven-sh/bun)을 인수함 Bun은 월간 다운로드 700만, GitHub 스타 8만 9천을 기록했고, “AI 주도 소프트웨어 엔지니어링의 필수 인프라”로 불림 Evan You의 VoidZero는 [Rolldown-Vite](https://voidzero.dev/posts/announcing-rolldown-vite)를 출시함 이 Rust 번들러는 GitLab의 2.5분 빌드를 40초로 줄이고 메모리 사용량을 100분의 1로 낮춤
- Vercel 제품 부문 부사장 Lee Robinson은 “JS에서 최적화의 정점에 도달했다”고 말함
- Python과 JavaScript에서 가져다 쓰는 패키지는 점점 더, 직접 출시하기 어렵다고 여겨졌던 언어로 작성된 코드의 래퍼가 되고 있음 이제 그런 언어로 직접 출시할 수 있다면 래퍼는 오버헤드처럼 보이기 시작함

## 패치보다 포팅이 쉬워지는 변화

- 기존 오픈소스 생태계의 선순환은 패치 중심이었음 Python이 쉬워서 선택함 의존성 버그를 발견함 수정하고 upstream에 반영함 생태계가 더 건강해짐
- 에이전트는 기여의 단위를 패치에서 포팅으로 옮기는 중
- Flask 창시자 Armin Ronacher는 1월에 에이전트를 사용해 Rust 라이브러리 MiniJinja를 [Go로 포팅](https://lucumr.pocoo.org/2026/1/14/minijinja-go-port/)함 전체 실행 시간은 10시간이었음 이 중 3시간은 감독했고 7시간은 무인으로 진행됨 실제 사람 시간은 45분이었음 API 비용은 60달러였음
- 라이브러리를 언어 간 포팅하는 일이 45분짜리 작업이 되면, 다른 사람의 라이브러리에 수정사항을 올리는 논리는 약해짐 “패치할 수 있는데 왜 포크하지 않는가”가 아니라 “포크할 수 있는데 왜 패치하는가”가 됨
- Armin Ronacher는 가치가 코드에서 테스트와 문서로 이동하고 있다고 봄 좋은 테스트 스위트가 코드보다 더 가치 있을 수 있음
- PyPI와 npm을 만든 루프는 지금도 작동하지만, 2028년에도 그대로 작동할지는 명확하지 않음

## 여전히 남는 예외

- 모든 변화가 한 방향으로만 흐르지는 않음
- 어떤 경우에는 여전히 기존 선택이 맞음 [Prisma는 Rust query engine을 제거](https://www.prisma.io/blog/from-rust-to-typescript-a-new-chapter-for-prisma-orm)하고 TypeScript/WASM 코어로 옮김 번들 크기는 85% 감소했고, 쿼리는 최대 3.4배 빨라짐 네이티브 Rust 바이너리는 서버리스 런타임에 불리함
- PyTorch는 딥러닝 연구의 약 85% 를 여전히 차지함 모델 가중치는 어떤 언어로 감싸는지에 영향을 받지 않기 때문에 이 위치가 쉽게 바뀌지는 않음
- AI가 모든 시스템 언어를 똑같이 잘 다루는 것은 아님 Zig, Haskell, Gleam 같은 더 작은 언어는 현재 AI 생성 품질이 Rust나 Go와 같지 않음 훈련 데이터가 모델이 도울 수 있는 범위를 결정함 Rust와 Go는 GitHub에 충분히 많이 올라와 있어 유리한 위치에 있음 Zig, Haskell, Gleam은 아직 그 곡선의 불리한 쪽에 있음

## 왜 이 변화가 지속될 수 있는가

- Python과 TypeScript의 기존 방어 논리는 사실 개발자 경험의 방어였음 사람의 아이디어와 출시 제품 사이의 마찰을 최소화했기 때문에 선택됐음 Rust는 런타임에서 느린 언어가 아니라, 새벽 2시에 출시해야 할 때 느린 언어였음
- 이제 에이전트가 어려운 부분을 맡기 시작함 사람의 역할은 “코드 작성”에서 “시스템 설계와 출력 검토”로 이동함 이 흐름에서는 Python의 문법적 편의가 분기마다 덜 중요해짐 더 어려운 언어의 런타임 이점은 서비스가 프로덕션에서 실행되는 매일 누적됨
- Armin Ronacher는 2월 글 [A Language For Agents](https://lucumr.pocoo.org/2026/2/9/a-language-for-agents/)에서 코딩 비용이 급격히 내려가며 생태계의 폭이 덜 중요해진다고 봄
- 지난 20년간의 언어 선택은 “사람이 코드를 작성하고, 사람은 저수준 언어에서 느리다”는 제약을 중심으로 형성됐음 이 제약이 사라지기 시작함
- Stack Overflow 2025 설문에서 Rust는 10년 연속 가장 존경받는 언어였고 72% 를 기록함 Gleam은 70% Elixir는 66% Zig는 64% 선호는 이미 있었고, 도구가 이제 그 선호를 따라잡고 있음

## 에이전트에 쉬운 언어로 가는 다음 단계

- Karpathy는 [2월](https://x.com/karpathy/status/2023476423055601903)에 LLM이 소프트웨어의 제약 지형 전체를 바꾼다고 말함 C에서 Rust로 포팅하는 흐름에서 그 조짐이 보인다고 봄 Rust조차 LLM의 대상 언어로는 최적에 가깝지 않다고 덧붙임
- 현재의 승자는 시작점일 뿐이며, 최종 형태는 더 멀리 있을 수 있음
- @RealRichomie는 [4월 24일](https://x.com/RealRichomie/status/2047509168442196230?s=20)에 프로그래밍의 미래가 사람에게 가장 쉬운 언어가 아니라 에이전트에게 가장 쉬운 언어로 갈 것이라고 말함 엔지니어들이 Rust나 Tauri를 전혀 몰랐던 상태에서 Mac 앱을 출시함 결과물은 Electron 버전 대비 약 10분의 1 크기였고, 런타임 성능이 높았음 사람은 Rust를 배울 필요 없이 그 결과에 도달함
- 다음 프로젝트가 반드시 Python을 기본값으로 삼을 필요는 없음

## GeekNews/원문 링크

- [CtrlAltDwayne](http://twitter.com/CtrlAltDwayne)
- [TypeScript 7.0 beta](https://devblogs.microsoft.com/typescript/announcing-typescript-7-0-beta/)
- [Anders Hejlsberg의 판단](https://thenewstack.io/microsoft-typescript-devs-explain-why-they-chose-go-over-rust-c/)
- [16개의 Claude 에이전트를 병렬로 조율](https://www.anthropic.com/engineering/building-c-compiler)
- [Rue라는 새 시스템 언어](https://www.theregister.com/2026/01/03/claude_copilot_rue_steve_klabnik)
- [JetBrains 2025 Python survey](https://blog.jetbrains.com/pycharm/2025/08/the-state-of-python-2025/)
- [2026년 3월 19일 OpenAI가 Astral을 인수](https://openai.com/index/openai-to-acquire-astral/)
- [Anthropic이](https://www.anthropic.com/news/anthropic-acquires-bun-as-claude-code-reaches-usd1b-milestone)
- [Bun](https://github.com/oven-sh/bun)
- [Rolldown-Vite](https://voidzero.dev/posts/announcing-rolldown-vite)
- [Go로 포팅](https://lucumr.pocoo.org/2026/1/14/minijinja-go-port/)
- [Prisma는 Rust query engine을 제거](https://www.prisma.io/blog/from-rust-to-typescript-a-new-chapter-for-prisma-orm)
- [A Language For Agents](https://lucumr.pocoo.org/2026/2/9/a-language-for-agents/)
- [2월](https://x.com/karpathy/status/2023476423055601903)
- [4월 24일](https://x.com/RealRichomie/status/2047509168442196230?s=20)
- [Rust, Python, TypeScript: 새로운 프로그래밍 3대장(Trifecta)](https://news.hada.io/topic?id=22393)
- [Go는 AI 에이전트를 위한 최고의 언어](https://news.hada.io/topic?id=27187)
- [2025.02 ~ 2026.02 GitHub 인기 신규 프로젝트 언어 분포](https://news.hada.io/topic?id=27463)
- [Ladybird가 Rust를 채택, AI의 도움으로 전환 가속](https://news.hada.io/topic?id=26941)
- [AI 시대, TypeScript의 부상: 수석 설계자 Anders Hejlsberg의 통찰](https://news.hada.io/topic?id=24265)
- [Hacker News 의견들](https://news.ycombinator.com/item?id=48100433)
- [https://gertlabs.com/rankings?mode=agentic_coding](https://gertlabs.com/rankings?mode=agentic_coding)
- [https://scribe.rawbit.ninja/@NMitchem/if-ai-writes-your-code...](https://scribe.rawbit.ninja/@NMitchem/if-ai-writes-your-code-why-use-python-bf8c4ba1a055)
- [https://sr.ht/~edwardloveall/Scribe/](https://sr.ht/~edwardloveall/Scribe/)
- [https://libredirect.github.io/](https://libredirect.github.io/)
## 댓글 보존

### Comment 1
- Metadata: GN⁺ 17시간전 [-]
[Hacker News 의견들](https://news.ycombinator.com/item?id=48100433)

- LLM 코딩 도구를 비결정적 컴파일러처럼 본다는 주장에 동의한다면, 가능한 한 성능 좋은 언어를 고르는 게 꽤 말이 됨 물론 라이브러리나 언어별 네이티브 장점 같은 예외는 많지만, 지난 한 달 정도 C++로 작업해 보니 언어 선택 때문에 느려진 건 컴파일 시간뿐이었음
- 초반 댓글들을 읽고도 학습 데이터 얘기가 안 보여서 놀랐음. Python 코드가 학습 데이터에 워낙 많음 AI로 Brainfuck도 쓸 수는 있겠지만, Python을 쓸 때와 같은 결과가 나오지는 않을 거라고 봄 후속 질문은 이거임: 이제 AI가 있다면, 필요해지기 전까지 왜 언어를 신경 써야 하나? 5년 만에 Perl을 다시 써보고 싶어졌고, Go로 만들던 프록시를 띄우고 여러 통합 테스트를 작성할 아주 단순한 방법이 필요했음 Claude Code로 대부분을 작성했는데 Claude가 Perl을 정말 잘 다뤘음. CPAN에 손대지 말고 Perl 표준 라이브러리만 쓰라고 했더니 HTTP 클라이언트, TLS, JSON까지 전부 내장되어 있었고, 평소라면 셸 스크립트로 구현했을 일을 매우 안정적이고 쉬운 방식으로 대체할 수 있었음 Perl이 크게 변하지 않았고 학습 데이터도 많아서, Claude는 셸 스크립트를 떠올릴 만한 상황에서 Perl을 꽤 잘 쓰는 것 같음 놀랍게도 LLM은 에이전트식 코딩 작업에서 다른 흔한 프로그래밍 언어보다 Python 추론을 훨씬 못함 데이터는 여기 있음: [https://gertlabs.com/rankings?mode=agentic_coding](https://gertlabs.com/rankings?mode=agentic_coding) 그냥 Go를 쓰면 됨. LLM이 Go를 많이 봤고, 잘 작성하며, 거의 즉시 컴파일되고, 타입이 있는 컴파일 언어의 장점도 모두 있음 AI로 큰 Python 코드베이스를 만들었는데, LLM이 계속 인수나 딕셔너리 형식을 잘못 추측했음. 단위 테스트나 pydantic 같은 도구가 도움이 되긴 하지만, 그런 종류의 런타임 오류 자체를 피하는 편이 더 낫다 학습 데이터만으로는 답이 다 안 됨. LLM은 다른 프로그래밍 언어로 번역하는 일을 정말 잘함. 텍스트 번역 시스템에서 파생됐다는 점을 생각하면 자연스러움 공개 코드가 상대적으로 적은 언어에서도 결과가 훌륭했음. 더 큰 장애물은 LLM이 대상 언어의 흔한 관용구를 베낀다는 점이고, Java나 C#처럼 “엔터프라이즈스러운” 언어라면 쓸모없는 상용구 코드가 즉시 폭증할 수 있음. 그러면 결과물이 사용 가능한 문맥 창 크기를 넘어서 품질이 떨어질 위험이 커짐 AI에게 열린 루프로 코드를 생성하게 한다면 학습 데이터가 중요할 수 있음. Python에는 요청한 것과 비슷한 코드를 누군가 이미 작성했을 가능성이 높으니까 하지만 에이전트가 코드를 만들고, 컴파일을 시도하고, 자세한 오류 메시지를 본 뒤 그 메시지를 바탕으로 코드를 다듬는다면 더 높은 품질의 결과가 나옴. rustc 진단은 매우 좋고, Python이나 JavaScript/TypeScript가 훨씬 많다 해도 이제 온라인에 Rust 코드도 충분히 많음
- 왜 Python이냐면, 10년 넘게 써왔고 디버깅 방법을 알며, 에이전트가 코드를 쓰고 10초 안에 큰 사고로 이어질 만한 일을 하는지 냄새로 알아챌 수 있기 때문임 다른 언어라면 그렇지 않고 많이 다시 배워야 함. AI가 빠르게 코드를 쏟아내더라도 어느 정도 통제하고 있다는 느낌이 드는 Python을 선호하게 됨. Go나 Rust로 했다면 AI 보조 프로그래밍이라기보다, 제품 전체를 그냥 YOLO로 밀어붙이는 “바이브 코딩”처럼 느껴졌을 것임 에이전트 시대에 Rust를 쓰기 시작했는데, 다른 언어에서 쌓은 경험이 여전히 이어져서 코드 냄새와 나쁜 아키텍처를 알아보는 데 도움이 됐음 메모리 안전성 부분은 무엇이 “맞는지” 몰라서 배워야 했지만, 나머지는 순조로웠음 문법은 점점 배경으로 사라지고 더 높은 수준의 것에 집중하게 되며 새로운 길을 탐색하게 됨. 한번 시도해 보면 경험이 얼마나 많이 이전되는지 기분 좋게 놀랄 수 있음 나도 비슷했음. AI가 생성한 Python 코드는 몇 줄만 봐도 헛소리인지 냄새를 맡을 수 있어서, 대부분의 프로젝트에 계속 Python을 씀
- AI가 글을 써준다면 왜 뇌를 쓰나? 비웃을 일이 아님. 모델은 지난달보다 훨씬 좋아졌고 토큰 비용도 내려갔음. LLM은 뇌를 위한 컴파일러와 같음 /s
- AI가 Rust를 쓰게 하는 데서 왜 멈추나? 모든 게 바이브 코딩이고 코드 리뷰도 더 이상 안 한다면, LLM에게 토큰 사용량 최소화와 속도만을 위해 만든 초간결·초고밀도 언어를 설계하게 하면 됨 이 댓글 끝에는 부분적으로만 의도한 /s가 붙어 있음 왜 코드 작성에서 멈추나? 우리 모두 맞춤형 ASIC 칩을 만들어야 하고, 칩 팹이 없다면 최소한 FPGA라도 해야 함
- 약간 주제에서 벗어나지만, 도대체 왜 아직도 사람들이 Medium에 글을 올리는지 모르겠음 읽기 경험이 끔찍함. 전체 화면 팝업이 읽고 있던 문장을 말 그대로 가려서 이 글도 끝까지 못 읽었음 내가 못 보는 어떤 유인이 있나? 브라우저에서 읽는 어떤 것도 모두에게 궁극적으로 훌륭하고 단연 최고의 읽기 경험을 똑같이 제공할 수는 없음. 현대 웹 모델 자체가 그와 충돌함 CSS 없는 평범한 HTML 페이지는 거의 완벽한 읽기 경험임. 문제는 거의 아무도 그렇게 배포하지 않는다는 것임. 웹이 저자들이 관심을 두고 경쟁하는 출판 플랫폼이 되었기 때문임. 사용자 통제 아래 있는 일반 텍스트 프로토콜이 “모두에게 최고의 읽기 경험”에 더 가까움. 웹도 그럴 수 있었지만 대부분은 그렇지 않음 브라우저에서 긴 글을 읽으려는 시도를 그만뒀음. 관련된 일반 텍스트, 심지어 구조화된 텍스트까지 쉽게 추출해서 내 편집기에서 읽을 수 있는데 왜 브라우저에서 읽어야 하나? 글꼴, 색상, 탐색 등을 내가 통제할 수 있음. 브라우저는 전달 수단이지 읽기 환경이 아님. 그렇게 취급하는 건 습관이지 필수가 아님 오래전부터 세 단어보다 긴 것은 편집기 밖에서 쓰지 않게 됐음. 맞춤법 검사, 동의어 사전, 어원 조회, 번역, 내 모든 노트 접근, LLM 연동까지 이미 필요한 게 다 있음. 언젠가 시도해 보면 엄청나게 해방감을 느낄 것임. 그러면 긴 글을 브라우저에서 읽는 것도 그만둘 수 있음 Medium은 글쓴이에게 돈을 지급하려는 꽤 진지한 시도를 해왔음. Substack과는 다른 모델이지만, 그게 이유임 신문 유료 장벽을 보는 방식과 비슷하게 봄. 마음에 들지는 않지만 왜 있는지는 이해함 가장 그럴듯한 추측은 관성임. 어떤 사람들은 브랜드 충성도가 매우 강하고, 남들이 무엇을 어떻게 하는지에 맞춰 움직여야 함 실제로는 어디에 게시됐는지는 중요하지 않고 URL만 주면 되지만, 모두가 그렇게 행동하지는 않음 글쓴이 친화적인 블로그 플랫폼의 최신 진화처럼 보임. WordPress보다 뉴스레터 형태로 묶기 쉽고, 유료 티어로 수익화하기도 더 쉬움 Medium 대체 프론트엔드인 Scribe를 써보면 훨씬 나음: [https://scribe.rawbit.ninja/@NMitchem/if-ai-writes-your-code...](https://scribe.rawbit.ninja/@NMitchem/if-ai-writes-your-code-why-use-python-bf8c4ba1a055) [https://sr.ht/~edwardloveall/Scribe/](https://sr.ht/~edwardloveall/Scribe/) [https://libredirect.github.io/](https://libredirect.github.io/)
- Python은 Rust보다 훨씬 성숙한 생태계를 갖고 있고, 특히 AI/머신러닝 쪽에서 그렇음 특정 머신러닝 알고리즘을 구현한다고 주장하는 Rust 크레이트를 만났는데 제대로 동작하지 않았음. 그래도 Claude로 대체 구현을 작성할 수는 있었음 AI와 함께라면 타입 시스템 수준에서 정확성을 강제하는 게 좋은 생각이라고 봐서, Python보다 C#이나 Rust 같은 언어를 자주 고름. 다만 어떤 일에는 Python이 분명 맞는 도구임 거의 항상 Rust를 고름. 최근에는 Go로 작성된 어떤 것의 플러그인을 만들었음 Rust를 쓸 수도 있었지만, 결과물이 잘되면 다른 사람들은 하나의 도구 체인을 쓰는 데서 더 큰 가치를 얻을 테니 Go가 맞다고 느꼈음 핵심 이유는 필요할 때 읽을 수 있어야 한다는 것임. 그리고 받는 쪽 생태계가 기대하는 언어가 있음. 일부 데이터 과학 커뮤니티가 R, MatLab, Julia, Python, Mojo를 고르는 것도 기술적으로 무엇이 우월한지가 아니라 동료들이 무엇을 쓰는지에 달려 있음 유일한 사용처는 머신러닝 라이브러리처럼 저수준 C++ 라이브러리를 감싸는 경우라고 봄. 그런 것들은 재현하기가 정말 어렵긴 함 AI와 함께 쓸 때 타입 시스템 강제가 좋은 이유는 몇 가지 있음 추측이지만, 타입 언어는 더 빠르고 좋은 언어 서버를 갖는 경우가 많아서 도구 사용으로 코드를 더 효율적으로 수정할 수 있음 사람이 직접 끼어들어 코드를 조사하거나 수정해야 할 때도, 강한 타입 덕분에 스파게티 코드 안에서 훨씬 쉽게 방향을 잡을 수 있음 AI/머신러닝 라이브러리 지원에는 확실히 할 말이 있음. 그래도 요즘 백엔드 작업은 Rust/TypeScript로 많이 가게 됨. Django를 정말 좋아하는데도 그렇다 Python 생태계에서 벗어나 AI가 의존성을 관리하거나 폴리필하게 둘 거라면, Rust가 아니라 차라리 OCaml/F#까지 가는 편이 나음 그러면 가비지 컬렉션과 강한 타입의 장점을 얻을 수 있음
- 지금으로서는 사람이 직접 작성할 때 Python을 쓰는 이유와 정확히 같음. Zig 같은 언어보다 Python을 아는 사람이 더 많아서, 사람이 코드를 더 쉽게 읽고 수정할 수 있기 때문임 글의 요지는 이해하지만, 아직 그 단계까지는 아니라고 봄 자동화가 인간이 이해하지 못하는 언어로 작성하는 세상은, 완전히 캄캄한 중국 자동화 공장을 떠올리게 함. 인간은 길을 잃고 혼란스러워하지만 로봇은 그 안에서 편안한 곳
- “팀의 아무도 모르는 언어로 출시된 앱”이라니 좋음. 그리 멀지 않은 미래에 이 일을 되돌아보게 될 것임 AI 이전에도 이런 일은 있었음. 10년 전 어떤 사람이 무작위 언어로 핵심 도구를 작성했고, 나머지 사람들이 그걸 유지보수해야 했음. 그래도 어떻게든 해냈음 아마 그들이 대체하던 Electron 앱보다 더 무서울 수 있는 세상 유일한 물건일 듯함 그냥 12~18개월 뒤에 이직하면 됨. 그러면 그건 다른 사람 문제임
- “Anthropic 연구원 Nicholas Carlini가 16개의 병렬 Claude 에이전트를 조율해 Rust로 프로덕션 C 컴파일러를 작성했다”는 건 사실이 아님 그 컴파일러는 gcc/clang보다 훨씬 열등한 코드를 생성해서 사실상 쓸모없음
