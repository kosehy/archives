# Reallocating $100/Month Claude Code spend to Zed and OpenRouter

Source: https://braw.dev/blog/2026-04-06-reallocating-100-month-claude-spend/
Saved: 2026-04-12

I’ve been disappointed to feel that I’m hitting Claude limits faster than before. For context, I use both Claude Code and the Claude desktop app for work and pay $100/month for the privilege of hitting limits. I’m not the only one with numerous other reports found over Reddit and Twitter. My usage pattern is “bursty” so I’m not using the windows all the time throughout the day but find it incredibly frustrating to hit a limit mid-way through a coding session.

This article is how I’m reallocating that spend to other tools and models while getting more flexibility at the same time.

## Picking an Agent Harness and Exploring other models

I like options and while Opus is undoubtedly the market leader for agentic coding, there are other models that I like to use to balance cost and speed depending on the complexity of the task in hand. I’m looking at how I can use different models with an Agent Harness.

An “agent harness” coordinates sending and receiving messages from LLMs, injecting tool definitions and calling the tools and orchestrating all of this into workflows, including retrying failing tasks.

Claude Code is an example of such a system. It takes the user message, coordinates reading and writing files, among other things, and makes calls to the LLM.

## Zed and OpenRouter

Plans: $10 / month.

The author argues that you don’t realize how slow or laggy VSCode and its forks feel until you try Zed. Zed’s built-in agent harness is described as basic but pleasant, with the ability to follow the agent as it edits files and define new profiles to customize behavior. Like Cursor, it exposes context usage and active rules for the current session.

If you continue to use Claude Code or tools like Mistral Vibe, Zed integrates them directly into the editor using Agent Client Protocol (ACP). The biggest drawback is the weaker extension ecosystem compared with VSCode, though the author says it covers common languages and tasks.

Zed offers usage-based pricing after included credits, but the author prefers to use OpenRouter inside Zed because Zed’s token prices are higher than going directly to the API. Another benefit is access to more native context window sizes. The article notes that Zed’s native integration limited Gemini 3.1 context to 200k tokens, whereas OpenRouter allowed use of the full 1M context.

### OpenRouter

The article notes an edit that OpenRouter charges a 5.5% fee.

The author likes OpenRouter because it offers a large menu of models and providers, and because prepaid credits expire only after 365 days if unused. This avoids the frustration of fixed monthly Anthropic windows that expire whether heavily used or not.

To minimize data exposure risk, the author opted out of allowing OpenRouter to use inputs and outputs to improve the product, and enabled Zero Data Retention endpoints only in workspace guardrails. This excludes some models but was considered a worthwhile tradeoff.

## Cursor

Plans: $20 | $60 | $200 / month.

The author originally switched from VSCode and Copilot to Cursor in 2025 because of the quality of Cursor’s autocomplete and later appreciated having multiple models available for experimentation.

Cursor 3.0, rewritten in Rust and more focused on agent orchestration, renewed the author’s curiosity. As a VSCode fork, it benefits from the full extension ecosystem. The author especially values Cursor’s different rule application modes, including applying rules only to certain files or path regexes, which helps use context more efficiently.

The downside is that even with API-rate pricing after included usage, you still pay at least $20/month and unused value does not roll over.

## Claude Code and OpenRouter

The article notes that Claude Code is optimized for Anthropic models and may not work correctly with other providers, but also explains that Claude Code can still be configured to use OpenRouter instead of Anthropic’s API.

The required environment variables are shown as follows:

```bash
export OPENROUTER_API_KEY=""
export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
export ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"
export ANTHROPIC_API_KEY="" # Important: Must be explicitly empty

export ANTHROPIC_DEFAULT_OPUS_MODEL="anthropic/claude-opus-4.6"
export ANTHROPIC_DEFAULT_SONNET_MODEL="anthropic/claude-sonnet-4.6"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="anthropic/claude-haiku-4.5"
export CLAUDE_CODE_SUBAGENT_MODEL="anthropic/claude-opus-4.6"
```

The article also recommends verifying the setup with `claude /status` and checking that authentication and base URL now point to OpenRouter.

## Other CLI tools like OpenCode + OpenRouter

The article lists several command-line coding agent harnesses that can work with OpenRouter, including:

- OpenCode, which the author uses the most
- Crush, which the author finds performant but annoying to configure for custom models

The author notes that many other tools have forks or variants that attempt OpenRouter compatibility.

## Final allocation

The author says they are now happily paying for Zed at $10/month and also keeping a Cursor subscription at $20/month to watch how Cursor 3 evolves. The remaining $70 is added to OpenRouter credits each month so the value rolls over instead of being lost.

The overall recommendation is that if you regularly hit Claude limits but still want optional access to Opus and other models, reallocating part of that spend into Zed plus OpenRouter is worth trying.
