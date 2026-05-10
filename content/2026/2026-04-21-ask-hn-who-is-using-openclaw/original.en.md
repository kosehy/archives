# Ask HN: Who is using OpenClaw?

Source: https://news.ycombinator.com/item?id=47783940
Saved: 2026-04-21

This archive preserves the accessible portion of a Hacker News discussion asking who is actually using OpenClaw in practice.

The visible thread presents a mixed but concrete picture. Some participants describe genuine, ongoing usage, especially for personal-assistant workflows, memory management, health tracking, shopping lists, family archiving, and lightweight household coordination. Others remain skeptical, arguing that many such workflows would be better implemented as scripts, cron jobs, or narrower automation tools.

## Main themes visible in the accessible discussion

### 1. Personal assistant and memory workflows

Several users describe OpenClaw as a day-to-day personal assistant rather than a dramatic productivity multiplier. One recurring setup uses Markdown files or an Obsidian-style notes repository as memory, accessed through messaging interfaces like WhatsApp or Telegram. The key appeal is that memory stays in user-controlled files rather than being locked into one vendor’s app.

These users describe tasks such as:

- calorie, weight, and workout tracking
- to-do lists and reminders
- general life administration
- shopping-list and household coordination
- family-history capture and conversational archiving

The visible comments suggest that OpenClaw is often most valuable where natural language becomes a low-friction interface over already-structured personal systems.

### 2. Family archiving and consent

One especially memorable use case involves an OpenClaw bot in a family Telegram group that asks relatives for stories from their lives, documents them carefully, and uses those notes to ask more informed follow-up questions later. That project is described as building a multi-generational family history.

This use case produces a visible split in reaction. Some commenters think it is compelling and humane, especially as a way to preserve memory before it disappears. Others find it creepy or dehumanizing, especially if a machine is mediating intimate conversation. The thread then turns toward questions of intent, consent, transparency, and whether the bot clearly identifies itself as a bot.

### 3. Cost sensitivity

Costs are a repeated concern. One visible commenter says they stopped because OpenClaw cost around $3.50 per day, or roughly $100 per month. Another says earlier Claude Opus usage ran closer to $100–150 per month before switching to a Codex-backed setup closer to $20 per month.

The thread also includes discussion of model substitution, with users comparing Codex, MiniMax, GLM, Kimi, and other lower-cost options. This suggests that cost control is central to real-world OpenClaw viability.

### 4. Security and constrained action

At least some of the people who do use OpenClaw describe intentionally limiting its permissions. One commenter explicitly says they give it very little access and rely mostly on read-only skills. Another says they keep data collection outside the LLM by using separate scripts to push and pull data from external systems, reducing the need to give the model direct auth keys.

That pattern reflects a practical instinct visible across the discussion: OpenClaw may be useful, but only if carefully sandboxed and constrained.

### 5. OpenClaw versus scripts

A strong skeptical thread argues that many OpenClaw use cases collapse into things engineers could more cleanly implement with cron jobs, Playwright scripts, or custom automation. Some commenters explicitly say that every task they built with OpenClaw eventually seemed like it would work better as a script.

Another counterpoint appears alongside that criticism: perhaps OpenClaw is not mainly for people who are already highly skilled in deterministic scripting, but for users who want to automate things conversationally without building everything manually.

### 6. The real split may be between engineers and non-engineers

One visible interpretation in the thread is that OpenClaw feels most empowering to people who are not already strong programmers, because it gives them a way to automate tasks they otherwise could not automate at all. Skilled automation engineers, by contrast, tend to focus more on the failure modes, non-determinism, and risks, and therefore find the product less compelling.

That argument does not resolve the debate, but it gives the discussion a clearer frame: OpenClaw may not be judged by the same standard by two different groups.

## Overall visible conclusion

The accessible portion of the thread shows that real OpenClaw usage does exist, especially among people using it as a natural-language interface to personal systems, family memory, and recurring household tasks. But it also shows why adoption remains controversial: cost, security, fragility, and the constant question of whether a script would simply be better.

## Preservation note

This archive preserves only the accessible portion of the Hacker News thread visible through the current fetch path. The fetched discussion was truncated, so this archive reflects the visible segment rather than the full comment thread.
