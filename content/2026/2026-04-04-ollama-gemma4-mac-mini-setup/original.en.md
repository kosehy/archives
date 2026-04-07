# April 2026 TLDR setup for Ollama + Gemma 4 12B on a Mac mini (Apple Silicon) — auto-start, preload, and keep-alive

Source: https://share.google/BPBBQOCf3HOaoSuJO
Final source: https://gist.github.com/greenstevester/fc49b4e60a4fef9effc79066c1033ae5
Archived: 2026-04-04
Language: English
Type: Practical setup note / GitHub Gist

## Scope

- Mac mini with Apple Silicon (M1/M2/M3/M4/M5)
- At least 16GB unified memory for Gemma 4
- macOS with Homebrew installed

## Install Ollama app

Install the Ollama macOS app via Homebrew cask:

```bash
brew install --cask ollama-app
```

This installs:

- Ollama.app in `/Applications/`
- `ollama` CLI at `/opt/homebrew/bin/ollama`

Launch it:

```bash
open -a Ollama
```

The Ollama icon should appear in the menu bar. Wait a few seconds for the server to initialize.

Verify it is running:

```bash
ollama list
```

## Pull Gemma 4

```bash
ollama pull gemma4
```

This downloads about 9.6GB.

Verify:

```bash
ollama list
# NAME ID SIZE MODIFIED
# gemma4:latest ... 9.6 GB ...
```

## Model sizing note

The note explains that `gemma4:26b` was originally tested, but on a 24GB Mac mini it consumed nearly all unified memory, left the system barely responsive, and caused frequent swapping under concurrent requests.

The recommended setup therefore downgrades to the default `gemma4:latest` model (8B, `Q4_K_M` quantization, about 9.6GB), which runs with much more usable headroom.

Quick test:

```bash
ollama run gemma4:latest "Hello, what model are you?"
```

Check GPU acceleration:

```bash
ollama ps
# Should show CPU/GPU split, e.g. 14%/86% CPU/GPU
```

## Enable launch at login

Enable launch at login from the menu bar app, or add Ollama through:

- System Settings
- General
- Login Items

## Preload and keep the model warm

Create a launch agent that loads the model after Ollama starts and keeps it warm:

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

Load the agent:

```bash
launchctl load ~/Library/LaunchAgents/com.ollama.preload-gemma4.plist
```

This sends an empty prompt to `ollama run` every 5 minutes, which keeps the model warm in memory.

## Keep models loaded forever

By default, Ollama unloads models after 5 minutes of inactivity. To keep them loaded indefinitely:

```bash
launchctl setenv OLLAMA_KEEP_ALIVE "-1"
```

Then restart Ollama.

The note adds that this environment variable is session-scoped. To persist across reboots, add:

```bash
export OLLAMA_KEEP_ALIVE="-1"
```

to `~/.zshrc`, or set it via a dedicated launch agent.

## Verification checks

Check server status:

```bash
ollama list
```

Check whether the model is loaded in memory:

```bash
ollama ps
```

Check the launch agent:

```bash
launchctl list | grep ollama
```

Expected `ollama ps` style output:

```text
NAME ID SIZE PROCESSOR CONTEXT UNTIL
gemma4:latest ... 9.6 GB 14%/86% CPU/GPU 4096 Forever
```

## Local API

Ollama exposes a local API at `http://localhost:11434`.

Example chat completion request:

```bash
curl http://localhost:11434/v1/chat/completions \
 -H "Content-Type: application/json" \
 -d '{
 "model": "gemma4:latest",
 "messages": [{"role": "user", "content": "Hello"}]
 }'
```

## Useful commands

| Command | Description |
|---|---|
| `ollama list` | List downloaded models |
| `ollama ps` | Show running models and memory usage |
| `ollama run gemma4:latest` | Interactive chat |
| `ollama stop gemma4:latest` | Unload model from memory |
| `ollama pull gemma4:latest` | Update model to latest version |
| `ollama rm gemma4:latest` | Delete model |

## Cleanup

Remove the preload agent:

```bash
launchctl unload ~/Library/LaunchAgents/com.ollama.preload-gemma4.plist
rm ~/Library/LaunchAgents/com.ollama.preload-gemma4.plist
```

Uninstall Ollama:

```bash
brew uninstall --cask ollama-app
```

## Additional notes

The gist states that on Apple Silicon, Ollama automatically uses Apple’s MLX framework for faster inference, with no manual configuration needed.

It also mentions:

- M5 / M5 Pro / M5 Max chips gaining additional acceleration via GPU Neural Accelerators
- M4 and earlier still benefiting from general MLX speedups
- newer inference optimizations such as NVFP4-related support
- cache reuse across conversations
- intelligent cache checkpoints
- smarter shared-prefix eviction

## Practical memory guidance

- Gemma 4 default 8B uses about 9.6GB when loaded.
- On a 24GB Mac mini, that leaves roughly 14GB for the system.
- The 26B variant uses around 17GB, leaving too little headroom for comfortable multitasking.

## Linked references

- Ollama MLX Blog Post — March 31, 2026
- Ollama v0.20.0 Release
- Gemma 4 Announcement — Google DeepMind

## Notes on preservation

- The title mentions Gemma 4 12B, but the body strongly recommends the default `gemma4:latest` setup instead.
- This preserved version focuses on the practical setup flow and the reasoning behind the memory trade-off.
