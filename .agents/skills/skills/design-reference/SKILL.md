---
name: design-reference
description: Analyses up to 5 reference websites provided by the client, visits each one, and generates a structured design guide (docs/design-reference.md) that captures the patterns, features, and qualities the client admires. Use when the client provides URLs of websites they like. Run before design-system.
---

# Design Reference
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- The task matches this domain: Analyses up to 5 reference websites provided by the client, visits each one, and generates a structured design guide (docs/design-reference.md) that captures the patterns, features, and qualities the client admires. Use when the client provides URLs of websites they like. Run before design-system.
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
3. Produce the implementation, configuration, or guidance this skill owns.
4. Validate that the result stays compatible with the rest of the repository workflow.

## Quality standards
- Outputs must be implementation-ready and internally consistent.
- Preserve existing behavior unless the task explicitly requires a change.
- Avoid host-specific path assumptions so the skill remains portable.

## Anti-patterns
- Do not hardcode `.Codex/skills` or another single install path.
- Do not skip validation against upstream or downstream dependencies.
- Do not generate generic output that ignores the actual project context.

## Outputs
- Implementation guidance, configuration, generated artifacts, or concrete follow-on steps.

## References
- Start with `references/legacy-guidance.md` when you need the preserved detailed instructions from the previous skill version.
- Use `references/competitor-analysis-worksheet.md` to analyse competitors as positioning and trust inputs, not just design inspiration.
- Use `references/research-synthesis-template.md` to turn reference and sector analysis into differentiated design direction.
- Read only the specific files under `references/` that match the current task instead of loading the whole directory.
- This skill has no bundled scripts by default; keep execution focused on the documented workflow and any existing project files.

## Notes
- Treat this `SKILL.md` as the portable execution layer for both Codex and Codex.
- Preserve existing project behavior unless the current task explicitly requires a change.


## Canonical worksheet format

For premium engagements ($20k+), use Levy's 19-column competitive matrix as the canonical format. See `references/levy-competitive-matrix.md`. Local sector adaptations live in the "Local additions" subsection of `references/competitor-analysis-worksheet.md`.

Minimum data set: 5 direct + 3 indirect competitors fully filled, with A–F heuristic grades and a 1-page distilled brief.
