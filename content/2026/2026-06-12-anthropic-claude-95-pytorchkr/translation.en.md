# English rendering: PyTorchKR summary of Anthropic's self-service analytics stack

> Note: The archived Korean source is a PyTorchKR GPT-assisted summary of Anthropic's official English article. The official English article is preserved separately as `source/anthropic-blog.jina.md`. This file is an English archive rendering of the Korean summary and its takeaways, not a replacement for the official source snapshot.

## Introduction

Anthropic describes how its data science and data engineering teams use Claude and Claude Code to support self-service business analytics. The central claim is that analytics accuracy is not primarily a code-generation problem. It is a context and verification problem: the agent must map a stakeholder's question to the correct, current, governed entities in the data model.

Anthropic reports that roughly 95% of internal business analytics queries are automated via Claude, with around 95% aggregate accuracy. That number should be read as Anthropic's own internal report, not as an independently verified benchmark.

## Why analytics agents are different from coding agents

Coding agents operate in a relatively open solution space, and tests can often tell whether a solution works. Analytics agents face a different problem. There may be one correct answer, but correctness depends on hidden choices: which metric definition, which population, which source, which lookback window, and which freshness assumption.

Anthropic frames most wrong answers as coming from three failure modes:

1. Concept/entity ambiguity: business terms such as “active users” map to many plausible tables, fields, filters, or definitions.
2. Data staleness: schemas, sources, and business definitions change constantly.
3. Retrieval failure: the right information may exist, but the agent cannot find or use it in the correct way.

## The agentic analytics stack

Anthropic's stack addresses those failures through four layers.

First, data foundations reduce ambiguity before the agent begins searching. This includes canonical datasets, enforced standards, colocated artifacts, and metadata treated as a product.

Second, sources of truth help the agent turn vague business language into governed entities. Anthropic highlights the semantic layer, lineage and transformation graphs, curated query patterns, and business context.

Third, Claude Code Skills encode procedural knowledge. A skill tells the agent which source to try first, when to fall back, which domain references to load, how to handle ambiguity, and how to review the final answer. Anthropic reports that skills moved its analytics eval accuracy from below 21% to above 95%, reaching around 99% in some domains.

Fourth, validation finds what still leaks through. Anthropic uses offline evaluations, ablation experiments, and online validation mechanisms such as adversarial review, provenance footers, data-quality checks, passive monitoring, and correction harvesting.

## Most important lesson

The strongest lesson is the negative ablation result. Anthropic gave agents direct access to thousands of historical dashboard, transformation, and notebook SQL files. Accuracy moved by less than one percentage point. In many wrong cases the answer was present, but the agent still did not use it.

That suggests the bottleneck was not access to information. It was structure: mapping the question to the right entity and source.

## Practical takeaway

Teams should start with a small number of canonical datasets, a few dozen meaningful offline evaluations, and thin but explicit skills. Broader retrieval, richer automation, adversarial reviewers, and continuous correction loops become useful after that foundation exists.
