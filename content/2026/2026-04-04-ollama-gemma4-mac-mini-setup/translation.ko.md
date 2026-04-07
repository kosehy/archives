# 2026년 4월 기준 Mac mini(Apple Silicon)에서 Ollama + Gemma 4 설정 TL;DR — 자동 시작, preload, keep-alive

- 원문: https://share.google/BPBBQOCf3HOaoSuJO
- 최종 출처: https://gist.github.com/greenstevester/fc49b4e60a4fef9effc79066c1033ae5
- 아카이브일: 2026-04-04
- 언어: 한국어
- 문서 유형: 실무 설정 메모 / GitHub Gist

## 개요

이 문서는 Apple Silicon 기반 Mac mini에서 Ollama와 Gemma 4를 실사용 가능한 상태로 세팅하는 빠른 요약이다. 핵심은 세 가지다.

- Ollama 앱을 설치해 자동 시작되게 만들기
- `gemma4:latest`를 미리 메모리에 올려두기
- keep-alive를 걸어 모델이 자주 내려가지 않게 하기

흥미로운 점은 제목에 Gemma 4 12B가 들어가 있지만, 본문에서 실제로 권장하는 구성은 **기본 `gemma4:latest`(8B)** 쪽이라는 것이다. 이유는 메모리 여유 때문이다.

## 요구 조건

- Apple Silicon Mac mini (M1/M2/M3/M4/M5)
- 최소 16GB 통합 메모리
- Homebrew가 설치된 macOS

## 1. Ollama 설치

Homebrew cask로 Ollama macOS 앱을 설치한다.

```bash
brew install --cask ollama-app
```

이렇게 하면:

- `/Applications/` 아래에 `Ollama.app`
- `/opt/homebrew/bin/ollama`에 CLI

가 설치된다.

앱 실행:

```bash
open -a Ollama
```

메뉴 바에 아이콘이 뜨고 서버가 초기화되면, 아래로 확인한다.

```bash
ollama list
```

## 2. Gemma 4 받기

```bash
ollama pull gemma4
```

다운로드 용량은 약 9.6GB다.

확인:

```bash
ollama list
```

간단 테스트:

```bash
ollama run gemma4:latest "Hello, what model are you?"
```

GPU 가속 확인:

```bash
ollama ps
```

예시처럼 CPU/GPU 비율이 보이면 된다.

## 3. 왜 26B가 아니라 기본 모델인가

문서에서 원래 `gemma4:26b`를 돌려봤지만, 24GB Mac mini에서는 통합 메모리를 거의 다 먹어서 시스템 반응성이 크게 떨어지고 동시 요청 시 스와핑이 심해졌다고 설명한다.

그래서 최종 권장 구성은:

- `gemma4:latest`
- 8B
- `Q4_K_M`
- 약 9.6GB 사용

이다.

이 구성이면 24GB 머신 기준으로 시스템 쪽에 대략 14GB 안팎의 여유가 남아 훨씬 실용적이라는 판단이다.

## 4. 로그인 시 자동 시작

Ollama 메뉴 바 아이콘에서 **Launch at Login**을 켜거나,

- System Settings
- General
- Login Items

에서 직접 추가할 수 있다.

## 5. 모델 preload / warm 유지

문서의 핵심 실무 팁은 launch agent를 하나 만들어 주기적으로 `ollama run gemma4:latest`를 호출해 모델을 따뜻하게 유지하는 것이다.

생성 예시는 다음과 같다.

```bash
cat << 'EOF' > ~/Library/LaunchAgents/com.ollama.preload-gemma4.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
 <key>Label</key>
 <string>com.ollama.preload-gemma4</string>
 <key>ProgramArguments</key>
 <array>
 <string>/opt/homebrew/bin/ollama</string>
 <string>run</string>
 <string>gemma4:latest</string>
 <string></string>
 </array>
 <key>RunAtLoad</key>
 <true/>
 <key>StartInterval</key>
 <integer>300</integer>
 <key>StandardOutPath</key>
 <string>/tmp/ollama-preload.log</string>
 <key>StandardErrorPath</key>
 <string>/tmp/ollama-preload.log</string>
</dict>
</plist>
EOF
```

불러오기:

```bash
launchctl load ~/Library/LaunchAgents/com.ollama.preload-gemma4.plist
```

이렇게 하면 5분마다 빈 프롬프트 요청을 보내 모델이 메모리에 남아 있게 한다.

## 6. keep-alive를 영구로

기본적으로 Ollama는 일정 시간 비활성 상태가 되면 모델을 내린다. 이를 막으려면:

```bash
launchctl setenv OLLAMA_KEEP_ALIVE "-1"
```

을 설정하고 Ollama를 재시작한다.

문서에서는 이 값이 세션 단위이므로, 재부팅 뒤에도 유지하려면:

```bash
export OLLAMA_KEEP_ALIVE="-1"
```

를 `~/.zshrc`에 넣거나 별도 launch agent로 관리하라고 덧붙인다.

## 7. 점검 포인트

서버 상태:

```bash
ollama list
```

모델이 메모리에 올라와 있는지:

```bash
ollama ps
```

launch agent 등록 여부:

```bash
launchctl list | grep ollama
```

문서가 제시한 기대 상태는 대략 이런 식이다.

```text
gemma4:latest ... 9.6 GB 14%/86% CPU/GPU 4096 Forever
```

## 8. 로컬 API 사용

Ollama는 `http://localhost:11434`에서 로컬 API를 연다. 예시로 OpenAI 호환 chat completion 호출도 보여준다.

```bash
curl http://localhost:11434/v1/chat/completions \
 -H "Content-Type: application/json" \
 -d '{
 "model": "gemma4:latest",
 "messages": [{"role": "user", "content": "Hello"}]
 }'
```

즉, 코딩 에이전트나 다른 로컬 도구와 붙여 쓰기 좋다.

## 9. 자주 쓰는 명령

- `ollama list` — 받은 모델 목록
- `ollama ps` — 현재 실행 모델 / 메모리 사용량
- `ollama run gemma4:latest` — 대화 실행
- `ollama stop gemma4:latest` — 메모리에서 언로드
- `ollama pull gemma4:latest` — 최신 버전 갱신
- `ollama rm gemma4:latest` — 모델 삭제

## 10. 정리 / 제거

preload agent 제거:

```bash
launchctl unload ~/Library/LaunchAgents/com.ollama.preload-gemma4.plist
rm ~/Library/LaunchAgents/com.ollama.preload-gemma4.plist
```

Ollama 제거:

```bash
brew uninstall --cask ollama-app
```

## 추가 메모

문서는 Apple Silicon에서 Ollama가 자동으로 MLX를 사용한다고 설명한다. 별도 수동 설정은 필요 없고, 칩 세대에 따라 더 빠른 가속 혜택을 받을 수 있다고 본다.

또 캐시 재사용, 체크포인트, prefix eviction 개선 같은 최근 inference 최적화 포인트도 짧게 언급한다.

## 핵심 결론

이 메모의 실질적인 결론은 아주 단순하다.

- 24GB Mac mini 기준으로는 26B보다 기본 8B가 훨씬 실용적이다.
- Ollama는 앱 자동 시작 + preload agent + keep-alive 조합으로 쓰면 훨씬 안정적이다.
- 로컬 API까지 열어두면 로컬 코딩/에이전트 워크플로에 바로 붙일 수 있다.

## 보존 메모

- 제목과 달리 본문 실질 권장안은 `gemma4:latest` 중심이다.
- 이번 보존본은 실무 설정 흐름과 메모리 판단 포인트를 읽기 좋게 정리하는 데 초점을 맞췄다.
