# 에이전트에 음성을 추가하기

원문: https://blog.cloudflare.com/voice-agents/
저장일: 2026-04-20
번역 메모: 현재 접근 가능한 본문 기준으로 자연스럽게 옮긴 번역본.

Cloudflare는 Agents SDK에 실시간 음성 상호작용을 붙일 수 있는 실험적 voice pipeline을 공개했다. 목표는 개발자가 이미 텍스트, 도구, 영속성, Durable Object 기반으로 쓰고 있는 동일한 에이전트 아키텍처를 그대로 유지하면서 음성을 추가할 수 있게 하는 것이다.

이 글의 핵심 주장은 음성을 붙이기 위해 기존 에이전트를 별도의 voice framework로 옮길 필요가 없어야 한다는 점이다. 대신 음성은 동일한 에이전트에 접근하는 또 하나의 인터페이스가 되어야 하며, 상태, 도구, 스케줄링, 영속성 모델도 그대로 공유해야 한다는 것이다.

## Cloudflare가 내놓은 것

이 글은 Agents SDK용 실험 패키지 `@cloudflare/voice`를 소개한다. 글에 따르면 이 패키지에는 다음이 포함된다.

- 완전한 대화형 voice agent를 위한 `withVoice(Agent)`
- 받아쓰기나 음성 검색 같은 speech-to-text 전용 용도의 `withVoiceInput(Agent)`
- React 앱용 `useVoiceAgent`, `useVoiceInput` hook
- 프레임워크에 종속되지 않는 `VoiceClient`
- Workers AI 기반의 내장 STT/TTS provider

내장 스택에는 특히 다음이 포함된다고 설명한다.

- Deepgram Flux 기반 연속 STT
- Deepgram Nova 3 기반 연속 STT
- Deepgram Aura 기반 TTS

Cloudflare는 이것을 하나의 고정된 스택에 묶어두려는 목적이 아니라고 강조한다. provider interface를 작게 설계해, 다른 speech, telephony, transport provider도 같은 아키텍처에 붙을 수 있게 하려는 의도라는 것이다.

## 최소 서버 패턴

이 글은 `withVoice`로 Agent 클래스를 감싸고, transcriber와 TTS provider를 지정한 뒤 `onTurn()`만 구현하면 음성 에이전트 서버를 만들 수 있다고 설명한다.

가장 단순한 예제는 매우 짧다. speech-to-text가 안정적인 transcript를 만들면 `onTurn()`이 응답을 반환하고, 그 응답이 다시 음성으로 합성되어 클라이언트로 돌아간다. Cloudflare는 이를 대략 30줄 안팎의 서버 패턴으로 설명한다.

## voice pipeline이 동작하는 방식

이 글은 voice pipeline이 Agents SDK 모델을 대체하는 것이 아니라 확장한다고 설명한다. 각 에이전트는 이미 SQLite-backed state와 WebSocket을 가진 Durable Object이기 때문에, voice는 그 위에 그대로 얹히는 구조다.

글은 흐름을 7단계로 설명한다.

1. 브라우저가 마이크 오디오를 잡아 같은 WebSocket 연결 위로 PCM 오디오를 스트리밍한다
2. 에이전트는 통화가 지속되는 동안 유지되는 continuous transcription session을 만든다
3. 오디오는 그 세션에 계속 들어간다
4. STT 시스템이 사용자의 발화가 끝났는지 판단해 안정적인 transcript를 내보낸다
5. 그 transcript가 `onTurn()`으로 전달된다
6. 응답은 음성으로 합성되어 클라이언트로 돌아가며, 스트리밍 응답일 경우 문장 단위로 잘라 먼저 보낼 수 있다
7. 사용자와 에이전트 메시지는 SQLite에 저장되어 재연결이나 배포 이후에도 기록이 유지된다

## 왜 Cloudflare는 음성이 같은 에이전트 시스템 안에 있어야 한다고 보는가

이 글의 큰 주제 중 하나는 실제 에이전트가 결국 speech loop 그 이상을 필요로 한다는 점이다. 상태, 도구, 워크플로, 스케줄링, 영속성, 멀티채널 일관성까지 필요하기 때문에, 음성은 별도 스택이 아니라 같은 에이전트 플랫폼 안에서 자라야 한다는 주장이다.

또한 텍스트와 음성이 같은 상태를 공유해야 한다고 말한다. 사용자는 타이핑에서 음성으로, 다시 텍스트로 이동할 수 있지만, 모두 같은 대화 이력과 도구 환경으로 들어가야 한다는 것이다.

## 지연시간에 대한 설명

Cloudflare는 낮은 latency가 단순히 모델 속도 문제가 아니라 네트워크 아키텍처 문제이기도 하다고 설명한다. 에이전트와 내장 STT/TTS provider를 모두 Cloudflare 인프라 안에 두면, 서로 다른 서비스 사이를 오가는 왕복 비용을 줄일 수 있다는 주장이다.

또한 좋은 voice UX에는 streaming이 중요하다고 강조한다. `onTurn()`이 stream을 반환하면 전체 응답을 기다리지 않고 문장 단위로 먼저 음성 합성을 시작할 수 있어, time-to-first-audio를 줄일 수 있다는 설명이다.

## 더 고급 예시들

이후 글은 더 풍부한 패턴으로 확장한다.

- LLM 응답을 stream으로 생성하고 문장 단위로 읽어주는 backend 예시
- spoken response 없이 transcription 중심으로 쓰는 `withVoiceInput`
- 같은 연결에서 text와 voice를 함께 다루는 방식
- `onCallStart`를 이용한 통화 시작 인사
- spoken reminder scheduling
- voice turn 안에서 LLM tool 사용
- Flux와 Nova 3 같은 STT 모델의 runtime switching
- transcription 이후나 synthesis 이전에介입할 수 있는 pipeline hook

이 예시들은 voice가 별도 제품군이 아니라 더 큰 agent runtime의 capability layer일 뿐이라는 점을 보여주려는 것이다.

## 전화 지원

이 글은 Twilio adapter를 통해 같은 에이전트를 브라우저 WebSocket 세션뿐 아니라 전화 통화에도 연결할 수 있다고도 설명한다.

## 보존 메모

이 아카이브는 현재 fetch 경로에서 접근 가능한 Cloudflare 블로그 글의 본문을 기준으로 보존한 것이다. 가져온 텍스트가 끝부분에서 잘렸기 때문에, 전체 글이 아니라 현재 보이는 주요 부분만 반영했다.
