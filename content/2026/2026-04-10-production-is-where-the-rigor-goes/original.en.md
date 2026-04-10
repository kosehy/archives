# Production Is Where the Rigor Goes

Source: https://www.honeycomb.io/blog/production-is-where-the-rigor-goes
Saved: 2026-04-10

Production Is Where the Rigor Goes

In early February, Martin Fowler and the good folks at Thoughtworks sponsored a small, invite-only unconference in Deer Valley, Utah, birthplace of the Agile Manifesto, to talk about how software engineering is changing in the AI-native era. The longer I sit with this recap, the more troubled I am by what it doesn't say. I worry that the most respected minds in software are unintentionally replicating a serious blind spot that has haunted software engineering for decades: relegating production to the realm of bugs and incidents.

By: Charity Majors  
Published: 2026-03-18

In early February, Martin Fowler and the good folks at Thoughtworks sponsored a small, invite-only unconference in Deer Valley, Utah, birthplace of the Agile Manifesto, to talk about how software engineering is changing in the AI-native era.

They recently published a summary of key insights and themes from the summit, sorted into ten topical buckets.

This document represents an almost incalculable amount of engineering skill, practical expertise, and battle-hardened wisdom, from some of the leading voices and actual titans in our field. It’s also a fascinating capsule of where the industry is at in this weird, compressed moment of change, from people who aren’t trying to sell you anything.

I recommend digesting their notes for yourself, with Annie Vella’s after-event musings as an essential pairing. (Annie’s most important takeaway: “Nobody has this figured out.”)

But the longer I sit with this recap, the more troubled I am by what it doesn't say. I worry that the most respected minds in software are unintentionally replicating a serious blind spot that has haunted software engineering for decades: relegating production to the realm of bugs and incidents.

## “Where does the rigor go?”

The technologists in Utah report spending more time and energy on the question, “Where does the rigor go?” than any other question. As Chad Fowler put it in his influential essay,

> Across decades of software evolution, the same misunderstanding keeps recurring. Constraint removal is mistaken for loss of rigor. But what actually happens, when things go well, is rigor relocation.
>
> Control doesn't disappear. It moves closer to reality.
>
> If [code] generation gets easier, judgment must get stricter. Otherwise, you're not engineering anymore.

The notes describe five destinations where rigor is already moving to:

- Upstream to specification review
- Into test suites as first-class artifacts
- Into type systems and constraints
- Into risk mapping
- Into continuous comprehension

All of these are great and exciting. Beefing up your pre-production test quality, capturing intent in specification docs, separating specs from constraints, revisiting the jobs to be done by code review, yes yes yes, all of that. Yes please.

But where is production on that list? If control is supposed to be moving “closer to reality,” what is closer to reality than your production systems? Production is reality. Reality is production.

If I squint, I think I can infer that “risk mapping” is about code in production, or at least inclusive of code in production. There are also a couple of vague references to “architecture” or “backend” in the context of agents, which gesture in the general direction of production systems. But that’s basically it.

## “Self-healing and self-improving systems”

I could only find one straightforward mention of observability, telemetry, or production systems in the entire recap. Predictably, it was tucked away in the section on incident response.

> The retreat was blunt: code changes should be the last resort for incident remediation. The path to self-healing runs through better rollback, better feature flags, and better observability before it runs through agents rewriting production code.

Again, no argument. All of this is well reasoned and true, as far as it goes.

But why is there just one mention of production or observability, and why is it confined to a subsection about incidents and bugs?

This worries me, because bugs and incident response are such a tiny fraction of the reasons engineers should be engaging with production. Do you only check your bank account when your card gets declined?

## The software engineering blind spot

It’s easy to understand why this blind spot is so pervasive, when the overwhelming majority of software engineers do not look at production as part of their development workflow. At some companies, they are not even allowed to.

Because of this, and as a result of this, they think of production as “where I go to fix bugs.” They think of observability as what they use to find bugs.

No.

Observability is just another word for understanding.

Formal methods and test suites are flight simulators. Production is flying the actual plane. Observability is how you fly it.

To be clear, I’m not blaming the engineers. The tools most software engineering teams are given are infrastructure tools built for operators, not for builders. They are not capable of asking the kind of precise, exploratory questions you need to understand your product and users.

This is the brutal circular dependency loop we are stuck in: tools only good for finding bugs, engineers don't know their lives could be better, they don't agitate for better tools, they don't get better.

## We know how this should work

The best way to build good software has always been to iterate with fast feedback loops, linking developer intent with outcomes in production.

The best way to find bugs before customers do has always been to instrument as you go, ship, and validate your change in production.

