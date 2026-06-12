# Figure notes

## figure-01

- File: `figures/figure-01.png`
- Source URL: `https://contributor.insightmediagroup.io/wp-content/uploads/2026/05/image-214-683x1024.png`
- Status: recovered
- Alt text: `Safe coding agents`
- Caption from article: “This infographic highlights the main contents of this article. I’ll discuss how to run coding agents in a safe manner, why you don’t need to perform human review on all code, how to avoid running unsafe actions, how many permissions to give your coding agents, and how to run them safely. Image by ChatGPT.”

### What it shows

The image is an author-created infographic titled “Running Coding Agents Safely.” It shows a developer at a workstation feeding work to four robot-like agents labeled code implementation, testing and validation, code review and quality, and DevOps/automation. The lower half is organized into six numbered panels:

1. **Why Run Coding Agents?**
   - Massive productivity boost.
   - Agents understand more context and can often produce equal or better code than humans.
   - Faster feature shipping and focus on what matters.
2. **Common Concerns**
   - Agents might perform unsafe actions.
   - Users may feel they must manually review all code.
3. **Why It’s Safe**
   - Agents are described as reliable and unlikely to make irreversible mistakes.
   - The user controls the environment; destructive actions indicate permission/infrastructure problems.
4. **Permissions: Be Liberal, Not Reckless**
   - Give agents needed permissions, limit scope to what is necessary, avoid admin-level access, allow reversible actions, and block destructive irreversible actions.
5. **Techniques to Run Safely**
   - Use agent reviews, block dangerous commands such as `rm -rf`, and maintain good setup with clear docs/tests.
6. **Bottom Line**
   - Run agents confidently using YOLO mode only with smart safeguards; use agent review/automation instead of manually reviewing all code; treat bad permissions/infrastructure as the main risk.

### Why it matters

The figure is useful as a quick retrieval map for “coding-agent safety without constant approvals.” It pairs naturally with Hermes routing, Codex/Claude permission modes, denylist design, and reviewer-agent loops.

### Evidence status and limits

- Evidence type: author-created explanatory infographic, not an empirical safety benchmark.
- The strongest claims, especially “no need to manually review all code” and broad YOLO-mode usage, should be reused only with the caveats in `source-trace.ko.md`.
- Local Codex and Claude help snapshots preserved in `source/` contain stronger warnings about dangerous bypass modes than the article’s default posture.
