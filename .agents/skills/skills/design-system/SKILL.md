---
name: design-system
description: Establishes the visual foundation for a website — fonts, colors, spacing, animations, and aesthetic direction. Use before building any pages. Reads docs/style-brief.md for brand direction.
---

# Design System
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- The task matches this domain: Establishes the visual foundation for a website — fonts, colors, spacing, animations, and aesthetic direction. Use before building any pages. Reads docs/style-brief.md for brand direction.
- The user needs an implementation-facing skill rather than a general discussion.

## Do not use when
- The prerequisite upstream context is missing and the task is not yet execution-ready.
- Another narrower skill is the clear better fit for the exact subtask.

## Required inputs
- Project context, current files, and any constraints that affect implementation.
- Upstream artifacts produced by earlier skills when this skill is part of a pipeline.

## Workflow
1. Read only the relevant project inputs and preserved guidance before acting.
2. Audit the existing interface first when a site or product already exists: identify duplicated components, token drift, inconsistent states, and bespoke one-off styling before inventing anything new.
3. For premium or revenue-critical sites, load `premium-ui-ux-design` before choosing color, type, spacing, imagery, or motion direction.
4. Choose the smallest set of references needed for the current job.
5. Define the system in layers: primitives, semantic tokens, then component-level tokens and rules.
6. Produce the implementation, configuration, or guidance this skill owns.
7. Validate that the result stays compatible with the rest of the repository workflow.

## Quality standards
- Outputs must be implementation-ready and internally consistent.
- Preserve existing behavior unless the task explicitly requires a change.
- Avoid host-specific path assumptions so the skill remains portable.
- The design system must act as a living product, not a one-time style dump: include usage rules, states, and a clear source of truth.
- Prefer reusable components and documented patterns over page-specific bespoke styling.
- Premium design systems must define visual voice, dominant/subordinate/accent color logic, typography roles, imagery rules, data/proof presentation, component states, and responsive production rules.

## Anti-patterns
- Do not hardcode `.Codex/skills` or another single install path.
- Do not skip validation against upstream or downstream dependencies.
- Do not generate generic output that ignores the actual project context.

## Outputs
- Implementation guidance, configuration, generated artifacts, or concrete follow-on steps.

## References
- Start with `references/legacy-guidance.md` when you need the preserved detailed instructions from the previous skill version.
- Use `references/math-for-web-design.md` when sizing, spacing, typography, grids, media ratios, color ramps, or motion timing should be derived from proportion, `clamp()`, `calc()`, `minmax()`, aspect-ratio, or rounding logic.
- Use sibling skill `premium-ui-ux-design` when perceived quality, beauty, conversion, or high-ticket trust is part of the job.
- Read only the specific files under `references/` that match the current task instead of loading the whole directory.
- This skill has no bundled scripts by default; keep execution focused on the documented workflow and any existing project files.
- Prioritize `references/ux-quality-checklist.md` when validating whether the system is coherent enough to ship.

## Notes
- Treat this `SKILL.md` as the portable execution layer for both Codex and Codex.
- Preserve existing project behavior unless the current task explicitly requires a change.
- Minimum system outputs for substantial work:
  1. token structure
  2. component inventory or change list
  3. states and accessibility expectations
  4. source-of-truth location for future contributors


## Dashboard and data-viz coverage

For projects that include dashboards (executive, operational, public-facing), additional rules apply. See `references/enterprise-data-viz-rules.md` — covers chart-type selection, pre-attentive visual attributes, and the no-3D / no-shadow rules. Premium-priced dashboards must comply.
