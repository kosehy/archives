# GitHub - safishamsi/graphify: AI coding assistant knowledge graph skill

Source: https://github.com/safishamsi/graphify
Saved: 2026-05-05

## Repository metadata

- Repository URL: https://github.com/safishamsi/graphify
- Description: AI coding assistant skill (Claude Code, Codex, OpenCode, Cursor, Gemini CLI, and more). Turn any folder of code, SQL schemas, R scripts, shell scripts, docs, papers, images, or videos into a queryable knowledge graph. App code + database schema + infrastructure in one graph.
- Primary language: Python
- Topics: antigravity, claude-code, codex, gemini, graphrag, knowledge-graph, leiden, openclaw, rag, skills, tree-sitter
- Default branch: v7
- License: MIT
- Stars: 42905
- Forks: 4689
- Open issues: 231
- Created at: 2026-04-03T15:49:07Z
- Updated at: 2026-05-05T09:00:10Z
- Pushed at: 2026-05-04T18:01:03Z
- Archived: False
- PyPI package: graphifyy
- PyPI version: 0.7.5
- Python requirement: >=3.10

## Source tree snapshot

- Total Git tree entries: 195
- Blob files: 175
- Total blob size: 2193428 bytes
- Tree truncated by GitHub API: False
- Top-level path entry counts: `tests` 67, `graphify` 35, `docs` 33, `worked` 30, `.` 8, `.github` 2
- Most common file extensions: `py` 72, `md` 62, `json` 9, `php` 5, `yml` 2, `svg` 2, `ts` 2, `f90` 2, `gitignore` 1, `[no extension]` 1, `toml` 1, `c` 1, `cpp` 1, `cs` 1, `ex` 1

## Recent releases

- v0.7.5 (2026-05-04T17:22:10Z)
- v0.7.4 (2026-05-04T11:40:44Z)
- v0.7.3 (2026-05-04T10:46:52Z)
- v0.7.2 (2026-05-04T10:17:18Z)
- v0.7.1 (2026-05-04T09:31:54Z)

## Recent default-branch CI runs

- CI: completed / success / 2026-05-04T18:01:06Z
- CI: completed / success / 2026-05-04T17:52:03Z
- CI: completed / success / 2026-05-04T17:51:20Z
- CI: completed / success / 2026-05-04T17:27:41Z
- CI: completed / success / 2026-05-04T17:27:37Z

## First 120 tree entries

