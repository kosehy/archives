# Harness design for long-running application development

Source: https://www.anthropic.com/engineering/harness-design-long-running-apps
Saved: 2026-04-11

Written by Prithvi Rajasekaran, a member of our Labs team.

Over the past several months I’ve been working on two interconnected problems: getting Claude to produce high-quality frontend designs, and getting it to build complete applications without human intervention. This work originated with earlier efforts on our frontend design skill and long-running coding agent harness, where my colleagues and I were able to improve Claude’s performance well above baseline through prompt engineering and harness design, but both eventually hit ceilings.

To break through, I sought out novel AI engineering approaches that held across two quite different domains, one defined by subjective taste, the other by verifiable correctness and usability. Taking inspiration from Generative Adversarial Networks (GANs), I designed a multi-agent structure with a generator and evaluator agent. Building an evaluator that graded outputs reliably, and with taste, meant first developing a set of criteria that could turn subjective judgments like “is this design good?” into concrete, gradable terms.

I then applied these techniques to long-running autonomous coding, carrying over two lessons from our earlier harness work: decomposing the build into tractable chunks, and using structured artifacts to hand off context between sessions. The final result was a three-agent architecture, planner, generator, and evaluator, that produced rich full-stack applications over multi-hour autonomous coding sessions.

## Why naive implementations fall short

We've previously shown that harness design has a substantial impact on the effectiveness of long running agentic coding. In an earlier experiment, we used an initializer agent to decompose a product spec into a task list, and a coding agent that implemented the tasks one feature at a time before handing off artifacts to carry context across sessions. The broader developer community has converged on similar insights, with approaches like the "Ralph Wiggum" method using hooks or scripts to keep agents in continuous iteration cycles.

But some problems remained persistent. For more complex tasks, the agent still tends to go off the rails over time. While decomposing this issue, we observed two common failure modes with agents executing these sorts of tasks.

First is that models tend to lose coherence on lengthy tasks as the context window fills. Some models also exhibit "context anxiety," in which they begin wrapping up work prematurely as they approach what they believe is their context limit. Context resets, clearing the context window entirely and starting a fresh agent, combined with a structured handoff that carries the previous agent's state and the next steps, addresses both these issues.

This differs from compaction, where earlier parts of the conversation are summarized in place so the same agent can keep going on a shortened history. While compaction preserves continuity, it doesn't give the agent a clean slate, which means context anxiety can still persist. A reset provides a clean slate, at the cost of the handoff artifact having enough state for the next agent to pick up the work cleanly. In earlier testing, Claude Sonnet 4.5 exhibited context anxiety strongly enough that compaction alone wasn't sufficient to enable strong long task performance, so context resets became essential to the harness design. This solves the core issue, but adds orchestration complexity, token overhead, and latency to each harness run.

A second issue is self-evaluation. When asked to evaluate work they've produced, agents tend to confidently praise it even when, to a human observer, the quality is obviously mediocre. This is especially acute in subjective tasks like design, where there is no binary check equivalent to a verifiable software test. But even on tasks with verifiable outcomes, agents can show poor judgment that impedes performance. Separating the agent doing the work from the agent judging it is a strong lever. Tuning a standalone evaluator to be skeptical is much more tractable than making a generator critical of its own work.

## Frontend design: making subjective quality gradable

The author began with frontend design, where the self-evaluation problem was especially visible. Without intervention, Claude tended toward safe, predictable layouts that were functional but visually bland.

Two insights shaped the frontend harness:

1. Aesthetics cannot be fully reduced to a score, but they can be improved through grading criteria that encode design principles and preferences.
2. Separating frontend generation from frontend grading creates a feedback loop that can drive stronger outputs.

The harness used four criteria in both generator and evaluator prompts:

- Design quality
- Originality
- Craft
- Functionality

Design quality and originality were weighted more heavily, because Claude already did reasonably well by default on craft and functionality. The criteria explicitly penalized generic “AI slop” patterns.

