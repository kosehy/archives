# 12-factor agents

Source: https://github.com/humanlayer/12-factor-agents
Saved: 2026-04-11

In the spirit of [12 Factor Apps](https://12factor.net/). The source for this project is public at [https://github.com/humanlayer/12-factor-agents](https://github.com/humanlayer/12-factor-agents), and I welcome your feedback and contributions. Let's figure this out together!

Hi, I'm Dex. I've been hacking on AI agents for a while.

I've tried every agent framework out there, from the plug-and-play crew/langchains to the "minimalist" smolagents of the world to the "production grade" langraph, griptape, etc.

I've talked to a lot of really strong founders, in and out of YC, who are all building really impressive things with AI. Most of them are rolling the stack themselves. I don't see a lot of frameworks in production customer-facing agents.

I've been surprised to find that most of the products out there billing themselves as "AI Agents" are not all that agentic. A lot of them are mostly deterministic code, with LLM steps sprinkled in at just the right points to make the experience truly magical.

Agents, at least the good ones, don't follow the ["here's your prompt, here's a bag of tools, loop until you hit the goal"](https://www.anthropic.com/engineering/building-effective-agents#agents) pattern. Rather, they are comprised of mostly just software.

So, I set out to answer:

Welcome to 12-factor agents.

Even if LLMs continue to get exponentially more powerful, there will be core engineering techniques that make LLM-powered software more reliable, more scalable, and easier to maintain.

## Contents

- [How We Got Here: A Brief History of Software](https://github.com/humanlayer/12-factor-agents/blob/main/content/brief-history-of-software.md)
- [Factor 1: Natural Language to Tool Calls](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-01-natural-language-to-tool-calls.md)
- [Factor 2: Own your prompts](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-02-own-your-prompts.md)
- [Factor 3: Own your context window](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-03-own-your-context-window.md)
- [Factor 4: Tools are just structured outputs](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-04-tools-are-structured-outputs.md)
- [Factor 5: Unify execution state and business state](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-05-unify-execution-state.md)
- [Factor 6: Launch/Pause/Resume with simple APIs](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-06-launch-pause-resume.md)
- [Factor 7: Contact humans with tool calls](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-07-contact-humans-with-tools.md)
- [Factor 8: Own your control flow](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-08-own-your-control-flow.md)
- [Factor 9: Compact Errors into Context Window](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-09-compact-errors.md)
- [Factor 10: Small, Focused Agents](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-10-small-focused-agents.md)
- [Factor 11: Trigger from anywhere, meet users where they are](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-11-trigger-from-anywhere.md)
- [Factor 12: Make your agent a stateless reducer](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-12-stateless-reducer.md)

## A brief framing

For a deeper dive on the author’s agent journey and what led to this guide, the project points readers to _A Brief History of Software_.

The guide frames software as a directed graph, then explains why agent builders were excited by the idea of replacing hand-coded DAG paths with LLM-selected transitions. The author argues that the naive promise of “give the model a goal and tools and let it figure out the path” does not work as well as many hoped.

The repo describes a common agent loop like this:

```ts
initial_event = {"message": "..."}
context = [initial_event]
while True:
  next_step = await llm.determine_next_step(context)
  context.append(next_step)

  if (next_step.intent === "done"):
    return next_step.final_answer

  result = await execute_step(next_step)
  context.append(result)
```

The author’s argument is that teams often use frameworks to quickly reach a 70-80% quality bar, then discover that customer-facing quality requires much deeper control over prompts, context, flow, and execution. As a result, many end up rebuilding from scratch.

## Core thesis

After working through many libraries and talking with many founders, the author’s view is:

- There are core principles that make agents great.
- Going all-in on an agent framework and effectively doing a greenfield rewrite may be counterproductive.
- The fastest path to high-quality AI software is often to take modular concepts from agent building and fold them into an existing product.
- Skilled software engineers can often apply these ideas even without deep AI-specific backgrounds.

## Additional appendix and links

The repository also lists:

- [Factor 13: Pre-fetch all the context you might need](https://github.com/humanlayer/12-factor-agents/blob/main/content/appendix-13-pre-fetch.md)
- Links to talks, related essays, OSS projects, and references

## Notes

- This preserved file is based on the accessible repository landing page content, which acts as an overview and table of contents for the guide.
- The detailed factor essays live in linked subpages under `content/` in the repository.
- Licensing notes on the page state that content and images are under CC BY-SA 4.0, while code is under Apache 2.0.
