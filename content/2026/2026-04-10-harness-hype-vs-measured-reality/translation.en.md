# You have probably seen many claims that harnesses are important.

Original: https://www.linkedin.com/posts/kiwoong-yeom_%ED%95%98%EB%84%A4%EC%8A%A4%EA%B0%80-%EC%A4%91%EC%9A%94%ED%95%98%EB%8B%A4%EB%8A%94-%EC%9D%B4%EC%95%BC%EA%B8%B0%EB%A5%BC-%EB%A7%8E%EC%9D%B4-%EB%B3%B4%EC%85%A8%EC%9D%84-%EA%B2%81%EB%8B%88%EB%8B%A4-%ED%95%98%EC%A7%80%EB%A7%8C-%EA%B0%90%EC%97%90%EB%A7%8C-%EC%9D%98%EC%A1%B4%ED%95%9C-ugcPost-7447788990641995776-SrP6?utm_source=share&utm_medium=member_android&rcm=ACoAAAXt8v0BjTAFa8U2A--Uyng7OCcG4aSv6gE
Archived: 2026-04-10
Language: English
Type: English translation

This LinkedIn post pushes back against vague claims about harnesses by asking for measurable evidence. The author argues that people should distinguish between real gains in automation performance and inflated claims about model intelligence.

The post reviews three recent papers that offer numbers, concrete comparisons, and a more grounded view of what harnesses can and cannot do.

## 1. Meta-Harness: letting AI optimize the work environment itself

The first paper describes a system in which AI coding agents search and optimize the harness that humans would previously build by hand.

- In a text-classification setting, accuracy reportedly improved by 7.7 percentage points over the previous best result.
- Context token usage fell to one quarter of the earlier level.
- The best prior performance was matched in only four evaluations.
- The claimed reason for the improvement is that the system did not look only at scores, but directly opened prior agent traces from the filesystem and learned causal lessons from them.

## 2. Natural-Language Agent Harnesses: turning spaghetti code into readable instructions

The second paper describes making harness control logic explicit in natural language so that AI agents can read the rules directly.

- In OSWorld, success rates reportedly rose from 30.4% to 47.2%.
- But the trade-off was severe: token usage increased 13 times, LLM calls 12 times, and completion time 5 times.
- The post argues that clearer rules helped the agent shift away from unreliable trial-and-error toward more verifiable strategies such as shell usage and file manipulation.

## 3. ARC-AGI-3: exposing the limits of harness tricks

The final paper is not a harness proposal but a benchmark that challenges the idea that handcrafted harnesses should count as intelligence.

- In a 64x64 pixel-grid environment with no useful language or background knowledge, ordinary humans solved the tasks perfectly.
- Even advanced models such as Gemini 3.1 Pro Preview and GPT 5.4 reportedly scored below 0.37%.
- Handwritten code or multi-agent harnesses can solve the known public environment, but performance collapses on unfamiliar settings, showing overfitting rather than general intelligence.
- Search-heavy harnesses may still reach around 12% on hidden environments, but that remains far from human-level generalization.

## Closing point

The post concludes that harnesses are powerful tools for automation, cost optimization, and task performance, but they should not be mistaken for proof that model intelligence itself has fundamentally improved. According to this view, much of the apparent gain still comes from human-designed strategy and brute-force search, not from machine understanding alone.

The author suggests that the deeper goal should be better action efficiency and stronger adaptation to unfamiliar environments, possibly supported in part by reinforcement learning with verifiable rewards.
