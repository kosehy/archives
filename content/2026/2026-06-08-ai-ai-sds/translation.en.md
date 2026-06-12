# Can We Delegate Work to AI? The Critical Weakness of Delegated AI

- Source URL: https://www.samsungsds.com/kr/insights/ai-delegation-document-integrity-risk.html
- Korean source title: AI에게 일을 맡겨도 될까? ‘위임형 AI’의 치명적 약점
- Publisher: Samsung SDS Insights, syndicated from IDG/CIO
- Author: Paul Barker
- Published: 2026-06-08
- Archived: 2026-06-08

This article is provided as a republication of an IDG article. Original article: [AI is ready to take over Python programming, but not much else](https://www.cio.com/article/4170475/ai-is-ready-to-take-over-python-programming-but-not-much-else.html).

## Executive Summary

- Generative AI and agentic AI are evolving from assistants into delegated systems that perform knowledge work directly. Even high-performing frontier LLMs can quietly damage an average of 25% of document content during long-running work, making document corruption a core enterprise risk.
- The newer and more fluent the model, the harder these errors can be to notice. The output may read naturally while key meaning, context, or obligations have been altered. Simple visual review is not enough, and domain-expert oversight becomes essential.
- Python differs from business documents because code can often be run, tested, type-checked, or statically analyzed. Contracts, policies, board documents, audit records, and management reports do not have such straightforward deterministic validation.
- Effective AI automation requires architectural guardrails: separating editing agents from validation agents, tracking change histories, comparing results against originals, and designing explicit human review points.

Generative AI is moving beyond simple assistance and into actual task delegation. Organizations increasingly want AI to draft emails, summarize meetings, prepare reports, edit complex documents, and analyze work materials. Agentic AI, in which multiple agents perform tasks on behalf of people, is now being discussed as the next model of work innovation.

But enterprises must ask a harder question: can AI be trusted with important work? Recent research from Microsoft gives an uncomfortable answer. AI performs well in some areas, but it still shows serious weaknesses when repeatedly processing complex business documents.

## Is AI Ready to Take Over Work?

Most AI evaluations have focused on single-shot answer accuracy or creativity. The DELEGATE-52 benchmark, designed by Microsoft researchers Philippe Laban, Tobias Schnabel, and Jennifer Neville, is different because it tests multi-step editing tasks that resemble real knowledge work.

DELEGATE-52 is not a simple question-answering test. It contains 52 professional domains and 310 work environments, including coding, crystallography, genealogy, and music notation. Each environment includes real documents and complex editing tasks. The goal is not merely to see whether AI can generate a good answer. The benchmark tests whether documents remain faithful to their original information after repeated delegated work.

The researchers argue that current LLMs are still difficult to treat as trustworthy delegates. The models can make rare but severe errors that silently corrupt documents, and these problems accumulate as interactions grow longer. According to the article, even frontier models such as Gemini 3.1 Pro, Claude 4.6 Opus, and GPT 5.4 lose about 25% of document content on average after 20 delegated interactions, while the average degradation across all tested models reaches about 50%. The issue is not just typographical mistakes. Important information can be removed, meanings can shift, and core document context can be damaged.

## The Problem Is Quieter Than Hallucination

Hallucination has long been treated as a major weakness of AI. It refers to AI confidently generating facts that do not exist or presenting incorrect information. The risk highlighted by this research is different.

AI can corrupt a document even when it is not writing a new one from scratch. During revision, it may delete content, change wording, or restructure context in a way that subtly changes meaning. The larger problem is that the errors are hard to see.

AI does not fail because it cannot write. It fails because it can write too plausibly. Weaker models may omit large chunks, making errors easier to spot. Stronger models may preserve fluency and logical flow while slightly altering key meaning. The result may look polished but be wrong. Such errors are difficult to catch through simple reading and require reviewers who understand the domain context.

## AI Was Ready for Fewer Tasks Than Expected

One striking result is that Python was the only domain in which many models were judged ready. This suggests that LLMs can perform more reliably in code domains, especially Python, where there is abundant training data and outputs can be tested through execution.

Most enterprise work, however, cannot be verified like Python code. Contracts, policy documents, management reports, audit records, and customer-response materials often do not have a single right answer. They depend on intent, organizational rules, business norms, and accountability. Enterprise documents are not just containers of information. They are records of decisions and responsibility. Even small changes can create legal, financial, or operational risk.

## Errors Accumulate in Long Workflows

The study matters because it shows how AI weaknesses appear under realistic work conditions. Results became worse as documents grew longer, as interactions extended over time, and as irrelevant distractor files were included. A short test may make a model look stable, but real enterprise environments contain many documents, multiple versions, complex context, old files, and new policies mixed together.

This resembles actual organizational work. Core documents are rarely simple. They are written by multiple departments, revised repeatedly, and shaped by old decisions and current rules. When AI handles such documents, the key ability is not summary or generation. It is knowing what must not be changed.

For this reason, delegated AI is not yet reliable enough to handle important outputs alone. If AI modifies contracts, ledgers, policy documents, codebases, board materials, or regulatory records and damages them, the organization remains responsible. Even when AI performs the task, legal, financial, and operational accountability stays with the enterprise.

## The Answer Is Stronger Verification

Should enterprises abandon AI automation? The researchers and industry experts say no. Brian Jackson of Info-Tech Research Group argues that this benchmark is useful for enterprise developers because it helps organizations understand where agentic AI has limits. He also warns that document degradation after 20 edits does not mean automation is impossible in a field. It means current foundation models cannot do all the work alone.

The important question is how AI output will be verified. One agent can perform edits while another checks for errors. Organizations can track change histories and compare originals against outputs. They can also fine-tune models for specific tasks. General-purpose foundation models are flexible, but high-accuracy work in a specific task may require adaptation.

Fine-tuning alone is not enough. The research notes that some multi-agent setups can make performance worse. The key is the quality of verification: how errors will be detected, how originals and results will be compared, and which changes must be sent back to humans.

Some domains allow mathematical or deterministic checks. In software, tests, static analysis, type checks, and regression tests can act as guardrails. Document work needs change tracking, source-result diffing, required-clause checks, policy-violation detection, approval workflows, and domain-expert review. The system must not only inspect AI's final output. It must make AI's change behavior traceable and explainable.

## In the AI Era, Human Roles Move Rather Than Disappear

The article's most important message is more specific than saying humans are still needed. AI shifts human roles from production to supervision, verification, and accountability. That is different from the simple labor-replacement model many executives expect.

As AI advances, some organizations may be tempted to reduce people. But the people most able to catch AI errors are often the domain experts that organizations want to replace or reassign. Frontier-model errors can be hard to spot because the text remains natural and logical. Detecting them requires domain knowledge and experience. If organizations remove too much expertise from the workflow, they may also remove the people who could notice when AI silently corrupts an output.

The value of expertise therefore rises rather than falls. Humans move from producer to supervisor, writer to verifier, and executor to accountable owner.

The age of delegating work to AI has begun. But the key issue is not how fast organizations can hand more work to AI. It is how they will verify and take responsibility for delegated work. In verifiable domains such as Python, AI can quickly become a practical tool. In complex documents and business outputs, organizations must design the scope of automation, depth of verification, and human intervention points together. Competitive advantage in the AI era will depend not only on adoption, but on the ability to build trustworthy delegation structures. The real thing to manage is not AI itself, but the outputs AI produces. Delegation is becoming possible, but responsibility cannot yet be delegated.

## FAQ

### Q1. What is the biggest risk when adopting agentic or delegated AI?

The most serious risk is document corruption: the quiet omission or distortion of key information and context in existing documents. Microsoft research reports that even frontier models can lose about 25% of content after repeated editing delegation.

### Q2. Why are errors from high-performing frontier models more dangerous?

Lower-performing models may omit content in obvious ways. Frontier models can preserve the overall flow and surface quality of the text while subtly changing meaning or important conditions. These errors are hard to notice through simple review.

### Q3. Why is AI performance different in Python programming and general business-document work?

Python has abundant training data and can be checked through execution, tests, and static analysis. Business documents such as contracts and management reports are shaped by organizational norms, rules, and accountability. Small changes can create large legal or financial risks.

### Q4. What can enterprises do to prevent document corruption?

They should not assign editing and validation to the same unchecked system. Editing agents and review agents should be separated, while original-output comparison, change-history tracking, approval workflows, and human review are built into the automation architecture.

### Q5. How will the role of domain experts change as AI adoption increases?

Human work moves from production to supervision, verification, and accountability. Domain experts become more valuable because they can detect polished but incorrect AI outputs that generic review processes may miss.
