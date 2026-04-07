# Summary — llm-wiki

## Core idea

This note proposes using an LLM-maintained persistent wiki as the knowledge layer between raw source materials and later queries.

## Key points

- Typical RAG systems rediscover knowledge from raw files every time a question is asked.
- The proposed pattern instead compiles knowledge into a persistent markdown wiki.
- The wiki is incrementally updated as new sources arrive.
- The system has three layers: raw sources, the wiki, and the schema that governs maintenance.
- Core workflows are ingest, query, and lint.
- Good query outputs should also be filed back into the wiki so exploration compounds over time.
- Obsidian is presented as a practical browsing interface, while the LLM acts as the maintainer.
- The wiki remains simple infrastructure-wise because it is just markdown plus optional tools like search, Dataview, Marp, and git.

## Bottom line

The central claim is that LLMs can make knowledge bases actually sustainable by taking over the maintenance work humans usually abandon.
