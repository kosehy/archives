# Anthropic Economic Index report: Learning curves

Source: https://www.anthropic.com/research/economic-index-march-2026-report
Saved: 2026-03-29

The Anthropic Economic Index uses our privacy-preserving data analysis system to track how Claude is being used across the economy. It’s part of our effort to understand the economic impacts of AI as early as possible, so that researchers and policymakers have adequate time to prepare.

This latest report studies Claude usage in February 2026, building on the economic primitives framework introduced in our previous report (which used data from November 2025). Our sample covers February 5 to February 12, three months following the release of Claude Opus 4.5 and coincident with the release of Claude Opus 4.6.

We first document how usage has changed relative to our previous reports: the rate of augmentation, collaborative interaction where the AI complements the user’s abilities, increased slightly in both Claude.ai and API traffic. In Claude.ai, usage diversified, with the top 10 tasks accounting for a smaller share of usage last month than in November 2025. As a result of this diversification, the average conversation in Claude.ai had a slightly lower-wage task than in previous reports.

We then focus on an important determinant of Claude’s impact on the labor market and the broader economy: learning curves in Claude adoption. We present evidence that high-tenure users have developed habits and strategies that allow them to better harness Claude’s capabilities. Indeed, we document that more experienced users not only attempt higher-value tasks, but are also more likely to elicit successful responses in their conversations.

## What has changed since our last report

- Use cases on Claude.ai diversified. Coding tasks continue to migrate from augmentative usage in Claude.ai to more automated workflows in our first-party API traffic. In this report, Claude.ai usage was less concentrated: the top 10 tasks made up 19% of all traffic in February, down from 24% in November. That said, almost all tasks in this sample appeared in at least one of our previous samples. About 49% of jobs have seen at least a quarter of their tasks performed using Claude.
- Claude adoption broadened to lower-wage tasks. As use cases have diversified, the average economic value of work done on Claude—as measured by US wages paid to workers in the associated occupations—has decreased slightly. This is caused, mechanically, by a rise in personal queries around sports, product comparisons, and home maintenance. The pattern is consistent with a standard adoption curve story, in which early adopters favor specific high-value uses like coding, and later adopters take on a much wider range of tasks.
- Inequality in global usage has persisted. Usage remains heavily concentrated: the top 20 countries account for 48% of all per-capita usage, up from 45%, underscoring a persistent gap in global adoption. However, Claude usage per capita continued to converge within the United States: the share of usage accounted for by the 10 highest usage states decreased from 40% to 38% since our last report.

## Learning curves

A central finding in the Economic Index is that early adoption of Claude is very uneven: Claude is used more intensely in high-income countries, within the US in places with more knowledge workers, and for a relatively small set of specialized tasks and occupations.

An important question is how inequality of adoption might determine where and to whom the benefits of AI will accrue. If, for example, effective AI use requires complementary skills and expertise—and if such skills can be acquired through use and experimentation—then the benefits from early adoption may be self-reinforcing.

The report investigates how users shape the value they get out of Claude: how they match model capability to the task at hand, and how usage patterns and outcomes shift with experience on the platform.

- Model selection matches the task. Users choose Opus, Anthropic’s most intelligent model class, more often for tasks that normally receive higher wages in the labor market. Among paying Claude.ai users, Opus is used more than average for coding tasks and less than average for tutoring-related tasks. This pattern is even stronger for API users.
- Higher tenure, higher success. Users who have been using Claude for 6 months or more attempt higher-education, more work-related tasks, spend less time on personal uses, and have higher success rates in their conversations. This pattern is not fully explained by task selection, geography, or other obvious factors. It could reflect both selection effects and learning-by-doing.

## Diversification of use cases in Claude.ai

The report samples 1 million conversations from both Claude.ai and Anthropic’s first-party API. Coding remains the most common use, accounting for 35% of conversations on Claude.ai. But between November 2025 and February 2026, use cases on Claude.ai became less concentrated: the top 10 most common tasks fell from 24% of conversations to 19%.

Part of this shift reflects coding tasks moving into API-based workflows, especially through Claude Code, whose agentic architecture splits coding work into smaller API calls classified as distinct tasks. But another major factor is a shift in user mix. Coursework fell from 19% to 12% of conversations, while personal use rose from 35% to 42%, likely due to academic seasonality and a rise in casual users.

Even though work tasks diversified, most of them were not truly new. The earlier estimate that about 49% of jobs had seen at least a quarter of their tasks performed using Claude barely changed.

## Collaboration and automation patterns

Anthropic groups interactions into two broad categories: automation and augmentation. In Claude.ai, augmentation increased slightly, driven by more validation and learning patterns. In API data, automation decreased sharply, though the API still shows more directive workflows overall.

The API platform continued gaining a higher share of Computer and Mathematical tasks. Since August 2025, tasks in that category increased by 14% in the API and decreased by 18% in Claude.ai. Anthropic interprets this migration from Claude.ai to the API as a sign of more imminent work transformation in those jobs.

Two API workflows appeared far more frequently in February than three months earlier:
- business sales and outreach automation
- automated trading and market operations

## Geographic convergence and divergence

Within the United States, Claude usage per capita continued to converge across states, though more slowly than before. The share of per-person usage going to the top five states fell from 30% to 24% between August 2025 and February 2026.

Across countries, however, usage became slightly more concentrated. The top 20 countries increased their share of usage from 45% to 48%, suggesting that lower-adoption countries are falling further behind.

## Learning to use AI

The report studies two signals of how people learn to use AI: model selection and user tenure.

Anthropic finds that users appear to route harder, higher-value tasks to Opus, its most capable model class. For paid Claude.ai accounts, coding-related tasks show higher Opus usage than educational tasks. On both Claude.ai and the API, tasks associated with higher-paid occupations are more likely to use Opus, and the effect is much stronger for API users.

On tenure, users who signed up at least six months earlier are more likely to use Claude collaboratively, more likely to use it for work, less likely to use it for personal tasks, and more likely to succeed in conversations. They also tend to bring tasks that imply higher levels of education.

The report notes that some of this may reflect cohort effects or survivorship bias: early adopters may be more technical, and long-term users may simply be the ones who already get value from Claude. But even after controlling for task type, use case, model, country, and other factors, higher-tenure users still show higher success rates.

## Discussion

Anthropic concludes that Claude is still disproportionately used for relatively high-value, complex work rather than tasks representative of the average US economy. However, as the user base broadens, lower-remunerated and more casual tasks are becoming a somewhat larger share of usage.

More experienced users tend to use Claude more collaboratively, for more work-related and complex tasks, and with more success. Anthropic argues this is consistent with learning-by-doing: the more time people spend using AI, the better they become at extracting value from it.

The report warns that this may deepen labor-market inequality. If early adopters with more technical, higher-skill tasks are both more exposed to AI disruption and better able to benefit from AI assistance, then adoption advantages may reinforce themselves over time.

## Appendix

Available here: https://cdn.sanity.io/files/4zrzovbb/website/a3cdcd9e67c3c4c51440429dd016cacba514b35b.pdf

## Data availability

Data from this report is available here: https://huggingface.co/datasets/Anthropic/EconomicIndex

## Authors

First author block:
- Maxim Massenkoff
- Eva Lyubich
- Peter McCrory

Second author block:
- Ruth Appel
- Ryan Heller

Citation date: 2026-03-24
