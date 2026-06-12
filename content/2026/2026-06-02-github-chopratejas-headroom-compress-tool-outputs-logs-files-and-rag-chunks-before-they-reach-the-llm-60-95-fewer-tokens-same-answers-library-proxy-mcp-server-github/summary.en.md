# Summary — Headroom

Source: https://github.com/chopratejas/headroom
Archived: 2026-06-02

Headroom is a GitHub project that positions itself as a local, reversible context-compression layer for AI agents. It compresses tool outputs, logs, RAG chunks, files, and conversation history before they reach the LLM, aiming to reduce token usage while preserving answer quality.

## Core claims

- 60-95% fewer tokens for selected agent workloads.
- Library, proxy, wrapper, and MCP deployment modes.
- Local-first handling: data remains in the user's environment.
- Reversible compression through CCR: originals are kept and can be retrieved on demand.
- Cross-agent memory shared across tools such as Claude, Codex, Gemini, Cursor, Aider, Copilot CLI, and OpenClaw.
- `headroom learn` mines failed sessions and writes corrections into agent instruction files such as `CLAUDE.md` and `AGENTS.md`.

## Architecture

The README describes a pipeline composed of CacheAligner, ContentRouter, SmartCrusher, CodeCompressor, Kompress-base, IntelligentContext/RollingWindow, cross-agent memory, and MCP tools. ContentRouter selects the appropriate compressor for JSON, code, prose, image, or other content. CCR keeps originals locally and lets the LLM retrieve them if compression removed needed detail.

## Evidence presented by the repository

The README presents token-saving examples for code search, SRE debugging, GitHub issue triage, and codebase exploration, plus small benchmark tables for GSM8K, TruthfulQA, SQuAD v2, and BFCL. These should be treated as repository-provided claims until reproduced independently.

## Why it matters

Headroom is relevant to agent-heavy workflows because the main bottleneck is no longer only model capability; it is also context-window budget, noisy tool outputs, retrieval bloat, and repeated cross-agent context transfer. If the reversible-compression claims hold, Headroom-like systems could become part of the default infrastructure layer for long-running coding agents and Hermes-style workflows.
