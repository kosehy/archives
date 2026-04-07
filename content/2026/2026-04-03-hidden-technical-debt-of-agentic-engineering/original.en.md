# The hidden technical debt of agentic engineering

Source: https://thenewstack.io/hidden-agentic-technical-debt/
Saved: 2026-04-03

Agents are easy to build but hard to run. At Port, we mapped seven blocks of hidden infrastructure debt with AI agents in enterprise systems.

Apr 2nd, 2026 8:00am by Zohar Einy

[Figure omitted — see figures/figure-01.jpg and figure-notes.md]

Anyone today can build an agent locally with minimal effort. With some LLM calls, a prompt, and a few tool definitions, that agent will be doing real work for them within minutes. But what happens when that agent needs to get into production and be used by the entire engineering department, with real data and real consequences?

In 2015, Google published “Hidden Technical Debt in Machine Learning Systems.” That paper turned on the light for machine learning engineers and named all the problems they were experiencing. The diagram they shared also became iconic: a tiny box labeled “ML Code” surrounded by massive infrastructure blocks.

[Figure omitted — see figures/figure-02.png and figure-notes.md]

We’re seeing the same pattern for agents. Agents are a small part of the picture, and we want to name all the infrastructure around them.

Agentic engineering systems are especially good at piling up technical debt. They carry all the maintenance problems of traditional software, plus an additional set of agent-specific issues. New agents are being created daily by nearly every employee. Soon you’ll have far more agents than employees.

We define an agent as any process with dynamic decision-making capabilities that can autonomously determine tool usage and execution paths through reasoning and reflection. Decision-making, reasoning, and reflection require all the supporting infrastructure.

Building an agent is easy. But in production, the agent code is the smallest part of the system. Everything around it is where the actual complexity lives.

Over the past few months, through conversations with engineering leaders and our own experience, we’ve mapped out seven infrastructure blocks that surround the agent. Each one is a category of work that no one plans for when building their demo.

Some of these blocks will look familiar if you’ve done traditional engineering: observability, integrations, and governance. Others are unique to agents, such as human-in-the-loop, evals for non-deterministic systems, and the agent registry.

[Figure omitted — see figures/figure-03.png and figure-notes.md]

Let’s walk through each one.

## 1. Integrations

Agents need to reach your actual systems: CI/CD, cloud providers, incident tools, observability platforms, code repos, secret managers, and more.

Without centralized integrations, every team wires up its own connections to agents.

Picture an engineering org with 200 engineers on 30 teams, each with multiple agents. Each engineer generates their own GitLab PAT for coding agents, Snowflake credentials for data agents, Kubernetes service accounts for deployment agents, and monitoring tokens for incident agents.

That’s hundreds of integration points, each one configured individually, debugged individually, and expiring on its own schedule.

When every developer wires their own credentials, each agent sees different data depending on whose token it uses. One developer’s GitLab PAT has access to all repos. Others are scoped to their team. Same agent type, but each has a completely different view of the org.

Or, what happens when GitLab ships a breaking change to their API? Every team that wired its own connection independently debugs the same issue (or submits a ticket to the platform team). Three teams figure it out on Monday. Two more by Wednesday. One team doesn’t notice for a week because their agent only runs during incidents.

What also matters is what comes through those integrations. When three teams connect to the same data source through different paths, their agents can get different answers to the same question. If one team’s integration pulls a 30-day history of deployments, and another team’s integration shows everything from the last 3 years, their outputs will differ.

Right now, MCP is how most teams connect agents to their tools. But let’s not confuse MCPs with integrations. MCP gives agents a standard way to call a tool. It doesn’t manage the credentials for that call, the scope of the data that comes back, or what happens when the API on the other end changes.

Hidden tech debt in integrations looks like:
- An integration auth token expires on a Friday night, and an incident agent silently stops working. Nobody notices until Monday.
- Five teams each maintain their own GitLab connection with different permissions and scopes, unaware that the others exist.
- When an integration updates its API, every team debugs its connection separately.

## 2. Context lake

Agents are only as good as the context they can reference and use. They need two kinds of context.

### Runtime context
How do you deliver accurate context to agents during their execution?

The runtime context is the live data that agents need for a specific execution, such as information about services, who owns them, and what was deployed recently. It’s the same kind of data humans use when coding or resolving incidents, but more accessible to agents.

Think of a coding agent picking up a ticket to add a retry mechanism to a service. It needs to know: what language and framework the service uses, how retries are handled in other services in this org, who owns the downstream service it calls, and whether there’s been a recent config change to the timeout settings.

