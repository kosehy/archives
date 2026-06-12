# Figure Notes

## figure-01
- Status: recovered
- File: `figures/figure-01.png`
- What it shows: We align Claude by training on constitutionally aligned documents, high quality chat data that demonstrates constitutional responses to difficult questions, and a diverse set of environments. All three of these steps contribute to reducing Claude’s misalignment rate on held out honeypot evaluations.
- Why it matters: It grounds the article’s core claim that targeted safety training reduced agentic-misalignment/honeypot failures.

## figure-02
- Status: recovered
- File: `figures/figure-02.png`
- What it shows: Average of three honeypot evaluations (blackmail, research sabotage, framing for crimes) for Claude Sonnet 4 trained on different datasets. Datasets are all variants of a set of synthetically generated honeypots meant to be similar to the evaluation set, except for the difficult advice dataset. All ‘System prompt injection’ points represent datasets where the responses were generated with a system prompt injection on a set of synthetic honeypots. The pareto-optimal training dataset is ‘Difficult advice”.
- Why it matters: It grounds the article’s core claim that targeted safety training reduced agentic-misalignment/honeypot failures.

## figure-03
- Status: recovered
- File: `figures/figure-03.png`
- What it shows: Performance of experimental models and Claude Sonnet 4 on an older version of our automated alignment assessment. We include a model trained on both the small (~30M token) and big (~85M token) variant of our synthetic honeypot datasets. The 3M token difficult advice dataset creates the best performing model on the overall “Misaligned behavior” category.
- Why it matters: It grounds the article’s core claim that targeted safety training reduced agentic-misalignment/honeypot failures.

## figure-04
- Status: recovered
- File: `figures/figure-04.png`
- What it shows: With a large, well-constructed dataset of constitutional documents with an emphasis on positive fictional stories, the blackmail rate can be reduced from 65% to 19%. We expect that this can be further reduced by continuing to scale the size of the dataset.
- Why it matters: It grounds the article’s core claim that targeted safety training reduced agentic-misalignment/honeypot failures.

## figure-05
- Status: recovered
- File: `figures/figure-05.png`
- What it shows: On our constitutional adherence evals and (a lightweight version of) our automated alignment assessment, constitutional documents (synthetic document fine-tuning, or SDF) and high quality transcript training improve performance on all metrics. This improvement persists through RL.
- Why it matters: It explains how constitutional-data and transcript-training interventions affect alignment metrics.

## figure-06
- Status: recovered
- File: `figures/figure-06.png`
- What it shows: Average score on honeypot evals over training steps for several different variants of the same core environments. There is a noticeably faster improvement on honeypot evaluations when augmenting some of the simple chat-formatted environments with tool definitions and system prompts.
- Why it matters: It grounds the article’s core claim that targeted safety training reduced agentic-misalignment/honeypot failures.
