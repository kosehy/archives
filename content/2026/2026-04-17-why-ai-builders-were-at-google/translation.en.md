# Why were the people who built AI at Google?

Source: https://www.linkedin.com/posts/leekh929_ai%EB%A5%BC-%EB%A7%8C%EB%93%A0-%EC%82%AC%EB%9E%8C%EB%93%A4%EC%9D%80-%EC%99%9C-%EA%B5%AC%EA%B8%80%EC%97%90-%EC%9E%88%EC%97%88%EC%9D%84%EA%B9%8C%EC%9A%94-demis-hassabis-share-7449008523440701441-D21U
Saved: 2026-04-17
Translation note: Natural English rendering of a Korean LinkedIn post.

Demis Hassabis, Ilya Sutskever, Dario Amodei. These are the people now leading the AI industry. Google DeepMind, OpenAI, Anthropic. At one point, all of them were at the same company: Google.

Add Jeff Dean to that list and the picture becomes even clearer. Many of the people who built today’s core AI axis passed through Google. Why was that? One obvious answer is that Google had money, or that Google was generous toward research. But after listening to a recent Sundar Pichai interview, a different possibility comes to mind.

Maybe those people gathered at Google because Google had the biggest problems.

## 1. Transformer came from a product problem, not a lab curiosity

According to Sundar, Transformer did not begin as pure research curiosity. Translation quality was not improving. Speech recognition worked, but serving it to two billion people required far more chips than were available. “How do we handle inference?” was the real problem. TPUs emerged from the same context. Researchers solved the problem, but the product gave them the problem. The starting point was not “an interesting research topic,” but “a problem the service cannot survive without solving.”

That difference matters more than it first appears. You can choose interesting topics. You cannot choose to ignore a product bottleneck. If it remains unsolved, the product stops working. So product bottlenecks do not just define research direction, they define its intensity. They create pressure at the level of “this must be solved,” not “this would be nice to solve.”

## 2. Big products encounter the next research problem first

If you follow that idea further, products used by billions are not just large businesses. They are the place where the next research problem appears first. Problems that stay invisible at small scale show up clearly as hard limits at large scale: translation accuracy, search relevance, recommendation quality, serving cost. These become research problems only after usage reaches massive scale. In products with a few hundred users, those same issues may not even be visible yet.

This also helps explain why Google built TPUs through seven generations, started building AI data centers in 2016, and expanded capital expenditure from around $30 billion to $180 billion. The problems created by product scale demanded that level of investment.

## 3. Good problems attract good people

That makes the fact that Demis, Ilya, and Dario were once at Google read differently. Maybe it was not simply because the待遇 was good, but because the biggest and most urgent AI problems were there at the time. Google’s products were creating problem scale that could not yet be encountered elsewhere, and people who wanted to solve those problems gathered there. The place that attracts great researchers is not necessarily the place with the most money. It may be the place with the biggest problems. At least for researchers of that caliber, that may well have been true.

## 4. Those people then left and built today’s AI industry

They took the insight they developed while solving Google’s product problems and used it to build today’s AI industry. Ilya co-founded OpenAI. Dario founded Anthropic. Demis leads Google DeepMind and remains at the center of Google AI.

The familiar sentence that “Google invented the Transformer and other companies commercialized it” may only capture the surface. If you look more closely, Google’s product problems created the research, and the people who grew through that research created the next industry. Problems grew people, and people built industries.

## 5. A company’s greatest asset may be not technology, but problems

And this does not seem like a Google-only story. We often think great research comes from great ideas, visionary leaders, far-seeing strategy, or creative teams. Of course those things matter. But in practice, strong problems may create stronger research. Problems existing methods cannot absorb, problems that will stop the product if unsolved, problems that become sharper as scale increases. Those problems gather people, set direction, and force breakthroughs.

So perhaps the question an organization should ask itself is not “Do we have good technology?” but “Do we have a sufficiently large problem?” Good problems attract good people, and good people create the next technology. Of course, as Google’s case also shows, there is no guarantee those people will stay after solving the problem.
