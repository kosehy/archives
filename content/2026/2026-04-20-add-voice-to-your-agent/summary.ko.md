# 요약

Cloudflare는 Agents SDK에 실시간 STT와 TTS를 붙일 수 있는 실험적 voice pipeline을 소개합니다. 핵심은 음성을 별도 프레임워크로 분리하지 않고, 텍스트, 상태, 도구, 영속성을 함께 쓰는 동일한 에이전트의 또 다른 인터페이스로 다루자는 것입니다.

이 글은 voice를 더 큰 agent runtime의 일부로 위치시키면서, 텍스트와 음성의 상태 공유, 스트리밍 응답, 스케줄링, 도구 사용, Twilio 연동, 교체 가능한 provider 계층까지 함께 강조합니다.
