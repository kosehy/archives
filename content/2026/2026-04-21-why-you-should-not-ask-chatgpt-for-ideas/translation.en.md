# Why you shouldn’t ask ChatGPT for ideas, according to a German research team

Source: https://zdnet.co.kr/view/?no=20260420203025
Saved: 2026-04-21
Translation note: Natural English rendering of a Korean ZDNet Korea article.

If you type “make me a creative image” into ChatGPT, it can produce a plausible result in seconds. Convenient. But according to a paper released in April 2026 by researchers at the Max Planck Institute for Software Systems in Germany, that very convenience may be eroding your creativity. The team experimentally showed that the conventional chatbot format can trigger a cognitive trap called design fixation during human-AI co-creation. Anyone using AI for creative work should understand this.

## The trap of getting stuck on the first result

Design fixation is the phenomenon where people become mentally anchored to the first result they see and keep refining it even when much better ideas may exist elsewhere. For example, when someone generates a poster image with ChatGPT, even if they are not fully satisfied with the first output, most people focus on small changes such as “make it brighter” or “increase the font size” rather than exploring a completely different direction.

The research team argues that this is a structural problem specific to chatbot-style interfaces. Systems like ChatGPT produce a polished output as soon as the user submits a prompt. The user sees a “finished” object before sufficiently exploring the idea space. In psychological terms, this reflects the tendency to become attached to the first thing one sees. Once users are locked into that first impression, they focus on incremental edits instead of exploring broader possibilities. Repeating this process can actually reduce the creativity of the final output.

The article describes a second issue as well: what the researchers call the “gulf of envisioning.” Even if users know what they want in their heads, they often cannot find the right language to communicate it to the AI. This is a longstanding limitation of AI creative tools. Someone may want an image to feel “more vivid,” for example, but converting that intention into concrete instructions the AI can reliably interpret is much harder than it sounds.

## ChatGPT vs. HAICo

To address both problems, the research team built a new creative system called HAICo (Human-AI Co-creation system). HAICo clearly separates the creative process into two stages. First comes divergent mode, where users explore a range of conceptual ideas. After that comes convergent mode, where they refine the most promising one. The decisive difference is that no image is generated until the user has first gone through idea exploration.

The team compared HAICo with ChatGPT on the same task using 24 participants. HAICo showed a clear advantage. It significantly outperformed ChatGPT across all Creativity Support Index categories (all items p < 0.002). Usability scores (UMUX-Lite) also differed strongly, with HAICo at 81.25 and ChatGPT at 64.24 (p < 0.001).

The most striking metric was novelty. Images created with HAICo had an average novelty score of 3.22 out of 5, compared with 2.41 for ChatGPT (p < 0.001). Diversity scores were also higher, with HAICo at 0.48 and ChatGPT at 0.36 (p = 0.001). The difference may not sound huge in isolation, but the article notes that this came from a single creative session. For people who use AI daily for content, planning documents, or marketing materials, those differences could compound over time.

## Divergence and convergence as the structure of creativity

The article argues that HAICo works because it aligns more closely with how human creative thinking actually operates. Creativity research has long described creative thinking as involving two stages: divergent thinking, where many ideas are freely explored, and convergent thinking, where promising ideas are selected and developed. Creative people tend to move back and forth between these stages.

Traditional chatbots do not distinguish the two. The moment the user enters a prompt, the system jumps directly into convergence, that is, output generation. Divergence is skipped. HAICo addresses this by showing nine idea cards in divergent mode first. These are not just style variations but conceptual prompts drawn from distant domains such as mythology, historical events, or internet culture. For example, a poster about reducing smartphone use might draw inspiration from the “Interrupting Cow” meme, which is the kind of direction many users would not invent on their own.

The article says the team used an “associative thinking prompting” strategy to connect distant concepts, and this produced significantly greater idea diversity than simply instructing the system to “be creative” (p < 0.001). Participants reportedly found this surprising and productive.

## Why this should change AI creative habits

The article’s message is not simply “use HAICo.” It raises a deeper question. When using AI creative tools, are you exploring the idea space first and then asking AI to implement a direction, or are you getting trapped inside the first result and only polishing it?

One especially interesting finding was that participants who used HAICo first later began asking ChatGPT for idea exploration before requesting final outputs. In other words, they seemed to transfer the “diverge first, converge later” method into their later chatbot use. The research team viewed this as an important signal because it suggests that the system may teach a mode of creative thinking, not just a tool-specific workflow.

Self-reported learning scores also favored HAICo strongly. HAICo users reported an average learning score of 5.29 out of 7, compared with 3.12 for ChatGPT users (p < 0.001). According to the article, many ChatGPT users said they learned little or nothing new, while HAICo users more often felt they learned about the task itself.

The article closes with a practical recommendation. If you are using ChatGPT or Claude for creative work, don’t ask for the final result immediately. First ask for several radically different directions, ideally pulling from domains that seem unrelated, such as mythology, history, or popular culture. Only after exploring those possibilities should you choose one and refine it.

## Source note

The article says the cited report can be found on arXiv under the title _Exploration vs. Fixation: Scaffolding Divergent and Convergent Thinking for Human-AI Co-Creation with Generative Models_.

The ZDNet Korea article also discloses that it was provided through partnership with the AI media outlet AI Matters and written using Claude 3.5 Sonnet and ChatGPT.
