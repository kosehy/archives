# 한국어 요약: AI paradox - 자동화가 많아질수록 인간과 일이 더 중요해지는 이유

Dan Shipper는 Every를 “미래를 예언하는” 회사라기보다 “미래 안에서 함께 살아보는” 회사로 설명한다. Every는 약 30명 규모의 media/software company이고, 엔지니어·디자이너·writer·editor·sales·customer support 인력이 모두 AI early adopter로 일한다. Lenny는 Dan이 1년 전 “Claude Code for non-technical work”를 일찍 짚었다고 회고하며, 이번 에피소드는 2027년 5월에 다시 채점할 수 있는 Dan의 새 예측 묶음으로 구성된다.

핵심 예측은 “일의 방식이 두 갈래로 갈라진다”는 것이다. 하나는 회사 구성원이 Slack 같은 협업 표면에서 정기적으로 호출하는 company-level super-agent이고, 다른 하나는 Codex나 Claude Code/Claude Cowork 같은 로컬/데스크톱 agent surface가 email, document, research, browser, SaaS 사용까지 감싸는 work operating system이 된다는 전망이다. Dan은 개인별 agent의 미래를 부정하지 않지만, 현재는 유지보수와 context gardening이 어려워 “한 회사에 하나의 강한 agent + 이를 책임지는 사람” 모델이 더 잘 작동한다고 본다.

Codex/Claude Code를 둘러싼 관찰은 “coding agent가 software development tool에 머물지 않는다”는 데 있다. Dan은 agent가 사용자의 computer, browser, files, SaaS app 접근권을 갖고 사용자를 보며 함께 작업할 때, AI를 SaaS 안에 넣는 것보다 “SaaS를 AI work surface 안에서 쓰는” 경험이 더 강력해진다고 말한다. 이 관점에서는 Codex/Claude Cowork가 email triage, document writing, legal/report gathering, app control을 처리하는 일상 workbench가 된다.

이 흐름은 SaaS에 대한 반대 직관으로 이어진다. Dan은 “SaaS apocalypse is dumb”라며 SaaS가 죽는 것이 아니라 agent가 SaaS의 사용자 수와 사용량을 늘린다고 주장한다. 특히 사용자가 자기 agent와 자기 AI tokens를 가져와 SaaS app을 쓰면, vendor가 모든 inference cost를 부담하는 모델보다 margin이 개선될 수 있다는 관찰을 제시한다. 다만 이는 명백히 interview claim이자 market prediction이며, Dan 본인도 “not investment advice”라고 선을 긋는다.

제품 설계의 과제는 “humans and agents to use together”가 된다. 단순히 product 안에 chatbot을 붙이는 것이 아니라, HTML, browser state, CLI/API, permission, audit, realtime UI feedback을 agent-friendly하게 만들고, 동시에 인간 사용자가 같은 app을 이해하고 제어할 수 있어야 한다. Dan은 “two agents are better than one”이라고도 말한다. 사용자의 Codex/Cowork agent가 app-side agent와 대화하면, 사용자가 직접 긴 onboarding form을 채우는 것보다 훨씬 많은 context를 전달하고 문제를 해결할 수 있다는 것이다.

Dan은 동시에 “CLIs are over”라는 도발적 표현을 쓴다. 의미는 CLI가 사라진다는 뜻이 아니라, Claude Code 초기에 사람들이 terminal/CLI 자체를 성공 요인으로 오해했지만 이제 agent-native GUI, in-app browser, desktop workbench가 main surface가 될 가능성이 커졌다는 주장이다. 개발자들은 여전히 CLI를 오갈 수 있지만, 특히 non-programmer work에서는 GUI가 더 자연스럽고 같은 agent 이점을 제공한다는 설명이다.

에피소드의 제목에 해당하는 역설은 “automation is a lie”다. Dan은 자동화가 늘수록 인간 일이 줄어드는 것이 아니라, 자동화가 제대로 작동하는지 지켜보고, context를 주고, 실패를 고치고, 더 높은 수준의 판단을 하는 human manager/gardener가 더 필요해진다고 말한다. 그는 Proof 앱의 “vibe-coded slop”을 senior engineer가 고친 경험과 자체 benchmark를 예로 들며, benchmark 상승이 곧 senior engineer 대체를 뜻하지 않는다고 주장한다. 실제 사용에서는 항상 “AI를 쓰는 인간 vs AI를 쓰는 다른 인간”의 차이가 남는다는 관점이다.

그 결과 유망한 역할도 달라진다. Dan은 AI에 깊이 적응한 PM은 product sense, user sense, 문제 정의 능력과 coding model을 결합해 훨씬 빠르게 ship할 수 있다고 본다. full-stack designer도 interaction taste와 visual creativity를 실제 PR/implementation으로 연결할 수 있어 강해진다. 반대로 “AI job apocalypse”식 대량 실업 서사는 회의적으로 본다. 다만 직무가 안전하다는 뜻은 아니며, “ride the models” — 새 model을 직접 써보고 자기 workflow에 적용하며, 모델이 어제 못 하던 일을 오늘 할 수 있는지 계속 뒤집어보는 태도 — 가 필요하다고 말한다.

마지막으로 Dan은 forward deployed engineer를 중요한 새 역할로 본다. agent가 조직 안에서 실제로 유용하려면 누군가가 setup, permission, tool wiring, monitoring, prompt/system design, failure repair를 책임져야 하고, 이는 단순 babysitting이 아니라 조직의 비기술 구성원도 기술적 일을 할 수 있게 하는 system-building 문제다. 같은 맥락에서 AI-generated writing도 더 많이 읽게 되며, 좋은 AI 문서는 작성자가 모든 줄을 이해하고 책임지는 문서이고, 나쁜 slop은 읽는 사람의 시간보다 만드는 시간이 더 적게 든 문서라고 구분한다.
