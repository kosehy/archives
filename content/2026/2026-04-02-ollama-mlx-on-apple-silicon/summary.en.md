# Ollama is now powered by MLX on Apple Silicon — Summary

Source: https://ollama.com/blog/mlx
Based on: `archive/2026/2026-04-02-ollama-mlx-on-apple-silicon/original.en.md`
Saved: 2026-04-02

## One-paragraph summary
Ollama announced a preview release that replaces its Apple Silicon backend with MLX, Apple’s machine learning framework, to improve local LLM performance on macOS. The company claims major gains in both prefill speed and decode speed, especially on M5-series chips, while also adding support for NVIDIA’s NVFP4 format and improving cache behavior for coding and agentic workloads. The broader message is that local inference on Apple hardware is becoming faster, more production-like, and better suited for agent-based workflows.

## Key points
- Ollama’s Apple Silicon backend is now based on MLX instead of the prior implementation.
- The switch is designed to better exploit unified memory architecture on Apple devices.
- Performance improvements are highlighted for both TTFT and decode speed.
- NVFP4 support is intended to preserve quality while lowering inference overhead.
- Improved caching targets coding and agent-style use cases.
- The preview release emphasizes the Qwen3.5-35B-A3B coding model.
- Ollama positions this as a major step toward faster local agent workflows on Macs.

## Memorable takeaway
Local LLM performance on Apple Silicon is no longer just about running models—it is becoming optimized for serious agentic work.
