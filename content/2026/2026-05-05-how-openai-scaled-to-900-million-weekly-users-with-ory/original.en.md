# How OpenAI scaled to 900 million weekly users with Ory

Source: https://thenewstack.io/openai-ory-identity-scale/
Saved: 2026-05-05

## Source Metadata

- Title: How OpenAI scaled to 900 million weekly users with Ory
- Source: The New Stack
- Author: Damon Tepe
- Published: 2026-05-04T16:00:00+00:00
- Canonical URL: https://thenewstack.io/openai-ory-identity-scale/
- Shared URL: https://share.google/VhLHta9WorwsEORuL
- Description: OpenAI replaced its legacy login system with Ory Hydra to scale identity for 900 million weekly users with zero downtime and full IAM control.
- Categories: AI Infrastructure, Open Source, Security
- Reading time: 4 minutes
- Cover image URL: https://cdn.thenewstack.io/media/2026/05/c5425c98-getty-images-f7hvqfyjz9u-unsplash-scaled.jpg
- Sponsor disclosure: Ory sponsored this post. Insight Partners is an investor in Ory and TNS.

## Extractor Notes

- Resolved the Google shared URL to the canonical The New Stack URL with Python urllib redirects.
- Extracted article body from `.content-column-post-body`, preserving headings, lists, blockquotes, and important inline links.
- Excluded navigation, scripts, newsletter/signup/footer widgets, and unrelated site chrome.
- The article is a sponsored/contributed post by Ory; the sponsor disclosure is preserved in metadata.

## Article Body

In the history of software, few milestones are as staggering as [900 million weekly active users](https://openai.com/index/scaling-ai-for-everyone/). To put that in perspective, OpenAI’s user base now rivals the populations of entire continents, all interacting with a high-compute, stateful AI environment.

At this scale, “Identity and Access Management” (IAM) is no longer just about a login box; it is the gatekeeper of system stability, data privacy, and global accessibility.

When OpenAI launched ChatGPT, they didn’t just release a product; they triggered a global shift in computing. To survive the resulting “success disaster,” OpenAI needed an identity layer that could scale horizontally without friction, maintain absolute security, and offer flexibility and control across multiple deployment options.

When OpenAI faced the challenge of managing millions of identities, they didn’t choose a traditional, monolithic “Identity-as-a-Service” provider. Instead, they leveraged [Ory](https://www.ory.com/) to build a bespoke, hardened, and infinitely scalable identity system.

## The Challenge: Scaling through a “success disaster”

The launch of ChatGPT was the fastest-growing consumer application launch in history. ChatGPT reached 1 million users in just five days. Traditional IAM solutions often struggle with:

- **Database Bottlenecks:** Most identity providers use rigid database schemas that don’t play well with global, multi-region distribution.
- **Latency:** When 900 million users log in, even a 100ms delay in token validation can add up to massive infrastructure costs and a poor user experience.
- **Lack of Control:** OpenAI wanted the ability to conduct A/B testing and observe user behavior to optimize performance for its audience.
- **Deployment Flexibility:** OpenAI required a system that enabled them to self-host in an environment of their choosing.

By adopting a standards-based, agile IAM approach, OpenAI avoided vendor lock-in and secured a frictionless, globally scalable user experience that they could control.

> “OpenAI wanted a partner that could help enable our vision for owning our identity processes, data, and success. We have a lot of partners, and Ory is one of our best.” **– Benjamin Billings, Engineering Manager, OpenAI**

## The results: Infrastructure for the next billion

Following the implementation of Ory, OpenAI successfully navigated what Benjamin Billings described as a “success disaster”, the explosive growth from 200 million to over 400 million weekly active users within just a few months.

The move to Ory also resolved the “SaaS paradox” of needing enterprise-grade security without the rigid constraints of a monolithic provider. OpenAI gained full control over its user interface and roadmap, allowing it to build a bespoke experience for both consumer and enterprise users. Ultimately, the partnership accelerated OpenAI’s [engineering velocity](https://thenewstack.io/accelerating-developer-velocity-with-effective-platform-teams/); instead of spending months building and maintaining a homegrown identity stack, the team leveraged Ory’s expertise and responsive support to focus on their core mission of AI innovation, ensuring that identity remained a secure, invisible foundation for their global user base.

**_Key Results:_**

- **Massive Scalability:** Successfully managed the meteoric rise of users from 100 million to over 900 million weekly active users.
- **Zero-Downtime Migration:** Replaced the [legacy login system](https://thenewstack.io/orchestration-the-key-to-integrating-ai-with-legacy-systems/) without any disruption to the weekly active user sessions.
- [**Enhanced Observability**](https://thenewstack.io/opensearch-3-2-delivers-hybrid-search-enhanced-observability-tools/)**:** Gained deeper “in-house” control over identity data and traffic, which was previously lost when using third-party full-stack providers.
- **Engineering Velocity:** Accelerated the rollout of new features by relying on Ory’s expert support and battle-tested Ory Hydra engine for complex tokenization.

OpenAI’s journey to 900 million weekly active users is a masterclass in infrastructure design. By choosing Ory, OpenAI avoided the “vendor lock-in” of traditional SaaS and the “maintenance nightmare” of a homegrown system.

Ory provided the identity system that allowed OpenAI to:

1. **Stay Lean:** A small team of security engineers can manage nearly a billion identities.
2. **Stay Secure:** Using hardened, audited open-source that the world’s best researchers trust.
3. **Stay Fast:** Delivering tokens and validating sessions at the “Edge” of the internet.

As OpenAI approaches the 1 billion weekly user mark, the Ory-powered identity layer remains one of the most critical yet invisible components of the most important technology story of our time.

> “Overall, working with your team has been very satisfying. You’ve been very responsive. You’ve done changes that we’ve asked for in a very timely manner. So it’s been overall great working with you all.” **– Benjamin Billings, Engineering Manager, OpenAI**

_Read the_ [_original case study_](https://www.ory.com/case-studies/openai) _or_ [_watch the interview_](https://www.ory.com/resources/videos/openai-scales-to-800m-users-with-ory).

## Take the next step with Ory

- _Agent IAM is the next big thing,_ [_hear Ory CEO’s thoughts_](https://www.ory.com/resources/videos/agentic-ai-identity-security-the-future-of-ciam-vmblog).
- _Global survey on Agentic readiness._ [_See what peers think_](https://www.ory.com/resources/whitepapers/agentic-ai-identity-security-readiness).
- _Modern identity strategies: AI Agents, passwordless, mobile UX._ [_Watch the video_](https://www.ory.com/resources/webinars/top-5-trends-in-customer-identity-and-access-management-ciam).
