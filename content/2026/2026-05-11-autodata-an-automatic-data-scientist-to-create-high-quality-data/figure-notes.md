# Figure Notes

## figure-01
- Status: recovered
- File: `figures/figure-01-main2.png`
- What it shows: Autodata pipeline: autonomous data scientist iteratively generates data, inspects/evaluates it, synthesizes insights, updates the generation recipe, and can itself be meta-optimized. Source image: https://facebookresearch.github.io/RAM/blogs/autodata/main2.png
- Why it matters: Establishes the article’s central loop: inference-time agent work is converted into better training/evaluation data, then into improved data-scientist scaffolds.

## figure-02
- Status: recovered
- File: `figures/figure-02-asi2.png`
- What it shows: Weak-vs-strong Agentic Self-Instruct: main agent coordinates Challenger, Weak Solver, Strong Solver, and Judge, seeking examples where strong succeeds and weak fails. Source image: https://facebookresearch.github.io/RAM/blogs/autodata/asi2.png
- Why it matters: Shows the concrete operationalization of Autodata and the weak/strong separation criterion that drives data selection.

## figure-03
- Status: recovered
- File: `figures/figure-03-cs1.png`
- What it shows: Quality statistics chart for CS research QA pairs comparing CoT Self-Instruct with Agentic Self-Instruct weak/strong solver scores. Source image: https://facebookresearch.github.io/RAM/blogs/autodata/cs1.png
- Why it matters: Supports the data-quality claim: Agentic Self-Instruct widens weak-vs-strong separation relative to single-shot CoT Self-Instruct.

## figure-04
- Status: recovered
- File: `figures/figure-04-agent_trajectory_round6.jpg`
- What it shows: Example agent trajectory through six rounds on a CS paper, culminating in an accepted question with weak 48%, strong 93%, and a 45-point gap. Source image: https://facebookresearch.github.io/RAM/blogs/autodata/agent_trajectory_round6.jpg
- Why it matters: Illustrates how iterative feedback changes the question angle and why repeated failure analysis matters for challenging-data creation.

## figure-05
- Status: recovered
- File: `figures/figure-05-cs3.png`
- What it shows: RL training results chart for Qwen-3.5-4B trained on CoT Self-Instruct versus Agentic Self-Instruct data. Source image: https://facebookresearch.github.io/RAM/blogs/autodata/cs3.png
- Why it matters: Connects generated data quality to downstream model improvement, not just benchmark discrimination.

## figure-06
- Status: recovered
- File: `figures/figure-06-meta1.png`
- What it shows: Meta-optimization loop for the data scientist agent: evaluate harnesses, analyze failures, edit the scaffold, and accept improvements on validation papers. Source image: https://facebookresearch.github.io/RAM/blogs/autodata/meta1.png
- Why it matters: Shows the outer-loop idea: the data-generating agent/scaffold is itself trainable or optimizable using data-quality criteria.

## figure-07
- Status: recovered
- File: `figures/figure-07-meta3.png`
- What it shows: Validation pass-rate progression for meta-optimized data-scientist harnesses, rising from the baseline toward 42.4% over accepted iterations. Source image: https://facebookresearch.github.io/RAM/blogs/autodata/meta3.png
- Why it matters: Provides evidence that scaffold/meta-harness optimization can materially improve data generation quality, while still leaving reliability limitations.
