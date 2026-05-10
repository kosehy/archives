# The advisor strategy: Give agents an intelligence boost — Summary

Source: https://claude.com/blog/the-advisor-strategy
Based on: `archive/2026/2026-04-10-the-advisor-strategy-give-agents-an-intelligence-boost/original.en.md`
Saved: 2026-04-10

## One-paragraph summary

Anthropic presents the advisor strategy as a cost-performance architecture for agentic systems: use Sonnet or Haiku as the executor that runs the task loop, and consult Opus only when the executor reaches a hard decision point. This keeps most of the run at lower-cost model rates while borrowing frontier-level reasoning only when needed. Anthropic packages this pattern into a server-side advisor tool, reports benchmark gains across coding and browsing tasks, and positions the feature as a simple API-level way to improve agent quality without paying Opus-level costs end to end.

## Key points

- The executor model handles the full task loop and only escalates to Opus for guidance on difficult decisions.
- This flips the common big-orchestrator-small-worker pattern into a smaller-driver-escalation model.
- Anthropic reports better benchmark performance with lower per-task cost than Sonnet alone in several evaluations.
- The advisor tool is integrated into a single Messages API request with separate usage accounting and configurable call caps.

## Memorable takeaway

Use expensive intelligence only at the moments where it actually changes the trajectory.