The evaluator was calibrated with few-shot examples and used the Claude Agent SDK plus Playwright MCP to inspect and score live pages. Feedback from the evaluator flowed back to the generator across 5 to 15 iterations, sometimes over as long as four hours. In some cases, iterations produced sharp aesthetic leaps rather than just incremental refinements.

## Scaling to full-stack coding

The same generator evaluator loop was then adapted to full-stack application development.

### The architecture

Earlier long-running harnesses had used an initializer agent, a coding agent working one feature at a time, and context resets between sessions. In this newer harness, Opus 4.5 allowed the author to move to a three-agent structure:

- Planner: expands a short prompt into a fuller product spec while staying high-level and ambitious.
- Generator: implements one feature at a time in sprints using a React, Vite, FastAPI, and SQLite (later PostgreSQL) stack, self-evaluating after each sprint.
- Evaluator: uses Playwright MCP to click through the live app, test UI features, API endpoints, and database states, then grade each sprint against bugs found and criteria covering product depth, functionality, visual design, and code quality.

Before each sprint, the generator and evaluator negotiated a sprint contract defining what done meant and how success would be verified. Communication between agents was handled through files.

### Running the harness

In the first version of this harness, the author compared the full harness against a single-agent baseline using Claude Opus 4.5. One test prompt was to build a retro game maker.

The cost and runtime were dramatically different:

- Solo: 20 minutes, $9
- Full harness: 6 hours, $200

The harness run produced a much richer application, with a planner-expanded spec covering sixteen features across ten sprints, a stronger visual language, better editors, a Claude-powered in-app assistant, and a working play mode. The evaluator also caught concrete bugs against detailed sprint criteria, including failures in rectangle fill, entity deletion logic, and animation frame reorder API routing.

The author notes that getting the evaluator to this level required significant tuning. Out of the box, Claude was a poor QA agent, often noticing real issues and then excusing them anyway.

### Iterating on the harness

Because the first harness was bulky, slow, and expensive, the next step was simplification. The author emphasizes a general principle: every harness component encodes an assumption about what the model cannot yet do alone, and those assumptions should be stress-tested because they may be wrong or may become outdated as models improve.

A more methodical simplification process followed, removing one component at a time and testing the effect. The release of Opus 4.6 also changed the calculus, because it could plan better, sustain longer tasks, operate more reliably in larger codebases, and review and debug code more effectively.

### Removing the sprint construct

One major simplification was removing the sprint structure entirely. With Opus 4.6, the model could often handle the build coherently without decomposition into sprints.

The planner and evaluator were retained because they continued to add value. Without the planner, the generator tended to under-scope. Without the evaluator, some last-mile defects still slipped through, though the evaluator became less load-bearing for tasks that the stronger model could already handle solo.

This led to an important practical lesson: the evaluator is not a fixed yes-or-no choice. It is worth the cost when the task lies beyond what the current model can do reliably by itself.

The updated harness was tested on a browser-based digital audio workstation built with the Web Audio API. The run still took about 3 hours and 50 minutes and cost about $124.70. QA feedback continued to catch missing interactivity, stubbed features, and incomplete visual controls.

## What comes next

The author expects that as models improve, some scaffolding around them will matter less over time, but the opportunity space for new harnesses will also move rather than disappear. The recommendations are:

- Experiment directly with the model you are building against.
- Read traces on realistic problems.
- Tune performance toward desired outcomes.
- Decompose tasks and use specialized agents where useful.
- Revisit harnesses when new models arrive, removing no-longer-useful components and adding new ones where they create capability gains.

The concluding conviction is that the space of interesting harness combinations does not shrink as models improve. It shifts, and the job of the AI engineer is to keep finding the next useful combination.

## Appendix note

The original article includes a long appendix with an example plan generated by the planner agent for a product called RetroForge, a 2D retro game maker.
