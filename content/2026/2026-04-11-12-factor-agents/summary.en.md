# 12-factor agents — Summary

Source: https://github.com/humanlayer/12-factor-agents
Based on: `archive/2026/2026-04-11-12-factor-agents/original.en.md`
Saved: 2026-04-11

## One-paragraph summary
This repository argues that production-grade AI agents are less about blindly adopting agent frameworks and more about applying a set of durable engineering principles to real software systems. Drawing inspiration from 12 Factor Apps, the guide claims that many successful customer-facing “agents” are mostly software with carefully placed LLM steps, and that teams often get more leverage by integrating modular agent concepts into existing products than by rebuilding everything around a framework. The repo organizes this view into a set of factors covering prompts, context, tools, execution state, control flow, human contact, compaction, focused agents, and stateless reduction.

## Key points
- Many production AI products are less agentic than they appear and rely heavily on deterministic software around selected LLM steps.
- Agent frameworks may help teams move quickly at first, but deeper product quality usually requires owning prompts, context, flow, and execution directly.
- The guide proposes a modular, principle-driven approach rather than total framework dependence.
- The listed factors focus on engineering reliability, maintainability, and control in LLM-powered systems.

## Memorable takeaway
Good production agents are usually not “just agents”, they are disciplined software systems with LLMs placed where they create the most leverage.
