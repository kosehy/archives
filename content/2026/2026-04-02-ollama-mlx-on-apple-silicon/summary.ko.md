# Ollama가 Apple Silicon에서 MLX 기반으로 전환됐다 — 요약

- 원문: https://ollama.com/blog/mlx
- 기준 파일: `archive/2026/2026-04-02-ollama-mlx-on-apple-silicon/translation.ko.md`
- 저장일: 2026-04-02

## 한 문단 요약

Ollama는 Apple Silicon용 백엔드를 MLX로 교체한 프리뷰 버전을 발표했다. 이를 통해 macOS에서 로컬 LLM의 prefill 속도와 decode 속도가 크게 개선되고, 특히 M5 계열 칩에서 더 강한 성능 향상이 기대된다고 설명한다. 동시에 NVFP4 지원과 캐시 개선도 추가해 코딩 및 에이전트 워크플로우에 더 적합한 로컬 추론 환경을 만들겠다는 메시지를 내고 있다.

## 핵심 포인트

- Ollama의 Apple Silicon 백엔드가 MLX 기반으로 바뀌었다.
- Apple 통합 메모리 구조를 더 잘 활용하도록 설계됐다.
- TTFT와 decode 속도 모두 개선이 강조된다.
- NVFP4 지원으로 품질과 효율을 함께 노린다.
- 캐시 개선은 코딩과 에이전트 작업에 초점을 둔다.
- 프리뷰 릴리스는 Qwen3.5-35B-A3B 코딩 모델 중심으로 소개된다.
- 전체적으로 Mac에서의 로컬 에이전트 실행을 한 단계 더 실용적으로 만들려는 방향이다.

## 한 줄 정리

Apple Silicon에서의 로컬 LLM은 이제 단순 실행을 넘어, 실제 에이전트 작업에 맞게 최적화되는 단계로 가고 있다.
