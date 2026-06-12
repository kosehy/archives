# Google CEO: Agents, Open Source, Race to AGI, Cybersecurity, Chips, China

Source: https://www.youtube.com/watch?v=IB7IW6zX-H0
Saved: 2026-05-23

## Source metadata

- Source URL: https://www.youtube.com/watch?v=IB7IW6zX-H0
- Submitted URL: https://youtube.com/watch?v=IB7IW6zX-H0&si=-B4FA6Hc2sH-8Cxq
- Video ID: IB7IW6zX-H0
- Channel: Matthew Berman
- Published: 2026-05-20T11:55:27-07:00
- Upload date: 2026-05-20T11:55:27-07:00
- Duration metadata: 1819 seconds
- Transcript estimate: 1816.88 seconds
- View count at capture: 27753
- Transcript: English (auto-generated) (`en`), generated: True, segments: 751
- Thumbnail URL: https://i.ytimg.com/vi_webp/IB7IW6zX-H0/maxresdefault.webp
- Capture note: YouTube oEmbed and selected ytInitialPlayerResponse metadata were preserved; full raw YouTube HTML was not copied into the archive because it is large and dynamic.
- Transcript caveat: captions are auto-generated, so names, product names, and acronyms may contain errors.

## Official description

Join My Newsletter for Regular AI Updates 👇🏼
https://forwardfuture.ai/newsletter

My Links 🔗
👉🏻 X: https://x.com/matthewberman
👉🏻 Forward Future X: https://x.com/forwardfuture
👉🏻 Instagram: https://www.instagram.com/matthewberman_ai
👉🏻 TikTok: https://www.tiktok.com/@matthewberman_ai
👉🏻 Spotify: https://open.spotify.com/show/6dBxDwxtHl1hpqHhfoXmy8

Media/Sponsorship Inquiries ✅
https://bit.ly/44TC45V

Chapters:
00:00 - Intro
00:41 - Sundar on AI agents replacing parts of the internet
03:10 - How Google thinks about trusting AI agents
05:00 - Will agents kill the “raw internet”?
08:01 - AI cyberattacks and Google’s defense strategy
10:42 - Should dangerous cyber AI models be held back?
12:21 - The threshold for releasing powerful AI
13:15 - Why Google won’t open-source a frontier model
15:03 - The business problem with open-source AI
17:10 - Should American companies use Chinese AI models?
19:02 - The risk of building on China’s AI ecosystem
20:41 - Why Google cares so much about cheap, fast AI models
23:31 - Sundar on self-improving AI and the race to AGI
26:17 - Google’s compute situation
27:45 - Google has more AI demand than compute
28:51 - Google’s biggest bottleneck: power, data centers, chips, and memory
30:04 - Closing

## Parsed viewing guide

- [00:00] **Opening and agent entry points** - Matt Berman introduces Sundar Pichai and asks whether agents will become the main entry point to the internet. Pichai says developers are already moving into agentic workflows and that agents should add value while preserving user control, transparency, and agency.
- [02:54] **Trust, control, and staged rollout** - The conversation compares agent trust to Gmail spam filtering and Waymo. Pichai frames trust as a value-delivery journey and says Gemini Spark is deliberately starting with first-party surfaces like Gmail and Calendar before broader third-party MCP, computer-use, and browser-use exposure.
- [05:06] **Agents as a buffer over the raw web** - Berman worries that agents add another abstraction layer over the raw internet. Pichai answers that search, YouTube, creators, shopping, and trusted sources still matter because discovery and exploration are human needs, while agents can remove chore-like friction.
- [07:38] **AI-enhanced cybersecurity** - Pichai says Google has long invested in security frontiers such as zero trust and is deploying agentic workflows internally to detect, patch, test, and deploy fixes. CodeMender, Wiz, SynthID, watermarking, and cross-industry cyber collaboration are presented as important pieces.
- [10:35] **Responsible release of powerful cyber models** - The discussion turns to Anthropic Mythos and OpenAI GPT-5.5 Cyber. Pichai argues that release decisions should depend on whether a model only marginally improves the state of the art or dramatically shifts the frontier, borrowing norms from responsible vulnerability disclosure and government coordination.
- [13:02] **Google open-source strategy** - Pichai places Gemma in Google's long open-source tradition alongside Chromium, Android, and Kubernetes, but says frontier models require heavy capex and R&D and therefore Google is taking a balanced approach rather than simply releasing every frontier capability.
- [15:18] **Business model and Chinese open models** - The conversation asks whether US firms should adopt Chinese open-source models. Pichai says enterprises optimize for reliability, safety, security, licenses, and ecosystem support, and he worries less about origin than about whether the US remains at the frontier.
- [19:08] **Model and chip dependency** - On the concern that building on Chinese open models could later create chip-stack dependency, Pichai argues that applications should be designed to swap or evolve models because model ecosystems are changing quickly.
- [20:18] **Workhorse and Flash-class models** - Pichai explains why Google invests heavily in efficient Flash/workhorse models: Search, Gemini, developers, and enterprises need powerful models that can run fast and cheaply, especially in agentic workflows where many calls accumulate cost.
- [23:10] **Race to AGI and self-improvement** - Berman asks whether the only game is reaching self-improving AI first. Pichai pushes back on race-condition framing, saying advanced AI requires responsibility and that recursive self-improvement, if it appears, should become a societal conversation rather than a single-company race.
- [25:25] **Compute and TPU/inference constraints** - The interview closes on compute. Pichai says Google has invested aggressively but still has more demand than compute, must balance Cloud customers, internal products, API inference, and hardware access, and constantly makes tradeoffs.
- [28:34] **Parallel compute bottlenecks** - Pichai says bottlenecks move across the stack: permitting and constructing data centers, power, core components, memory, and the need for all layers to align before chips can actually become usable compute.

