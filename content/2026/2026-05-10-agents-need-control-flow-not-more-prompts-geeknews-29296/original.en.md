# agents need control flow not more prompts geeknews 29296

Source: https://bsuh.bearblog.dev/agents-need-control-flow/
Saved: 2026-05-10

## Metadata

- Source URL: https://bsuh.bearblog.dev/agents-need-control-flow/
- Canonical URL: https://bsuh.bearblog.dev/agents-need-control-flow/
- Archived date: 2026-05-10
- Source published date: 2026-05-07T15:27Z
- Source site: brian’s thoughts
- Surface URL: https://share.google/7D3OIqbfd8TnC67ce
- GeekNews URL: https://news.hada.io/topic?id=29296
- Extraction method: bearblog_html_manual
- Quality status: good

## Original Article

**Thesis: reliable agents tackling complex tasks need deterministic control flow encoded in software, not increasingly elaborate prompt chains**

If you’ve ever resorted to **MANDATORY** or **DO NOT SKIP**, you’ve hit the ceiling of prompting.

Imagine a programming language where statements are **suggestions** and functions return “Success” while **hallucinating**. Reasoning becomes impossible; reliability collapses as complexity grows.

Software scales through recursive composability: systems built from libraries, modules, and functions. It’s code all the way down. Code exposes predictable behavior, enabling local reasoning. Prompt chains lack this property. While useful for narrow tasks, prompts are non-deterministic, weakly specified, and difficult to verify.

Reliability requires moving logic out of prose and into runtime. We need deterministic scaffolds: explicit state transitions and validation checkpoints that treat the LLM as a component, not the system.

But deterministic orchestration is only half the battle. In a system prone to silent failure, an agent without aggressive error detection is just a fast way to reach the wrong conclusion. Without programmatic verification, we are left with three options:

1. Babysitter: Keep a human in the loop to catch errors before they propagate.
2. Auditor: Perform exhaustive end-to-end verification after the run.
3. Prayer: Vibe accept the outputs.
