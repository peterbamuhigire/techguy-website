---
name: i18n
description: Internationalization infrastructure for multi-language websites. Defines 3 supported languages (English, French, Kiswahili) with path-based routing, hreflang tags, and language-specific sitemaps. Orchestrates content organization and SEO across all language versions.
---

# I18N
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- The task matches this domain: Internationalization infrastructure for multi-language websites. Defines 3 supported languages (English, French, Kiswahili) with path-based routing, hreflang tags, and language-specific sitemaps. Orchestrates content organization and SEO across all language versions.
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
- For multilingual websites, slugs must be localized for every supported language. Do not keep English slugs on non-English pages unless the term is a proper noun, brand, acronym, or established search term in that language.
- Language switching, canonical URLs, hreflang tags, and sitemaps must resolve through the same route-equivalence map so users changing languages land on the matching page with the correct localized URL.

## Anti-patterns
- Do not hardcode `.Codex/skills` or another single install path.
- Do not skip validation against upstream or downstream dependencies.
- Do not generate generic output that ignores the actual project context.
- Do not blindly swap only the language prefix in URLs. `/en/accounting-software/` should become the researched equivalent for the target language, not `/fr/accounting-software/`, unless that slug is intentionally native to the target language.

## Outputs
- Implementation guidance, configuration, generated artifacts, or concrete follow-on steps.

## References
- Start with `references/legacy-guidance.md` when you need the preserved detailed instructions from the previous skill version.
- Read only the specific files under `references/` that match the current task instead of loading the whole directory.
- This skill has no bundled scripts by default; keep execution focused on the documented workflow and any existing project files.

## Notes
- Treat this `SKILL.md` as the portable execution layer for both Codex and Codex.
- Preserve existing project behavior unless the current task explicitly requires a change.