- .github/FUNDING.yml (19 bytes)
- .github/workflows/ci.yml (842 bytes)
- .gitignore (376 bytes)
- AGENTS.md (411 bytes)
- ARCHITECTURE.md (3829 bytes)
- CHANGELOG.md (53393 bytes)
- LICENSE (1068 bytes)
- README.md (15462 bytes)
- SECURITY.md (3092 bytes)
- docs/docker-mcp-sqlite.md (5229 bytes)
- docs/how-it-works.md (4433 bytes)
- docs/logo-icon.svg (2001 bytes)
- docs/logo-text.svg (2373 bytes)
- docs/superpowers/plans/2026-05-04-incremental-updates-dedup.md (40697 bytes)
- docs/superpowers/specs/2026-05-04-incremental-updates-dedup-design.md (5746 bytes)
- docs/translations/README.ar-SA.md (12876 bytes)
- docs/translations/README.cs-CZ.md (5935 bytes)
- docs/translations/README.da-DK.md (5715 bytes)
- docs/translations/README.de-DE.md (13015 bytes)
- docs/translations/README.el-GR.md (7688 bytes)
- docs/translations/README.es-ES.md (11843 bytes)
- docs/translations/README.fi-FI.md (5963 bytes)
- docs/translations/README.fr-FR.md (11968 bytes)
- docs/translations/README.hi-IN.md (14967 bytes)
- docs/translations/README.hu-HU.md (6137 bytes)
- docs/translations/README.id-ID.md (5839 bytes)
- docs/translations/README.it-IT.md (6055 bytes)
- docs/translations/README.ja-JP.md (20455 bytes)
- docs/translations/README.ko-KR.md (20814 bytes)
- docs/translations/README.nl-NL.md (5787 bytes)
- docs/translations/README.no-NO.md (5703 bytes)
- docs/translations/README.pl-PL.md (5993 bytes)
- docs/translations/README.pt-BR.md (11584 bytes)
- docs/translations/README.ro-RO.md (5919 bytes)
- docs/translations/README.ru-RU.md (15133 bytes)
- docs/translations/README.sv-SE.md (5683 bytes)
- docs/translations/README.th-TH.md (8520 bytes)
- docs/translations/README.tr-TR.md (6007 bytes)
- docs/translations/README.uk-UA.md (7344 bytes)
- docs/translations/README.vi-VN.md (6424 bytes)
- docs/translations/README.zh-CN.md (15300 bytes)
- docs/translations/README.zh-TW.md (5607 bytes)
- graphify/**init**.py (1301 bytes)
- graphify/**main**.py (98899 bytes)
- graphify/analyze.py (22242 bytes)
- graphify/benchmark.py (4721 bytes)
- graphify/build.py (11575 bytes)
- graphify/cache.py (8343 bytes)
- graphify/cluster.py (6147 bytes)
- graphify/dedup.py (12301 bytes)
- graphify/detect.py (31146 bytes)
- graphify/export.py (47853 bytes)
- graphify/extract.py (189920 bytes)
- graphify/hooks.py (8879 bytes)
- graphify/ingest.py (10266 bytes)
- graphify/llm.py (19166 bytes)
- graphify/manifest.py (214 bytes)
- graphify/report.py (8641 bytes)
- graphify/security.py (8651 bytes)
- graphify/serve.py (20237 bytes)
- graphify/skill-aider.md (48572 bytes)
- graphify/skill-claw.md (48584 bytes)
- graphify/skill-codex.md (52860 bytes)
- graphify/skill-copilot.md (55179 bytes)
- graphify/skill-droid.md (52648 bytes)
- graphify/skill-kiro.md (48797 bytes)
- graphify/skill-opencode.md (56382 bytes)
- graphify/skill-pi.md (48797 bytes)
- graphify/skill-trae.md (51611 bytes)
- graphify/skill-vscode.md (8699 bytes)
- graphify/skill-windows.md (54237 bytes)
- graphify/skill.md (47796 bytes)
- graphify/transcribe.py (6319 bytes)
- graphify/tree_html.py (22884 bytes)
- graphify/validate.py (3308 bytes)
- graphify/watch.py (11874 bytes)
- graphify/wiki.py (8722 bytes)
- pyproject.toml (2535 bytes)
- tests/**init**.py (0 bytes)
- tests/bench_extract.py (4952 bytes)
- tests/fixtures/dynamic_import.ts (1057 bytes)
- tests/fixtures/extraction.json (1235 bytes)
- tests/fixtures/graphify-out/cache/4722d67ec49f51710650249b1f865b6a748d91fb6805f3d385a99143eb950fe7.json (2515 bytes)
- tests/fixtures/graphify-out/cache/6a640d202b5f9a6d68f7b5eb2c05e708d85ba9ee43ad0ff271badfc966a1c06c.json (2815 bytes)
- tests/fixtures/graphify-out/cache/a3c5220ed581781e1dc2f4e9a82eeee366881554ec9fce57823e124f7aecd348.json (4512 bytes)
- tests/fixtures/graphify-out/cache/f5916299213779311e7162e90a1613bca095b5372f5d269c5941b5237af2d020.json (2667 bytes)
- tests/fixtures/graphify-out/cache/f82cddb8aad2615e0381e57b80857edfd3345213967c815de87e09be80f9f12a.json (1329 bytes)
- tests/fixtures/sample.F90 (256 bytes)
- tests/fixtures/sample.c (518 bytes)
- tests/fixtures/sample.cpp (714 bytes)
- tests/fixtures/sample.cs (813 bytes)
- tests/fixtures/sample.ex (460 bytes)
- tests/fixtures/sample.f90 (757 bytes)
- tests/fixtures/sample.go (368 bytes)
- tests/fixtures/sample.java (663 bytes)
- tests/fixtures/sample.jl (461 bytes)
- tests/fixtures/sample.kt (588 bytes)
- tests/fixtures/sample.m (612 bytes)
- tests/fixtures/sample.md (204 bytes)
- tests/fixtures/sample.php (786 bytes)
- tests/fixtures/sample.ps1 (620 bytes)
- tests/fixtures/sample.py (132 bytes)
- tests/fixtures/sample.rb (359 bytes)
- tests/fixtures/sample.rs (539 bytes)
- tests/fixtures/sample.scala (520 bytes)
- tests/fixtures/sample.sql (417 bytes)
- tests/fixtures/sample.swift (1147 bytes)
- tests/fixtures/sample.ts (517 bytes)
- tests/fixtures/sample.zig (612 bytes)
- tests/fixtures/sample_calls.py (517 bytes)
- tests/fixtures/sample_php_config.php (381 bytes)
- tests/fixtures/sample_php_container.php (330 bytes)
- tests/fixtures/sample_php_listen.php (399 bytes)
- tests/fixtures/sample_php_static_prop.php (353 bytes)
- tests/test_analyze.py (9035 bytes)
- tests/test_benchmark.py (4561 bytes)
- tests/test_build.py (3229 bytes)
- tests/test_cache.py (4330 bytes)
- tests/test_chunking.py (16363 bytes)
- tests/test_claude_md.py (5191 bytes)

---

## README.md

<p align="center">
  <a href="https://graphifylabs.ai"><img src="https://raw.githubusercontent.com/safishamsi/graphify/v4/docs/logo-text.svg" width="260" height="64" alt="Graphify"/></a>
</p>

<p align="center">
  🇺🇸 <a href="README.md">English</a> | 🇨🇳 <a href="docs/translations/README.zh-CN.md">简体中文</a> | 🇯🇵 <a href="docs/translations/README.ja-JP.md">日本語</a> | 🇰🇷 <a href="docs/translations/README.ko-KR.md">한국어</a> | 🇩🇪 <a href="docs/translations/README.de-DE.md">Deutsch</a> | 🇫🇷 <a href="docs/translations/README.fr-FR.md">Français</a> | 🇪🇸 <a href="docs/translations/README.es-ES.md">Español</a> | 🇮🇳 <a href="docs/translations/README.hi-IN.md">हिन्दी</a> | 🇧🇷 <a href="docs/translations/README.pt-BR.md">Português</a> | 🇷🇺 <a href="docs/translations/README.ru-RU.md">Русский</a> | 🇸🇦 <a href="docs/translations/README.ar-SA.md">العربية</a> | 🇮🇹 <a href="docs/translations/README.it-IT.md">Italiano</a> | 🇵🇱 <a href="docs/translations/README.pl-PL.md">Polski</a> | 🇳🇱 <a href="docs/translations/README.nl-NL.md">Nederlands</a> | 🇹🇷 <a href="docs/translations/README.tr-TR.md">Türkçe</a> | 🇺🇦 <a href="docs/translations/README.uk-UA.md">Українська</a> | 🇻🇳 <a href="docs/translations/README.vi-VN.md">Tiếng Việt</a> | 🇮🇩 <a href="docs/translations/README.id-ID.md">Bahasa Indonesia</a> | 🇸🇪 <a href="docs/translations/README.sv-SE.md">Svenska</a> | 🇬🇷 <a href="docs/translations/README.el-GR.md">Ελληνικά</a> | 🇷🇴 <a href="docs/translations/README.ro-RO.md">Română</a> | 🇨🇿 <a href="docs/translations/README.cs-CZ.md">Čeština</a> | 🇫🇮 <a href="docs/translations/README.fi-FI.md">Suomi</a> | 🇩🇰 <a href="docs/translations/README.da-DK.md">Dansk</a> | 🇳🇴 <a href="docs/translations/README.no-NO.md">Norsk</a> | 🇭🇺 <a href="docs/translations/README.hu-HU.md">Magyar</a> | 🇹🇭 <a href="docs/translations/README.th-TH.md">ภาษาไทย</a> | 🇹🇼 <a href="docs/translations/README.zh-TW.md">繁體中文</a>
</p>

<p align="center">
  <a href="https://safishamsi.gumroad.com/l/qetvlo"><img src="https://img.shields.io/badge/Book-The%20Memory%20Layer-2ea44f?style=flat&logo=gitbook&logoColor=white" alt="The Memory Layer"/></a>
  <a href="https://github.com/safishamsi/graphify/actions/workflows/ci.yml"><img src="https://github.com/safishamsi/graphify/actions/workflows/ci.yml/badge.svg?branch=v7" alt="CI"/></a>
  <a href="https://pypi.org/project/graphifyy/"><img src="https://img.shields.io/pypi/v/graphifyy" alt="PyPI"/></a>
  <a href="https://pepy.tech/project/graphifyy"><img src="https://static.pepy.tech/badge/graphifyy" alt="Downloads"/></a>
  <a href="https://github.com/sponsors/safishamsi"><img src="https://img.shields.io/badge/sponsor-safishamsi-ea4aaa?logo=github-sponsors" alt="Sponsor"/></a>
  <a href="https://www.linkedin.com/in/safi-shamsi"><img src="https://img.shields.io/badge/LinkedIn-Safi%20Shamsi-0077B5?logo=linkedin" alt="LinkedIn"/></a>
</p>

<p align="center">
  <a href="https://star-history.com/#safishamsi/graphify&Date">
    <img src="https://api.star-history.com/svg?repos=safishamsi/graphify&type=Date" alt="Star History Chart" width="600"/>
  </a>
</p>

Type `/graphify` in your AI coding assistant and it maps your entire project — code, docs, PDFs, images, videos — into a knowledge graph you can query instead of grepping through files.

Works in Claude Code, Codex, OpenCode, Cursor, Gemini CLI, GitHub Copilot CLI, VS Code Copilot Chat, Aider, OpenClaw, Factory Droid, Trae, Hermes, Kiro, Pi, and Google Antigravity.

```
/graphify .
```

That's it. You get three files:

```
graphify-out/
├── graph.html       open in any browser — click nodes, filter, search
├── GRAPH_REPORT.md  the highlights: key concepts, surprising connections, suggested questions
└── graph.json       the full graph — query it anytime without re-reading your files
```

---

## Install

**Requires Python 3.10+**

```bash
uv tool install graphifyy && graphify install
# or: pipx install graphifyy && graphify install
# or: pip install graphifyy && graphify install
```

> **Official package:** The PyPI package is `graphifyy` (double-y). Other `graphify*` packages on PyPI are not affiliated. The CLI command is still `graphify`.

> **`graphify: command not found`?** Use `uv tool install graphifyy` or `pipx install graphifyy` — both put the CLI on PATH automatically. With plain `pip`, add `~/.local/bin` (Linux) or `~/Library/Python/3.x/bin` (Mac) to your PATH, or run `python -m graphify`.

### Pick your platform

| Platform                | Install command                        |
| ----------------------- | -------------------------------------- |
| Claude Code (Linux/Mac) | `graphify install`                     |
| Claude Code (Windows)   | `graphify install --platform windows`  |
| Codex                   | `graphify install --platform codex`    |
| OpenCode                | `graphify install --platform opencode` |
| GitHub Copilot CLI      | `graphify install --platform copilot`  |
| VS Code Copilot Chat    | `graphify vscode install`              |
| Aider                   | `graphify install --platform aider`    |
| OpenClaw                | `graphify install --platform claw`     |
| Factory Droid           | `graphify install --platform droid`    |
| Trae                    | `graphify install --platform trae`     |
| Trae CN                 | `graphify install --platform trae-cn`  |
| Gemini CLI              | `graphify install --platform gemini`   |
| Hermes                  | `graphify install --platform hermes`   |
| Kiro IDE/CLI            | `graphify kiro install`                |
| Pi coding agent         | `graphify install --platform pi`       |
| Cursor                  | `graphify cursor install`              |
| Google Antigravity      | `graphify antigravity install`         |

> Codex users: also add `multi_agent = true` under `[features]` in `~/.codex/config.toml`.
> Codex uses `$graphify` instead of `/graphify`.

---

## Make your assistant always use the graph

Run this once in your project after building a graph:

| Platform             | Command                        |
| -------------------- | ------------------------------ |
| Claude Code          | `graphify claude install`      |
| Codex                | `graphify codex install`       |
| OpenCode             | `graphify opencode install`    |
| GitHub Copilot CLI   | `graphify copilot install`     |
| VS Code Copilot Chat | `graphify vscode install`      |
| Aider                | `graphify aider install`       |
| OpenClaw             | `graphify claw install`        |
| Factory Droid        | `graphify droid install`       |
| Trae                 | `graphify trae install`        |
| Trae CN              | `graphify trae-cn install`     |
| Cursor               | `graphify cursor install`      |
| Gemini CLI           | `graphify gemini install`      |
| Hermes               | `graphify hermes install`      |
| Kiro IDE/CLI         | `graphify kiro install`        |
| Pi coding agent      | `graphify pi install`          |
| Google Antigravity   | `graphify antigravity install` |

This writes a small config file that tells your assistant to read `GRAPH_REPORT.md` before answering questions about your codebase. On platforms that support hooks (Claude Code, Codex, Gemini CLI), a hook fires automatically before every file-read call — your assistant navigates by the graph instead of grepping through everything.

Uninstall with the matching command (e.g. `graphify claude uninstall`).

---

## What's in the report

- **God nodes** — the most-connected concepts in your project. Everything flows through these.
- **Surprising connections** — links between things that live in different files or modules. Ranked by how unexpected they are.
- **The "why"** — inline comments (`# NOTE:`, `# WHY:`, `# HACK:`), docstrings, and design rationale from docs are extracted as separate nodes linked to the code they explain.
- **Suggested questions** — 4–5 questions the graph is uniquely positioned to answer.
- **Confidence tags** — every inferred relationship is marked `EXTRACTED`, `INFERRED`, or `AMBIGUOUS`. You always know what was found vs guessed.

---

## What files it handles

| Type                | Extensions                                                                                                                                                                  |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Code (26 languages) | `.py .ts .js .jsx .tsx .go .rs .java .c .cpp .rb .cs .kt .scala .php .swift .lua .zig .ps1 .ex .exs .m .jl .vue .svelte .sql .f .F .f90 .F90 .f95 .F95 .f03 .F03 .f08 .F08` |
| Docs                | `.md .mdx .html .txt .rst .yaml .yml`                                                                                                                                       |
| Office              | `.docx .xlsx` (requires `pip install graphifyy[office]`)                                                                                                                    |
| PDFs                | `.pdf`                                                                                                                                                                      |
| Images              | `.png .jpg .webp .gif`                                                                                                                                                      |
| Video / Audio       | `.mp4 .mov .mp3 .wav` and more (requires `pip install graphifyy[video]`)                                                                                                    |
| YouTube / URLs      | any video URL (requires `pip install graphifyy[video]`)                                                                                                                     |

Code is extracted locally with no API calls (AST via tree-sitter). Everything else goes through your AI assistant's model API.

---

## Common commands

```bash
/graphify .                        # build graph for current folder
/graphify ./docs --update          # re-extract only changed files
/graphify . --cluster-only         # rerun clustering without re-extracting
/graphify . --no-viz               # skip the HTML, just the report + JSON
/graphify . --wiki                 # build a markdown wiki from the graph

/graphify query "what connects auth to the database?"
/graphify path "UserService" "DatabasePool"
/graphify explain "RateLimiter"

/graphify add https://arxiv.org/abs/1706.03762   # fetch a paper and add it
/graphify add <youtube-url>                       # transcribe and add a video

graphify hook install              # auto-rebuild on git commit
graphify merge-graphs a.json b.json              # combine two graphs
```

See the [full command reference](#full-command-reference) below.

---

## Ignoring files

Create a `.graphifyignore` in your project root — same syntax as `.gitignore`, including `!` negation:

```
# .graphifyignore
node_modules/
dist/
*.generated.py

# only index src/, ignore everything else
*
!src/
!src/**
```

---

## Team setup

`graphify-out/` is meant to be committed to git so everyone on the team starts with a map.

**Recommended `.gitignore` additions:**

```
graphify-out/manifest.json    # mtime-based, breaks after git clone
graphify-out/cost.json        # local only
# graphify-out/cache/         # optional: commit for speed, skip to keep repo small
```

**Workflow:**

1. One person runs `/graphify .` and commits `graphify-out/`.
2. Everyone pulls — their assistant reads the graph immediately.
3. Run `graphify hook install` to auto-rebuild after each commit (AST only, no API cost). This also sets up a git merge driver so `graph.json` is never left with conflict markers — two devs committing in parallel get their graphs union-merged automatically.
4. When docs or papers change, run `/graphify --update` to refresh those nodes.

---

## Using the graph directly

```bash
# query the graph from the terminal
graphify query "show the auth flow"
graphify query "what connects DigestAuth to Response?" --graph graphify-out/graph.json

# expose the graph as an MCP server (for repeated tool-call access)
python -m graphify.serve graphify-out/graph.json
```

The MCP server gives your assistant structured access: `query_graph`, `get_node`, `get_neighbors`, `shortest_path`.

> **WSL / Linux note:** Ubuntu ships `python3`, not `python`. Use a venv to avoid conflicts:
>
> ```bash
> python3 -m venv .venv && .venv/bin/pip install "graphifyy[mcp]"
> ```

---

## Privacy

- **Code files** — processed locally via tree-sitter. Nothing leaves your machine.
- **Video / audio** — transcribed locally with faster-whisper. Nothing leaves your machine.
- **Docs, PDFs, images** — sent to your AI assistant for semantic extraction (via the `/graphify` skill, using whatever model your IDE session runs). Headless `graphify extract` requires `ANTHROPIC_API_KEY` (Claude) or `MOONSHOT_API_KEY` (Kimi). The `--dedup-llm` flag uses the same key.
- No telemetry, no usage tracking, no analytics.

---

## Full command reference

```
/graphify                          # run on current directory
/graphify ./raw                    # run on a specific folder
/graphify ./raw --mode deep        # more aggressive relationship extraction
/graphify ./raw --update           # re-extract only changed files
/graphify ./raw --directed         # preserve edge direction
/graphify ./raw --cluster-only     # rerun clustering on existing graph
/graphify ./raw --no-viz           # skip HTML visualization
/graphify ./raw --obsidian         # generate Obsidian vault
/graphify ./raw --wiki             # build agent-crawlable markdown wiki
/graphify ./raw --svg              # export graph.svg
/graphify ./raw --graphml          # export for Gephi / yEd
/graphify ./raw --neo4j            # generate cypher.txt for Neo4j
/graphify ./raw --neo4j-push bolt://localhost:7687
/graphify ./raw --watch            # auto-sync as files change
/graphify ./raw --mcp              # start MCP stdio server

/graphify add https://arxiv.org/abs/1706.03762
/graphify add <video-url>
/graphify add https://... --author "Name" --contributor "Name"

/graphify query "what connects attention to the optimizer?"
/graphify query "..." --dfs --budget 1500
/graphify path "DigestAuth" "Response"
/graphify explain "SwinTransformer"

graphify hook install              # post-commit + post-checkout hooks
graphify hook uninstall
graphify hook status

graphify claude install / uninstall
graphify codex install / uninstall
graphify opencode install
graphify cursor install / uninstall
graphify gemini install / uninstall
graphify copilot install / uninstall
graphify aider install / uninstall
graphify claw install / uninstall
graphify droid install / uninstall
graphify trae install / uninstall
graphify trae-cn install / uninstall
graphify hermes install / uninstall
graphify kiro install / uninstall
graphify antigravity install / uninstall

graphify extract ./docs                        # headless LLM extraction for CI (no IDE needed)
graphify extract ./docs --backend claude       # explicit backend: claude (ANTHROPIC_API_KEY) or kimi (MOONSHOT_API_KEY)
graphify extract ./docs --no-cluster           # raw extraction only, skip clustering
graphify extract ./docs --dedup-llm            # LLM tiebreaker for ambiguous entity pairs (uses same API key)

graphify clone https://github.com/karpathy/nanoGPT
graphify merge-graphs a.json b.json --out merged.json
graphify watch ./src
graphify check-update ./src
graphify update ./src
graphify cluster-only ./my-project
```

---

## Learn more

- [How it works](docs/how-it-works.md) — the extraction pipeline, community detection, confidence scoring, benchmarks
- [ARCHITECTURE.md](ARCHITECTURE.md) — module breakdown, how to add a language
- [Optional integrations](docs/docker-mcp-sqlite.md) — Docker MCP Toolkit + SQLite

---

## Built on graphify — Penpax

[**Penpax**](https://graphifylabs.ai) is the always-on layer built on top of graphify — it applies the same graph approach to your entire working life: meetings, browser history, emails, files, and code, updating continuously in the background.

Built for people whose work lives across hundreds of conversations and documents they can never fully reconstruct. No cloud, fully on-device.

**Free trial launching soon.** [Join the waitlist →](https://graphifylabs.ai)

---

<details>
<summary>Contributing</summary>

**Worked examples** are the most useful contribution. Run `/graphify` on a real corpus, save the output to `worked/{slug}/`, write an honest `review.md` covering what the graph got right and wrong, and open a PR.

**Extraction bugs** — open an issue with the input file, the cache entry (`graphify-out/cache/`), and what was missed or wrong.

See [ARCHITECTURE.md](ARCHITECTURE.md) for module responsibilities and how to add a language.

</details>
