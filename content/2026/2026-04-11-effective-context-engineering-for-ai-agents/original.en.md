# Effective context engineering for AI agents

Source: https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents
Saved: 2026-04-11

After a few years of prompt engineering being the focus of attention in applied AI, a new term has come to prominence: context engineering. Building with language models is becoming less about finding the right words and phrases for your prompts, and more about answering the broader question of “what configuration of context is most likely to generate our model’s desired behavior?”

Context refers to the set of tokens included when sampling from a large-language model (LLM). The engineering problem at hand is optimizing the utility of those tokens against the inherent constraints of LLMs in order to consistently achieve a desired outcome. Effectively wrangling LLMs often requires thinking in context, in other words: considering the holistic state available to the LLM at any given time and what potential behaviors that state might yield.

In this post, we’ll explore the emerging art of context engineering and offer a refined mental model for building steerable, effective agents.

At Anthropic, we view context engineering as the natural progression of prompt engineering. Prompt engineering refers to methods for writing and organizing LLM instructions for optimal outcomes. Context engineering refers to the set of strategies for curating and maintaining the optimal set of tokens, information, during LLM inference, including all the other information that may land there outside of the prompts.

In the early days of engineering with LLMs, prompting was the biggest component of AI engineering work, as the majority of use cases outside of everyday chat interactions required prompts optimized for one-shot classification or text generation tasks. As the term implies, the primary focus of prompt engineering is how to write effective prompts, particularly system prompts. However, as we move towards engineering more capable agents that operate over multiple turns of inference and longer time horizons, we need strategies for managing the entire context state: system instructions, tools, Model Context Protocol (MCP), external data, message history, and more.

An agent running in a loop generates more and more data that could be relevant for the next turn of inference, and this information must be cyclically refined. Context engineering is the art and science of curating what will go into the limited context window from that constantly evolving universe of possible information.

In contrast to the discrete task of writing a prompt, context engineering is iterative and the curation phase happens each time we decide what to pass to the model.

## Why context engineering is important to building capable agents

Despite their speed and ability to manage larger and larger volumes of data, we’ve observed that LLMs, like humans, lose focus or experience confusion at a certain point. Studies on needle-in-a-haystack style benchmarking have uncovered the concept of context rot: as the number of tokens in the context window increases, the model’s ability to accurately recall information from that context decreases.

While some models exhibit more gentle degradation than others, this characteristic emerges across all models. Context, therefore, must be treated as a finite resource with diminishing marginal returns. Like humans, who have limited working memory capacity, LLMs have an attention budget that they draw on when parsing large volumes of context. Every new token introduced depletes this budget by some amount, increasing the need to carefully curate the tokens available to the LLM.

This attention scarcity stems from architectural constraints of LLMs. LLMs are based on the transformer architecture, which enables every token to attend to every other token across the entire context. This results in n² pairwise relationships for n tokens.

As its context length increases, a model's ability to capture these pairwise relationships gets stretched thin, creating a natural tension between context size and attention focus. Additionally, models develop their attention patterns from training data distributions where shorter sequences are typically more common than longer ones. This means models have less experience with, and fewer specialized parameters for, context-wide dependencies.

Techniques like position encoding interpolation allow models to handle longer sequences by adapting them to the originally trained smaller context, though with some degradation in token position understanding. These factors create a performance gradient rather than a hard cliff: models remain highly capable at longer contexts but may show reduced precision for information retrieval and long-range reasoning compared to their performance on shorter contexts.

These realities mean that thoughtful context engineering is essential for building capable agents.

## The anatomy of effective context

Given that LLMs are constrained by a finite attention budget, good context engineering means finding the smallest possible set of high-signal tokens that maximize the likelihood of some desired outcome. Implementing this practice is much easier said than done, but in the following section, we outline what this guiding principle means in practice across the different components of context.

System prompts should be extremely clear and use simple, direct language that presents ideas at the right altitude for the agent. The right altitude is the Goldilocks zone between two common failure modes. At one extreme, we see engineers hardcoding complex, brittle logic in their prompts to elicit exact agentic behavior. This approach creates fragility and increases maintenance complexity over time. At the other extreme, engineers sometimes provide vague, high-level guidance that fails to give the LLM concrete signals for desired outputs or falsely assumes shared context. The optimal altitude strikes a balance: specific enough to guide behavior effectively, yet flexible enough to provide the model with strong heuristics to guide behavior.

We recommend organizing prompts into distinct sections and using techniques like XML tagging or Markdown headers to delineate these sections, although the exact formatting of prompts is likely becoming less important as models become more capable.

Regardless of how you decide to structure your system prompt, you should be striving for the minimal set of information that fully outlines your expected behavior. Minimal does not necessarily mean short; you still need to give the agent sufficient information up front to ensure it adheres to the desired behavior. It’s best to start by testing a minimal prompt with the best model available to see how it performs on your task, and then add clear instructions and examples to improve performance based on failure modes found during initial testing.

Tools allow agents to operate with their environment and pull in new, additional context as they work. Because tools define the contract between agents and their information and action space, it’s extremely important that tools promote efficiency, both by returning information that is token efficient and by encouraging efficient agent behaviors.

