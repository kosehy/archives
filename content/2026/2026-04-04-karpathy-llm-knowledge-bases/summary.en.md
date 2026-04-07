# Summary — LLM Knowledge Bases

## Core idea

Karpathy describes a workflow where LLMs help build and maintain personal knowledge bases by turning raw source materials into a markdown wiki that can be queried, extended, linted, and continuously improved.

## Key points

- Source materials go into a `raw/` directory.
- An LLM incrementally compiles these materials into a structured markdown wiki.
- Obsidian serves as the main interface for browsing source data, compiled notes, and derived outputs.
- The LLM handles most of the writing and maintenance of the wiki.
- Once the wiki becomes large enough, the user can ask complex questions against it without necessarily needing elaborate RAG infrastructure.
- Outputs can be rendered as markdown files, slide decks, or images, then fed back into the knowledge base.
- LLM health checks can identify inconsistencies, missing data, and new article opportunities.
- Karpathy sees room for a dedicated product here, not just ad hoc scripts.

## Bottom line

The post sketches a practical model for using LLMs less as chatbots and more as knowledge-compilation and knowledge-maintenance systems.
