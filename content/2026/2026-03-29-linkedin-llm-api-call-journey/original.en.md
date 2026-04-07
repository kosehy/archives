# You hit "Send" on an LLM API call.

Source: https://www.linkedin.com/posts/brijpandeyji_you-hit-send-on-an-llm-api-call-400-share-7443133741075521536-cdjK
Saved: 2026-03-29

~400 milliseconds later you get a response.

Ever wonder what happened in between?

14+ infrastructure layers. Billions of matrix multiplications. Thousands of dollars in GPU compute per hour.

This applies to every major provider — OpenAI, Anthropic, Google, all of them.

Here's the full journey:

## Step 1: API Gateway (~5ms)

Your request doesn't go straight to a model.

- TLS termination
- API key validation
- Rate limiter checks tokens-per-minute and requests-per-minute
- Request schema validation
- Billing meter starts ticking

That 429 error you sometimes get? It dies right here.

## Step 2: Load Balancer (~2ms)

Your request gets routed to one of many GPU clusters.

- Geographic routing to nearest data center
- Least-connections algorithm picks the cluster
- Health checks running continuously

This is why latency varies between identical calls.

## Step 3: Tokenization (~3ms)

Your text gets converted to numbers.

- BPE, SentencePiece, or WordPiece depending on the provider
- Each token is roughly 4 characters
- Context window limit checked here

Token count equals your cost. This is where the meter runs.

## Step 4: Model Router (~1ms)

The layer nobody talks about.

- Large model requests route to heavy multi-GPU clusters
- Small model requests route to optimized single-GPU clusters
- Embedding requests route to dedicated clusters
- Queue management during peak traffic

Every provider with multiple models has this layer.

## Step 5: Inference (~300-800ms)

This is 95% of your wait time. Two phases:

### Prefill
- All input tokens processed in parallel
- Attention scores computed across Query and Key matrices
- KV Cache generated and stored in GPU HBM memory
- This is why long prompts have higher time-to-first-token

### Decode
- One token generated per forward pass
- KV Cache reused so past tokens aren't recomputed
- Temperature and top_p sampling happens at this step
- Each token sent immediately if streaming is on

This is the fundamental reason streaming exists — tokens are generated one at a time.

The hardware doing this:
- A100 / H100 / H200 GPUs with 80GB+ HBM
- Model weights split across multiple GPUs via tensor parallelism
- Multiple user requests batched together for throughput
- Flash Attention and GQA for memory efficiency

This is why GPU compute costs $2-3 per hour.

## Step 6: Post-Processing (~5ms)

- Token IDs converted back to readable text
- Safety classifier runs on the output
- Stop sequences checked
- Response packaged as JSON

## Step 7: Billing & Response

- Input tokens × price per 1K
- Output tokens × price per 1K (usually 3-5x more expensive)
- Prompt caching reduces cost at most providers now

None of this is specific to one provider. This is how LLM inference works at scale — whether you're calling OpenAI, Anthropic, Google, or anyone else.
