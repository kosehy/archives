# 프롬프트에서 하네스까지 — AI 에이전틱 패턴 4년의 기록

Source: https://bits-bytes-nn.github.io/insights/agentic-ai/2026/04/05/evolution-of-ai-agentic-patterns.html
Archived: 2026-04-06
Language: Korean
Type: Long-form essay / agentic AI / software engineering

## Core framing

This article presents the last four years of AI development as a sequence of three engineering centers of gravity: prompt engineering, context engineering, and harness engineering.

Its main thesis is not that rigor disappeared as AI systems became more agentic. Instead, rigor moved upward: first from code and prompts into context design, and then from context design into the larger execution system around the model.

## Era 1: Prompt engineering

The article treats the 2022–2024 period as the age of prompt engineering.

In that era, the dominant belief was that success depended mainly on how well humans instructed the model. GitHub Copilot, ChatGPT, chain-of-thought prompting, ReAct, Tree-of-Thought, Self-Refine, Reflexion, and Andrew Ng’s design patterns are all presented as part of this period.

The article does not deny the importance of these techniques. Instead, it argues that prompt engineering eventually ran into structural limits:

- prompts could not compensate for missing context
- model outputs remained non-deterministic
- production systems needed stronger validation than wording alone could provide
- teams often practiced “blind prompting,” tweaking text without rigorous measurement

The article uses the failures of vibe coding as a vivid example of what happens when prompt-driven acceleration outruns verification and system discipline.

## Era 2: Context engineering

The second phase, starting around 2025, is framed as the shift from asking “what should we say?” to asking “what information should the model see?”

The article highlights several ideas here:

- the LLM-as-OS metaphor, where the context window becomes working memory
- Anthropic’s strategies of write, select, compress, and isolate
- Google ADK’s separation of stable prefix and variable suffix
- KV-cache hit rate as a practical production metric
- tool standards such as MCP and broader agent infrastructure patterns

The article argues that context engineering was a genuine step forward because it recognized that model quality depends heavily on the information architecture around the model, not just clever instructions.

But it also says context engineering hit its own wall. Long-running agents still need error recovery, security boundaries, evaluation, cost control, and execution loops. Perfectly curated context alone is not enough.

## Era 3: Harness engineering

The article presents 2026 as the beginning of harness engineering.

Harness engineering is defined as the design of the full surrounding system that constrains, guides, tests, and evaluates an agent. In this framing, the model is only one component; the harness includes the rules, tools, evaluators, execution environment, feedback loops, and failure handling mechanisms.

The article points to several supporting examples:

- Mitchell Hashimoto’s idea that recurring agent mistakes should be fixed structurally, not just by rewriting prompts
- OpenAI’s formulation that an agent is effectively model plus harness
- Martin Fowler and Birgitta Böckeler’s four-quadrant framework of guides, computational checks, prompts, and inferential feedback
- Anthropic’s multi-agent planner / generator / evaluator pattern for long-running application development

This section is where the article’s main claim becomes clearest: the real engineering work has migrated from writing prompts to designing the machinery around the model.

## Why the argument matters

The article is not just describing new terms. It is trying to explain why each previous wave disappointed people.

- Prompt engineering overpromised control through wording.
- Context engineering improved reliability but still focused too narrowly on a single model call.
- Harness engineering emerges because agent systems operate over time, across tools, inside security and cost constraints.

In other words, the article sees the future of AI systems not as better talking to models, but as better systems architecture for model-mediated work.

## Tone and structure

The piece is written as a historical essay and diagnosis rather than a neutral survey.

It mixes:
- chronology
- commentary
- industry anecdotes
- references to papers and blog posts
- practical system design observations

That style makes it energetic and persuasive, though sometimes more interpretive than strictly academic.

## Final takeaway

The article’s core conclusion is simple: the engineering challenge in AI has not become easier or fuzzier. It has become more architectural.

The question is no longer just how to prompt a model well, or even how to provide the right context. It is how to build a reliable surrounding system that makes model behavior useful, testable, affordable, and safe.

## Notes on preservation

- The source article is written in Korean; this archive preserves it as `original.ko.md` and provides `translation.en.md`.
- This preserved original is a structured retention of the article’s argument rather than a byte-for-byte HTML dump.
