---
name: blog-idea-generator
description: Generate 15-25 targeted blog post ideas with 200-word summaries for any client website. Reads website content, assesses available information, adaptively selects from 20 ideation methods, and conducts a guided interview. Each idea includes a narrative brief + structured specs. Use when the user says "generate blog ideas", "what should I blog about", "blog topic ideas", "content ideas", or wants to populate docs/en/blog/topics.md.
---

# Blog Idea Generator
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- The task matches this domain: Generate 15-25 targeted blog post ideas with 200-word summaries for any client website. Reads website content, assesses available information, adaptively selects from 20 ideation methods, and conducts a guided interview. Each idea includes a narrative brief + structured specs. Use when the user says "generate blog ideas", "what should I blog about", "blog topic ideas", "content ideas", or wants to populate docs/en/blog/topics.md.
- The user needs domain-specific strategy, writing, or planning in this area.

## Do not use when
- Another skill is clearly narrower and better matched to the request.
- The task is unrelated to this domain or needs direct implementation instead.

## Required inputs
- Business context, target audience, and the artifact or decision being developed.
- Any existing materials, constraints, or supporting references already available.

## Workflow
1. Read the current business context and the concrete task to solve.
2. Use only the relevant detailed guidance and references for the request at hand.
3. Produce the strategy, writing, or framework output this skill is responsible for.
4. Check the result for clarity, realism, and handoff readiness.

## Quality standards
- Outputs must be specific, usable, and grounded in the available evidence.
- Recommendations should support follow-on execution instead of staying abstract.
- The result should remain consistent with the broader repository system.

## Anti-patterns
- Do not produce generic framework dumps with no decision made.
- Do not invent facts to complete the output.
- Do not ignore the actual audience, offer, or business constraints.

## Outputs
- Strategy notes, writing deliverables, framework outputs, or implementation-facing recommendations.

## References
- Start with `references/legacy-guidance.md` when you need the preserved detailed instructions from the previous skill version.
- Use `references/idea-sources-and-series.md` when the user needs a repeatable editorial pipeline, cluster planning, or stronger source-bucket logic behind the blog ideas.
- Read only the specific files under `references/` that match the current task instead of loading the whole directory.
- This skill has no bundled scripts by default; keep execution focused on the documented workflow and any existing project files.

## Notes
- Treat this `SKILL.md` as the portable execution layer for both Codex and Codex.
- Preserve existing project behavior unless the current task explicitly requires a change.

