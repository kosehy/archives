# From prompts to harnesses — a four-year record of AI agentic patterns

- Original: https://bits-bytes-nn.github.io/insights/agentic-ai/2026/04/05/evolution-of-ai-agentic-patterns.html
- Archived: 2026-04-06
- Language: English
- Document type: Long-form essay / agentic AI / software engineering

## Core argument

This article argues that over the last four years, the center of gravity in AI engineering has shifted three times: from prompt engineering, to context engineering, and then to harness engineering.

Its main point is that engineering rigor did not disappear as AI systems became more agentic. It simply moved. First it moved from prompt wording toward context design, and then from context design toward the larger execution system surrounding the model.

## 1. The age of prompt engineering

The article treats 2022–2024 as the age of prompt engineering.

During this period, the dominant belief was that success depended mainly on how well humans instructed the model. GitHub Copilot, ChatGPT, chain-of-thought prompting, ReAct, Tree-of-Thought, Self-Refine, Reflexion, and Andrew Ng’s design patterns are all framed as part of this era.

The article does not dismiss those techniques. Instead, it argues that prompt engineering eventually hit structural limits:

- prompts could not compensate for missing context
- outputs remained non-deterministic
- production systems required stronger validation than prompt wording could provide
- many teams practiced what Mitchell Hashimoto called “blind prompting,” adjusting text without rigorous measurement

The piece uses the failures of vibe coding as a vivid example of what happens when prompt-driven speed outruns verification and system discipline.

## 2. The age of context engineering

The next phase, beginning around 2025, is presented as the shift from asking “what should we say?” to asking “what information should the model see?”

The article highlights several core ideas:

- the LLM-as-OS metaphor, where the context window acts like working memory
- Anthropic’s write / select / compress / isolate strategies
- Google ADK’s stable prefix and variable suffix structure
- KV-cache hit rate as a practical production metric
- MCP and related infrastructure for tools, skills, sub-agents, and memory

The article argues that context engineering was a real advance because it recognized that model behavior depends heavily on information architecture, not just clever instruction writing.

But it also says context engineering hit its own wall. Long-running agents still require error recovery, security boundaries, evaluation, cost control, and execution loops. Curating context more carefully is necessary, but not sufficient.

## 3. The age of harness engineering

The article presents 2026 as the beginning of harness engineering.

Harness engineering is defined as the design of the full surrounding system that guides, constrains, tests, and evaluates an agent. In this view, the model is only one component. The harness includes rules, tools, evaluators, execution environments, feedback loops, and failure-handling mechanisms.

The article supports this view with several examples:

- Mitchell Hashimoto’s idea that recurring agent mistakes should be fixed structurally, not just by rewriting prompts
- OpenAI’s formulation that an agent is effectively model plus harness
- Martin Fowler and Birgitta Böckeler’s four-quadrant framework of guides, computational checks, prompts, and inferential feedback
- Anthropic’s planner / generator / evaluator architecture for long-running application development

This is where the article’s main thesis becomes clearest: the real engineering challenge has moved from prompt writing to system design around the model.

## Why this matters

The article is not just introducing new vocabulary. It is trying to explain why each previous wave disappointed practitioners.

- Prompt engineering overpromised control through wording.
- Context engineering improved reliability but still focused too much on a single model invocation.
- Harness engineering emerges because real agents operate across time, tools, costs, permissions, and failure states.

In other words, the future of AI systems is not mainly about getting better at talking to models. It is about building better systems for model-mediated work.

## Style and character

This is not a neutral survey. It reads more like a historical diagnosis.

The piece blends:
- timeline narrative
- interpretation
- industry anecdotes
- references to papers and blog essays
- practical engineering observations

That makes it lively and persuasive, though at times more interpretive than academically detached.

## Final takeaway

The article’s core conclusion is that AI engineering has not become simpler or less rigorous. It has become more architectural.

The central question is no longer just how to prompt a model well, or even how to provide good context. It is how to build a reliable surrounding system that makes model behavior useful, testable, efficient, and safe.
