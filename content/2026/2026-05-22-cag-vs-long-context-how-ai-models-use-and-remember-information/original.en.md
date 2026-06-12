# CAG vs Long Context: How AI Models Use and Remember Information

Source: https://www.youtube.com/watch?v=B_RrXwDupIg
Saved: 2026-05-22

## Source metadata

- Source URL: https://www.youtube.com/watch?v=B_RrXwDupIg
- Channel: IBM Technology
- Published: 2026-05-21T04:00:27-07:00
- Duration metadata: PT10M59S
- Length seconds: 658
- View count at capture: 6306
- Transcript: English (en), generated: False, segments: 98
- Thumbnail URL: https://i.ytimg.com/vi/B_RrXwDupIg/maxresdefault.jpg
- Capture note: YouTube oEmbed and selected ytInitialPlayerResponse metadata were preserved; full raw YouTube HTML was not copied into the archive because it is large and dynamic.

## Official description

Learn more about AI Models here → https://ibm.biz/~Yk0OZilIN

Long context and CAG are two powerful ways to give AI access to external knowledge. Martin Keen explains how long context, CAG, KV cache, and prompt caching let LLMs process documents faster and more efficiently 🤖. Learn when each method is best for real-world AI workloads.

AI news moves fast. Sign up for a monthly newsletter for AI updates from IBM → https://ibm.biz/~0Z28hPp8U

Hashtags: `#ai` `#llm` `#aimodel` `#cag`

## Parsed viewing guide

- [00:00] **External knowledge problem** — Why LLMs need inference-time access to private or current information, and how RAG, long context, and CAG address that need.
- [01:07] **Long context** — The simple strategy: put all relevant documents directly into the prompt/context window.
- [01:43] **Context windows are expanding** — Examples from GPT-3, GPT-4 Turbo, and Gemini 1.5 Pro illustrate rapid growth in available context size.
- [03:12] **Long-context tradeoffs** — Long context avoids retrieval misses, but token cost, latency, and lost-in-the-middle effects remain practical constraints.
- [04:43] **Cache Augmented Generation and KV cache** — CAG precomputes and reuses the model internal key-value cache instead of rereading stable documents every query.
- [05:30] **CAG phases** — Knowledge preparation, pre-computation of KV cache, and inference by loading the cache plus appending the new query.
- [07:07] **CAG limitations** — The knowledge base still must fit in the context window, and changed sources require cache recomputation.
- [07:39] **Long context vs CAG** — The difference is when computation happens: every query for long context, once up front for CAG.
- [08:35] **Best-fit workloads** — Long context suits one-off analysis; CAG suits repeated questions over a stable knowledge base.
- [09:22] **Prompt caching** — Provider-side prompt caching turns CAG-like behavior into an API feature with discounted cache reads.
- [10:28] **RAG is still a separate option** — The video closes by framing RAG as another external-knowledge pattern rather than building a retrieval pipeline here.

## Timestamped transcript

