---
name: policy-pages
description: Design Privacy Policies and Terms of Use that are legally compliant, user-friendly, accessible, and trustworthy. Use when building any website to ensure proper legal protection, regulatory compliance (GDPR, CCPA, COPPA, PIPEDA, LGPD), and user trust through clear, plain-language documents. Covers design patterns, placement strategies, implementation examples, and jurisdiction-specific requirements. Every website needs both documents.
---

# Policy Pages
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- The task matches this domain: Design Privacy Policies and Terms of Use that are legally compliant, user-friendly, accessible, and trustworthy. Use when building any website to ensure proper legal protection, regulatory compliance (GDPR, CCPA, COPPA, PIPEDA, LGPD), and user trust through clear, plain-language documents. Covers design patterns, placement strategies, implementation examples, and jurisdiction-specific requirements. Every website needs both documents.
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
- Read only the specific files under `references/` that match the current task instead of loading the whole directory.
- This skill has no bundled scripts by default; keep execution focused on the documented workflow and any existing project files.

## Notes
- Treat this `SKILL.md` as the portable execution layer for both Codex and Codex.
- Preserve existing project behavior unless the current task explicitly requires a change.

