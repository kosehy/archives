# 요약 — 2026년 4월 기준 Mac mini용 Ollama + Gemma 4 설정

## 핵심 포인트

이 문서는 Apple Silicon Mac mini에서 Ollama + Gemma 4를 **항상 바로 쓸 수 있는 상태**로 만들기 위한 실무 설정 메모다.

## 핵심 내용

- `brew install --cask ollama-app`으로 Ollama 앱을 설치한다.
- Ollama를 실행하고 `ollama list`로 서버를 확인한다.
- `gemma4`를 받아서 기본 `gemma4:latest` 모델을 사용한다.
- 24GB Mac mini에서는 26B보다 기본 8B 모델이 훨씬 실용적이라고 본다.
- launch agent로 주기적으로 `ollama run gemma4:latest`를 호출해 모델을 warm 상태로 유지한다.
- `OLLAMA_KEEP_ALIVE="-1"`로 모델 언로드를 막을 수 있다.
- `ollama ps`로 메모리 상주 여부와 CPU/GPU 사용 비율을 확인한다.
- `localhost:11434`의 로컬 API를 다른 도구나 코딩 에이전트와 연결할 수 있다.

## 한 줄 결론

결국 이 문서는 **로컬 Ollama를 늘 준비된 상태로 만들어 쓰는 레시피**이고, 가장 실용적인 조언은 24GB급 Mac mini에서는 무리해서 큰 모델보다 기본 Gemma 4 모델을 쓰라는 점이다.