## Timestamped transcript

[00:00] Can y'all hear me? All right, welcome.
[00:04] This is the dialogue stage. My name is
[00:06] Matt Berman. I'm the CEO of Ford Future
[00:09] and
[00:12] I am super excited to share a
[00:14] conversation with the man who has been
[00:17] leading Google for the last 10 years.
[00:20] Please help me welcome Sundar Pachai
[00:26] there. Hi, first of all, uh, great to be
[00:29] here. Thanks for doing it, Matt. And I
[00:31] love your content and I appreciate all
[00:32] of you joining as well.
[00:34] >> You have a unique insight and probably
[00:38] very strong opinions about the future of
[00:40] the internet. And so that's where I want
[00:42] to start. It seems like the internet is
[00:45] being transformed right before our eyes.
[00:47] Agents are being built. They're
[00:49] infiltrating the internet. And I'm
[00:51] wondering, do you see the future as
[00:54] agents being the entry point to the
[00:56] internet for most people? You know,
[00:58] agents are
[01:01] going to be a fundamental part of how we
[01:03] work because having used them,
[01:06] you know, if you're living, you know,
[01:08] maybe today the people who are on the
[01:09] frontier of how agents work are
[01:12] developers, right? You know, and
[01:13] particularly with coding, you know, two
[01:16] years ago, most developers started using
[01:18] these tools. they they started giving
[01:21] them more and more auto completions and
[01:23] you were accepting them etc.
[01:26] But over the last few months, developers
[01:29] are actually doing agentic workflows,
[01:32] right? The the developers on the
[01:34] frontier and they are actually deploying
[01:37] agents, orchestrating agent. You saw the
[01:40] demo in anti-gravity for building an OS,
[01:42] you're effectively in an agentic
[01:44] workflow.
[01:46] So I think once you get the taste of
[01:49] using something like that and the
[01:51] superpower that comes with it I think so
[01:54] I think it's they're genuinely adding
[01:56] value in a way I think people will will
[01:58] use them. I think it's important we
[02:00] build it in a way that users feel a
[02:02] sense of
[02:04] control and agency and transparency when
[02:07] they use agents. I think that's
[02:08] important. But I think yes, I do expect
[02:10] agents to be a core part of how we use
[02:13] the web, but that doesn't mean it'll
[02:16] take away from people use the web for a
[02:19] lot of reasons, right? And you're
[02:21] entertaining yourself. You're trying to
[02:23] do something meaningful at times. And
[02:26] you know, it depends on
[02:28] your shopping, what you're shopping for.
[02:30] You know, if it's your weekly groceries
[02:32] versus you're trying to buy your loved
[02:35] one a gift, right? And so I think it'll
[02:38] allow humans to use the internet in ways
[02:40] that gives them joy and purpose and not
[02:43] always be forced to deal with I have to
[02:46] fill these 18 bomb fields to renew a DMV
[02:50] license. Right. So, you know, so that's
[02:51] how agents will separate it out. I think
[02:54] yeah, I mean I'm I'm particularly
[02:55] excited to have agents actually do real
[02:57] world tasks. You mentioned the DMV. That
[02:59] use case is incredible. Um, but I also
[03:02] think about putting so much trust into
[03:06] agents to really uh be the arbiter of
[03:09] our information diet and and I'm
[03:11] wondering how how do we make sure that
[03:14] that we are putting the trust in the
[03:17] right agents and the agents are deciding
[03:19] correctly what information that we
[03:21] should have. you know, you are doing a
[03:23] version of that if you use Gmail and
[03:26] there's a spam filter working on your
[03:28] behalf, filtering spam like in some ways
[03:32] you're like trusting an agent. It is an
[03:33] agent. You know, I I look at it as
[03:36] working on Whimo. You have to make
[03:38] people trust sitting on the backseat of
[03:40] a Whimo and let the car go. You know,
[03:43] that is an agent in some ways, but
[03:47] people are willing to trust. But that's
[03:49] because we've done the work over time to
[03:51] demonstrate to people both with data
[03:53] with how we have operated it that it's
[03:57] it's fundamentally safe and it's freeing
[03:59] you up to enjoy the ride. I think it's
[04:02] all depends on the value you deliver,
[04:04] right? I think that's why I think the
[04:07] building the agency and trust
[04:11] with users is a shared journey and we
[04:14] have to get that part right. Part of the
[04:16] reason in Gemini Spark, Gemini Spark is
[04:19] actually very powerful under the hood,
[04:21] but we are taking the deliberate careful
[04:24] step of making it work with your first
[04:27] party surfaces like Gmail, calendar,
[04:30] etc. before we expose third party with
[04:33] MCP and full computer use and browser
[04:36] use. You know, it can do all that, but
[04:39] we want to make sure users are in
[04:41] control and they feel comfortable. We
[04:42] are getting their feedback, improving
[04:44] the product as we give those
[04:46] capabilities.
[04:47] >> You know, Sundar, I if I'm crossing the
[04:50] street, you mentioned Whimo. I actually
[04:52] trust walking in front of a Whimo more
[04:54] so than I trust walking in front of a
[04:56] human driver. I I don't know if other
[04:58] people agree with that, but there there
[04:59] is it was almost an immediate trust that
[05:01] I had for Whimo. So, I'm I'm hoping
[05:03] agents are the same way. Um, I'm old
[05:06] enough to remember the early days of the
[05:08] internet, which was an absolute wild
[05:11] west, but you got to raw information
[05:14] very quickly. And I think, you know,
[05:18] part of something I'm concerned about is
[05:20] that we're increasing the the buffer
[05:23] between us and the raw internet. We saw
[05:26] it, you know, a little bit with the
[05:27] browser, a little bit with apps, and now
[05:29] more so with agents. How do we account
[05:31] for that? people in our experience with
[05:34] search and in YouTube, YouTube is a
[05:36] great example, right? People have this
[05:38] sense of connection with the creators
[05:39] they like and follow, right? And you
[05:42] know, so that's a big part of what
[05:43] they're looking for. So I think people
[05:46] are in different mindsets when there are
[05:49] times they want to discover content on
[05:51] the web like shopping is delightful for
[05:54] a lot of people in a lot of moments,
[05:56] right? And so they're not trying to
[05:59] fully outsource that, right? like you
[06:01] know that's why I try to distinguish
[06:02] between what feels like something which
[06:05] may be a chore at times and what feels
[06:06] like something which is delightful
[06:09] >> similarly I think you know uh it could
[06:12] be in news it could be people have their
[06:15] trusted sources at at least at Google
[06:17] through search and YouTube and through
[06:19] agents we think
[06:23] you know there will always be an
[06:24] incredible value from the ecosystem
[06:26] which users want to connect to and the
[06:29] agents should be in the job of doing
[06:31] that.
[06:31] >> Yeah.
[06:32] >> Um but you are right. There are times
[06:36] the agents are playing a role
[06:39] in the middle. Sometimes it's very good
[06:41] because you know it helps improve user
[06:45] satisfaction because users are getting
[06:46] to what they want in a better way.
[06:50] But but there's a layer of abstraction
[06:52] too and that's what you're talking
[06:53] about. Yeah,
[06:54] >> but I think it's always been true with
[06:56] technology a bit uh uh but I don't think
[06:59] ultimately you know it's also make at
[07:02] the same time it's also in the tools
[07:05] with which you can create content are
[07:06] also exploding so people will also be
[07:09] creating more content so I think
[07:11] there'll be a new balance which we will
[07:13] find but yeah it is an interesting
[07:15] moment of evolution. Yeah, I I like
[07:17] that. I think I think you're saying
[07:18] there's definitely going to be a strong
[07:20] place for agents to do that curation on
[07:22] our behalf, especially in the era of
[07:24] complete uh slop domination.
[07:27] >> Uh but also, you know, that feeling of
[07:29] exploration can still be there.
[07:30] >> Yes.
[07:31] >> Um Okay. Because it's a fundamental
[07:33] human need that doesn't go away.
[07:35] >> Yeah. Exactly. Um Okay. So speaking of
[07:38] the wild west and I I know you're
[07:40] probably feeling this pretty strongly on
[07:41] the uh at Google there have been
[07:45] increasing cyber security cyber attacks
[07:48] the models are getting better at cyber
[07:51] um obviously Google has been thinking
[07:54] about cyber security for decades are you
[07:57] seeing cyber attacks especially AI
[07:59] enhanced cyber attacks ramp up uh at
[08:02] Google
[08:05] >> look we've been seeing being very clear
[08:08] like we've deeply cared about cyber uh
[08:11] you know because we've been working on
[08:13] frontier technologies for a while like
[08:15] Google pioneered many of uh important
[08:18] security frontiers like zero trust and
[08:21] so on right like you know we we've
[08:24] worked hard to keep the company at the
[08:25] frontier and also we operate many
[08:27] products and platforms around the world
[08:28] that that touch billions of people
[08:31] I we've been pretty aggressive in
[08:34] deploying agent Agentic workflows. Our
[08:37] internal security teams
[08:39] use agentic workflows to help detect
[08:43] vulnerabilities and then how do you work
[08:45] to patch them? And we we have steadily
[08:50] seen over the last two years as the
[08:52] model capabilities have progressed
[08:55] you know
[08:57] we are able to detect more
[08:59] vulnerabilities and we've been working
[09:00] very hard to patch them. I think mythos
[09:05] was a point of inflection of capturing
[09:07] that moment in time. Um you know that
[09:10] they put out a model which was really
[09:14] you know well built for that particular
[09:16] task and it was frontier there right but
[09:21] what we are excited about it is part of
[09:24] the reason we are sharing maybe one of
[09:26] the
[09:27] uh undermentioned announcements today at
[09:29] iOS code mener. So codemener is a
[09:33] product which we use internally and
[09:34] which we're building to share
[09:36] externally. It not only helps you
[09:39] identify the vulnerabilities,
[09:41] generate patches, test and verify that
[09:44] they work and deploy them
[09:45] >> and it's running 24/7.
[09:47] >> That's right. And like you know and and
[09:49] real time we completed our recent
[09:51] acquisition of Viz, you know. So Viz is
[09:53] state-of-the-art in being able to do
[09:55] this realtime monitoring uh of of
[09:58] vulnerabilities etc. So I think
[10:00] combination of what we have with viz and
[10:03] code mender I think we are using it
[10:06] internally
[10:08] uh to stay at the frontier and I think
[10:10] it's an important moment for the
[10:11] industry. I have to say I'm heartened by
[10:13] the cross industry collaboration going
[10:16] on at this moment. uh I think one of the
[10:18] examples I would call out today be it
[10:21] synth ID or watermarking companies
[10:23] coming together
[10:25] companies coming together around cyber
[10:28] that is so important for this industry
[10:30] with this technology right so I'm
[10:32] encouraged by uh those trends as well
[10:35] >> so you mentioned mythos so I want to
[10:37] talk about that for a moment obviously
[10:39] anthropic decided not to release mythos
[10:41] publicly just a handful of companies we
[10:44] have open AAI releasing
[10:47] releasing uh GPT 5.5 cyber
[10:51] which which approach do you think is
[10:53] more appropriate which is right for
[10:54] Google is it uh you know is there is
[10:57] there some model that is just too good
[10:59] and and you're going to hold it back or
[11:01] is the more iterative deployment
[11:03] strategy that open AAI takes more
[11:06] aligned with what Google believes
[11:11] I think
[11:14] it depends on where you we it depends on
[11:17] the model capability. If it's if it is
[11:20] not fundamentally changing what's out
[11:22] there already in terms of the
[11:24] state-of-the-art,
[11:27] I think it's definitely okay to put it
[11:28] out. But in the security world, there's
[11:30] a well established practice. Google has
[11:32] done project zero for a long time,
[11:35] right? And like you know we have teams
[11:36] of people who find vulnerabilities
[11:40] then we notify the vendor give them 90
[11:42] days to patch it before we acknowledge
[11:46] the vulnerability in the in the wide and
[11:49] so there are wellestablished practices
[11:51] in the security industry around how to
[11:53] do it. So I think it makes sense to me
[11:55] if you suddenly have something which
[11:58] dramatically changes the frontier. First
[12:00] of all, I think it's important to work
[12:01] closely with the government on that
[12:04] >> and and you approach it in a responsible
[12:07] way. So, so I I think that is consistent
[12:11] with how the security industry works and
[12:14] but I do think it's important to also
[12:15] def make sure enough people get access
[12:17] to it so they can patch their systems
[12:19] and so on and and they go hand in hand.
[12:22] So I think there's validity to that
[12:24] approach. So is there some threshold by
[12:28] which you would say past that point uh
[12:31] we can't release it or or is it more
[12:33] let's look at what the landscape of
[12:36] model uh capabilities are let's look at
[12:38] how cyber is right now and let's make
[12:40] the determination on a model basis
[12:43] that's what I would say like is the next
[12:45] one you're introducing does it
[12:47] dramatically change the frontier is it a
[12:50] 1 to 2% improvement over the current
[12:52] state-of-the-art
[12:54] or are you taking these 20% jumps.
[12:57] That's where the judgment comes in and I
[12:59] think that's how I would change my
[13:00] approach.
[13:02] So on the topic of model strategy,
[13:06] something near and dear to my heart is
[13:07] open source. Uh basically Google and
[13:11] Nvidia are the only companies with a
[13:13] real model uh open source model strategy
[13:15] nowadays. Um you know Google's model is
[13:18] smaller meant to run on edge devices.
[13:22] Why not release a large open-source
[13:25] frontier model?
[13:28] Look, we um first of all, Google, we've
[13:31] been big fans of open source. Google was
[13:33] built on a lot of open source systems.
[13:36] We have worked on many big things which
[13:37] are open source. I mean, I personally
[13:39] worked on Chromium and Android and so
[13:41] on, Kubernetes and I can name many
[13:43] projects which Google has contributed
[13:45] pretty strongly to the world in open
[13:47] source. In AI, we've been building Gemma
[13:50] models and we've been updating them year
[13:53] after year, right? And they're awesome
[13:56] and and uh you know and I think the
[13:59] recent release of Jimma 4 was a great
[14:01] release and you know so we are pushing
[14:04] it. I think all of us are trying to
[14:08] make you know make sure the frontier
[14:10] takes a lot of investment to get the
[14:12] frontier done right you've you've seen
[14:15] our capex dollars right and like you
[14:17] know so you're working you're putting a
[14:20] lot of R&D dollars to generate those
[14:22] incremental frontier models
[14:24] so I think and and you you're you're
[14:26] discovering new techniques as part of
[14:28] doing those models so we all have to be
[14:31] mindful of that but I think we are also
[14:33] committed to making sure there's a open
[14:34] source ecosystem which is able to
[14:36] develop and and and so we we take a
[14:40] balanced approach there uh approach
[14:42] there and I think we'll continue to take
[14:44] that balanced approach that's how I see
[14:45] it. Yeah. And and by the way, I do love
[14:48] the Gemma models. I run them locally at
[14:50] home. They are fantastic. So definitely
[14:52] thank you. Um you know, obviously a
[14:55] company of the size and the resources of
[14:57] Google, if you're making that decision
[14:59] of okay, large closed source, large open
[15:02] source, we can't do both. Um probably
[15:04] most startups in the US also will
[15:07] struggle with that decision. Like what
[15:10] what is your sense of the business model
[15:12] for open source in America? It is it is
[15:15] it viable right now?
[15:18] Look first of all we not only do open
[15:21] source part of the reason we invest so
[15:22] much in flashlight and flash models is
[15:25] so that we are giving a range of options
[15:27] right and and those models are workh
[15:29] horses too support but your question on
[15:32] open source it's not that we don't you
[15:35] know we are we've been moving the open
[15:37] source frontier too there's a lot of
[15:39] very very good open source models like
[15:41] particularly from China which startups
[15:43] are adopting too
[15:44] >> yeah we're going to talk about that
[15:45] >> so you know I think I think it depends
[15:47] right You go through moments in
[15:49] technology where the frontier moves so
[15:51] fast maybe sometimes the open source may
[15:53] not be able to fully keep up with it
[15:56] but then there are moments where open
[15:58] source will take leaps if the technology
[15:59] curve slows down or you know and you
[16:03] know takes a break right so uh it's
[16:06] tough to predict pred predict it fully
[16:08] in the future uh but I expect there to
[16:11] be a demand for a strong open-source
[16:15] ecosystem and I think We will definitely
[16:18] play a part in it and I hope others do
[16:20] do too. There there have been a number
[16:23] of open source ecosystems that have been
[16:25] really successful over many decades in
[16:27] technology. But I think just the upfront
[16:29] cost of of baking a model makes it
[16:33] extremely difficult especially if you're
[16:35] putting out the model and then all of a
[16:36] sudden your competitors are serving
[16:38] inference at a higher margin than you.
[16:40] Um but I I am hopeful. Uh, I I do love
[16:43] open source and we're going to talk
[16:45] about the workhorse models in a moment,
[16:47] but I want to talk about China and and
[16:51] they have been putting out incredible
[16:53] open-source models. Um, you know, if you
[16:57] can put yourself uh in the shoes of
[16:58] another uh enterprise CEO and you're
[17:01] looking at the landscape of which AI
[17:03] model to choose for your business and
[17:05] you're seeing, you know, deepseek at a
[17:07] fraction of the cost but still near the
[17:09] frontier.
[17:11] Uh why wouldn't America adopt Chinese
[17:15] open source AI? What's the argument to
[17:17] go with American AI?
[17:20] >> So you're saying why wouldn't uh uh you
[17:23] just use the best open source models
[17:24] available? Yeah.
[17:26] >> Look, I think you look at the end of the
[17:29] day, what are companies trying to do,
[17:30] right? They're trying to solve problems,
[17:32] right? These are
[17:34] and and they're trying to solve a
[17:36] problem with a solution. So the question
[17:38] is what are the solutions available?
[17:40] Remember they are designed let's say
[17:42] you're doing something in customer
[17:44] service you want predictability you want
[17:47] reliability
[17:48] >> like you want consistency and like you
[17:51] know so you want safety security so
[17:55] companies are optimizing for a lot of
[17:57] factors
[17:59] I think that gives a place for both open
[18:01] source models and there'll be providers
[18:04] who will take the open-source models and
[18:06] like build that ecosystem around it
[18:09] which makes a lot of sense
[18:11] there'll be closed source models
[18:14] and and you know it'll be open
[18:16] marketplace and people will have a lot
[18:18] of choice. I think I am more okay if it
[18:21] is open source with the right licenses
[18:23] it should matter less where it came from
[18:26] right like you know I think over time
[18:29] there are good ways to inspect open
[18:31] source not saying it's exactly true
[18:33] particularly with the how the AI models
[18:35] are developed but with open source comes
[18:38] a community which is responsible for it
[18:42] cares about it so if something is wrong
[18:45] is happening in that software it's not
[18:47] like it's going to go unnoticed
[18:49] So I think that creates a level of trust
[18:51] for people to adopt that technology. I
[18:53] think so I worry less about are we
[18:56] adopting open source models from China
[18:58] or more that are we doing enough in the
[19:01] US to make sure we are staying at the
[19:02] frontier.
[19:03] >> Yeah, that's how I think about it.
[19:05] >> Now I know like Google is is big on
[19:08] co-design full stack and and kind of
[19:10] just continuing on on where the open
[19:13] source model is coming from. I've heard
[19:14] that argument that is if it's open
[19:16] source it doesn't necessarily matter.
[19:17] we're going to fine-tune it or customize
[19:20] it for our needs. But ultimately, if we
[19:22] continue to build on top of, you know,
[19:25] China's open source, there's also an
[19:28] argument that they're going to optimize
[19:30] their models for their own chips and
[19:32] then all of a sudden we're kind of built
[19:34] on uh another country's technology. Is
[19:37] is that an incorrect argument? Look, I I
[19:40] think the fundamentals of AI, the way
[19:42] people should be building use cases on
[19:44] top is because the models are changing
[19:47] so fast anyway, you need to build it in
[19:49] a way in which you're able to evolve the
[19:51] models underneath, right? I think that
[19:55] has got to be the way, you know, you're
[19:57] working through this moment, right? And
[19:59] so I so I think you have to be dynamic
[20:03] enough that you have to be able to adapt
[20:05] because the model frontier the model
[20:08] ecosystems are changing pretty sharply
[20:11] and so that's the way I would think
[20:13] about it now and you know it's too early
[20:15] to predict if this is a real concern or
[20:17] not.
[20:18] >> Yeah. Um okay talking about model
[20:21] strategy one of my favorite things is
[20:23] watching the frontier labs and seeing
[20:25] how their model strategies play out. uh
[20:28] anthropic and open AI seem almost
[20:30] exclusively focused on the absolute
[20:32] frontier and Google has that but you
[20:36] guys also put a lot of emphasis on on
[20:39] what I'll call kind of the the workhorse
[20:41] class of models the flash class of
[20:43] models talk a little bit about why why
[20:45] is that such a big part of Google's
[20:46] strategy
[20:48] >> look I I mean in our mission statement
[20:52] we have this thing to to make technology
[20:54] universally accessible and useful
[20:57] >> we've always deeply cared for what is
[20:59] the most important technology in our
[21:01] lifetimes that it diffuses as broadly as
[21:04] possible
[21:06] and we get really excited at driving
[21:09] efficiency and making sure the best
[21:12] models can work in the fastest possible
[21:14] way cheaper because we need to do it for
[21:17] search right because we have to give it
[21:19] to billions of people
[21:21] >> we want to put it in Gemini
[21:23] and so we want to give it to developers
[21:25] so that they can do powerful things with
[21:27] And we've had a lot of success with the
[21:28] strategy and I think 3.5 flash
[21:31] particularly I made this point during
[21:33] the keynote but I've heard anecdotally
[21:35] from a lot of CIOS who are so concerned
[21:38] about how much their companies are
[21:40] blowing through budgets.
[21:42] >> Yeah. That you can feel it talking to
[21:44] them and I think the problem is going to
[21:47] get worse as we go through the year.
[21:49] Right. And I think that's where I think
[21:53] the flash model will really shine
[21:56] because particularly in a agentic
[21:58] workflow where you need these things to
[22:00] be repeatedly used and used a lot of
[22:03] times. I think it's so important to have
[22:06] a model which is very capable but is
[22:08] fast and efficient right and and even
[22:11] accounting for token effic token use
[22:15] flash is remarkably costefficient right
[22:17] and and and so I'm really excited we are
[22:20] finding it internally we are using it as
[22:23] a blend of pro and flash right
[22:25] internally
[22:27] and and I think most companies should
[22:30] learn to use it that way to be very
[22:32] clear we're super committed to being at
[22:34] the frontier on every category. I'm
[22:36] excited for Pro which we're working on.
[22:39] Uh but I think flash has a unique role
[22:41] to play in this constrained compute
[22:43] constraint time. Yeah. No, I I I agree
[22:45] completely especially most companies are
[22:49] are not, you know, solving math olympiad
[22:52] problems. They're not at the absolute
[22:54] cutting edge of science. They need real
[22:56] work done and that that is truly where
[22:58] the flash model shines. and not
[23:00] everybody is token maxing and trying to
[23:03] or unc unconcerned with the budget. So I
[23:06] I definitely appreciate that. Um
[23:10] I like
[23:12] if you think about the future of AI, is
[23:17] it just truly a race to self-improving
[23:20] AI? is is it like maybe just to play the
[23:23] the devil's advocate for a second the
[23:25] flash family of models are great now but
[23:27] ultimately whoever reaches
[23:29] self-improving AI first wins and then
[23:31] nothing else m do you think about it
[23:33] like that
[23:36] look I think first of all there's a
[23:39] responsibility that comes with this
[23:41] technology and you know I think we all
[23:42] need to be careful to
[23:45] avoid this race condition at all costs
[23:49] >> uh and and and and and and you know I
[23:52] think we owe it to humanity to make sure
[23:54] we deploy this technology responsibly.
[23:57] You are right in your question that
[23:59] there is this current moment where
[24:00] people feel like the curve is so steep
[24:02] and like you know
[24:04] >> uh you know where you are in the curve
[24:06] matters but just like in a few months
[24:09] ago when we launched 3.0 0 people are
[24:10] like oh we are so in the frontier no one
[24:12] will ever be able to catch up and you
[24:14] know I think at the frontier labs
[24:18] uh it's very dynamic the competition is
[24:20] fierce we all have our strengths and
[24:23] weaknesses
[24:25] we all also have different cadences of
[24:27] our pre-train pre-training release
[24:29] cycles so the peaks don't exactly match
[24:34] so all this creates that perception gap
[24:37] which shifts widely in like four to six
[24:39] weeks
[24:41] But I think a few few labs are really at
[24:43] the frontier and then there's a big gap.
[24:46] Um and I think I think there are
[24:50] scenarios in which things like recursive
[24:53] self-improvement come into play.
[24:56] But I think if they come into play with
[24:58] that no difference from the cyber
[25:00] moment, we all have to handle those
[25:02] moments far more responsibly than today.
[25:06] Right? And so that goes hand in hand.
[25:09] And so I I think the more AI becomes
[25:14] advanced, the more it's a societal
[25:18] conversation versus a single company
[25:19] conversation.
[25:20] >> Yeah. Yeah. Well said.
[25:25] So all of uh we know we're talking about
[25:27] a lot about models, but all of it is
[25:28] downstream from compute. Uh I I'm always
[25:33] both kind of uh impressed and in awe of
[25:36] Google's ability to serve, you know,
[25:39] you're serving your own models in
[25:42] inference on the API. You're also
[25:44] powering your suite of products with
[25:47] Gemini to literally billions of users.
[25:51] You're also allowing your competitors to
[25:53] use your inference. You're also selling
[25:55] TPUs. Um I've I've heard the reason for
[25:58] this is because I mean Thomas told me he
[26:00] said we planned really well which you
[26:03] know makes a lot of sense. You've been
[26:04] at this for 10 plus years. I think I've
[26:06] also heard that Google's revenue is
[26:09] literally constrained by compute. So I
[26:12] wanted to give you the opportunity what
[26:13] is the state of compute at Google right
[26:16] now?
[26:19] Look, I
[26:21] all of us are
[26:23] I think we have made a set of
[26:27] you know bold right decisions over the
[26:29] last few years to invest in compute and
[26:32] scale it up aggressively.
[26:34] But having said that I don't think any
[26:36] of us sit in the chair and say we wish
[26:38] we we had you know you look back and say
[26:40] I wish I had done a little bit more. So
[26:43] we're living in one of those moments in
[26:44] time
[26:46] and you know there are costs going up
[26:48] too. So like for a given budget you may
[26:50] be getting less compute than you had
[26:51] previously planned for your memory
[26:54] prices what have you you know so the
[26:57] costs are going up. I think we plan you
[27:00] know we are able to plan longterm for
[27:02] cloud separately from our you know own
[27:05] internal needs and we do long range
[27:07] plans and we plan for it. I think it's
[27:10] good and some of it is like when you're
[27:12] in Google cloud and you're supporting
[27:14] customers your your customers may look
[27:16] at something and say well I want access
[27:17] to that like they may look at the demo
[27:20] of 3.5 flash on anti-gravity and say how
[27:23] are you exactly running it at 800 tokens
[27:25] per second and like could we get access
[27:27] to that you know so you're also
[27:30] supporting customers through those
[27:31] journeys and hence you're meeting them
[27:33] in the in in what they're asking for and
[27:36] but it is not an easy balancing act and
[27:39] You know, we are we are constantly
[27:40] thinking as far ahead as possible and we
[27:43] are making tradeoffs uh like every other
[27:46] company right now. And
[27:47] >> so do you have maybe an obvious question
[27:49] more demand than you have compute to
[27:51] serve it?
[27:52] >> Absolutely.
[27:52] >> Like what is the scale of that?
[27:54] >> And and and hence the emphasis on
[27:56] something like 3.5 flash even more
[27:58] >> right and you know could we have done an
[28:02] even better omni model? Yes. But like
[28:05] you know how can we do a omni model
[28:06] which we can give to as many people as
[28:08] possible. So there's constantly you're
[28:10] making trade-offs of trade-offs of like
[28:12] that including on you know do you build
[28:15] a very large model which you know like
[28:18] an ultraized model that will increase
[28:21] the capability frontier but then who all
[28:23] can you give it to? So you're constantly
[28:25] all of us are making these trade-offs
[28:27] and sometimes you make a trade-off it
[28:29] looks like well maybe you done that
[28:32] trade-off a bit differently. Yeah. So we
[28:34] only have a few seconds left. One last
[28:35] question for you. What is the main
[28:37] bottleneck for compute for Google right
[28:39] now? Is it land? Is it political will?
[28:41] What is it?
[28:45] I think I think the way it works is by
[28:50] definition bottlenecks work this way. If
[28:53] you think something is a bottleneck and
[28:55] you solve it, something else becomes a
[28:57] bottleneck. Right? Like you know that's
[28:59] the whole like definition of
[29:01] bottlenecks. I think at various times I
[29:04] think you're having a few areas your
[29:07] ability to physically cons permit and
[29:10] construct
[29:12] data centers the power they need in and
[29:17] then very quickly you get into the core
[29:20] components for these systems
[29:23] they are all the bottleneck.
[29:24] >> Yeah. and and it's a it's it's like
[29:29] you have you need all of that to work
[29:31] together to get a square set of a chip
[29:35] you need right and like you know and so
[29:39] uh I feel like there are a few parallel
[29:42] bottlenecks going through and it almost
[29:44] doesn't matter there are like a few of
[29:46] them which are bottlenecks and at
[29:48] various times you may you may conclude
[29:49] it is memory but then if everyone
[29:51] concludes it's memory tomorrow you turn
[29:52] around and say okay no no no it's it's
[29:55] actually this and so you know but but I
[29:57] think there are systemic bottlenecks
[30:00] across all layers of the stack now
[30:02] >> yeah whatever the bottleneck is in the
[30:03] moment that's the most compute you can
[30:05] have in that moment okay everybody
[30:07] please help me thank Darpachai thank you
[30:09] so much thank you thank you thank you
[30:13] guys awesome