[00:00] Long context and cache augmented generation are two ways to give a large language model access to external knowledge
[00:07] and they actually build on each other in a way that's worth understanding.
[00:13] So an LLM, a large-language model, it only knows what was in its training data.
[00:20] So if it needs to reason over some data that's in a private document
[00:25] or maybe it needs to take a look at quarters financials, well it needs a way to access that information at inference time.
[00:37] Now most people have heard of RAG, Retrieval Augmented Generation.
[00:43] My goodness, I feel like we've covered RAG a few times before.
[00:49] Now RAG solves this problem with a retrieval pipeline, meaning using things like vector databases and embedding models.
[00:58] But CAG and long context are two other ways to provide an AI model with this external knowledge.
[01:05] So how do they work?
[01:07] Well, it doesn't get much more simple than long context, which is basically to say, just stuff everything into the context window.
[01:17] Send it into the prompt, send it to the AI model that way.
[01:21] Now that's simple, but will everything fit?
[01:24] Well, context windows have been growing pretty fast.
[01:28] So let me illustrate that with a quick diagram.
[01:31] So on this axis here, we're gonna put the size of the context window and then this axis there, this will just be time.
[01:41] Okay, so let's kind of map this out.
[01:43] So if we start in 2020, GPT-3, that could handle thousand tokens.
[01:55] That's maybe 10 pages of text.
[01:59] If we go forward to 2023, well that's where GPT-4 Turbo pushed that quite significantly to 128,000 tokens, which is roughly 300 pages.
[02:14] Then by 2024 Google Gemini 1.5 Pro came along.
[02:22] What do we have here?
[02:23] Two million tokens, that's maybe 20 full length novels, and the trend is still climbing.
[02:32] So the strategy becomes, if the context window is big enough, then just skip the retrieval pipeline entirely.
[02:41] So we just get all of our stuff, we get all our documents that we want to provide as external knowledge,
[02:49] and they go into the prompt along with the query that we want to send to the large language model and it's all stored in this context window.
[03:00] We let the AI model just read the entire thing because we've got such a big context window to go from now and then a response comes out from that model.
[03:12] Now for certain workloads this works really really well.
[03:16] The model has access to everything so there's no risk of the- retrieval step, pulling the wrong documents, or missing something relevant, like rag might do.
[03:26] But there are costs.
[03:28] Literal costs.
[03:30] Because pricing for most LLM APIs scales with token counts.
[03:34] So if this is 200,000 tokens of context, you're going to have to pay that on every single query, and that can add up pretty fast, as does latency.
[03:44] A large context can more processing time per response.
[03:48] Then there's a subtler problem as well,
[03:51] LLMs have what's called the lost in the middle effect.
[03:55] So performance at the beginning of a context window,
[04:01] well that generally is is pretty strong, and then information at the end can generally be retrieved as well,
[04:08] but the information buried in the Middle of the long context window the accuracy can drop significantly.
[04:16] The model attends to the edges better than it does the center.
[04:21] But maybe the biggest issue is that every query reprocesses all of these documents from scratch.
[04:28] So 10 questions about the same set of documents mean the model reads these documents 10 times.
[04:34] Which raises a pretty obvious question.
[04:38] What if the model could read the documents just once and then remember them?
[04:43] Well, that's the idea behind Cache Augmented Generation, or CAG, and the key to understanding it is something called Key Value Cache.
[04:56] So Key Value When a large language model processes text, each layer of the transformer computes what are called key and value matrices.
[05:11] And these are basically the model's working memory and they represent how the model has understood and encoded everything it's read so far.
[05:19] Now, normally these get computed fresh on every single request, but Cag says, do it once and reuse the result.
[05:30] Now we can think about how CAG works in three different phases.
[05:35] And phase number one, that's knowledge preparation.
[05:40] So the relevant documents, they get created and formatted to fit within the model's context window.
[05:45] And those documents can be whatever you like, company policies, product documentation, whatever the knowledge base is.
[05:52] Then in phase two, we move on to pre-computation, which is to say,
[05:57] the model processes all of those documents and generates the KV cache, which is the internal representation of everything it's read.
[06:07] And then that cache gets saved somewhere.
[06:09] So it's persisted.
[06:10] So to disk or to memory.
[06:12] And then phase number three, that's actually the inference phrase.
[06:17] So what happens here is a, you know, a query comes in and it's sent into an AI model to process that query.
[06:29] Then instead of rereading all of the documents, the model just loads this pre-computed KV cache,
[06:37] it appends the new question and then it generates the answer coming out.
[06:43] So the heavy computation already happened in phase two, so phase three here is going to be a lot faster.
[06:50] And in fact Research has showed something like a 10x speedup.
[06:56] When we use small data sets in the KV cache and even more with larger ones, something like 40X compared to reprocessing the full context every time.
[07:07] Now, CAG does have limitations and the obvious one is that the entire knowledge base still has to fit within the context window
[07:18] and when the source documents change, well, the entire KVCache has to be recomputed.
[07:24] So if the data changes frequently.
[07:27] The cost of constantly re-caching starts in, it starts to eat into any latency savings that you are making.
[07:33] So really, CAG works best when the knowledge base here that it's using is stable.
[07:39] So the difference between long context and CAG, well, it comes down to when the computation happens.
[07:45] So with long context, the model has to process every document that we've put into the context window.
[07:54] It needs to do it.
[07:55] Every time on every query that comes in.
[07:59] I mean, it's simple to set up, there's nothing to manage, but the cost and the latency hit come on every inference.
[08:07] With CAG, the model processes all of those same documents, but it only does it once during pre-computation.
[08:18] It saves that KV cache, and then each subsequent query just loads the cache and answers the question.
[08:24] Now the first query is just as expensive as long context, but the second query, the tenth query, the hundredth query, that's where tag starts paying off.
[08:35] Now, long context is also a really good fit for a specific type of query, and that is.
[08:44] Queries where we just call something one time, so analyzing a single document, maybe answering a couple of questions about it.
[08:51] There's no point pre-computing a cache for something that's only going to be queried one time.
[08:56] Whereas CAG is much better if those requests happen over and over.
[09:02] So repeated queries are really where CAG shines against a stable knowledge base,
[09:09] so an HR chat bot answering questions about company policies, for example, because the knowledge doesn't change very often and the cache stays valid.
[09:18] So every query after the first one is gonna be fast and cheap.
[09:22] Now, there is one more piece to this that makes CAG a practical thing to use in the real world.
[09:29] That is called prompt caching.
[09:33] Now major LLM providers now offer prompt cashing as a feature of their APIs.
[09:37] And the idea is essentially CAG as a service which is not a real acronym but that's what it is.
[09:46] So you send a long system prompt containing all the documents and the provider handles the KEV cash management behind the scenes.
[09:55] The subsequent requests that share the same prompt prefix they skip the document processing entirely,
[10:02] and the the economics of this are pretty significant
[10:06] because cash reads can come at a big discounts, something like a 90% discount compared to processing those tokens fresh.
[10:15] So prompt caching takes what was an interesting research idea, which is CAG,
[10:20] and it turns it into something any developer can use without having to manage the cache infrastructure themselves.
[10:28] So an entire video about giving models external knowledge, and we didn't build a single retrieval pipeline using RAG.
[10:38] Whether RAG is still needed after all of this?
[10:42] Well, that's literally the title of another video on this channel.
[10:45] Go check that one out.
