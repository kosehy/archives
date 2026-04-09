# Context engineering? Now it is called harness engineering.

Original: https://www.linkedin.com/posts/leekh929_%EC%BB%A8%ED%85%8D%EC%8A%A4%ED%8A%B8-%EC%97%94%EC%A7%80%EB%8B%88%EC%96%B4%EB%A7%81-%EC%9D%B4%EC%A0%9C%EB%8A%94-%ED%95%98%EB%84%A4%EC%8A%A4-%EC%97%94%EC%A7%80%EB%8B%88%EC%96%B4%EB%A7%81%EC%9D%B4%EB%9D%BC%EA%B3%A0-%ED%95%A9%EB%8B%88%EB%8B%A4-%ED%94%84%EB%A1%AC%ED%94%84%ED%8A%B8%EB%A5%BC-share-7447647195337596929-F_oJ?utm_source=share&utm_medium=member_android&rcm=ACoAAAXt8v0BjTAFa8U2A--Uyng7OCcG4aSv6gE
Archived: 2026-04-10
Language: English
Type: English translation

This LinkedIn post argues that the center of gravity in effective AI use is shifting again.

There was a time when prompt engineering mattered most. Then the focus moved to context engineering, where the key question became what information should be given to the model. Now, the post argues, the more important question is different: how do we build an environment in which agents can produce good results on their own?

That is what the author calls harness engineering.

## 1. The question has changed

Prompt engineering asked, "How should we ask?" Context engineering asked, "What should we tell the model?" Harness engineering asks, "How do we create an environment where the agent can reliably produce good outcomes by itself?"

Prompts improve a single conversation. Context improves a single task. Harness improves the whole system in which every task runs. The underlying principle is simple: when the agent fails, the response should not be "give better instructions," but "what structure was missing?"

## 2. What accumulates has changed

According to the post, the first month and a half was ten times slower than doing the work directly. But once that cost was paid, one person could later achieve team-scale productivity. In this setup, agents submit work, pass automated validation, resolve conflicts, and complete final integration autonomously. If the result is poor, the whole output is discarded and rebuilt from scratch.

As a result, attachment shifts away from the code itself and toward the environment that produces good code, including documentation, tests, quality criteria, and architecture. The post notes that a seven-person team broke its codebase into 500 independent modules so that agents would interfere with one another less. In the old model, good code accumulated. In the new model, the environment that generates good code accumulates.

## 3. Mistakes accumulate differently

One of the strongest lines in the post is: "Every mistake an agent makes is a standard that has not yet been written down."

If an outage leads to adding a timeout, that is not the end. The team also writes down a rule such as "all network calls must have timeouts." A single fix becomes a permanent guardrail. The team gathers full agent session logs every day, identifies what the team can do better, and reflects that learning into the system. What one person learns automatically improves the environment for everyone. In prompt engineering, mistakes ended with "next time, ask better." In harness engineering, mistakes become permanent system improvements.

## 4. Models improve every month, but harnesses must be built

The team reportedly went through four model-generation changes over five months. Each time the model improved, teams with a well-built harness could absorb that gain immediately. As models become capable of more, the harness becomes the path through which that capability is actually realized.

By contrast, simply swapping models without a harness is like starting over every time. As models improve, the value of writing clever prompts declines because the model can understand more on its own. But the value of designing the environment in which agents work rises, because that is not something the model can do for you.

The post concludes that the meaning of using AI well is shifting, from asking well, to informing well, to making the system work well.
