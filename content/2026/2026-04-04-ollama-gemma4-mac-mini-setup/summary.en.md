# Summary — April 2026 TLDR setup for Ollama + Gemma 4 on a Mac mini

## Core point

This note gives a practical Apple Silicon Mac mini setup for running Ollama with Gemma 4, focusing on auto-start, preloading, and keeping the model warm in memory.

## Key points

- Install Ollama via `brew install --cask ollama-app`.
- Launch Ollama and verify the server with `ollama list`.
- Pull `gemma4` and use the default `gemma4:latest` model.
- The note recommends the default 8B model rather than 26B on a 24GB Mac mini because the larger model leaves too little memory headroom.
- A macOS launch agent can periodically call `ollama run gemma4:latest` to keep the model warm.
- `OLLAMA_KEEP_ALIVE="-1"` can keep the model loaded indefinitely.
- `ollama ps` is used to verify memory residency and CPU/GPU usage.
- Ollama’s local API at `localhost:11434` can be used by coding agents and other tools.

## Bottom line

The document is basically a “make local Ollama feel always ready” recipe, with the strongest practical advice being: use the smaller default Gemma 4 model unless you have far more headroom.
