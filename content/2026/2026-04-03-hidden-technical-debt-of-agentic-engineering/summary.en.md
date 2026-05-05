# The hidden technical debt of agentic engineering — Summary

Source: https://thenewstack.io/hidden-agentic-technical-debt/
Based on: `archive/2026/2026-04-03-hidden-technical-debt-of-agentic-engineering/original.en.md`
Saved: 2026-04-03

## One-paragraph summary

This article argues that the real complexity of agentic engineering is not in writing the agent itself, but in the surrounding infrastructure required to operate agents safely at organizational scale. Drawing a parallel to Google’s classic paper on hidden technical debt in machine learning systems, it outlines seven categories of debt that accumulate around enterprise agents: integrations, context management, agent registry, measurement, human-in-the-loop controls, governance, and orchestration. The central warning is that companies will have to build this supporting infrastructure either proactively or reactively after incidents, failures, or costly sprawl make it unavoidable.

## Key points

- Agent code is only a small part of the total production system.
- Enterprise agent deployments create infrastructure debt similar to ML systems, but with agent-specific complications.
- The article names seven surrounding debt categories: integrations, context lake, agent registry, measurement, human-in-the-loop, governance, and orchestration.
- Teams often underestimate how much duplicated, invisible, and inconsistent infrastructure agents create.
- Measurement needs differ across SREs, ML engineers, executives, and end users.
- Human approvals, governance, and orchestration become especially painful at scale.
- Platform teams will need to standardize and govern agents much as they previously did with microservices.
- The real choice is not whether to build the infrastructure, but whether to build it before or after failures.

## Memorable takeaway

You will build the infrastructure around agents either before the pain or after it — but you will build it either way.
