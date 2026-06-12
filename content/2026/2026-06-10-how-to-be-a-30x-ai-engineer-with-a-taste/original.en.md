# How to Be a 30x AI Engineer with a Taste

Source: https://pakodas.substack.com/p/how-to-be-a-30x-ai-engineer-with-a-taste
Saved: 2026-06-10

![Cover image](images/cover.jpg)

A different kind of engineer is becoming disproportionately valuable. And almost nobody can precisely explain why.

The word that keeps coming up is “taste.”

Emma Tang, head of data infrastructure at OpenAI, [said it directly](https://newsletter.pragmaticengineer.com/p/how-codex-is-built): “Everybody can be a 10x engineer now, as long as you have people with good software taste.” Tibo, the head of Codex, said the most successful engineers on his team “spend a lot more time thinking about their users” and “need their own compass.” SQ Mah, a researcher training the models that power Codex, put it this way: “Humans create the need for systems. Models excel with context, but humans define evolution.”

Three people at the same company. All independently arrived at the same conclusion. The differentiator is not speed, not knowledge, not even experience. It’s taste.

But when you push anyone to define taste, they get vague. It becomes one of those words like “culture” or “leadership” where everyone agrees it matters and nobody agrees on what it actually is. That vagueness is expensive. If you can’t define taste, you can’t develop it deliberately. And if you can’t develop it deliberately, you’re hoping it arrives through osmosis, which is another way of saying you’re hoping to get lucky.

This post is an attempt to make taste concrete. What it actually is, why it’s suddenly the most valuable skill in engineering, how to develop it on purpose, and what to build with it.

## The World Changed. Most Engineers Didn’t Notice.

Let’s start with what happened.

Recently [Gergely Orosz wrote](https://newsletter.pragmaticengineer.com/p/when-ai-writes-almost-all-code-what) about a prediction Anthropic’s CEO Dario Amodei made in March 2025: that AI would be writing 90% of code within months. At the time, it sounded ridiculous. By December, the creator of Claude Code, Boris Cherny, reported that 100% of his committed code that month was AI-written. He hadn’t opened an IDE at all.

Andrej Karpathy, who in October 2025 called AI coding tools “slop,” reversed his position entirely by December. His new take: “I’ve never felt this much behind as a programmer. The profession is being dramatically refactored.” DHH, the creator of Ruby on Rails, admitted his resistance to AI was partly because “the models weren’t good enough. That has now flipped.” Malte Ubl, CTO at Vercel, built two major open-source projects over the holidays and said plainly: “The cost of software production is trending towards zero.”

The models got dramatically better between November and December 2025. Opus 4.5, GPT-5.2, and Gemini 3 crossed an invisible capability line. Suddenly, for a wide range of programming tasks, AI-generated code was as good as what experienced engineers would write by hand. And it took minutes instead of hours.

So if code generation is approaching commodity, what’s left?

Everything else.

The “everything else” is what we’ve always called software engineering, as distinct from coding. Breaking down complex problems. Deciding what to build. Architecting for testability, reliability, and scale. Understanding the user well enough to make the right tradeoffs. Knowing when something is good enough to ship and when it needs more work. Recognizing when a system is clean versus when it’s a time bomb waiting to detonate under load.

That’s taste. And it turns out it’s the part that matters most.

## What Taste Actually Is

I’ve been studying how the best engineering teams talk about taste, and there are three distinct definitions floating around. They sound different but they describe the same underlying capability seen from different angles.

#

## Taste as recognition

This is the most intuitive form. You look at two implementations and you can feel which one is better before you can explain why. Emma Tang described it this way: “It’s a matter of taste as to whether a system is actually really clean, scalable, and not duplicative. Is it simple to understand?”

This is the chef who tastes a sauce and knows it needs acid, even before consciously identifying the missing ingredient. The recognition comes before the explanation. You’ve seen enough good and bad systems that your pattern-matching runs faster than your conscious reasoning.

A concrete example from the [Codex deep dive](https://newsletter.pragmaticengineer.com/p/how-codex-is-built): the Codex team chose to build their CLI in Rust instead of TypeScript. Both would have worked. But the team recognized that Rust’s constraints (strong typing, explicit memory management, minimal dependencies) would create engineering culture effects that go beyond the technical merits. The language choice was a taste decision. Not “which language is technically superior” but “which language shapes the behavior we want from our team.”

Bad taste version of the same decision: choosing Rust because it’s trendy, or because a blog post said it was the fastest, without understanding the second-order effects on team culture and codebase health.

#

## Taste as compass

This is the form Tibo described when he said engineers “need their own compass.” It’s the ability to know what to build next, not just to evaluate what already exists. The engineer who looks at a feature spec and says “this isn’t the right feature” before anyone writes a line of code.

Boris Cherny at Anthropic demonstrated this when [building Claude Code](https://newsletter.pragmaticengineer.com/p/how-claude-code-is-built). He built around 20 prototypes of the todo list feature in two days. Most engineers would have picked the first decent approach and shipped it. Boris kept iterating because something didn’t feel right. He tried inline todos, drawer UIs, interactive pills, bottom-of-screen displays. Prototype after prototype, each one slightly closer to something that felt inevitable instead of arbitrary.

The key detail: he could explain after the fact why the final version was better, but the initial dissatisfaction with each intermediate version was taste operating as compass. He didn’t have a specification that said “the todo list should be attached to the spinner.” He navigated toward it through a series of judgment calls, each informed by accumulated experience about what makes developer tools feel good.

Compass taste is rarer than recognition taste because it operates upstream of execution. Anyone with enough experience can eventually tell you why a finished system is good or bad. Fewer people can sense the right direction before the system exists.

#

## Taste as vision

This is the hardest form. SQ Mah described it when he said “humans define evolution.” Vision taste means knowing not just what’s good now but what will matter in two years. The researcher who picks the right problem to work on, not just the right solution to the current problem.

Peter Steinberger, creator of OpenClaw, [described his workflow](https://newsletter.pragmaticengineer.com/p/the-creator-of-clawd-i-ship-code) as running 5-10 agents simultaneously while spending most of his time on architecture and system design. He said something striking: “Most code is boring data transformation. Focus energy on system design instead.” That’s vision taste. He recognizes that the locus of value has permanently shifted, and he’s reorganizing his entire workflow around that recognition.

The Codex team at OpenAI showed the same instinct when they described their next priority: “Planning with rich context. A good plan requires information beyond the codebase, such as about business goals, market dynamics, and team priorities.” They’re not building a better code generator. They’re building toward a future where the model needs to understand why software exists, not just how to write it. That’s vision taste applied to product strategy.

#

## The unified definition

All three forms collapse into one mechanism: taste is the quality of your internal evaluation function. Every time you exercise taste, you’re running an evaluation. You compare the current state against an internal standard and make a judgment. The difference between someone with good taste and someone without it is the quality of that evaluation.

Recognition taste means your evaluation function works on finished artifacts. Compass taste means it works on possibilities and directions. Vision taste means it works on futures and trajectories.

This is why taste is suddenly the most important skill in engineering. In a world where AI generates the code, the human’s job is evaluation: deciding what to build, judging whether the output is good enough, sensing when the architecture needs to change. Evaluation is literally the job now. And taste is what makes evaluation good.

## Why Some Engineers Make Way More Than Others

Before AI, compensation differences between engineers were largely explained by three things: the company they worked at (Big Tech vs. startup vs. agency), their seniority level (years of experience, title), and their technical specialization (ML engineers earned more than frontend engineers in most markets).

AI is scrambling all three of those variables.

Company still matters, but the gap between a great engineer at a startup and a mediocre one is now 10x instead of 3x, because the great one leverages AI to produce the output of a small team. Seniority still matters, but the axis has shifted: years of experience writing code matters less, and years of experience making good judgment calls matters more. Specialization is being rewritten entirely: “I know React” is less valuable when Claude Code can write React as well as you can, but “I can design systems that are reliable under load” is more valuable than ever because AI can’t do that autonomously.

The engineers who make dramatically more than their peers share a common trait: they make decisions that compound. A single good architecture decision saves the team months of work over the next year. A single good product decision means the feature actually gets adopted instead of sitting unused. A single good evaluation framework means the team catches problems before customers do.

These compounding decisions are all taste. And the reason some engineers make 5x or 10x what others make is that their taste compounds while others’ effort adds linearly.

Here’s the uncomfortable implication: you can work twice as hard as someone with better taste and still produce half the value. The engineer who runs 8 AI agents in parallel but points them at the wrong problems produces less than the one who runs 2 agents pointed at exactly the right problem with exactly the right constraints.

The Codex article illustrates this perfectly. Some engineers at OpenAI adopted AI tools enthusiastically and became massively more productive. Others “returned to tab completion” because they felt they were “getting rusty and losing touch with the codebase.” Both responses are valid. But notice what the most productive engineers did differently. They didn’t just generate more code. They changed what they focused on: they spent more time talking to users, thinking about product direction, and empathizing with the millions of developers who use Codex. The code generation was the easy part. The taste about what code to generate was the differentiator.

## Where the Value Is Actually Generated

Let me be specific about where taste creates disproportionate value in the AI era. There are five zones, and most engineers are competing in only one or two of them.

#

## Zone 1: Problem selection

Choosing what to work on. This is the highest-leverage taste decision you make, and most engineers barely think about it. They take the next ticket, the next feature request, the next bug report. An engineer with taste looks at the backlog and asks: “Which of these, if solved well, makes five other problems disappear?”

Peter Steinberger operates almost entirely in this zone. He described his process: spend a long time going back and forth with an agent to create a solid plan, challenge it, tweak it, push back. Only when satisfied with the plan does he kick off the agent. The planning IS the work. The execution is delegated.

The Boris Cherny version: when the Claude Code team built their permissions system, they could have built a complex ACL system with role-based access control and granular policies. Instead, they chose the simplest possible approach (ask permission, remember the answer). That problem selection decision, choosing to solve the simple version of the problem instead of the enterprise version, is why Claude Code shipped fast and felt intuitive.

#

## Zone 2: System architecture

How the pieces fit together. This is where taste has the longest half-life. A good architecture decision made today still pays dividends two years from now. A bad one compounds into technical debt that eventually requires a rewrite.

The Codex team’s decision to make their agent loop a state machine, the Claude Code team’s decision to “write as little business logic as possible” and let the model do the work, Peter Steinberger’s obsessive focus on making OpenClaw extensible through modular architecture. All are architecture taste decisions that determined the ceiling of what was possible later.

Boris Cherny described the Claude Code philosophy: “Every time there’s a new model release, we delete a bunch of code. We try to put as little code as possible around the model.” That’s an architecture philosophy born from taste. Most teams add code with each release. The Claude Code team removes it. They recognized that the model IS the product, and everything around it should be as thin as possible. That recognition is taste.

#

## Zone 3: Quality judgment

Knowing when something is good enough to ship and when it needs more work. This is the zone where AI cannot help you, because the AI doesn’t know what “good enough” means for your specific context.

The Codex team’s tiered code review system is a taste decision about quality judgment. Non-critical code gets AI review only. Core agent code gets mandatory human review. The taste is in knowing which code is critical. An engineer without taste treats all code equally. An engineer with taste knows that the permissions system needs human eyes but the README update doesn’t.

Gergely Orosz noted in the Codex article: “Not surprisingly, engineers on the Codex team do write nearly all their code with prompts, but elsewhere at the company this figure is considerably less at around 70%.” The 30% that OpenAI engineers write by hand is not random. It’s the 30% where quality judgment matters most. The “30/70 rule” (writing 30% by hand to stay connected) is itself a taste decision.

#

## Zone 4: User empathy

Understanding what the human on the other side actually needs. This is where product-minded engineers create outsized value, and it’s the zone AI is worst at.

When Boris built the contextual loading messages in Claude Code (the spinner that says what the model is actually doing instead of just spinning), that was a taste decision about user empathy. Nobody asked for it. No ticket described it. He noticed that waiting without information feels different than waiting with information, and he built for that feeling.

The Codex team’s sandbox default is another user empathy taste decision. Tibo said: “We take a stance with the sandboxing that hurts us in terms of general adoption. However, we do not want to promote something that could be unsafe by default.” They chose user safety over user convenience. That choice required understanding their users well enough to know that many “are not that technical” and could accidentally do irreversible things.

#

## Zone 5: Communication and storytelling

How you frame what you’ve built. This zone is consistently undervalued by engineers and consistently rewarded by the market.

Peter Steinberger’s OpenClaw got more Google searches than Claude Code and Codex combined during its viral week. The project had great engineering, but the communication was what made it spread: a clear name, a compelling demo, a narrative (”one guy building what looks like a full team’s output”) that captured people’s imagination.

The Codex team’s AGENTS.md files (README files written for AI agents instead of humans) are a communication taste decision. They recognized that the audience for documentation had changed and adapted the format. That recognition is taste applied to communication.

## Examples of Taste (and Its Absence)

Abstract discussions of taste are only useful if you can recognize it in practice. Here are paired examples from the articles, each showing the same situation handled with and without taste.

#

## Choosing a tech stack

Without taste: “We should use TypeScript because it’s the most popular language and everyone knows it.” The decision is justified by convention, not by reasoning about the specific problem.

With taste: Boris Cherny chose TypeScript for Claude Code because it was “on distribution” for the Claude model, meaning the AI was already excellent at writing and understanding TypeScript. The tech stack choice was optimized for the model’s strengths, not the team’s comfort. Meanwhile, the Codex team chose Rust because “it gets you to think about the engineering bar you set” and because they wanted minimal dependencies they could “thoroughly look through.” Same decision (tech stack), completely different reasoning, both showing taste because both are grounded in specific constraints rather than general preferences.

#

## Handling code you don’t fully understand

Without taste: “I generated this code with AI and it passes the tests, so I’ll ship it.” No thought about whether the tests are sufficient, whether the code is maintainable, or whether it introduces patterns that will cause problems later.

With taste: Peter Steinberger ships code he doesn’t read, but not carelessly. He said: “I do know where components are and how things are structured, and how the overall system is designed; that’s usually all that’s needed.” He maintains architectural understanding even when he doesn’t read every line. The tests, linting, and local CI act as his verification layer. He’s not shipping blind. He’s shipping with a different kind of vision.

The distinction matters enormously. Both engineers are shipping AI-generated code. One is gambling. The other has built a system where correctness is structurally likely.

#

## Responding to a feature request

Without taste: Implement the feature as described in the ticket. Ship it. Move on.

With taste: Boris spent two days building 20 prototypes of a todo list before shipping anything. He wasn’t slow. He was navigating toward the right solution through rapid experimentation. The final version feels inevitable, like “of course that’s where the todo list should be.” That inevitability is the fingerprint of taste.

#

## Designing for AI agents

Without taste: “We wrote documentation for our codebase.” Generic README with setup instructions and API endpoints.

With taste: The Codex team created AGENTS.md files that tell AI agents how to navigate the codebase, which commands to run for testing, and how to follow the project’s standards. They structured their codebase “to make it inevitable for the model to succeed.” The difference: one team documented what exists. The other designed the environment so the right outcome is the easy outcome.

#

## Handling the PR flood

Without taste: More AI-generated PRs flooding in, same review process as before. Reviewers overwhelmed. Quality drops. Nobody notices until production breaks.

With taste: Emma Tang’s team at OpenAI started requiring the prompt alongside the PR. “If the prompt is not on the PR, we literally just Slack the person: ‘What is the prompt?’” They recognized that in an AI-generated world, reviewing the code is less informative than reviewing the intent. Peter Steinberger went further, calling PRs “prompt requests” and saying he’s “more interested in seeing the prompts that generated code than the code itself.” The review unit changed because the creation unit changed. That adaptation is taste.

## A Plan to Develop Taste (Not Just Appreciate It)

Most advice about taste stops at “get more experience.” That’s true but useless, like telling someone who wants to get fit to “exercise more.” Here’s a concrete 90-day plan organized by the three forms of taste.

#

## Month 1: Build recognition taste through structured exposure

The mechanism behind recognition taste is high-volume exposure to variance, followed by deliberate reflection. You need to see many examples ranging from terrible to excellent, and you need to think about why the good ones work.

**Week 1-2: Study 10 developer tools you admire.** Not just use them. Study the decisions behind them. Install Codex CLI, Claude Code, Linear, Supabase, Stripe’s dashboard, Vercel, Tailwind, Railway, Resend, and one non-software product (a beautifully designed museum exhibit or restaurant menu). For each one, spend 15 minutes writing answers to: What did I notice in the first 60 seconds? What delighted me? What confused me? What decision would I steal?

By doing this you’re training your recognition function across 10 data points. Patterns will emerge by the third or fourth tool. The good ones all do something in the first 30 seconds (usually show you the outcome before explaining the process). The bad ones all share a pattern too (explain the architecture before showing you why you should care).

**Week 3-4: Study 10 research papers for methodology, not findings.** Pick papers where the approach itself is the innovation: the original BLEU score paper, Anthropic’s Constitutional AI paper, Google’s PageRank paper, the Netflix Prize writeups, the Scaling Laws paper. For each, write: What makes this methodology elegant? What’s the one insight that makes it work? How would I adapt this approach for my domain?

This cross-domain exposure is where the best taste develops, because you start seeing that the same structural principles (clear evaluation criteria, honest limitation disclosure, simple formulations over complex ones) appear across completely different fields.

#

## Month 2: Build compass taste through active discrimination

**Weekly exercise: The Side-by-Side.** Every week, find two examples of the same thing and write 500 words on why one is better. Two API documentations. Two technical blog posts on similar topics. Two architecture diagrams. Two evaluation frameworks.

The critical discipline is to never say “I prefer this.” Always say “this is better because...” and articulate the specific mechanism. “Stripe’s docs are better because they’re organized by what the developer wants to do (send a payment, handle errors) rather than by Stripe’s internal architecture (API reference, webhooks, authentication).” The articulation transforms vague preference into actionable judgment.

**Daily exercise: Practice Noticing.** Every time you use a tool, read a paper, or look at someone’s code, notice one decision the creator made and ask: “Why this and not the obvious alternative?” Write one sentence in a notebook. “The Codex team defaults to sandboxed mode even though it hurts adoption because safety is a value judgment, not a feature toggle.” “Boris vibe-coded a markdown renderer the day before launch because none of the existing ones met his quality bar.” After 30 days, review the notebook. You’ll have 30 observations. The patterns across them are your developing taste.

#

## Month 3: Build vision taste through generative application

**Week 9:** Redesign something you own using everything you’ve learned. Your team’s onboarding flow. Your project’s README. Your evaluation pipeline’s developer experience. Apply the patterns from Month 1 and the discrimination skills from Month 2.

**Week 10:** Write something that’s the best thing you’ve ever written. Not the longest. Not the most comprehensive. The most precise. Where every paragraph earns its place and the reader’s thinking shifts by the end.

**Week 11:** Design a system from scratch and explain every decision from first principles, not from convention. Not “we use microservices because it’s best practice” but “we use a monolith because our team is 4 people, our traffic is predictable, and the deployment simplicity outweighs the theoretical scaling benefits we won’t need for 18 months.”

**Week 12:** Share your taste. Teach someone else the distinction between two approaches. Write a document like the Codex team’s AGENTS.md but for your own codebase, one that makes it inevitable for someone (human or AI) to produce good output. The ability to encode your taste into systems and documents is the difference between taste as personal skill and taste as organizational capability.

## Five Projects That Build Taste Fast

Reading about taste develops recognition. Building things develops compass and vision. Here are five projects designed to exercise taste muscles, each connected to a specific zone of value.

#

## 1. Build an evaluation framework for AI-generated code

Not a linter. Not a test runner. An evaluation framework that answers: “Is this AI-generated code good enough for production?” Define your own rubric. Categories might include: correctness (does it work?), maintainability (will someone understand this in 6 months?), efficiency (is it doing unnecessary work?), security (does it introduce vulnerabilities?), and style (does it match the codebase conventions?).

Run it against 50 real AI-generated PRs from your work. Score each one. Calibrate the rubric based on which scores surprise you. Publish the rubric and your findings.

This project builds Zone 3 taste (quality judgment) by forcing you to make your internal evaluation function explicit.

#

## 2. Redesign an open-source project’s onboarding

Pick a tool you admire technically but whose onboarding experience frustrates you. Fork it. Redesign the first 5 minutes of the developer experience. Write the new README. Create the new getting-started guide. Structure the codebase so a new contributor can ship their first PR on day one (the Codex team’s standard for onboarding).

This builds Zone 4 taste (user empathy) and Zone 5 taste (communication) simultaneously.

#

## 3. Build a “taste test” for your team

Create a document with 10 pairs of implementation approaches (real examples from your codebase or similar codebases). For each pair, one approach has better taste than the other. Ask 5 engineers to pick which is better and explain why.

The interesting output isn’t the “correct” answers. It’s the disagreements. Where your team disagrees about taste reveals where your standards are unaligned, which is where bugs, tech debt, and rework come from. This project builds organizational taste, which is the highest-leverage form.

#

## 4. Ship a product with a 48-hour time constraint

Not a prototype. A working product that someone other than you will use. The time constraint forces taste decisions constantly: you can’t build everything, so you have to choose the right things to include and the right things to cut. Every feature that makes the cut is a taste decision. Every feature you leave out is a taste decision.

The constraint creates taste by making the consequences of bad decisions immediate. If you spend 6 hours on the wrong feature, you’ve burned a quarter of your time.

#

## 5. Write a technical blog post that changes how someone thinks

Not a tutorial. Not a how-to. A piece that takes a familiar concept and reframes it so the reader sees it differently afterward. Like realizing that taste IS evaluation, or that the Codex team’s decision to delete code with every model release is an architectural philosophy, not just a practice.

This builds Zone 5 taste (communication and storytelling) and forces you to have a genuine point of view, which is the foundation of all taste.

## How to Optimize Your Career Around Taste

If taste is the differentiator, here’s how to position yourself for the careers where taste is rewarded most.

#

## Stop competing on speed

When AI writes code at machine speed, competing on coding speed is a losing game. The engineer who generates 500 lines per hour is less valuable than the one who spends 30 minutes thinking about which 50 lines actually need to exist. The Codex team’s observation that “the feature gets implemented in a couple of hours” means implementation speed is commoditized. What’s not commoditized is the judgment about what feature to implement and how it should work.

#

## Invest in the “adjacent skills” that taste requires

The best engineers in the Codex article all have something in common: they’re not just coders. Boris Cherny was a startup founder. Emma Tang spent four years at Stripe leading data infrastructure. Peter Steinberger built and scaled PSPDFKit into a global business. They have context beyond the codebase: they understand users, business models, team dynamics, and market forces.

Taste requires raw material. You can’t have good taste about developer experience if you’ve never studied what makes great developer experiences great. You can’t have good taste about system architecture if you’ve only seen one type of system. The adjacent skills (product thinking, design awareness, business understanding, communication ability) are the raw materials that make taste possible.

#

## Choose roles where taste matters

Not all engineering roles reward taste equally. A role where your job is to implement well-defined specifications rewards speed, not taste. A role where your job is to decide what to build, how to build it, and whether it’s good enough rewards taste directly.

Roles that disproportionately reward taste: founding engineer at an early-stage startup, tech lead at a product company, platform/infra engineer designing systems that other engineers build on, developer experience engineer, and staff+ engineer at any company where the role involves cross-team architectural decisions.

#

## Build a public body of tasteful work

In the age of AI, your portfolio matters more than your resume. Anyone can claim they have taste. The proof is in the artifacts. A well-designed open-source project. A technical blog with a consistent point of view. A product you built that people actually use. These are demonstrations of taste that no interview can replicate.

Peter Steinberger’s OpenClaw speaks louder than any resume. Boris Cherny’s Claude Code prototypes demonstrate taste better than any behavioral interview answer. Build things that show your judgment, not just your ability to generate code.

## The Uncomfortable Truth

The uncomfortable truth is that taste is unevenly distributed and always will be. Some people have been developing it for 15 years through thousands of decisions across dozens of projects. They have a head start that no 90-day plan can fully close. The Codex team has unlimited token access and works at the company building the models. Peter Steinberger has 20 years of experience and built a company to exit. These are not typical starting positions.

The gap between “no taste” and “some taste” is enormous in terms of career impact, and that gap is closable. You don’t need Boris Cherny’s taste to benefit from developing your own. The engineer who goes from “takes tickets and implements them” to “proposes what to build based on user research and then implements it with AI, including the test suite and the architecture decisions” has made a career-changing leap. That leap is taste.

Gergely Orosz closed his [article on AI and software engineering](https://newsletter.pragmaticengineer.com/p/when-ai-writes-almost-all-code-what) with something honest: “It feels like something valuable is being taken away, and suddenly. It took a lot of effort to get good at coding. Some of my best memories of building software are about being locked in, balancing several ideas while typing them out, being in the zone.”

That grief is real. The skill of writing code by hand, painstakingly developed over years, is becoming less central to the job. But the skill of knowing what code should exist, how it should be structured, and whether it’s good enough? That was always the real skill. The craft was never in the typing. It was in the thinking. AI just made that visible by taking the typing away.

The engineers who thrive next will be the ones who realize this: taste was always the job. We just used to hide it inside the code.

---

**[LinkedIn](https://www.linkedin.com/in/bhavsarpratik/) / [@ptkbhv](https://x.com/ptkbhv) / [GitHub](https://github.com/bhavsarpratik)**
