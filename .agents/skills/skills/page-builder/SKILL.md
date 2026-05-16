---
name: page-builder
description: Transforms markdown content from docs/{lang}/ into beautiful Astro pages and components. Supports multi-language builds (en, fr, sw). Creates dynamic [lang] routes, language-aware content loading, and language switcher component. Use after design-system and photo-manager have run.
---

# Page Builder
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- The task matches this domain: Transforms markdown content from docs/{lang}/ into beautiful Astro pages and components. Supports multi-language builds (en, fr, sw). Creates dynamic [lang] routes, language-aware content loading, and language switcher component. Use after design-system and photo-manager have run.
- The user needs an implementation-facing skill rather than a general discussion.

## Do not use when
- The prerequisite upstream context is missing and the task is not yet execution-ready.
- Another narrower skill is the clear better fit for the exact subtask.

## Required inputs
- Project context, current files, and any constraints that affect implementation.
- Upstream artifacts produced by earlier skills when this skill is part of a pipeline.

## Workflow
1. Read only the relevant project inputs and preserved guidance before acting.
2. Choose the smallest set of references needed for the current job.
3. On commercial websites, preserve the `premium-website-product` brief: page goal, search intent, proof, CTA, schema, analytics event, and developer-quality evidence must survive implementation.
4. Produce the implementation, configuration, or guidance this skill owns.
5. Validate that the result stays compatible with the rest of the repository workflow.

## Quality standards
- Outputs must be implementation-ready and internally consistent.
- Preserve existing behavior unless the task explicitly requires a change.
- Avoid host-specific path assumptions so the skill remains portable.

## Anti-patterns
- Do not hardcode `.Codex/skills` or another single install path.
- Do not skip validation against upstream or downstream dependencies.
- Do not generate generic output that ignores the actual project context.
- **Never write a generic author bio on blog or article pages.** The author bio must be specific to the article's topic — describing the author's (or organisation's) credentials and experience *relevant to what the article covers*. See `blog-writer/references/article-design.md` → Author Bio Standard for the full rule, examples, and bilingual requirements.

## Outputs
- Implementation guidance, configuration, generated artifacts, or concrete follow-on steps.

## References
- `references/page-conversion-checklist.md` — per-template anatomy, conversion QA gate, instrumentation minimums, pre-launch review. Use when building or reviewing any page.
- `references/authority-content-matrix.md` — content architecture by page type, cornerstone pages, pillar + cluster system, editorial ops. Use when planning the content system for Growth / Authority tiers.
- `references/page-goal-matrix.md` — convert strategy into page-specific audience, goal, proof, CTA, SEO decisions.
- `../premium-commercial-writing/references/website-page-writing-patterns.md` — use when implementation must preserve premium page copy structure for home, service, pricing, about, case-study, contact, or FAQ pages.
- `../premium-commercial-writing/references/professional-writing-quality-gate.md` — use before implementation when supplied copy needs final proof, claim, tone, CTA, and scannability checks.
- `references/conversion-sequence-implementation.md` — use when the build must preserve value-proposition clarity, CTA ladders, cluster linking, or launch-stage page states.
- `../website-builder/references/premium-website-engine-playbook.md` — use when page
  production must preserve the premium strategy, acquisition, conversion, measurement,
  and handoff artifacts for high-value clients.
- `../premium-website-product/references/premium-website-market-asset-gate.md` - use when page production must preserve premium content, SEO, UX, stack, launch, and agency proof requirements.
- `references/legacy-guidance.md` — preserved detailed instructions from the previous skill version.
- `../design-system/references/math-for-web-design.md` — use when implementing pages with fluid type, bounded spacing, intrinsic grids, aspect-ratio media, full-bleed sections, calculated CTA placement, or JS-driven sizing/motion.
- Read only the specific files under `references/` that match the current task instead of loading the whole directory.
- This skill has no bundled scripts by default; keep execution focused on the documented workflow and any existing project files.

## Notes
- Treat this `SKILL.md` as the portable execution layer for both Codex and Codex.
- Preserve existing project behavior unless the current task explicitly requires a change.
- Route upstream to `launch-campaigns` when page states or CTA swaps depend on campaign timing.
- Route upstream to `sales-copywriting` when the implementation needs revised value propositions, button labels, or objection handling.
- Route upstream to `premium-commercial-writing` when the page copy, SEO/GEO content, document download, blog excerpt, or offer section must meet the premium commercial writing gate before build.

