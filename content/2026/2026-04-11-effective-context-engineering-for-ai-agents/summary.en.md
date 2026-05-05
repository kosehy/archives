# Effective context engineering for AI agents — Summary

Source: https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents
Based on: `archive/2026/2026-04-11-effective-context-engineering-for-ai-agents/original.en.md`
Saved: 2026-04-11

## One-paragraph summary

Anthropic argues that as AI systems evolve from single-shot prompting toward long-running agents, the core engineering challenge shifts from prompt wording to context curation. Context engineering is the practice of selecting, updating, compressing, and retrieving the smallest high-signal set of tokens that gives an agent the best chance of behaving correctly. The article explains why context is a scarce resource, how prompts, tools, examples, and retrieval strategies should be designed around that scarcity, and why long-horizon agents need mechanisms like compaction, note-taking, and sub-agent architectures.

## Key points

- Context engineering extends prompt engineering by covering the full information state seen by the model, not just the prompt text.
- LLMs suffer from attention limits and context rot, so more context is not automatically better.
- Effective systems rely on concise prompts, clear tools, strong examples, and just-in-time or hybrid retrieval strategies.
- Long-running agents need explicit mechanisms such as compaction, memory, and sub-agents to preserve coherence across extended tasks.

## Memorable takeaway

The key is not giving the model more tokens, but giving it the right tokens at the right time.
