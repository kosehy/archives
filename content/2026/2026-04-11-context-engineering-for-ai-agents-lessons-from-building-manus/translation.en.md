# Context Engineering for AI Agents: Lessons from Building Manus

Original: https://manus.im/ko/blog/Context-Engineering-for-AI-Agents-Lessons-from-Building-Manus
Saved: 2026-04-11
Translation note: Edited for natural English flow rather than literal sentence-by-sentence rendering.

At the beginning of the Manus project, my team and I faced an important decision: should we train an end-to-end agent model on top of open source foundations, or should we build an agent around the in-context learning capabilities of state-of-the-art frontier models?

For the first decade of NLP, we did not really have that choice. In the BERT era, yes, it has already been seven years, models had to be fine-tuned and evaluated before they could transfer to a new task. Even though those models were much smaller than today's LLMs, each iteration still took weeks. For fast-moving applications, especially before product-market fit, that slow feedback loop was a fatal disadvantage. I learned this painfully at my previous startup, where I trained models from scratch for open information extraction and semantic search. Then GPT-3 and Flan-T5 arrived, and my custom models became irrelevant almost overnight. Ironically, those same models became the starting point of in-context learning and opened up an entirely new path.

That hard-earned lesson made the choice clear: Manus would bet on context engineering. That let us ship improvements in hours rather than weeks, and kept our product orthogonal to the base model layer. If model progress is a rising tide, Manus wanted to be a ship, not a pillar fixed to the seafloor.

Even so, context engineering was never simple. It is an experimental science, and we rebuilt our agent framework four times as we discovered better ways to construct context. We jokingly call this manual process of architecture search, prompt tuning, and empirical guesswork “stochastic graduate student descent.” It is not elegant, but it works.

In this essay, I want to share the local optimum we reached through our own “SGD.” If you are building your own AI agent, I hope these principles help you converge faster.

### Design around the KV cache

If I had to choose just one metric, I would argue that KV-cache hit rate is the single most important metric for production AI agents. It directly affects both latency and cost. To see why, consider how a typical agent works.

After receiving user input, the agent enters a chain of tool-use steps to complete the task. At each iteration, the model selects an action from a predefined action space based on the current context. That action is executed in the environment, for example Manus's virtual machine sandbox, and produces an observation. The action and observation are appended to the context, forming the input for the next iteration. This loop continues until the task is complete.

As you know, the context keeps growing at every step, while the output, usually a structured function call, stays relatively short. That creates a far more skewed prefilling-to-decoding ratio than in ordinary chatbots. In Manus, for example, the average input-to-output token ratio is about 100:1.

Fortunately, contexts that share the same prefix can benefit from KV caching, which dramatically reduces time-to-first-token and inference cost, whether you self-host the model or call an inference API. And the savings are not small. In Claude Sonnet, for example, cached input tokens cost 0.30 USD per million tokens, while uncached tokens cost 3 USD per million, a tenfold difference.

From a context engineering perspective, improving KV-cache hit rate includes several core practices.

1. Keep prompt prefixes stable. Because of the autoregressive nature of LLMs, even a one-token difference can invalidate the cache for everything that follows. A common mistake is putting a timestamp at the beginning of the system prompt, especially one precise to the second. That helps the model know the current time, but severely damages cache hit rate.
2. Make context append-only. Do not mutate prior actions or observations. Ensure serialization is deterministic. Many programming languages and libraries do not guarantee stable key order when serializing JSON objects, and that can silently poison the cache.
3. Mark cache breakpoints explicitly when necessary. Some model providers or inference frameworks do not support automatic incremental prefix caching, and instead require manual cache breakpoints in the context. When placing them, think about likely cache expiration, and at minimum make sure a breakpoint includes the end of the system prompt.

If you self-host with a framework like vLLM, also make sure prefix or prompt caching is actually enabled, and use techniques like session IDs so requests are routed consistently across distributed workers.

### Mask, do not remove

As agents gain more capabilities, their action space naturally becomes more complicated. Put simply, the number of tools explodes. The recent popularity of MCP only accelerates this. If you allow user-configurable tools, someone will eventually attach hundreds of mysterious tools to the carefully curated action space you designed. The result is predictable: the model becomes more likely to choose the wrong action or follow an inefficient path. In short, a better-armed agent can become a dumber one.

The natural response is to build a dynamic action space, perhaps using something like RAG to load tools on demand. We tried that in Manus too. But our experiments led us to a clear rule: unless it is absolutely necessary, avoid dynamically adding or removing tools in the middle of an interaction loop. There are two main reasons.

1. In most LLM stacks, tool definitions are serialized near the front of the context, usually around the system prompt. Any change there invalidates the KV cache for all subsequent actions and observations.
2. When earlier actions and observations refer to tools that are no longer defined in the current context, the model gets confused. Without constrained decoding, this often leads to schema violations or hallucinated actions.

To solve this while still improving action selection, Manus uses a context-aware state machine to manage tool availability. Instead of removing tools, it masks token logits during decoding to prevent or force certain action choices based on the current context.

In practice, most model providers and inference frameworks support some form of response prefill, which lets you constrain the action space without changing tool definitions. In general, function calling has three common modes.

