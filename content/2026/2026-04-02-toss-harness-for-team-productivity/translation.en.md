# Raising the floor of team productivity through harnesses in the Software 3.0 era

Original: https://toss.tech/article/harness-for-team-productivity
Saved: 2026-04-03
Translation note: Smoothed into natural English while preserving the structure and intent of the original article.

## Does your team use the same LLM?
Many development teams are adopting LLMs, but if you look closely, the reality is often closer to everyone fending for themselves.
Even when people use the same model and the same IDE, the difference in output quality can be extreme. One engineer, with a strong grasp of context engineering, can assign the LLM a precise role and finish a complex refactor in ten minutes. Another may spend an hour fighting hallucinations through repeated low-level question-and-answer loops.
Even when the same repository and the same task are involved, the results can diverge sharply.
The difference comes down to one thing: whether context was deliberately designed before starting the work.
This is not a coding-skill issue. It is a gap in LLM literacy—how precisely someone can control an LLM as a tool. Leaving that gap to personal instinct creates a major organizational loss.
The author argues that Claude Code’s plugin and marketplace ecosystem may be more than an extension of a CLI tool. It may be a key harness that can raise the floor of LLM usage capability across an entire organization.
The article explores how, in the Software 3.0 era, LLMs might be integrated not as individual tools but as team systems.

## The Frictionless Harness: an experience without broken context
Many strong attempts have existed, including Open Interpreter and OpenCode. But any “new tool” still creates subtle friction for developers. The moment someone leaves their local environment and pastes code into a browser chatbot, the cost of context switching appears.
The author sees Claude Code’s TUI as valuable precisely because it keeps natural language and code intertwined inside the terminal—the place where developers already spend most of their time.
That seamlessness matters because a workflow can only spread across a team if it feels low-friction enough to adopt. At least for now, Claude Code may be one of the lowest-friction entry points for embedding LLM workflows into an engineering organization.

## Executable SSOT: documents die, code lives
Teams always want a single source of truth, but wikis and Notion pages begin aging the moment they are written, because they are designed for people to read.
Knowledge defined as Claude Code plugins has a different character. It can become an executable SSOT.

- When humans read it, it is a work guideline or manual.
- When an LLM reads it, it becomes a precise system prompt.

In this framing, documentation management shifts from recording to execution. When plugin code is updated, the behavior of teammates’ agents updates immediately as well. That is the author’s idea of a true SSOT.

## Raising the Floor: from generic tools to domain-optimized harnesses
Within teams, there are large differences in LLM know-how that have little to do with raw coding ability. The task is to raise the floor of team productivity.
Open-source plugins such as oh-my-claudecode or oh-my-opencode are good starting points, much as oh-my-zsh became a standard productivity layer in the terminal. They let teams adopt generic best practices immediately.
But the author argues that teams must go one step further.
Generic external tools may understand code well, but they do not understand the domain context of a particular team. A payments team and a settlement team have different classes of work that AI can handle well and different places where human-in-the-loop review remains essential.
The author describes a recent experiment with a clear objective:
Minimize human intervention in the author’s own work, keep people approving only where necessary, and generate as many tokens as possible.

## The Software 1.0 perspective: repeating a familiar success formula
What looks like a strange new AI workflow may actually be an extension of something software teams have done for decades.
In the Software 1.0 era, platform engineering improved team productivity by building common internal libraries and modules for recurring functions such as auth, logging, and payment integration. This prevented teams from reinventing the wheel and let them focus on business logic.
The author sees Software 3.0 marketplaces and workflows through the same lens.

- Common modules become AI workflow plugins.
- Library distribution becomes marketplace publishing.

The difference is that the internals have shifted from code to prompts and agent logic.
What matters next is quality assurance. Just as teams review shared code modules carefully and optimize them, AI workflows should also be improved through peer review.
Comments like “this prompt uses too many tokens” or “the agent fails in this situation” could turn team AI capability from personal instinct into collective intelligence.
This is not a strange future, the author suggests. It is simply the extension of engineering practice into the AI domain.

## Why Marketplace? (Beyond RAG & Server)
Some may ask whether a company could simply connect internal wiki documents through RAG. The author argues that the marketplace approach has advantages in cost-effectiveness and reliability.

### 1) Predictability
Anyone who has built RAG systems knows their visibility is limited. Hybrid search, rerankers, and internal logic make it difficult to predict which context will actually be injected.
By contrast, plugins are explicit documents and code. Developers can fully control the logic and clearly see what context reaches the model.

### 2) Fast experimentation and dev-prod parity
Workflows can be validated without server deployment. Developers can edit plugins in a local TUI, talk to Claude immediately, and iterate in a tight feedback loop.
And with the Claude Agent SDK, plugins validated in local TUI environments may later be loaded into server-side agent environments as well. In that picture, the marketplace becomes the SSOT linking local experimentation and production operations.

## Marketplace 1.0: a workflow distribution platform
The author’s main thesis is that plugins and marketplaces are not just feature extensions. They may be version 1.0 of a platform for distributing how an organization works.
Imagine a team lead packaging the team’s lint rules, Git branch strategy, and testing policy into a plugin and publishing it to a marketplace or private registry. Teammates would install that discipline with a single command in the TUI.
If traditional linters merely emit errors and block progress, plugins could align behavior with team norms. That would make them powerful and modern governance tools.
Beyond compliance, the more exciting possibility is workflow propagation. If the best LLM user on a team could package their know-how into a slash command, then another engineer could run the same high-quality workflow with a simple trigger like `/new-feature`. That is what it means to raise the floor.

## Layered Architecture: context stratified by concern
Just as Claude Code can be described through a layered architecture, the knowledge captured in plugins can also be layered.
The author proposes managing knowledge in separate tiers so that an LLM is only given what is needed for the current task, much as a new employee would not be thrown into all company documentation at once.
When layered plugins accumulate, they can become a living knowledge base. Without building a separate complex RAG system, a well-maintained set of plugins—prompts plus code—can become the organization’s technical asset. Whether analyzing legacy code or building new features, that knowledge base remains ready to execute in up-to-date form.
The author sees this as the direction of knowledge management in the Software 3.0 era: prevent fragmentation and concentrate knowledge where it is needed.

## Outlook: the Data Flywheel hypothesis
Once the system takes hold, the author argues, teams may be able to build a data flywheel.
Marketplaces and plugins are not just tools that help work get done. They may also become factories for generating high-quality instruction-tuning datasets.
If structured data accumulates through plugins, that data can be used to fine-tune domain-specific models, and the existing workflows can become the basis for evaluating those models.
Of course, that flywheel requires prerequisites: enough time to gather data, a quality-control process, and sustained organizational investment.
But once it begins to turn, more use generates more data, more data improves models, and better models drive more use. That is the author’s vision of an AI-native data flywheel.

## Conclusion: toward a harness optimized for our own organization
In the end, the destination of all of this is the construction of a harness optimized for one’s own organization.
Much of the discussion remains directional and hypothetical. It is still unclear exactly how team workflows will evolve on top of marketplaces and how effective plugin-based knowledge management will be in practice.
But one thing is clear: LLM capability can no longer remain a matter of individual instinct. It is moving into the domain of systems that teams must design and distribute.
Claude Code’s marketplace is presented as the first tool to show that possibility. What remains is to gather a team’s scattered tacit knowledge and weave it into a system of its own.
The tools are ready. The question is what your team will choose to install.

*All images used in the article were generated with generative AI.*
