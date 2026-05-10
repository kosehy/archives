# Harness design for long-running application development — Summary

Source: https://www.anthropic.com/engineering/harness-design-long-running-apps
Based on: `archive/2026/2026-04-11-harness-design-for-long-running-application-development/original.en.md`
Saved: 2026-04-11

## One-paragraph summary

This article describes how Anthropic evolved from earlier long-running coding harnesses into a more capable multi-agent architecture for both frontend design and full-stack application development. The central idea is that naive single-agent loops break down on long or subjective tasks because of context degradation and weak self-evaluation, so performance improves when work is split across planner, generator, and evaluator agents with explicit artifacts, testing loops, and, where needed, context resets. The author also emphasizes that harness complexity should not become dogma: as models improve, some scaffolding becomes unnecessary, while other specialized structures still create meaningful lift on difficult tasks.

## Key points

- Long-running agents often fail because of context drift, context anxiety, and poor self-judgment.
- Splitting planning, generation, and evaluation across separate agents can improve both output quality and error detection.
- Evaluators can be especially valuable on subjective or edge-of-capability tasks, but they require careful tuning.
- Harness components should be treated as revisable assumptions, not permanent architecture.
- Better models can reduce the need for some scaffolding, but also open room for new harness combinations.

## Memorable takeaway

The right harness is not a fixed recipe, but a moving layer of structure that compensates for whatever the current model still cannot reliably do alone.
