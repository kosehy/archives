# llm-wiki

Source: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
Archived: 2026-04-06
Language: English
Type: Concept note / personal knowledge systems / LLM workflow

## Core idea

This document proposes a pattern for building personal knowledge bases with LLMs.

Instead of relying on retrieval from raw documents every time a question is asked, the idea is to maintain a persistent wiki that sits between the raw sources and the user. The LLM continuously reads new sources, extracts key knowledge, updates structured markdown pages, and keeps the wiki internally linked and current.

The important distinction is that knowledge is not re-derived from scratch for every query. It is compiled into a persistent, evolving artifact.

## Why this differs from typical RAG

The document contrasts this idea with the standard retrieval pattern most people experience today.

Typical RAG systems:

- store raw documents
- retrieve relevant chunks at query time
- synthesize an answer on demand

That works, but every subtle question forces the LLM to rediscover and recombine knowledge again.

The proposed wiki approach is different:

- the LLM incrementally integrates each source into the wiki
- entity pages, concept pages, and summaries are updated over time
- contradictions can be flagged in advance
- synthesis accumulates instead of restarting from zero

This makes the wiki a compounding knowledge artifact rather than a temporary answer layer.

## Human role vs. LLM role

The document is explicit that humans should rarely write the wiki directly.

Instead:

- the human curates sources, explores, and asks questions
- the LLM handles summarizing, filing, cross-referencing, and maintenance

The author describes the practical setup as having the LLM agent open on one side and Obsidian on the other. In that setup:

- Obsidian is the IDE
- the LLM is the programmer
- the wiki is the codebase

## Example use cases

The document suggests many possible uses:

- personal self-tracking and self-understanding
- long-form research on a topic
- book reading companions with pages for characters, themes, and links
- internal company or team wiki maintenance
- competitive analysis, due diligence, travel planning, course notes, hobby deep-dives

The shared pattern is that knowledge accumulates over time and benefits from structure rather than scattered notes.

## The three layers

The proposal defines three core layers.

### 1. Raw sources

These are the immutable source materials:

- articles
- papers
- images
- datasets
- clipped notes

The LLM can read them but never modifies them.

### 2. The wiki

This is a directory of LLM-generated markdown files.

Possible page types include:

- summaries
- entity pages
- concept pages
- comparisons
- synthesis pages
- overview pages

The LLM fully owns this layer and is responsible for creating, updating, and cross-linking pages.

### 3. The schema

This is the configuration document that teaches the LLM how the wiki should be structured and maintained.

Examples mentioned include files like `CLAUDE.md` or `AGENTS.md`.

The schema defines:

- structure
- conventions
- ingestion workflow
- maintenance rules
- query behavior

The author describes this as the key file that turns a generic LLM into a disciplined wiki maintainer.

## Core workflows

The document highlights three primary workflows.

### Ingest

A new source is dropped into the raw collection.

The LLM then:

- reads it
- discusses it with the user
- writes a summary page
- updates the index
- updates relevant entity and concept pages
- appends to the log

One source may touch many pages across the wiki.

### Query

The user asks questions against the wiki.

The LLM searches relevant pages, reads them, and synthesizes an answer with citations.

Crucially, good answers should themselves be filed back into the wiki as new pages, so the knowledge base compounds through exploration as well as ingestion.

### Lint

The LLM periodically performs health checks on the wiki.

It looks for:

- contradictions
- stale claims
- orphan pages
- missing cross-references
- important concepts that lack dedicated pages
- data gaps that new research could fill

This keeps the wiki coherent as it grows.

## Navigation files

Two special files are proposed.

### `index.md`

A content-oriented catalog of all wiki pages, organized by category and including one-line summaries and optional metadata.

Its purpose is to help both the user and the LLM find relevant pages without requiring heavy retrieval infrastructure at small to medium scale.

### `log.md`

A chronological append-only record of ingests, queries, and lint passes.

Its purpose is to track the evolution of the knowledge base over time and provide recent-history visibility.

## Optional tools and ecosystem

The document mentions several supporting tools:

- Obsidian for browsing, graph view, and plugins
- qmd for local markdown search
- Obsidian Web Clipper for collecting sources
- local image downloads for more stable multimodal reference
- Marp for slide generation
- Dataview for querying structured frontmatter
- git for versioning, branching, and collaboration

The broader idea is that the wiki remains just a markdown repository, which keeps the whole system simple and inspectable.

## Why this matters

The document argues that the hardest part of knowledge base maintenance is not reading or thinking, but bookkeeping:

- updating cross-references
- keeping summaries current
- tracking contradictions
- maintaining consistency across many pages

Humans often abandon wikis because this maintenance burden grows too quickly.

The LLM changes the economics of that maintenance by making cross-linking and multi-file updates cheap.

## Historical framing

The note connects this idea to Vannevar Bush’s Memex concept: a personal, curated knowledge system where associative links matter as much as documents themselves.

The difference, in this framing, is that the LLM supplies the missing maintenance labor.

## Final takeaway

The document’s core proposal is that a well-maintained personal or organizational wiki can become the persistent knowledge layer between raw materials and later reasoning.

Instead of treating every query as a fresh retrieval problem, the LLM continuously compiles, updates, and organizes knowledge into an artifact that grows more valuable over time.

## Notes on preservation

- This source is an idea file rather than a traditional article.
- It is written to be adapted collaboratively with an LLM agent rather than implemented as a fixed system specification.
