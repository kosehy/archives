# Figure Notes - Using Codex Goals Effectively

## Overview

LinkedIn Pulse exposed one cover image and five inline figures. All six were downloaded from LinkedIn media URLs and stored locally under `figures/`. Query tokens from the original media URLs are redacted in human-readable files.

## Figures

### figure-01 - `figures/figure-01-linkedin-pulse-cover.png`

- Status: recovered
- Type: cover / thesis graphic
- OCR/main text: “Using Codex Goals Effectively”; “How to define clear goals, tighten feedback loops, and help agents track progress.” Process labels: “Define goal”, “Get feedback”, “Measure progress”, checklist items “Goal defined”, “Plan in place”, “Iterate and refine”, “Goal achieved”.
- Shows: a goal-seeking loop that moves from definition through feedback and measurement toward a target.
- Why it matters: visually condenses the article’s three-part playbook: measurable goals, tight feedback, and persistent progress tracking.

### figure-02 - `figures/figure-02-linkedin-pulse-inline.png`

- Status: recovered
- Type: section illustration
- OCR/main text: “Specify A Clear, Quantitative Goal”; “Turn vague objectives into measurable end states.” Example card: “Target: -20% runtime”, “Constraint: No test regressions”, “Status: Measured”.
- Shows: a vague goal being converted into a measurable target with constraints.
- Why it matters: supports the article’s warning that vague qualitative prompts are a failure mode for long-running goal loops.

### figure-03 - `figures/figure-03-linkedin-pulse-inline.png`

- Status: recovered
- Type: checklist screenshot
- OCR/main text: “ICML Paper Constraints Checklist”; “Extracted from `neurips_paper/papers/example_paper.tex`”; “Audit status: [X] means satisfied...”; section “Submission Artifact” with checked items such as PDF-only submission, handling appendices, page limits, file size, embedded Type-1 fonts, avoiding Type-3 fonts, and US letter size.
- Shows: an example of turning conference formatting constraints into a checklist that an agent can grade against.
- Why it matters: illustrates how Codex can transform a vague formatting conversion task into a 200+ item measurable completion criterion.

### figure-04 - `figures/figure-04-linkedin-pulse-inline.png`

- Status: recovered
- Type: section illustration
- OCR/main text: “Make Sure the Feedback Loop Is Tight”; “Fast, easy evaluation helps agents improve more quickly.” Loop labels: “Try”, “Test”, “Score”, “Iterate”, “Minutes, not days”. Side card: “Smaller model”, “Subsampled data”, “Faster feedback”.
- Shows: a fast experiment loop with simplified evaluation inputs.
- Why it matters: supports the article’s claim that goal-mode agents need quick, easy-to-run scoring mechanisms rather than slow production-scale tests.

### figure-05 - `figures/figure-05-linkedin-pulse-inline.png`

- Status: recovered
- Type: section illustration
- OCR/main text: “Give Your Agent Markdown Files for Tracking”; “Externalize plans, experiments, and notes so long-running agents can stay coherent.” Files shown: `PLAN.md` as high-level plan, `EXPERIMENTS.md` as curated results, `EXPERIMENT_NOTES.md` as scratchpad/running notes. Side card: “Tracks progress”, “Preserves context”, “Makes review easier”.
- Shows: an agent reading from and writing to three Markdown files.
- Why it matters: directly connects to Hermes-style durable state: long-running agents should externalize plan, experiment, and scratchpad state into readable files.

### figure-06 - `figures/figure-06-linkedin-pulse-inline.png`

- Status: recovered
- Type: experiment-log screenshot
- OCR/main text: “E15: E12 Continuation With Simplex Auxiliary Anneal”; “Status: completed on Runpod.” It includes hypothesis, mechanism, decision rule, and result. Key visible metrics include `val_lddt_ca=0.3556`, FoldScore `0.3025`, `val_ca_drmsd=12.3527`, and predicted/true C-alpha radius of gyration `9.0217 / 15.7622`.
- Shows: a concrete `EXPERIMENTS.md`-style entry for a protein-structure-model experiment, including rationale, procedure, decision rule, and result.
- Why it matters: demonstrates what “agent markdown tracking” looks like in practice: a curated experiment ledger that both human and agent can review between iterations.

## Notes

- These figures are treated as argument-bearing screenshots/diagrams, not decorative images.
- File extensions were normalized to `.png` because LinkedIn served PNG bytes even though the original URLs did not expose stable filenames.