Some teams manage their runtime context in markdown files: agents.md, .cursorrules, skills files.

Markdown files are fine for static instructions, such as how to format commits or which linter to use. But the runtime context changes constantly. Service ownership shifts. Dependencies get added. Config values update. Deployments happen every hour. An agent running on a .md file that says “checkout-service is owned by Team Payments” doesn’t know that ownership transferred to Team Commerce last Tuesday. The file was accurate when it was written. By the time the agent reads it, it might not be.

### Decision traces
How do you help agents learn from their own past work or the work of other agents?

Decision traces are a history of what has been done before (by humans or agents), why it was decided, and what happened afterwards. Without that history to reference, every agent run starts from zero.

Think of an agent opening a PR to fix a flaky test. It doesn’t know that a different agent tried the same fix last week, the PR was rejected because it broke a downstream contract, and the team decided to deprecate the test entirely. So it reopens the same PR. Without decision traces, agents repeat mistakes that humans (or agents) have already resolved.

An agent that resolved 50 incidents has seen patterns a new agent hasn’t, like which fixes worked, which ones caused regressions, and which services are fragile after deploys. Without traces, that knowledge disappears after every run. When multiple agents operate on the same systems, they can’t see each other’s history.

LLM providers are starting to address this with memory.md files that can be shared across teams. But the debt still shows up when you have dozens of agents operating. You need to find a way to reliably serve that memory (or just the right parts of it) to specific agents.

Hidden tech debt in context lake looks like:
- Stale, fragmented context that no one owns.
- Agents running on agents.md when company standards live in a wiki.
- Agents not learning how and why other agents solved a problem, or about the mistakes they made.

## 3. Agent registry

### Gaining visibility into what agents exist
The org chart is changing. Instead of just people, you now have 5–10 times that number of agents. They’re being created daily by all your human employees. They’re running without guardrails, they have access to critical infrastructure, and they’re making decisions. They’re also spread across tools like Claude Code, Cursor, n8n, Zapier, Notion, AWS, GCP, and more.

The typical pattern goes like this: An engineer builds a triage agent, and their team starts using it to help with incidents. Another team builds its own version because it didn’t know the first one existed. A third team builds something similar but wired to different tools with different permissions.

In a company with 20 or 30 engineering teams, you’ll quickly reach agents with overlapping responsibilities, conflicting behaviors, and invisible dependencies. Before agents can be shared between teams, you need to know they exist.

### Delivering instructions to agents
Once you have visibility into your agents, they need the equivalent of an employee handbook: standards, skills, and instructions on how they’re expected to operate.

Today, engineers create skill files for their agents independently. The issue is that when they are scattered across repos without a centralized view, teams end up creating duplicate or inaccurate skills. They often contradict the platform-distributed context. The platform team has far more insight into what to write in skill files than individual teams do.

This information may require multiple levels:
- company-wide standards that apply everywhere
- repo-specific instructions
- team-level rules for subsets of engineers

You’ll need to find a way to reliably deliver this information to thousands of agents, ensuring the right instructions reach the right agents.

### Agent creation
Without a template, you get the same sprawl problem you just solved. An engineer spins up an agent with no owner, no lifecycle state, and no connection to the service it operates on. It works for them. Nobody else knows it exists. Six months later, someone finds it running in production with expired tokens and no way to contact whoever built it.

A template doesn’t restrict what the agent does. It makes sure every agent is born with the basics: an owner, a description, the tools it uses, the services it touches, and a lifecycle state.

Hidden tech debt in the agent registry looks like:
- Invisible agents
- Teams creating duplicate agents
- Outdated context
- No clear way of promoting an agent to production
- No versioning, rollbacks, or staging environments

## 4. Measurement

Different stakeholders want different types of measurement.

1. Observability — what your agents are doing.
2. Evals — whether your agents are getting better or worse when prompts, skills, tools, and models change.
3. Business impact — whether your agents are actually working for your business.
4. Feedback loops — whether humans accept or correct the agent’s output, and whether agents learn from that feedback.

Hidden tech debt in measurement looks like:
- Not knowing if agent performance is improving or declining over time.
- Not being able to measure what happens when a prompt or model changes.
- Leadership asking for ROI without a clear answer.
- Failure to collect feedback from humans using agents.

## 5. Human-in-the-loop

Most useful agents live somewhere between fully manual and fully autonomous engineering.

