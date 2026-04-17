# Introducing Claude Opus 4.7

Source: https://www.anthropic.com/news/claude-opus-4-7
Saved: 2026-04-17

Anthropic says Claude Opus 4.7 is now generally available and describes it as a notable improvement over Opus 4.6, especially for advanced software engineering and difficult long-running tasks.

According to the announcement, users report being able to hand off harder coding work to Opus 4.7 with greater confidence. Anthropic says the model handles complex multi-step work with more rigor and consistency, pays closer attention to instructions, and is better at devising ways to verify its own outputs before reporting back.

The announcement also says Opus 4.7 has substantially better vision, can work with higher-resolution images, and is more tasteful and creative on professional tasks such as interfaces, slides, and documents. Anthropic notes that Opus 4.7 is still less broadly capable than Claude Mythos Preview, but says it outperforms Opus 4.6 on a range of benchmarks.

## Cybersecurity positioning and safeguards

Anthropic ties the release to its earlier Project Glasswing announcement. It says Mythos Preview will remain more restricted for now, and that Opus 4.7 is the first model being released with new cybersecurity safeguards that automatically detect and block requests indicating prohibited or high-risk cyber uses.

The company says it experimented during training with ways to differentially reduce Opus 4.7’s cyber capabilities compared with Mythos Preview. It also invites legitimate security professionals doing tasks such as vulnerability research, penetration testing, and red-teaming to apply to a Cyber Verification Program.

## Availability and pricing

Anthropic says Opus 4.7 is available across Claude products, the API, Amazon Bedrock, Google Cloud Vertex AI, and Microsoft Foundry. Pricing is unchanged from Opus 4.6 at $5 per million input tokens and $25 per million output tokens.

## Early tester claims

The announcement is heavily supported by quotes from early-access testers. Across those testimonials, the recurring claims are:

- stronger coding performance on difficult multi-step tasks
- better long-horizon autonomy
- better instruction following
- fewer tool errors
- better honesty about missing data or model limits
- better multimodal understanding for high-resolution visual material
- stronger performance in asynchronous workflows, agents, code review, and enterprise document analysis

The post includes endorsements from a wide range of companies and products, including financial technology, research agents, developer tools, code review, dashboards, legal tooling, enterprise document analysis, and autonomous penetration testing.

## Notes from Anthropic’s own testing

Anthropic highlights several internal observations from pre-release testing:

- Opus 4.7 is substantially better at following instructions, sometimes to the point that prompts written for earlier models may need retuning because older prompts relied on loose interpretation.
- The model supports much higher-resolution image inputs, up to 2,576 pixels on the long edge, which Anthropic says is more than triple prior Claude models.
- Anthropic says Opus 4.7 performs better on real-world finance analysis, more professional presentations, and agentic reasoning over data.
- The company also says Opus 4.7 is better at file-system-based memory, carrying important notes across long multi-session work.

## Safety and alignment

Anthropic says overall safety looks similar to Opus 4.6, with low rates of concerning behavior such as deception, sycophancy, and cooperation with misuse. It says Opus 4.7 is somewhat better on some measures, such as honesty and resistance to prompt injection, though slightly weaker on others, such as giving overly detailed harm-reduction advice on controlled substances.

Anthropic’s alignment assessment describes the model as largely well-aligned and trustworthy, though not fully ideal in its behavior. It also says Mythos Preview remains the best-aligned model it has trained by its own evaluation.

## Preservation note

This archive preserves the accessible Anthropic announcement text available through the current fetch path. It does not preserve charts, images, or later edits beyond the captured text.
