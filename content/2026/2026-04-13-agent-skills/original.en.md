# agent-skills

Source: https://github.com/addyosmani/agent-skills
Saved: 2026-04-13

Production-grade engineering skills for AI coding agents.

Skills encode the workflows, quality gates, and best practices that senior engineers use when building software. These ones are packaged so AI agents follow them consistently across every phase of development.

```text
DEFINE PLAN BUILD VERIFY REVIEW SHIP
┌──────┐   ┌──────┐   ┌──────┐   ┌──────┐   ┌──────┐   ┌──────┐
│ Idea │ ─▶│ Spec │ ─▶│ Code │ ─▶│ Test │ ─▶│ QA   │ ─▶│ Go   │
│Refine│   │ PRD  │   │ Impl │   │Debug │   │ Gate │   │ Live │
└──────┘   └──────┘   └──────┘   └──────┘   └──────┘   └──────┘
/spec /plan /build /test /review /ship
```

The repository maps seven slash commands to the development lifecycle:

- `/spec` — Spec before code
- `/plan` — Small, atomic tasks
- `/build` — One slice at a time
- `/test` — Tests are proof
- `/review` — Improve code health
- `/code-simplify` — Clarity over cleverness
- `/ship` — Faster is safer

Skills also activate automatically based on activity, such as API design, frontend work, and so on.

## Setup across tools

The repo documents setup for multiple agent environments:

- Claude Code (recommended)
- Cursor
- Gemini CLI
- Windsurf
- OpenCode
- GitHub Copilot
- Kiro IDE & CLI
- Codex / Other agents

For Claude Code, marketplace install commands are shown, and the repo notes SSH setup issues plus an HTTPS fallback for fetches. Local development can be done by cloning the repository and pointing Claude at the plugin directory.

## Core skills

The repository says the top-level commands activate twenty structured skills that cover the development lifecycle. The listed skills include:

- idea-refine
- spec-driven-development
- planning-and-task-breakdown
- incremental-implementation
- test-driven-development
- context-engineering
- source-driven-development
- frontend-ui-engineering
- api-and-interface-design
- browser-testing-with-devtools
- debugging-and-error-recovery
- code-review-and-quality
- code-simplification
- security-and-hardening
- performance-optimization
- git-workflow-and-versioning
- ci-cd-and-automation
- deprecation-and-migration
- documentation-and-adrs
- shipping-and-launch

Each skill is described as a structured workflow with steps, verification gates, and anti-rationalization tables.

## Specialist personas and references

The repo also includes specialist personas for targeted review:

- code-reviewer
- test-engineer
- security-auditor

And quick-reference materials such as:

- testing-patterns.md
- security-checklist.md
- performance-checklist.md
- accessibility-checklist.md

## Skill anatomy

The repository explains that every skill follows a consistent anatomy:

- Frontmatter with name and description
- Overview
- When to Use
- Process
- Rationalizations
- Red Flags
- Verification

It emphasizes several design principles:

- Process, not prose
- Anti-rationalization
- Verification is non-negotiable
- Progressive disclosure

## Repository structure

```text
agent-skills/
├── skills/
├── agents/
├── references/
├── hooks/
├── .claude/commands/
└── docs/
```

The repository frames AI coding agents as tending to default to the shortest path, often skipping specs, tests, security review, and other practices that make software reliable. Agent Skills is presented as a way to encode the discipline senior engineers apply to production software.

The repo says the skills draw from engineering practices associated with Google, including concepts from Software Engineering at Google and Google’s engineering practices guide. It mentions examples such as Hyrum’s Law, the Beyonce Rule, the test pyramid, change sizing, Chesterton’s Fence, trunk-based development, Shift Left, feature flags, and deprecation as code-liability management.

The overall claim is that skills should be specific, verifiable, battle-tested, and minimal.

MIT licensed.