Tools should be self-contained, robust to error, and extremely clear with respect to their intended use. Input parameters should similarly be descriptive, unambiguous, and play to the inherent strengths of the model.

One of the most common failure modes is bloated tool sets that cover too much functionality or lead to ambiguous decision points about which tool to use. If a human engineer can’t definitively say which tool should be used in a given situation, an AI agent can’t be expected to do better.

Providing examples, otherwise known as few-shot prompting, remains a strong best practice. However, teams often stuff a laundry list of edge cases into a prompt in an attempt to articulate every possible rule the LLM should follow for a particular task. Anthropic does not recommend this. Instead, it recommends curating a set of diverse, canonical examples that effectively portray the expected behavior of the agent. For an LLM, examples are the pictures worth a thousand words.

Anthropic’s overall guidance across the different components of context is to be thoughtful and keep context informative, yet tight.

## Context retrieval and agentic search

Anthropic increasingly sees teams augmenting embedding-based pre-inference retrieval systems with just-in-time context strategies.

Rather than pre-processing all relevant data up front, agents built with the just-in-time approach maintain lightweight identifiers, such as file paths, stored queries, and web links, and use these references to dynamically load data into context at runtime using tools. Claude Code uses this approach to perform complex data analysis over large databases. The model can write targeted queries, store results, and leverage Bash commands like head and tail to analyze large volumes of data without ever loading the full data objects into context.

This mirrors human cognition: we generally don’t memorize entire corpuses of information, but instead use external organization and indexing systems like file systems, inboxes, and bookmarks to retrieve relevant information on demand.

Letting agents navigate and retrieve data autonomously also enables progressive disclosure, allowing agents to incrementally discover relevant context through exploration. Each interaction yields context that informs the next decision.

Of course, there’s a trade-off: runtime exploration is slower than retrieving pre-computed data. Also, opinionated and thoughtful engineering is required to ensure that an LLM has the right tools and heuristics for effectively navigating its information landscape. Without proper guidance, an agent can waste context by misusing tools, chasing dead ends, or failing to identify key information.

In certain settings, the most effective agents might employ a hybrid strategy, retrieving some data up front for speed and pursuing further autonomous exploration at their discretion. Claude Code is given as an example of this hybrid model.

## Context engineering for long-horizon tasks

Long-horizon tasks require agents to maintain coherence, context, and goal-directed behavior over sequences of actions where the token count exceeds the LLM’s context window. For tasks that span tens of minutes to multiple hours of continuous work, such as large codebase migrations or comprehensive research projects, agents require specialized techniques to work around context window limitations.

Anthropic outlines three main techniques: compaction, structured note-taking, and multi-agent architectures.

### Compaction

Compaction is the practice of taking a conversation nearing the context window limit, summarizing its contents, and reinitiating a new context window with the summary. In Claude Code, the message history is passed to the model to summarize and compress the most critical details, preserving architectural decisions, unresolved bugs, and implementation details while discarding redundant tool outputs or messages.

The art of compaction lies in selecting what to keep versus what to discard, since overly aggressive compaction can remove subtle but critical context whose importance only becomes obvious later.

### Structured note-taking

Structured note-taking, or agentic memory, is a technique where the agent regularly writes notes persisted to memory outside the context window. These notes are pulled back into context later.

This provides persistent memory with minimal overhead. Claude Code creating a to-do list or an agent maintaining a NOTES.md file are examples of this pattern.

Anthropic notes that Claude Plays Pokémon is a vivid example: the agent maintains detailed tallies, maps, and strategic notes across long stretches of interaction, then reads its own notes after context resets and continues multi-hour tasks coherently.

### Sub-agent architectures

Sub-agent architectures offer another workaround. Instead of one agent attempting to maintain state across an entire project, specialized sub-agents can handle focused tasks with clean context windows. The main agent coordinates with a high-level plan, while sub-agents do deeper technical work or retrieve information and return condensed summaries.

This creates a clean separation of concerns: the detailed search context stays isolated within sub-agents, while the lead agent focuses on synthesis and analysis.

The choice between compaction, note-taking, and multi-agent architectures depends on the task. Compaction helps maintain conversational flow, note-taking is effective for iterative development with clear milestones, and multi-agent systems suit complex research and analysis where parallel exploration pays off.

## Conclusion

Context engineering represents a fundamental shift in how we build with LLMs. As models become more capable, the challenge isn’t just crafting the perfect prompt, it’s thoughtfully curating what information enters the model’s limited attention budget at each step. Whether implementing compaction, designing token-efficient tools, or enabling just-in-time exploration, the guiding principle is the same: find the smallest set of high-signal tokens that maximizes the likelihood of the desired outcome.

Even as models improve and require less prescriptive engineering, treating context as a precious, finite resource will remain central to building reliable, effective agents.

## Acknowledgements

Written by Anthropic’s Applied AI team: Prithvi Rajasekaran, Ethan Dixon, Carly Ryan, and Jeremy Hadfield, with contributions from Rafi Ayub, Hannah Moran, Cal Rueb, and Connor Jennings. Special thanks to Molly Vorwerck, Stuart Ritchie, and Maggie Vo for their support.
