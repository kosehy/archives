# Add voice to your agent

Source: https://blog.cloudflare.com/voice-agents/
Saved: 2026-04-20

Cloudflare introduces an experimental voice pipeline for its Agents SDK, aimed at making real-time voice interaction a native extension of the same agent architecture developers already use for text, tools, persistence, and Durable Objects.

The core argument is that adding voice should not require moving an existing agent into a separate voice framework. Instead, voice should become another interface to the same underlying agent, with the same state, tools, scheduling, and persistence model.

## What Cloudflare is releasing

The post announces `@cloudflare/voice`, an experimental package for the Agents SDK. According to the article, it includes:

- `withVoice(Agent)` for full conversational voice agents
- `withVoiceInput(Agent)` for speech-to-text-only use cases such as dictation or voice search
- `useVoiceAgent` and `useVoiceInput` hooks for React apps
- `VoiceClient` for framework-agnostic clients
- built-in Workers AI-based providers for speech-to-text and text-to-speech

The built-in stack specifically includes:

- continuous STT with Deepgram Flux
- continuous STT with Deepgram Nova 3
- TTS with Deepgram Aura

Cloudflare emphasizes that this is not meant to lock developers into one fixed stack. The provider interfaces are intentionally small so other speech, telephony, and transport providers can plug into the same architecture.

## Minimal server-side pattern

The article shows that a voice-enabled server can be created by wrapping an Agent class with `withVoice`, assigning a transcriber and TTS provider, and implementing `onTurn()`.

The simple example is intentionally short: once the agent receives a stable transcript from speech-to-text, `onTurn()` returns the response, which is then synthesized back into audio. Cloudflare frames this as a roughly 30-line server-side pattern.

## How the voice pipeline works

The post explains that the voice pipeline extends the Agents SDK model rather than replacing it. Since each agent is already a Durable Object with SQLite-backed state and WebSocket support, voice rides on top of that same model.

The flow is described in seven steps:

1. the browser captures microphone audio and streams PCM audio over the same WebSocket connection
2. the agent creates a continuous transcription session for the duration of the call
3. audio streams into the STT session continuously
4. the STT system itself decides when an utterance has finished and emits a stable transcript
5. the transcript is passed to `onTurn()`
6. the response is synthesized to audio and sent back to the client, with sentence chunking if the response is streamed
7. both sides of the conversation are persisted in SQLite so history survives reconnections and deployments

## Why Cloudflare thinks voice belongs inside the same agent system

A major theme of the article is that real agents eventually need more than the speech loop itself. They need state, tools, workflows, scheduling, persistence, and multi-channel consistency. Cloudflare argues that voice should therefore grow inside the same agent platform rather than being handled by a separate specialized stack that later needs to be integrated back into the application.

The post also argues that text and voice should share the same state. A user may move between typed interaction and voice interaction, but both should feed into the same conversation history and tool environment.

## Latency story

Cloudflare presents lower latency as partly a network-architecture problem, not just a model-speed problem. By keeping the agent and the built-in STT/TTS providers on Cloudflare’s own infrastructure, the company argues it can reduce round trips between otherwise separate services.

The article also highlights streaming as a key factor in good voice UX. If `onTurn()` returns a stream, the system can begin speech synthesis sentence by sentence rather than waiting for the full response, reducing time-to-first-audio.

## More advanced examples

The article then expands into richer patterns:

- a backend example that streams an LLM response and speaks it back sentence by sentence
- `withVoiceInput` for transcription-first use cases without spoken responses
- shared text and voice interaction on the same connection
- call-start greetings via `onCallStart`
- scheduling spoken reminders
- LLM tool use inside voice turns
- runtime switching between speech models such as Flux and Nova 3
- pipeline hooks for post-transcription or pre-synthesis processing

These examples are meant to show that voice is not a separate product category but simply another capability layer within the broader agent runtime.

## Telephone support

The article also mentions Twilio integration through a Twilio adapter so the same agent can handle phone calls, not just browser WebSocket sessions.

## Preservation note

This archive preserves the accessible portion of the Cloudflare blog post through the current fetch path. The fetched text was truncated near the end, so this archive reflects the visible main portion rather than the full article.
