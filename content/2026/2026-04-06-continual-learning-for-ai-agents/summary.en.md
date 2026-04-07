# Summary — Continual learning for AI agents

## Core idea

This article argues that continual learning for agentic systems should be understood across three different layers: the model, the harness, and the context.

## Key points

- Most people associate continual learning with updating model weights, but that is only one layer.
- Model-level learning includes techniques like fine-tuning and reinforcement learning, but it faces catastrophic forgetting.
- Harness-level learning means improving the code, tools, and always-on logic that drive the agent.
- Context-level learning means updating instructions, skills, tools, or memory that live outside the base harness.
- Context can be learned at multiple scopes, including the agent, the user, and the organization.
- These updates can happen offline from traces or online while the agent is running.
- Traces are presented as the shared foundation that powers model, harness, and context learning.

## Bottom line

The article’s main contribution is a clearer mental model: agents do not only learn through weight updates. They can also learn by changing their harness and by evolving their context.
