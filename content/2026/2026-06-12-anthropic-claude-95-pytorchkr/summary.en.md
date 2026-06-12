# Summary: Anthropic's Claude-Based Self-Service Analytics Stack

## One-line summary

Anthropic's core claim is that accurate analytics agents are not mainly a SQL-generation problem. They require governed data foundations, procedural skills, and continuous validation that reduce ambiguity before the agent writes a query.

## Key points

- Anthropic reports that about 95% of its internal business analytics queries are automated through Claude, with roughly 95% aggregate accuracy.
- Analytics agents differ from coding agents. Code can often be tested deterministically, while analytics can look precise while using the wrong definition, field, population, time window, or freshness assumption.
- Anthropic identifies three dominant failure modes:
  - concept/entity ambiguity: business terms such as “active users” or “revenue” map to many plausible fields and definitions;
  - data staleness: schemas, sources, and business definitions change constantly;
  - retrieval failure: the correct information may exist, but the agent fails to find and use it.
- The proposed stack has four layers: data foundations, sources of truth, skills, and validation.
- Data foundations mean canonical datasets, enforced standards, colocated artifacts, and metadata treated as a first-class product.
- Sources of truth include a semantic layer, lineage and transformation graphs, curated query patterns, and business context.
- Skills encode procedural knowledge: what to try first, which references to load, how to handle ambiguity, and how to review the result. Anthropic says accuracy was below 21% without skills and rose above 95% with skills, reaching around 99% in some domains.
- Validation combines offline evals, ablations, and online monitoring. One notable negative result: giving agents raw access to thousands of past SQL files moved accuracy by less than one percentage point.
- The practical takeaway is that broader retrieval is not enough. The system must collapse ambiguous questions into a single governed answer, make that answer discoverable, and flag when it has gone stale.

## Practical takeaway

A useful analytics agent starts with a small number of canonical metrics and datasets, a thin but explicit skill layer, and evaluation cases that are tied to real stakeholder questions. More context helps only after the structure tells the agent what context actually matters.