Human-in-the-loop lets you define checkpoints: this action needs approval, this one doesn’t, and this one depends on the environment. The agent runs, but a human confirms high-stakes decisions before they execute.

When you have one agent in a demo, you can hard-code the approval checkpoints. With 100 agents across 20 teams, hard-coded approval logic doesn’t scale. Every team implements its own version.

And then there’s the orchestration of the approvals themselves: who gets notified, through what channel, what the timeout is, and what happens if nobody responds.

Hidden tech debt in human-in-the-loop looks like:
- Hard-coded approval code that can’t be changed from one place.
- Some agents run without approvals, others have too many.
- Multiple approval systems by email, Slack, and custom UI that don’t work with each other.
- No shared workspace where teams can see what their agents are doing and intervene if necessary.

## 6. Governance

When a human engineer needs access to a production database, there is usually a process. When an engineer creates an agent locally, it usually runs with whatever credentials its creator wired in.

Governance rules for agents need to be specific. They need centralized definition and enforcement.

The other side of governance is enforcement. If you discover a vulnerability in one internal API and need to block all agents from calling it immediately, can you? In most companies, that capability does not yet exist.

You also need auditability. Most agent setups don’t produce a real audit trail, especially if they are created locally.

Another aspect of governance is cost governance. Agents tend to keep working despite the costs they are racking up. An agent stuck in a retry loop or reasoning in circles can keep burning tokens for hours.

Hidden tech debt in governance looks like:
- An agent that shouldn’t run in production, accessing production data.
- An RCA agent publishing sensitive data to a shared channel.
- An agent publishing PII in a public forum.
- No way to disable a tool across all agents from one place.
- No audit trail of what an agent did or why.

## 7. Orchestration

Most agentic workflows aren’t purely agents. They’re a mix of agents, tools, and people. The debt isn’t in the individual steps. It’s in what happens between them: routing, failure handling, and ownership.

[Figure omitted — see figures/figure-04.png and figure-notes.md]

Take an incident response workflow: an alert fires, a triage agent investigates, a deployment agent rolls back a change, and a verification agent checks whether the fix worked.

If the triage agent got the root cause wrong, the workflow can confidently take the wrong action. The failure is not necessarily silent, but it becomes difficult to trace which handoff or decision introduced the error.

Traditional workflow orchestration is deterministic. Agent orchestration is not. There is no clean contract between agents in the same way there is between software services with schemas and versioned APIs.

Who owns the workflow itself becomes a real question. Even if each agent has an owner, the orchestration still needs an owner.

Hidden tech debt in orchestration looks like:
- An agent fails mid-workflow, and nobody finds out until the downstream effect surfaces.
- No way to trace a decision across agents back to the original trigger.
- A workflow spans three teams, but no team owns the outcome.
- A model or prompt change in one agent silently breaks the next agent in the chain.

## When the debt hits

This hidden tech debt becomes painful at specific trigger points.

[Figure omitted — see figures/figure-05.png and figure-notes.md]

At the exploration stage, there is little debt. When a team starts using agents for real work, integrations and context are the first things that break. When multiple teams run agents independently, the debt piles up much faster. At production scale, governance and orchestration become the priority.

Some companies see the problem early and try to avoid the chaos from day one. Others learn the hard way and end up retrofitting governance after agent sprawl has already emerged.

## This happened before with microservices

The author compares this moment to the rise of microservices. Each team chose its own technology and infrastructure until someone eventually had to create standards.

Platform engineering used to be primarily a velocity initiative. With agents, it is still about velocity, but platform teams are now playing catch-up while engineers spin up agents in tools like Cursor or Claude Code.

## What to do about it

Start with visibility. Audit your GitHub organization for AI-related workflows and actions. Check how many active API tokens your teams have on Claude, OpenAI, or Bedrock. Look at workflow tools for anything with an AI node. The goal is not a perfect inventory. It is the first count.

Your organization also needs a working definition of what counts as an agent. Is a GitHub Actions automation an agent? Is a Claude Code scheduled task an agent? Is an n8n workflow with an AI node an agent?

There is also the question of centralized versus democratized ownership. Should the platform team build everything and developers consume it, or should the platform team provide guardrails while teams build their own?

You can build this infrastructure now, or you can build it after an agent leaks customer data, burns $300 in tokens overnight, or silently rolls back a production service nobody asked it to touch. You’ll build it either way. The only question is whether you build it before the pain or after.

Zohar Einy is the CEO of Port, the agentic engineering platform that is helping customers like GitHub, Visa, and PwC move from manual to autonomous engineering.
