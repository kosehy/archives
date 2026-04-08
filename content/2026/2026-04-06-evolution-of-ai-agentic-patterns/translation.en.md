# Engineering rigor does not disappear, it only moves. A four-year record of AI agentic patterns

Original: https://bits-bytes-nn.github.io/insights/agentic-ai/2026/04/05/evolution-of-ai-agentic-patterns.html
Archived: 2026-04-08
Language: English
Type: English translation of preserved original article

"The hottest new programming language is English." — Andrej Karpathy, 2023.
Three years later, that line turned out to be only half right.

### TL;DR

- From 2022 to 2026, the AI development paradigm changed three times: Prompt Engineering → Context Engineering → Harness Engineering.
- The real driver of each transition was that the previous paradigm failed to deliver what it had promised.
- Engineering rigor did not disappear. It only moved, from prompts to context, and from context to harnesses (Chad Fowler’s ["Relocating Rigor"](https://www.honeycomb.io/blog/production-is-where-the-rigor-goes)).
- By 2026, the key metrics are not prompt quality but KV-cache hit rate, the rate at which the model can reuse previous computation, and harness complexity.
- This piece reads less like a survey and more like a postmortem, tracing why each era failed.

## 1. Why this chronology now

In the third week of June 2025, the AI timeline on X, formerly Twitter, suddenly began revolving around a single term: "context engineering." On June 19, Shopify CEO Tobi Lütke [lit the fuse](https://x.com/tobi/status/1935533422589399127), and within a week Karpathy, Andrew Ng, and hundreds of engineers had joined in. In a matter of days, the phrase "prompt engineering" began disappearing from the timeline. It felt as if the whole industry had woken up after a party the night before and started asking, "What exactly have we been doing all this time?"

This was not the first time. It was the third in just four years.

[Epsilla](https://www.epsilla.com/blogs/harness-engineering-evolution-prompt-context-autonomous-agents)’s metaphor captures the arc well. In 2022, we studied how to write the perfect email. In 2025, we learned how to manage the inbox. In 2026, we are designing the email system itself.

- Prompt Engineering (2022-2024): "What should we say?" We believed the quality of the instructions sent to the model determined success or failure.
- Context Engineering (2025): "What information should we include?" We realized that what filled the context window mattered more than prompt phrasing alone.
- Harness Engineering (2026): "What system should we build?" We finally acknowledged that the real problem was the design of the whole system consuming the context.

The article’s argument is simple. **Engineering rigor did not disappear. It only moved.** As Chad Fowler, elder of the Ruby community and CTO of Honeycomb, writes in ["Relocating Rigor"](https://www.honeycomb.io/blog/production-is-where-the-rigor-goes), this is not new in software history. When XP argued for test code over design documents, or when dynamic languages deployed without compiler-enforced type checks, the old guard always said the same thing: that rigor was being abandoned. They were wrong every time. Rigor was not abandoned. It was relocated to a higher level of abstraction. From design documents to automated tests, from compiler checks to runtime test suites. The same thing is happening now. Critics say that once AI writes code, engineering rigor disappears. But rigor is only moving, from writing code to designing context, and then to building system architecture.

Each move was triggered by the failures of the previous era. The article follows the path of those failures.

![AI 에이전틱 패턴의 진화 타임라인 — Prompt → Context → Harness Engineering](/assets/images/three-era-timeline.png)

## 2. The age of prompt engineering (2022-2024)

### 2.1 Opening act: GitHub Copilot opens the door

The article argues that the era of prompt engineering did not begin with ChatGPT. It began five months earlier, with another tool.

In June 2022, GitHub Copilot launched publicly for ten dollars a month. It was the first commercial AI coding assistant in history. Powered by OpenAI Codex, itself based on GPT-3, its core feature was "ghost text" autocomplete, suggesting the next line as you typed inside the editor.

At first the reaction was mixed. Some mocked it as a copy-paste helper or Stack Overflow automation. But developers who actually used it reacted differently. According to GitHub’s own survey, 88 percent of developers felt more productive, and the time spent writing repetitive code was cut in half. By early 2024 it had more than 20 million users, 4.7 million paid subscribers, adoption by 90 percent of Fortune 100 companies, and roughly 42 percent market share.

What is interesting is that the three years of Copilot’s evolution became a compressed preview of the three eras the article goes on to describe.

| Period | Copilot version | Main change | Corresponding era |
| --- | --- | --- | --- |
| 2022.06 | Early autocomplete | Suggests the next line based on the current file | Prompt era. The code itself acts as the prompt |
| 2023.11 | Copilot Chat (GPT-4) | Conversational code questions, explanation, refactoring | Start of the transition from prompts to context |
| 2025.02 | Agent Mode | Multi-file editing, terminal execution, automatic lint-fix loops | Harness era. The agent uses tools inside the loop |
| 2025.05 | Coding Agent | Issue assignment → cloud environment → code → tests → PR creation | Deeper harness era. Fully autonomous workflow |

The initial 2022 version of Copilot was a pure prompt engineering artifact. It handed the model the implicit prompt of "the code in the current file" and let it predict the next token. The context was one file. There was no harness. And in 2022, that was still enough to feel incredibly useful.

### 2.2 ChatGPT and "English is the new programming language"

Five months later, on November 30, 2022, ChatGPT was released. One million users in five days. One hundred million in two months. Do you remember what happened that week? Developer timelines on X changed overnight. The question was no longer "What can I build with this?" It became, "How should I talk to it?" Everything looked like a problem of language.

Andrej Karpathy, former Tesla AI director and founding member of OpenAI, named that moment ["Software 3.0"](https://www.latent.space/p/s3). If Software 1.0 is human-written code and 2.0 is neural network weights, then 3.0 is a world where natural-language instructions themselves become the program. The promise was intoxicating. Things that once took ten years of learning programming might now be done with a single English sentence. If Copilot was a tool that helped write code, ChatGPT felt like something that could understand code and converse about it. Together they triggered the explosion of prompt engineering as a field.

### 2.3 Academic foundation: eliciting reasoning with prompts

While Copilot and ChatGPT were proving practical possibility, academia was working on a related but more precise question: **How do we speak so that the model reasons better?** The answers were striking.

**[Chain-of-Thought (CoT) prompting](https://arxiv.org/abs/2201.11903)**, Wei et al., 2022. Published by the Google Brain team in January 2022, this paper was the first major revolution in prompt engineering. The idea was almost laughably simple. Instead of asking for the answer directly, tell the model to think step by step. In a math problem, for example:

- **Standard prompt**: "There are 23 people in a café. Six more arrive at lunch and five leave in the afternoon. How many are there now?" → model: "25" (wrong)
- **CoT prompt**: same problem plus "Let’s think step by step." → model: "Start with 23. Six arrive → 23 + 6 = 29. Five leave → 29 - 5 = **24**" (correct)

On GSM8K, the grade-school math benchmark, PaLM 540B jumped from 17.9 percent to 58.1 percent accuracy. Simply asking for the intermediate reasoning process dramatically improved arithmetic, commonsense, and symbolic reasoning. It was the moment when a single line of prompting proved its power.

![Chain-of-Thought 프롬프팅: 일반 프롬프트(좌)와 CoT 프롬프트(우)의 차이 — Wei et al., 2022](https://ar5iv.labs.arxiv.org/html/2201.11903/assets/x1.png)

**[ReAct: reasoning and acting combined](https://arxiv.org/abs/2210.03629)**, Yao et al., 2022. In October of the same year, the Princeton-Google team went a step further. If CoT was a "thinking only" pattern, ReAct alternated Thought and Action. The model would search Wikipedia on its own, observe the result, and then continue reasoning.

```
Thought: To answer this question I need to know about X.
Action: Search[X]
Observation: X is ...
Thought: Now compare it with Y...
Action: Search[Y]
...
```

![ReAct 패턴: 추론(Reasoning)과 행동(Acting)의 결합 — Yao et al., 2022](https://ylanglabs.com/static/images/blogs/react-reasoning-and-acting-in-language-models/react-act-reason.png)

The two key gains were clear. First, hallucination dropped because the model could search for what it did not know. Second, the reasoning path became transparent because you could trace why it answered the way it did. Absolute improvements of 34 percent on ALFWorld and 10 percent on WebShop followed. **The prototype of the agent was born here.** Today’s AI agents, Claude Code, Cursor Agent, GitHub Copilot Coding Agent, all descend from variations of this Thought-Action-Observation loop.

So far, things still looked promising. Problems began once people tried to push these ideas even further.

**[Tree-of-Thought](https://arxiv.org/abs/2305.10601)**, Yao et al., 2023. In 2023, the focus shifted from the depth of reasoning to its breadth.

![Tree-of-Thought: 일직선(CoT) 대비 트리 탐색 기반 추론 — Yao et al., 2023](https://www.promptingguide.ai/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FTOT.3b13bc5e.png&w=1920&q=75)

If CoT reasoned in a straight line, Tree-of-Thought explored multiple reasoning paths in parallel and backtracked from dead ends. It worked like reading multiple lines ahead in chess. Seductive, but expensive. A single problem could require dozens of API calls. The paper’s Future Work mentions cost in a single caveat line. In production, the cloud bill makes it the first crisis.

**[Self-Refine](https://arxiv.org/abs/2303.17651)** and **[Reflexion](https://arxiv.org/abs/2303.11366)**, Madaan et al., 2023, Shinn et al., 2023. What if models critiqued and improved their own output, the way humans draft and revise? Self-Refine proposed a generate-feedback-revise loop. Reflexion proposed verbal reinforcement learning, recording failure experiences in natural language to shape future attempts. Interesting, but fundamentally limited, because the quality of the feedback remained tied to the model’s own ability. It was like a weak student grading their own exam. The same problem resurfaces later in Anthropic’s three-agent architecture, and it takes three years to arrive at the obvious conclusion: someone else has to do the grading.

### 2.4 Andrew Ng’s four agentic design patterns

In March 2024, Andrew Ng, Stanford professor, Coursera co-founder, and former leader at Google Brain and Baidu AI, took the stage at Sequoia AI Ascent. His [four agentic design patterns](https://www.deeplearning.ai/the-batch/how-agents-can-improve-llm-performance/) synthesized the research into a practical engineering framework.

![Andrew Ng의 4가지 에이전틱 디자인 패턴 — Sequoia AI Ascent, 2024.03](https://miro.medium.com/v2/resize:fit:720/format:webp/1*wjqLo8i3WSZqX5VX_uchQg.png)

**Reflection.** The model critiques and revises its own output. It works on the same principle as Self-Refine, but Ng framed it as the most stable and predictable pattern. Generate code, then ask the model to review it for bugs. Simple, but surprisingly effective. The key was to have the same model review under a different persona, such as a senior code reviewer.

**Tool Use.** This is ReAct in practical form. The model calls web search, code execution, database queries, calculators, and other external tools. The crucial point is that the model decides **when** the tool should be used. If it needs the current exchange rate, it chooses to call an exchange-rate API and then uses the result in the calculation. That is the decisive difference between a chatbot and an agent.

**Planning.** Complex tasks are broken into substeps. "Build a website" becomes "analyze requirements, design, implement frontend, implement backend, test, deploy." Powerful, but also unstable. In Ng’s own phrasing, the devil is in the details. Plans often looked impressive and then collapsed in execution.

**Multi-Agent Collaboration.** Specialized agents take separate roles and cooperate. A coder, reviewer, and tester each handle their own specialty and exchange results. In 2024 this was still early-stage, but already full of possibility.

Ng’s key finding was striking: wrap GPT-3.5 in an agentic workflow and on some benchmarks it beats GPT-4 zero-shot. In other words, performance could jump even without upgrading the model itself. Change the pattern around the model and you change the outcome. That was the high-water mark of prompt engineering, and also an early clue that the system outside the model mattered more than many people realized.

These patterns were systematized again in Anthropic’s ["Building Effective Agents"](https://www.anthropic.com/research/building-effective-agents) later that year. Anthropic distinguished **workflows**, where the flow is predefined, from **agents**, where the LLM chooses the next move autonomously. Neither category is inherently superior. Anthropic’s core message was to start as simply as possible. If a workflow is enough, you do not need an agent. And even when you do need an agent, you often do not need a complicated framework, only a good composition of basic patterns.

### 2.5 The limit: hitting the wall of prompts

But what happens when these patterns are deployed in production?

Imagine a team that spends three weeks refining the prompt for a coding agent. The instructions grow longer and longer: follow existing coding conventions, write tests, leave no unused imports. On simple tasks, it works. Then the project grows, and something breaks. The agent begins ignoring existing utility functions and re-implementing them from scratch. No matter how often the prompt says "reuse existing code," if the relevant utility file is not inside the context window, the agent does not even know it exists. The prompt was perfect, but the information visible to the agent was incomplete. This was no longer a prompt problem. It was a **context** problem.

Mitchell Hashimoto, creator of Vagrant and Terraform and co-founder of HashiCorp, called this ["Blind Prompting"](https://mitchellh.com/writing/prompt-engineering-vs-blind-prompting). Prompt writing without rigorous measurement or testing, relying only on trial and error. To be honest, this describes what most teams were doing. Modify the prompt, eyeball the output, and say, "Seems okay this time." That is closer to alchemy than to software engineering.

The problem was structural. Models are non-deterministic. The same input can lead to different outputs. Sometimes adding "please" seemed to help, and sometimes a single line break changed everything. [CodeRabbit’s 2025 report](https://www.coderabbit.ai/blog/state-of-ai-vs-human-code-generation-report) quantified the gap: AI-assisted code produced 1.7 times more major issues, and 8 times more performance inefficiencies.

The cause of death for the prompt era is clear. The place where rigor belonged was not the prompt text itself, but the **entire context** consumed by the prompt. Before the industry fully absorbed that lesson, it rushed headlong into one more dead end.

## 3. The explosion of AI coding tools and the hangover of vibe coding (2024 to early 2025)

### 3.1 Cursor: the editor that "understands context"

If Copilot was autocomplete that only saw the current file, **Cursor**, launched in March 2023, changed the question itself. Created by four MIT students, Michael Truell, Sualeh Asif, Arvid Lunnemark, and Aman Sanger, this fork of VS Code fundamentally changed how AI systems understood code.

![Cursor의 AI 코드 에디터 아키텍처](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F0a8360f2-297e-4cb0-a502-f35532070821_918x1040.png)

The crucial difference was **context scope**.

| Dimension | GitHub Copilot (early) | Cursor |
| --- | --- | --- |
| **Context scope** | Current file | Entire codebase |
| **Indexing** | None | RAG + AST-based semantic search |
| **Reference system** | None | `@file`, `@codebase`, `@Docs`, `@PR`, `@commit` |
| **Editing unit** | Single line or block | Multi-file simultaneous editing (Composer) |
| **Agent mode** | None, until added later in 2025 | Agent Mode with terminal and filesystem access |
| **Model selection** | GPT family | GPT-4o, Claude 3.5 Sonnet, Gemini, and others |

Cursor’s method of understanding the codebase is technically interesting. It recursively scans all files in a project, parses the **AST (Abstract Syntax Tree)** to identify key symbols such as functions, classes, and variables, then transforms them into vector embeddings for semantic search. File names are obfuscated and code chunks encrypted to preserve privacy.

Early Cursor centered on chat-based editing, but once **Composer mode** arrived in late 2024, the game changed. Opened with `CMD+SHIFT+I`, it offered a three-panel layout showing progress, files, and chat. Ask it in natural language to add a user authentication system, and it creates and edits several files at once. Editing had moved from a single file to the whole project. By the time Cursor 2.0 launched in 2025, it added a mixture-of-experts architecture, reinforcement learning, and the ability to run as many as eight agents simultaneously in isolated Git worktrees. Most tasks completed in under thirty seconds at roughly 250 tokens per second.

Its growth was extraordinary, among the fastest ever seen in SaaS. By 2025 it had reached 1.2 billion dollars in ARR and a 29.3 billion dollar valuation. Shopify, Vercel, and Linear were among the major adopters.

### 3.2 The Cambrian explosion of AI coding tools

Cursor’s success triggered a Cambrian explosion of AI coding tools.

**Devin (Cognition Labs, 2024.03).** It arrived with the title "the first AI software engineer," claiming it could build and deploy an app end to end. The promotional video showed it handling freelance work from Upwork, though later analysis found major exaggerations. Independent tests by the Answer.AI team found success on only 3 out of 20 tasks. Still, Cognition later acquired Windsurf for 250 million dollars in 2025 and reached a 10.2 billion dollar valuation. The mismatch between hype and substance became one of the signatures of this era.

**Windsurf, formerly Codeium.** It began as an AI autocomplete extension and rebranded into a full AI IDE in late 2024. Its agentic assistant, Cascade, became its key differentiator. After reaching 82 million dollars in ARR, its CEO was recruited by Google through a 2.4 billion dollar licensing deal, and the company was later acquired by Cognition.

**Others** included Void Editor, an open-source privacy-focused Cursor alternative, Augment Code with enterprise emphasis, Sourcegraph Cody, Aider, and Cline.

Between 2024 and 2025, GitHub repositories for agent frameworks with more than a thousand stars grew from 14 to 89, a 535 percent increase. According to [GitHub’s 2024 Octoverse survey](https://github.blog/news-insights/octoverse/octoverse-2024/), 92 percent of developers were already using AI coding tools.

### 3.3 Vibe coding: the logical extreme of prompt engineering

In February 2025, amid this explosion, Karpathy [posted on X](https://x.com/karpathy/status/1886192184808149383):

> "I accepted every single change Cursor suggested... I barely even looked at the diff. The code grew beyond a level I can fully read."

That became the label ["vibe coding"](https://x.com/karpathy/status/1886192184808149383). You do not read the code, you paste back the errors, and if it works, you move on. It was either the ultimate form of prompt engineering or its logical endpoint. If English can produce code, why bother understanding the code?

Karpathy himself framed it as something suitable for weekend projects. The industry largely ignored that nuance. Y Combinator’s Winter 2025 batch reported that 25 percent of founders had codebases that were 95 percent AI-generated. The phenomenon became large enough for [Collins Dictionary](https://blog.collinsdictionary.com/language-lovers/collins-word-of-the-year-2025-ai-meets-authenticity-as-society-shifts/) to name it a word of the year.

And then the hangover arrived, faster than expected.

In September 2025, [Fast Company](https://www.fastcompany.com/91398622/the-vibe-coding-hangover-is-upon-us) published "The Vibe Coding Hangover." The situation was familiar. A team raised money with an MVP built quickly by AI. Real customers started using it. Bug reports accumulated. Then they opened the code to fix it, and nobody understood it. Not even the person who had "written" it, because they had never really read it. [CodeRabbit’s data](https://www.coderabbit.ai/blog/state-of-ai-vs-human-code-generation-report) gave the scale: 1.7 times more major issues in AI-generated code, and [45 percent security vulnerability rates](https://www.veracode.com/state-of-software-security-report) according to Veracode. What dazzled in demos began to collapse in production.

Simon Willison, Django co-creator and long-time AI tools commentator, [cut straight to the point](https://simonwillison.net/2025/May/1/not-vibe-coding/):

> "Even if the LLM wrote all the code, if you reviewed and tested it, that is not vibe coding."

The question was never who wrote the code. The question was **where rigor lives**.

Chad Fowler’s ["Relocating Rigor"](https://www.honeycomb.io/blog/production-is-where-the-rigor-goes) explains the situation perfectly. Rigor does not disappear. It moves. Fowler highlights three principles.

- **Rules that must hold should be enforced in code.** Writing in comments that a function only accepts positive values is not rigor. Type systems or assertions should make the machine verify it.
- **Failure should be immediate and loud.** Quietly swallowed errors return later as bigger problems. If something is wrong, break fast and visibly.
- **The engineer’s role changes.** It moves from typing code to specifying intent and validating outcomes.

Vibe coding ignored all three. The rules lived only in people’s heads, failures were allowed to pass quietly, and engineers abandoned verification. It was both the logical extreme of prompt engineering and the point where the location of rigor had been completely lost. So where should rigor move next?

## 4. The age of context engineering (mid-2025 onward)

### 4.1 Origin: one week in June 2025

Let us return to June 2025. On June 19, Shopify CEO Tobi Lütke [posted on X](https://x.com/tobi/status/1935533422589399127):

> "I like the term context engineering much more than prompt engineering. It describes the core competency better. The skill of providing all the context an LLM needs to plausibly solve a task."

One tweet changed the industry’s vocabulary.

A week later, Karpathy [responded](https://x.com/karpathy/status/1937902205765607626):

> "Context engineering is the delicate art and science of filling the context window with exactly the right information for the next step."

Then he added a crucial line: this was only a small piece of the new software "thick layer." Remember that phrase, because eight months later it returns under the name harness engineering.

This was not just a replacement of terminology. The central question itself had changed, from **"What should we say?"** to **"What information should we include?"**

### 4.2 LLM-as-OS: Karpathy’s operating system metaphor

The clearest framework for understanding this shift is Karpathy’s [LLM-as-OS metaphor](https://x.com/karpathy/status/1707437820045062561), which treats the LLM as the kernel of modern computing.

| Traditional OS component | Role | LLM OS counterpart | Note |
| --- | --- | --- | --- |
| **Kernel** | Manages system resources | LLM inference engine | Core of problem solving |
| **RAM** | Working memory | Context window | Managed in token units |
| **File system** | Persistent storage | RAG / vector database | Search and inject only what is needed |
| **System calls** | Hardware control | Tool calls / APIs | Interface to the outside world |
| **Process management** | Multitasking | Multi-agent orchestration | Collaboration and isolation among agents |

The reason this metaphor matters is that it locates prompts correctly. A prompt is only a **single command line** fed to the OS. What really determines performance is what sits in RAM, meaning the context window. You can craft the `ls` command as elegantly as you want, but if the needed files are on an unmounted disk, it does not help.

Anthropic formalized this in September 2025 in ["Effective Context Engineering for AI Agents"](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents), describing context engineering as the natural evolution of prompt engineering. It is the craft of optimizing the mix of system prompts, user inputs, conversation history, tool outputs, and retrieved knowledge that enters the context window. This was the moment rigor moved from prompts to context.

### 4.3 Core principles: where rigor arrived

Context engineering does not mean "put in more information." If that were the idea, it would have been called context stuffing. Many teams made exactly that mistake at first. Their RAG pipeline would retrieve ten documents and dump them all into the context. If tokens ran out, they increased the window size. If that still failed, they blamed the model.

[Google ADK](https://developers.googleblog.com/architecting-efficient-context-aware-multi-agent-framework-for-production/) makes the flaw in that approach explicit. Context is not a raw data dump. It is a compiled view over a richer stateful system. Dumping the whole database into RAM slows the OS. The same logic applies here.

#### Anthropic’s four strategies: Write / Select / Compress / Isolate

![Anthropic의 컨텍스트 엔지니어링 프레임워크 — Write, Select, Compress, Isolate](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Ffaa261102e46c7f090a2402a49000ffae18c5dd6-2292x1290.png&w=3840&q=75)

[Anthropic’s guide](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) classifies context curation into four strategies. Imagine building a customer support agent.

- **Write.** The system prompt is structured clearly, for example: you are a support agent, refunds are valid for 30 days, and technical issues require ticket creation. The focus is not just what to say, but how to structure it.
- **Select.** If the customer says "cancel order," you do not include the entire FAQ, only documents related to cancellation and refunds. To avoid the ["Lost-in-the-Middle"](https://arxiv.org/abs/2307.03172) problem, where information buried in long context becomes hard to retrieve, you optimize signal-to-noise ratio rather than sheer volume.
- **Compress.** After twenty turns of conversation, the first fifteen can be summarized as "Customer requested refund for product X, receipt verified, now asking about shipping fees." Anthropic argues that well-designed compression can preserve more than 80 percent of the information while sharply reducing token usage.
- **Isolate.** If the customer reports a technical problem, a diagnostic sub-agent handles it separately so that logs and low-level troubleshooting details do not flood the main context.

#### Google ADK’s context-stack architecture

[Google ADK](https://developers.googleblog.com/architecting-efficient-context-aware-multi-agent-framework-for-production/) turns these principles into an explicit architecture. Three core design ideas matter.

1. **Separate storage from representation.** In database terms, keep the original tables separate from the view rendered for the user. The agent’s full session history, user state, and prior tool results are preserved as source state. But what actually gets sent to the model each turn is a freshly composed working context containing only the relevant parts.
2. **Build a named transformation pipeline.** The view should not be stitched together ad hoc. It should go through explicit steps such as inserting system prompts, selecting relevant history, summarizing tool output, and checking token budget. Context assembly becomes a reproducible pipeline, not random string concatenation.
3. **Scope by default.** When an agent delegates work to a sub-agent, it should not pass the full conversation. A sub-agent asked to edit a file gets only that file and the local context it needs. This is least privilege applied to context.

On top of that, Google ADK divides the context window into two zones.

- **Stable Prefix**: system prompt, agent identity, tool definitions, long-term summaries, the parts that rarely change.
- **Variable Suffix**: latest user input, fresh tool outputs, the parts that change frequently.

Why does that ordering matter? Because of **KV-cache**.

#### KV-cache: the key production metric

Listen to [the Manus team](https://manus.im/blog/Context-Engineering-for-AI-Agents-Lessons-from-Building-Manus). They rebuilt their agent framework four times. First they focused on prompt optimization. Then they changed the agent architecture. Then they redesigned the tool system. Only in the fourth version did they realize that the real bottleneck was not prompts, not architecture, not tools, but **context management**.

What they called the single most important production metric for agents was **KV-cache hit rate**.

Here is how KV-cache works. When you send a prompt to an LLM API, the model computes attention keys and values for each token. That computation is expensive. But if the **prefix** of the current prompt is identical to the prefix from the previous request, the model can reuse cached results instead of recomputing them. For Claude Sonnet, a cache hit can reduce cost by roughly an order of magnitude. Over thirty turns of interaction, the difference between recomputing the whole system prompt every time and caching it is enormous.

![KV-cache 작동 원리 — 안정 접두어가 비용을 결정한다](/assets/images/kv-cache-mechanism.png)

The crucial point is this: change even **one token** in the context prefix and the rest of the cache becomes invalid. That is why Google ADK insists on placing the stable prefix first. In production, the **stability** of the prompt matters more than the quality of the phrasing. It is ironic. After two years of obsessing over better prompts, what matters most in production is often **not touching the prompt at all**.

The Manus team went further and proposed five practical rules.

1. **Optimize KV-cache and preserve prefix stability above all else.** Keep system prompts and tool definitions as fixed as possible.
2. **Do not change the tool list in the middle of execution.** Dynamically adding or removing tools breaks caching because tool definitions are part of the prefix. Better to enable or disable tools by state.
3. **Use controlled diversity.** If the agent responds in exactly the same way every time, it can fall into loops. Small changes in format or wording can push it into new attempts, as long as they do not disturb prefix stability.
4. **Prefer production-first iteration.** Context engineering is faster to deploy than fine-tuning. Improvements can go live in hours.
5. **Keep the harness valid even if the model changes.** A good context management system should not be tightly bound to one specific model.

[HumanLayer’s 12-Factor Agents](https://github.com/humanlayer/12-factor-agents) expresses similar ideas. Inspired by Heroku’s [12-Factor Apps](https://12factor.net/), it emphasizes three context-related principles.

- **Acknowledge that the context window is limited.** Their rule of thumb is that once you fill more than about 40 percent of it, you enter the dumb zone, where instruction-following degrades.
- **Prefer structured output to natural language.** Agents should exchange JSON and other parseable forms whenever possible.
- **Design human-in-the-loop into the system from the beginning.** Do not postpone approval mechanisms until later.

### 4.4 Agentic infrastructure

#### MCP: becoming the standard for tool connection

Start with the foundational infrastructure of context engineering: **[MCP, the Model Context Protocol](https://modelcontextprotocol.io/)**. Announced by Anthropic in November 2024, this open protocol standardizes how LLMs connect to external tools and data sources.

![MCP(Model Context Protocol) 아키텍처](https://mintcdn.com/mcp/bEUxYpZqie0DsluH/images/mcp-simple-diagram.png?w=1100&fit=max&auto=format&n=bEUxYpZqie0DsluH&q=85&s=341b88d6308188ab06bf05748c80a494)

Before MCP, each tool required its own custom integration. Slack APIs, GitHub APIs, databases, file systems, each one needed different glue code. It was like the era before USB, when printers, keyboards, and mice each needed their own connector. MCP plays the role of USB. Once a tool exposes an MCP server, any AI client that supports MCP, Claude, ChatGPT, Cursor, VS Code, can connect in the same way.

Its adoption was remarkably fast. OpenAI added MCP support to its Agents SDK and ChatGPT in March 2025. Google DeepMind announced Gemini support the next month. In December, Anthropic donated MCP to the Linux Foundation under the [Agentic AI Foundation](https://www.anthropic.com/news/donating-the-model-context-protocol-and-establishing-of-the-agentic-ai-foundation), with Anthropic, OpenAI, Google, and Microsoft participating in governance. Within a year it had become an industry standard, with more than 97 million monthly SDK downloads and more than ten thousand community servers.

MCP matters to context engineering because tool output is one of the main ingredients of the context window. Once tool connections are standardized, the form of their outputs becomes more predictable, and context assembly becomes more stable. Google’s [A2A protocol](https://developers.googleblog.com/en/a2a-a-new-era-of-agent-interoperability/), announced in April 2025, aims to standardize communication **between** agents as well. If MCP is the vertical axis of agent-to-tool communication, A2A is the horizontal axis of agent-to-agent interoperability.

#### Decomposition and collaboration: skills, sub-agents, and swarms

As agents became more complex, a new pattern emerged: rather than building one gigantic general-purpose agent, break the system into **small, specialized units** that can be combined.

**Skills** are reusable units of capability. If a tool is something like "call the search API," a skill packages a whole mini-workflow such as "search the relevant documents, summarize them, and present them to the user." If a tool is like a function, a skill is like a small module composed of multiple functions. The important design feature here is **lazy loading**. Agents may have dozens of skills, but loading all detailed skill definitions into context up front is wasteful. So only the list of skills, names plus one-line descriptions, stays in the stable prefix, while full skill definitions are loaded into the variable suffix only when the agent decides it needs them.

**Sub-agents** are specialized agents that the main agent delegates work to. They are also an implementation of the isolation principle. If a coding agent receives a debugging request, it can hand the relevant file and error log to a debugging specialist sub-agent while keeping the main context clean.

**Swarm** is the orchestration pattern proposed in OpenAI’s [experimental framework](https://github.com/openai/swarm) released in October 2024. Its core ideas are **routines** and **handoffs**. Instead of a central orchestrator, agents pass work to one another autonomously. A general support agent starts the conversation, hands off to a refund specialist if the topic changes to refunds, then to a technical support specialist if a technical issue appears. That pattern later evolved into production-usable form through the OpenAI Agents SDK.

#### Context Hub: treating the agent’s amnesia

Suppose you ask a coding agent to implement payments with the Stripe API. The agent will use the version of the Stripe API it learned during training. The problem is that the API may have changed six months ago. Endpoints may have moved, or required parameters may have been added. The generated code may compile, but return 404 at runtime. Karpathy compared this to anterograde amnesia. The LLM cannot accumulate post-training knowledge and must operate each session from its frozen training snapshot.

Andrew Ng’s [Context Hub](https://github.com/andrewyng/context-hub) tackles this directly. Before generating code, the agent runs commands such as `chub get stripe --lang python` to fetch the **latest API documentation in real time** and inject it into context. The design rests on three principles.

- **Curated documentation.** It does not dump raw search results into the model. People validate the documents for each API to reduce noise.
- **Stack specificity.** Flags such as `--lang py` or `--lang js` ensure the agent only loads the language-specific material it actually needs.
- **Persistent annotations.** Notes attached by the agent survive across sessions, allowing operational lessons to accumulate.

This is a practical evolution of retrieval-augmented generation. Traditional RAG says, search and retrieve relevant documents. Context Hub says, manage verified, current documentation systematically and inject it in a controlled way.

#### Memory: beyond a single session

The context window is only working memory. If an agent must preserve knowledge across sessions, a separate memory system becomes necessary. That is the deeper issue behind what people describe as agent drift.

The solution is external memory. It can be file-based memory such as CLAUDE.md and project notes, vector databases for semantic similarity lookup, or structured JSON state passed between sessions. Both Claude and ChatGPT have introduced memory features across conversations. Anthropic’s own practical strategy was **context compaction**, progressively summarizing older conversation content and reinjecting it into later context. In practice, this becomes a tiered compression pipeline, ranging from simply dropping old messages to compressing tool outputs selectively, to generating whole-session summaries depending on cost and fidelity tradeoffs.

### 4.5 Even that was not enough: the wall of context

Context engineering was real progress. There is no question about that. But teams operating agents in production still ran into a wall.

**First, the limit of the single turn.** Most context-engineering techniques focus on what goes into the next API call. But agents are not single-turn systems. They make dozens of linked decisions, execute tools, and interpret results over time. What happens if the output from turn 3 is needed at turn 15, but it was compressed away? Even a perfectly composed context fails if the execution loop consuming it is poorly designed. That is no longer just a context problem. It is a **system** problem.

**Second, the absence of recovery.** What happens when a tool call fails? When the model hallucinates? When cost explodes? However carefully context is composed, execution-time failures still require explicit mechanisms: cost-aware fallback strategies, loop detection, diminishing-returns detection, circuit breakers. These sit outside the scope of context engineering.

**Third, security.** If an agent can process external input, access sensitive internal data, and also take external action, then a single prompt injection attack can expose company data or trigger destructive behavior. Simon Willison called this ["The Lethal Trifecta"](https://simonwillison.net/2025/Jun/2/the-lethal-trifecta/), which the article returns to in detail later. Context engineering deals with what information enters the system. It does not, by itself, solve what the system must be **prevented** from doing.

That is the cause of death for the context era. You can build perfect context and still fail if the system consuming it is weak. Context was necessary, but not sufficient. Rigor had to move again.

## 5. The age of harness engineering (2026 onward)

### 5.1 Origin: simultaneous discovery in February 2026

In February 2026, Mitchell Hashimoto published ["My AI Adoption Journey"](https://mitchellh.com/writing/my-ai-adoption-journey), a record of how he moved from skepticism to practical productivity with AI. The key conclusion he reached was this:

> **Every time an agent makes a mistake, change the system so that the same mistake cannot recur structurally.**

The answer is not to keep editing the prompt. It is to change the surrounding system, its rules, tools, constraints, and feedback loops. That was the birth of the term **harness engineering**.

What is remarkable is what happened next. Within roughly two weeks, [OpenAI](https://openai.com/index/harness-engineering/), [Martin Fowler and Birgitta Böckeler](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html), and [Ethan Mollick](https://www.oneusefulthing.org/p/a-guide-to-which-ai-to-use-in-the) all arrived at closely related conclusions independently. This was not coordinated. It was multiple discovery, driven by multiple groups running into the same production wall at once.

Fowler and Böckeler expressed the core formula succinctly:

> **Agent = model + harness**

The harness is everything in the agent except the model. [Philipp Schmid](https://www.philschmid.de/agent-harness-2026) extended the point with the operating-system analogy: the model is the CPU, the harness is the operating system that manages context curation, tool control, permissions, and failure recovery. Mollick used a horse metaphor: the harness is what lets the horse’s strength be attached to a cart or a plow. No matter how strong the horse is, it cannot do the work without the surrounding equipment.

Simon Willison’s definition of an agent also belongs here: an agent is an LLM that executes tools in a loop to accomplish a goal. The key word is **loop**. And the harness is what governs the loop.

### 5.2 The anatomy of the harness: four quadrants

The word "harness" sounds grand, but in practice it means the collection of mechanisms that catch and correct agent failure. Fowler and Böckeler describe it using a clean [2×2 framework](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html).

|  | **Feedforward (guide before the fact)** | **Feedback (correct after the fact)** |
| --- | --- | --- |
| **Deterministic** | **Guides**: AGENTS.md, `.cursorrules`, coding conventions | **Computational checks**: compiler, type checker, linter |
| **Non-deterministic** | **System prompts and instructions**: role definitions, behavioral constraints, few-shot examples | **Inferential review**: LLM-as-a-judge, semantic code review |

Each quadrant blocks a different failure mode.

**Top left: guides, deterministic feedforward.** These steer the agent away from bad paths before the mistake happens. If `AGENTS.md` says to use Vanilla JS rather than React, the agent can consult that when writing code. Cursor’s `.cursorrules` sits here as well, defining project-specific patterns such as using Tailwind CSS or requiring explicit types. Cheap, but not fully enforceable. The agent may still ignore them.

**Top right: computational checks, deterministic feedback.** Even if the guide is ignored, the machine catches the violation. Compiler errors, lint warnings, type checking, static analysis. OpenAI’s Codex team especially emphasized this layer, replacing human reviewers with custom lint rules and structural tests that enforce architecture.

**Bottom left: system prompts, non-deterministic feedforward.** These handle constraints too subtle to encode as deterministic rules: be polite, ask for confirmation when uncertain, request approval for sensitive actions.

**Bottom right: inferential feedback, non-deterministic feedback.** This layer catches cases where code compiles but is semantically wrong. Another LLM reviews the code or evaluates the generated artifact. Anthropic’s Evaluator agent sits squarely in this quadrant.

A production harness combines all four layers into defense in depth. As the article puts it through the lens of 12-Factor Agents, most successful production AI agents are not magical autonomous beings. They are carefully designed traditional software systems with LLM capability inserted at critical points.

### 5.3 In practice: three case studies

Theory is one thing. How does harness engineering work in practice?

**Anthropic’s three-agent architecture.** Anthropic’s team repeatedly hit the same problem in long-running application agents. Ask the agent to build a web app, come back in thirty minutes, and you get something. It runs. But the buttons overlap, the API returns the wrong data, and the agent still reports success. Why? In March 2026, Anthropic’s ["Harness Design for Long-Running Application Development"](https://www.anthropic.com/engineering/harness-design-long-running-apps) revealed a surprisingly simple conclusion: **agents cannot reliably evaluate their own work.** It is like students grading their own exam.

So Anthropic split the system into three agents, inspired loosely by GAN-like separation between generation and evaluation.

![Anthropic의 3-에이전트 하네스 아키텍처 — Planner, Generator, Evaluator의 GAN 스타일 피드백 루프](https://cdn.sanity.io/images/4zrzovbb/website/3bde53c9578d74f6e05c3e515e20b910c5a8c20a-4584x4584.png)

- **Planner** expands a simple prompt into a detailed product spec, focusing on ambition and high-level design rather than over-prescribing technical details.
- **Generator** implements one feature at a time in a React, Vite, FastAPI, and SQLite stack, evaluating each sprint and handing it over for QA.
- **Evaluator** runs Playwright end-to-end tests, scoring UI behavior, API responses, database state, design quality, and code quality. If the score is too low, it sends specific feedback back to the Generator.

The cost is large. A single run might cost nine dollars and take twenty minutes. The full harness may take six hours and cost two hundred dollars. But quality jumps so sharply that this is better understood as a relocation of cost, from humans fixing problems afterward to the system validating work before release.

**OpenAI’s Codex experiment.** This case deserves extra attention. OpenAI’s ["Harness Engineering"](https://openai.com/index/harness-engineering/) describes a five-month experiment. A team of engineers grew from three to seven people. They wrote zero lines of code manually. About one million lines of code were generated. Roughly 1,500 pull requests were produced. Throughput rose by about ten times versus a manual baseline.

Zero lines of manual code? Yes. And that is the point. The humans in the room were not typing code. **They were designing the environment in which code could be generated reliably.** Their work fell into three parts.

1. **Systematizing repository knowledge.** The first thing they discovered was that agents repeated the same mistakes. Why? Because key architectural decisions and design principles existed only in Slack messages or in senior developers’ heads. The solution was to write everything down inside the repository, in markdown and code. Knowledge invisible to the agent might as well not exist.
2. **Mechanical enforcement.** Documentation alone was not enough. Telling the agent to follow a pattern did not guarantee compliance. So the team encoded architectural rules into custom linters and structural tests, making the agent iteratively repair its own code until it passed.
3. **Progressive disclosure.** Early attempts shoved giant documents into the context all at once. The result was that the agent got lost. The fix was to give the agent a map rather than a 1,000-page manual, so it could navigate toward the relevant detail itself.

Put into one sentence, this is the same philosophy Hashimoto articulated: every recurring failure should be fixed structurally, not just patched in the prompt.

**Ralph and PRD-driven autonomous execution.** The third case comes less from a corporation than from the community. If Anthropic and OpenAI show how to design harnesses, the broader Ralph-style pattern shows how agents can run more autonomously on top of such harnesses. Geoffrey Huntley popularized the idea of writing a PRD, a product requirements document, then repeatedly running an AI coding tool such as Claude Code or Amp until every PRD item is complete.

Agent state is often stored in explicit external files such as `progress.txt` or `prd.json`. The memory of the agent is not the context window. It is the external state artifact.

The more that verification is programmable, compilation, testing, linting, the more autonomously this pattern can run. In Fowler’s framework, that makes computational feedback the central quadrant. Within two months, this style of harnessed autonomy gathered over twelve thousand GitHub stars and became one of the clearest demonstrations of the promise that agents can continue coding while the human sleeps.

### 5.4 Security: the Lethal Trifecta and the two-person rule

In harness engineering, security is not optional. Willison’s ["Lethal Trifecta"](https://simonwillison.net/2025/Jun/2/the-lethal-trifecta/) is the key framework.

If an agent can do the following three things at once, a security incident becomes inevitable.

- **Read external input**, such as the public web, incoming email, or user messages.
- **Access sensitive data**, such as internal APIs, private databases, or personal data.
- **Take external action**, such as sending mail, deleting files, or calling state-changing APIs.

Together with [Google’s A2A and security-oriented interoperability framing](https://developers.googleblog.com/en/a2a-a-new-era-of-agent-interoperability/), the operational rule becomes simple: never let one agent freely combine all three. If all three are needed, require human approval in the loop.

Concrete examples follow naturally.

- External read + sensitive access + state change: **forbidden unless a human approves**.
- External read + state change: sensitive access must be blocked or heavily sandboxed.
- Sensitive access + state change: external input should be excluded so that only trusted internal data is involved.

![Lethal Trifecta — 세 가지가 동시에 존재하면 보안 사고는 필연이다](https://www.promptfoo.dev/img/blog/lethal-trifecta/lethal-trifecta-venn.png)

These guardrails are not optional feature restrictions. They are core trust infrastructure. Agents without such harnesses may sparkle in demos, but in production they behave like time bombs.

## 6. Postmortem across the three eras

### 6.1 Comparative view

| Dimension | Prompt Engineering | Context Engineering | Harness Engineering |
| --- | --- | --- | --- |
| Core period | 2022-2024 | 2025 | 2026 onward |
| Central question | "What should we say?" | "What information should we include?" | "What system should we build?" |
| Everyday metaphor | Writing the email | Managing the inbox | Designing the email system |
| OS metaphor | Single command line | RAM management | Entire operating system |
| Representative metric | Output quality, often subjective | KV-cache hit rate | Task completion rate, cost per task |
| Typical failure | Blind prompting, non-determinism | Context pollution, lost in the middle | Orchestration bugs, security incidents |
| Where rigor lives | Prompt text | Context-window composition | Whole system architecture |
| Representative tools | ChatGPT, early Copilot | Cursor Composer, RAG pipelines | Claude Code, Copilot Coding Agent |
| Main skill demanded | Language sensitivity + domain knowledge | Information architecture | System design + security |

### 6.2 Lesson: the path of rigor’s movement

Read that table vertically and you get a mini history of AI engineering. Read it horizontally and you see the failure mode of each era. But the most important pattern lies diagonally.

Harness engineering contains context engineering, and context engineering contains prompt engineering. Good harnesses still require good context, and good context still requires good prompts. So when someone says prompt engineering is dead, the article argues that they are wrong. Prompt engineering did not die. It got promoted into a larger system.

Fowler and Böckeler make a second important point. Harnesses must not become over-engineered in ways that work against model progress. As models improve, some of the smart logic built into today’s harnesses may become unnecessary. Half the recovery logic designed for Claude 4.5 might become obsolete with Claude 5.0. The craft of harness design is therefore not only deciding **what to build**, but deciding **what not to harden prematurely**.

### 6.3 Outlook: the next stop for rigor

If the pattern of the last four years continues, and the article argues there is every reason to think it will, then rigor will move again. Several directions are already visible.

**First, independent evaluator layers.** Imagine an agent trying to deploy code while a second agent blocks it in real time because the change violates regulatory constraints. Anthropic’s Evaluator is a primitive form of this. It is easy to imagine evaluation splitting off into its own infrastructure layer, moving rigor from execution toward monitoring.

**Second, behavior over benchmarks.** A new phrase has started to appear: behavior beats benchmarks. What matters is no longer just a high MMLU score, but how reliably an agent completes real work, and how gracefully it recovers from failure. The especially hard part is **evaluating qualitative judgment**. A machine can tell whether code compiles. But can it tell whether a piece of writing reads well or whether a design feels elegant? LLM-as-a-judge is emerging as one answer, but the bias of the evaluator itself remains an open problem. Even the question of evaluation is becoming its own engineering field.

**Third, richer knowledge engines.** Present-day context engineering focuses on what enters the next turn. But real software projects depend on information that is not in the code itself. Why was this architecture chosen? Why was this approach tried six months ago and then abandoned? What was the original design intent of this module? Code alone does not preserve that context.

Knowledge engines aim to solve this by going beyond vector search toward systems that integrate **structural relations, historical evolution, and accumulated operational lessons**. If Context Hub solves the axis of current external documentation, these future systems aim to solve the axis of project history and intent.

**Fourth, the crystallization of agent engineering as a real field.** Simon Willison is already systematizing many of these patterns under the broader label of ["agent engineering"](https://simonwillison.net/tags/agents/). The same thing happened with prompt engineering in 2023. By 2027, harness engineering may feel equally obvious, until another name arrives and the cycle continues.

In 2023, Karpathy said the hottest new programming language was English. Three years later, the hottest new engineering challenge is no longer English itself. It is the structure of the context window, the state machine of the agent loop, and the layering of security guardrails. English still matters. But it is no longer the whole system. It is just one part of it.

Chad Fowler’s line stands as the article’s closing thought. Rigor does not disappear. It moves closer to feedback and closer to reality. From the person writing the code, to the person curating the context, to the person designing the environment in which the agent works. The role did not vanish. The abstraction level changed.

The question is no longer whether rigor moves. That much is already established. The question is whether we can notice the movement quickly enough this time.

## References

- Mitchell Hashimoto, ["My AI Adoption Journey"](https://mitchellh.com/writing/my-ai-adoption-journey), 2026.02
- Andrej Karpathy, ["Software 3.0"](https://www.latent.space/p/s3), 2025.06
- Andrej Karpathy, ["Context engineering"](https://x.com/karpathy/status/1937902205765607626), 2025.06.25
- Andrew Ng, ["How Agents Can Improve LLM Performance"](https://www.deeplearning.ai/the-batch/how-agents-can-improve-llm-performance/), 2024.03
- Simon Willison, ["The lethal trifecta"](https://simonwillison.net/2025/Jun/2/the-lethal-trifecta/), 2025.06
- Simon Willison, ["Not vibe coding"](https://simonwillison.net/2025/May/1/not-vibe-coding/), 2025.05
- Martin Fowler, Birgitta Böckeler, ["Harness Engineering"](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html), 2026.02
- Philipp Schmid, ["What is Harness Engineering?"](https://www.philschmid.de/agent-harness-2026), 2026.01
- Ethan Mollick, ["A guide to which AI to use in the enterprise"](https://www.oneusefulthing.org/p/a-guide-to-which-ai-to-use-in-the), 2026.02
- Tobi Lütke, [X post on context engineering](https://x.com/tobi/status/1935533422589399127), 2025.06.19
- Chad Fowler, ["Relocating Rigor"](https://www.honeycomb.io/blog/production-is-where-the-rigor-goes), 2026.01
- Anthropic, ["Building Effective Agents"](https://www.anthropic.com/research/building-effective-agents), 2024.12
- Anthropic, ["Effective Context Engineering for AI Agents"](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents), 2025.09
- Anthropic, ["Harness Design for Long-Running Application Development"](https://www.anthropic.com/engineering/harness-design-long-running-apps), 2026.03
- OpenAI, ["Harness Engineering"](https://openai.com/index/harness-engineering/), 2026.02
- Google, ["Architecting Efficient Context-Aware Multi-Agent Framework for Production"](https://developers.googleblog.com/architecting-efficient-context-aware-multi-agent-framework-for-production/), 2025.12
- Manus, ["Context Engineering for AI Agents: Lessons from Building Manus"](https://manus.im/blog/Context-Engineering-for-AI-Agents-Lessons-from-Building-Manus), 2025
- HumanLayer, [12-Factor Agents](https://github.com/humanlayer/12-factor-agents), 2025
- Andrew Ng, [Context Hub](https://github.com/andrewyng/context-hub), 2026.03
- Wei et al., ["Chain-of-Thought Prompting Elicits Reasoning in Large Language Models"](https://arxiv.org/abs/2201.11903), 2022
- Yao et al., ["ReAct: Synergizing Reasoning and Acting in Language Models"](https://arxiv.org/abs/2210.03629), 2022
- Yao et al., ["Tree of Thoughts: Deliberate Problem Solving with Large Language Models"](https://arxiv.org/abs/2305.10601), 2023
- Madaan et al., ["Self-Refine: Iterative Refinement with Self-Feedback"](https://arxiv.org/abs/2303.17651), 2023
- Shinn et al., ["Reflexion: Language Agents with Verbal Reinforcement Learning"](https://arxiv.org/abs/2303.11366), 2023
- Epsilla, ["Harness Engineering: Evolution from Prompt to Context to Autonomous Agents"](https://www.epsilla.com/blogs/harness-engineering-evolution-prompt-context-autonomous-agents), 2026
- CodeRabbit, ["State of AI vs Human Code Generation Report"](https://www.coderabbit.ai/blog/state-of-ai-vs-human-code-generation-report), 2025
- Fast Company, ["The Vibe Coding Hangover Is Upon Us"](https://www.fastcompany.com/91398622/the-vibe-coding-hangover-is-upon-us), 2025.09
- Collins Dictionary, ["Word of the Year 2025"](https://blog.collinsdictionary.com/language-lovers/collins-word-of-the-year-2025-ai-meets-authenticity-as-society-shifts/), 2025
- Veracode, ["State of Software Security Report"](https://www.veracode.com/state-of-software-security-report), 2025
- GitHub, ["Octoverse 2024"](https://github.blog/news-insights/octoverse/octoverse-2024/), 2024
- Anthropic, [MCP announcement](https://modelcontextprotocol.io/), 2024.11
- Google, ["A2A: A New Era of Agent Interoperability"](https://developers.googleblog.com/en/a2a-a-new-era-of-agent-interoperability/), 2025.04
- OpenAI, [Swarm](https://github.com/openai/swarm), 2024.10

## Notes on preservation

- The source article is written in Korean, and this file is the English translation aligned to the preserved original.
- This translation was revised after the preserved original was corrected, so that section flow and emphasis match the source much more closely.
