---
name: skill-creator
description: Guide for creating effective skills. This skill should be used when users want to create a new skill (or update an existing skill) that extends Codex's capabilities with specialized knowledge, workflows, or tool integrations.
---

# Skill Creator
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- The task matches this domain: Guide for creating effective skills. This skill should be used when users want to create a new skill (or update an existing skill) that extends Codex's capabilities with specialized knowledge, workflows, or tool integrations.
- The user needs repo-maintenance or skill-authoring support rather than project output.

## Do not use when
- A build, writing, or audit skill should own the task instead.
- There is no repository or skill-maintenance action to perform.

## Required inputs
- The files, changes, or workflow that need maintenance.
- Current repository conventions and any behavior that must not regress.

## Workflow
1. Read the current repository state and the exact maintenance goal.
2. Use the preserved guidance and any bundled scripts to perform the minimum effective change.
3. Keep the result aligned with existing repo conventions.
4. Prepare the output so a follow-on safety review or documentation pass is straightforward.

## Quality standards
- Maintenance changes must reduce ambiguity, not add process noise.
- Outputs should preserve portability and existing behavior.
- The result should be easy for another agent to continue using.

## Anti-patterns
- Do not introduce product-specific assumptions into portable skill rules.
- Do not bloat SKILL.md when detail belongs in references or scripts.
- Do not leave partially updated conventions behind.

## Outputs
- Updated skill structure, repo-maintenance changes, authoring guidance, or synchronized documentation.

## References
- Start with `references/legacy-guidance.md` when you need the preserved detailed instructions from the previous skill version.
- Read only the specific files under `references/` that match the current task instead of loading the whole directory.
- Use bundled tools in `scripts/` when they cover the task more reliably than redoing the work manually.

## Notes
- Treat this `SKILL.md` as the portable execution layer for both Codex and Codex.
- Preserve existing project behavior unless the current task explicitly requires a change.