- Auto: the model can decide whether to call a function. This is implemented by prefilling only the response prefix: `<|im_start|>assistant`
- Required: the model must call a function, but the choice is unrestricted. This is implemented by prefilling up to the tool call token: `<|im_start|>assistant<tool_call>`
- Specified: the model must call a function from a specific subset. This is implemented by prefilling part of the function name: `<|im_start|>assistant<tool_call>{"name": "browser_`

This makes it possible to directly mask token logits and narrow action choice. For example, when a user provides new input, Manus should respond immediately rather than take an action first. We also deliberately designed action names with stable prefixes. All browser-related tools start with `browser_`, and command-line tools start with `shell_`. That makes it easy to force the agent toward particular tool groups in particular states without relying on a more complicated state-based logit processor.

This design helps keep the Manus agent loop stable even in a model-centric architecture.

### Use the filesystem as context

Modern frontier LLMs now offer context windows of 128K tokens or more. But in real agent scenarios, that is still not enough, and sometimes it becomes a burden. Three problems show up repeatedly.

1. Observations can be enormous, especially when the agent interacts with unstructured data such as web pages or PDFs. They can easily exceed context limits.
2. Model performance tends to degrade beyond a certain context length, even if the window is technically supported.
3. Long inputs are expensive, even when prefix caching is available. You still pay to transmit and prefill every token.

To handle this, many agent systems implement truncation or compression strategies. But overly aggressive compression inevitably causes information loss. The problem is fundamental: agents predict the next action based on all prior state, and you cannot reliably know which observation will matter ten steps later. From a logical perspective, any irreversible compression carries risk.

That is why Manus treats the filesystem as the ultimate context. It has no size limit, it is naturally persistent, and the agent can manipulate it directly. The model learns to write to and read from files as needed, using the filesystem not just as storage but as structured external memory.

Our compression strategy is designed to remain recoverable. For example, the content of a web page can be omitted from the context as long as the URL is preserved, and a document's contents can be omitted as long as its path remains available in the sandbox. That allows Manus to reduce context length without permanently losing information.

While developing this capability, I found myself imagining what conditions would be necessary for state space models to work effectively in agent environments. Unlike transformers, SSMs do not have full attention and struggle with long-range backward dependencies. But if they could master file-based memory, externalizing long-term state instead of keeping it all in-context, their speed and efficiency might open the door to a new class of agents. Agentic SSMs could become the true successor to neural Turing machines.

### Manipulate attention through recitation

If you have used Manus, you may have noticed something interesting. When handling a complex task, it creates a `todo.md` file, updates it step by step as the task progresses, and checks off completed items.

That is not just a cute behavior. It is an intentional mechanism for manipulating attention.

A typical Manus task requires around 50 tool calls on average. That is a long loop, and because Manus relies on an LLM for decision-making, it can drift off course or forget earlier goals, especially in long contexts or complicated tasks.

By continually rewriting the to-do list, Manus is effectively reciting its goals at the end of the context. That pushes the entire plan back into the model's recent attention range, helping it avoid the problem of getting lost in the middle and reducing goal misalignment. In practice, it biases its own focus toward the task objective using natural language, without needing any special architectural change.

### Keep the wrong turns too

Agents make mistakes. That is not a bug, it is reality. Language models hallucinate, environments return errors, external tools malfunction, and unexpected exceptions always happen. In multistep tasks, failure is not an exception. It is part of the loop.

Even so, the common instinct is to hide those failures: clean up the trace, retry the action, reset the model's state, and hand the rest over to temperature and luck. That feels safer and more controlled. But it comes at a cost. If you erase failures, you erase evidence. And without evidence, the model cannot adapt.

In our experience, one of the most effective ways to improve agent behavior is surprisingly simple: leave the wrong turns in the context. When the model can see a failed action and the resulting observation or stack trace, it implicitly updates its internal beliefs. That lowers the prior probability of similar actions and makes repetition of the same mistake less likely.

In fact, we believe error recovery is one of the clearest signs of genuinely agentic behavior. Yet it is still underrepresented in most academic work and public benchmarks, which mostly focus on task success under ideal conditions.

### Do not get fooled by few-shot examples

Few-shot prompting is a common technique for improving LLM output. But in agent systems, it can backfire in subtle ways.

Language models are excellent imitators. They copy behavior patterns from context. If the context is full of similar past action-observation pairs, the model tends to repeat those patterns even when they are no longer optimal.

That can be dangerous in tasks involving repeated decisions or actions. For example, when Manus reviews 20 resumes, the agent can slip into a rhythm, repeating similar behaviors simply because they are present in context. This can lead to drift, overgeneralization, or even hallucination.

The answer is to increase variation. Manus injects small amounts of structured variation into actions and observations: different serialization templates, alternate wording, and small noise in ordering or format. That controlled randomness helps break patterns and retune the model's attention.

In other words, do not trap yourself inside a handful of examples. The more uniform the context becomes, the more fragile the agent becomes.

### Conclusion

Context engineering is still an emerging science, but for agent systems it is already essential. Models are getting stronger, faster, and cheaper, but no amount of raw capability removes the need for memory, environment, and feedback. How you construct context ultimately determines how an agent behaves, how fast it executes, how well it recovers, and how well it scales.

At Manus, we learned these lessons through repeated rewrites, dead ends, and real-world testing at the scale of millions of users. Not everything shared here is universal truth, but these are the patterns that worked for us. If this essay helps you avoid even one painful iteration, it has done its job.

The future of agents will be built one context at a time. Design them well.