The best way to build great products has always been to ship a change, see what your users do with it, and ship another change based on what you learn.

None of this is new. All of this predates AI, and even predates DevOps. Why haven’t we done it?

Two reasons.

## The cost of change, the economy of “good enough”

Reason #1: easy to say, hard to do. You need a whole ecosystem of rich data and precision power tools, feature flags, progressive deployments, granular observability, to build those short, fast feedback loops connecting developer intent with production consequences.

That ecosystem has been out of reach for most teams. New tools, migrations, reinstrumentations, trainings, bookmarks. People are busy. Execs are dubious.

Especially given reason #2: the old ways were good enough for most teams. Our systems evolved to tolerate a certain rate of change, held together by human intuition, long-tenured engineers, and the strategic application of lots of duct tape. It wasn’t perfect, but it worked well enough most of the time.

## AI breaks both of these

AI changes things. It brings the cost of migration and instrumentation down dramatically at the same time as it turns the evolutionary rate of change into a bottleneck and existential risk.

As the rate of change ticks up to 10x, 100x or more, all the duct tape comes flying off the bus. You have to encode the context into your system instead of relying on human intuition to bridge the gaps. You have to validate at agentic speed to match the code being generated at agentic speed.

It gets better, or worse, depending on perspective. Models now appear to behave differently when they know they are being observed and evaluated.

As Yasmeen Ahmad recently wrote, the software testing paradigm treats evaluation as a checkpoint. You test before you ship. Pass the gate, you’re in production. Fail, you go back. The pharma industry used to work this way too, to catastrophic effect. They were forced to develop a new discipline of continuous monitoring of conditions over time. So must we.

Ahmad continues:

> The MIT study showing 95% of enterprise AI pilots failing to deliver ROI isn’t primarily a capability problem. It’s an observability problem. Organizations can’t evaluate whether their AI is working because they have no infrastructure for seeing what’s actually happening once the system is live.

Dashboards are not rigor. Metrics and logs are not rigor. Rigor requires precision: a function of how rich your data is in context and cardinality, and your ability to pick out meaningful events with a scalpel.

Fascinatingly, the bots are figuring this out faster than the humans. I posted a piece last week about how data is made powerful by context, not linearly more powerful, but exponentially, combinatorially more powerful, and I heard back from an AI-SRE startup who said their agents only use three-pillars data 30% of the time. The rest of the time, they go back to the source and get the raw, intact telemetry.

When I posted that, I got a chorus of replies from other agentic developers saying, “Yep, same here.”

## The code is not the system

Any team that wants to reap the benefits of AI is going to have to build the feedback loops we’ve long sought between development, human or agent, and production. They are going to need rich data and precision tools, the ability to trace intent through production and validate it there.

The spec describes intent. Telemetry describes reality. As Vidhya Ranganathan put it, “production telemetry is the spec that survived.”

Or as Boris Tane put it in “The Software Development Lifecycle is Dead,”

> When agents ship code faster than humans can review it, observability is no longer a nice-to-have dashboarding layer. It’s the primary safety mechanism for the entire collapsed lifecycle. Monitoring is what’s left. It’s the last line of defense. The observability layer becomes the feedback mechanism that drives the entire loop. Not a stage at the end. The connective tissue of the whole system.

Code is a terrible source of truth. The exact same code can do wildly different things under different conditions, even boring old deterministic lines of code. With LLMs, the unpredictability is a feature. As Ahmad says, we are applying a testing paradigm to what is essentially an epidemiological problem. What do you do, when controlled testing can’t capture what matters?

You instrument the deployed system. You build feedback loops. You measure outcomes, not just outputs. You design for observability, not just accuracy.

There are limits to how much you can validate your code before production, and diminishing returns set in fast. If you want to build confidence beyond that point, you have to test in production and keep testing in production, as the world keeps on changing.

## My one request for next time

I’m so grateful to Martin Fowler for posting the readout, and to Annie for posting her thoughts. I’m grateful to everyone who went and participated. I also want to acknowledge that I wasn’t there. I don’t know what they talked about.

Maybe production was front and center in every discussion. Maybe observability was too. Maybe they aren’t in the recap because they seemed too obvious to include.

If so, I respectfully disagree. It needs to be said.

This is my request and my plea: if production is implicit, make it explicit. Bring it out of the backwater of “bugs and incidents” and into the forefront of your deliberations over “where should the rigor go?” Production is where the users live and the money gets made, and future generations of engineers will need to live much closer to reality than they have in the past.

If you want help remembering this, consider inviting an SRE or two.
