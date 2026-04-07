# Ollama가 Apple Silicon에서 MLX 기반으로 전환됐다

- 원문: https://ollama.com/blog/mlx
- 저장일: 2026-04-02
- 번역 메모: 공식 블로그 공지의 구조와 의미를 유지하면서 자연스러운 한국어로 다듬었다.

Ollama가 Apple의 머신러닝 프레임워크인 MLX를 기반으로 Apple Silicon에서 더 빠르게 동작하는 프리뷰 버전을 공개했다.

이 변경으로 macOS에서 다음과 같은 고부하 작업의 성능이 개선된다.

- OpenClaw 같은 개인 비서형 에이전트
- Claude Code, OpenCode, Codex 같은 코딩 에이전트

## Apple Silicon에서 가장 빠른 성능, MLX 기반

Apple Silicon용 Ollama는 이제 Apple의 머신러닝 프레임워크인 MLX 위에서 동작하며, 통합 메모리 아키텍처를 적극 활용한다.

그 결과 모든 Apple Silicon 기기에서 큰 속도 향상이 발생한다. 특히 Apple의 M5, M5 Pro, M5 Max 칩에서는 새로운 GPU Neural Accelerators를 활용해 첫 토큰까지의 시간(TTFT)과 생성 속도(tokens per second)를 모두 끌어올린다.

테스트는 2026년 3월 29일 진행됐으며, Alibaba의 Qwen3.5-35B-A3B 모델을 NVFP4로 양자화한 버전과, Ollama 0.18의 기존 Q4_K_M 양자화 구현을 비교했다. Ollama 0.19에서는 int4 양자화 기준 prefill 1851 token/s, decode 134 token/s까지 더 높은 성능이 예상된다고 밝혔다.

## NVFP4 지원: 더 높은 응답 품질과 프로덕션 환경 일관성

Ollama는 이제 NVIDIA의 NVFP4 포맷을 활용해 모델 정확도를 유지하면서도 추론 과정의 메모리 대역폭과 저장 요구량을 줄인다.

추론 사업자들이 NVFP4 포맷을 더 널리 채택할수록, Ollama 사용자도 프로덕션 환경과 더 유사한 결과를 로컬에서 얻을 수 있게 된다.

또한 NVIDIA의 model optimizer로 최적화된 모델도 Ollama에서 실행할 수 있는 길이 열렸다. 다른 정밀도 포맷도 Ollama의 리서치 및 하드웨어 파트너들의 설계와 사용 목적에 따라 추가될 예정이다.

## 더 빠른 응답을 위한 캐시 개선

Ollama의 캐시는 코딩 및 에이전트 작업에 더 효율적으로 대응하도록 업그레이드됐다.

- 메모리 사용량 감소: Claude Code 같은 도구에서 공유 시스템 프롬프트를 쓸 때, 대화 간 캐시를 재사용해 메모리 사용을 줄이고 cache hit를 높인다.
- Intelligent checkpoints: 프롬프트 안의 적절한 지점에 캐시 스냅샷을 저장해 프롬프트 처리량을 줄이고 응답 속도를 높인다.
- Smarter eviction: 오래된 브랜치가 제거되더라도 공유 prefix는 더 오래 유지된다.

## 시작 방법

Ollama 0.19를 다운로드한다.

이번 프리뷰 릴리스는 코딩 작업에 맞춰 샘플링 파라미터를 조정한 Qwen3.5-35B-A3B 모델을 가속한다.

32GB 이상의 통합 메모리를 가진 Mac을 사용할 것을 권장한다.

Claude Code:

`ollama launch claude --model qwen3.5:35b-a3b-coding-nvfp4`

OpenClaw:

`ollama launch openclaw --model qwen3.5:35b-a3b-coding-nvfp4`

일반 실행:

`ollama run qwen3.5:35b-a3b-coding-nvfp4`

## 향후 모델 지원

Ollama는 앞으로 더 많은 모델 아키텍처를 지원할 계획이다. 지원되는 아키텍처 위에서 파인튜닝된 사용자 정의 모델을 Ollama에 더 쉽게 가져오는 방법도 추가할 예정이며, 향후 지원 아키텍처 목록도 계속 확장할 것이라고 밝혔다.

## 감사의 말

- 뛰어난 가속 프레임워크를 만든 MLX 기여자 팀
- NVFP4 양자화, NVFP4 model optimizer, MLX CUDA 지원, Ollama 최적화 및 테스트에 기여한 NVIDIA 팀
- 로컬 프레임워크와 커뮤니티를 구축한 GGML & llama.cpp 팀
- 우수한 모델을 오픈소스로 공개하고 협업한 Alibaba Qwen 팀
