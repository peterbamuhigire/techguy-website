# Documentation Style Guide

**Purpose**: Define how to write inside the engine so that documentation
stays coherent across skills, phases, and operators.

**Scope**: Every file in this repository — SKILL.md, references, plans,
scripts' help text, README, and decision entries.

**Enforcement**: `scripts/drift-check.sh` enforces the mechanical rules in
this guide.

## Principles

1. **Portability beats cleverness.** Every doc should work without the
   reader seeing another doc first. Use the glossary to avoid re-defining
   terms; link, do not re-explain.
2. **Write the rule, then the reason, then the application.** Rules first
   so the operator can act. Reasons second so the operator can judge edge
   cases. Application last because it is the longest.
3. **Name it, measure it, or delete it.** Claims without a measurable
   definition are drift. "Fast" is a drift word. "LCP < 2.5 s on a 3G
   profile" is not.
4. **No dated framing.** The glossary bans it; the drift-check gate fails
   the build on it. Write facts that remain true, or let the timestamp on
   a decision entry carry the date.
5. **500-line rule.** A SKILL.md over 500 lines is split into references
   unless a comment at the top of the file justifies the overrun. A
   reference over 500 lines is usually a sign it contains two topics —
   split.

## SKILL.md structure

Every SKILL.md follows this order:

```markdown
---
name: <skill-slug>
description: <one-paragraph description of the skill, portable across
Claude and Codex; used by both as the skill loader hint>
---

# <Skill Display Name>
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- <bullet list of the exact situations the skill is invoked>

## Do not use when
- <bullet list of the exact situations where another skill is better>

## Required inputs
- <the minimum the skill needs to produce its output>

## Workflow
1. <numbered steps>

## Quality standards
- <measurable or observable rules>

## Anti-patterns
- <explicit failure modes to avoid>

## Outputs
- <named artefacts the skill produces>

## References
- `references/<file>.md` — <one-line purpose>

## Notes
- <optional footer with integration notes, dependencies on other skills>
```

The acknowledgement line is mandatory, must appear exactly as shown, and
must sit immediately below the first top-level heading rather than in
frontmatter.

Do not invent new section names. If a skill's behaviour does not fit this
template, the skill is probably two skills.

## References

- A reference file is a self-contained deep-dive. It expects the reader to
  have read the SKILL.md.
- Every reference starts with a one-paragraph purpose and a one-line "read
  this when" line.
- References should not tell the reader what the skill already says.
- References cite primary sources when they encode an external framework
  (book, specification, paper). Cite with edition and year.

## Scripts

- Every script lives in `scripts/`.
- Every script starts with a shebang and a header comment: name, purpose,
  orchestration summary, usage, exit codes.
- Every script is `set -euo pipefail` compatible.
- Every script writes machine-readable output to `reports/<domain>/` and
  a human-readable summary to the same directory.
- No script mutates state outside the client project working directory.

## Plans

- Every plan file lives under `docs/plans/`.
- Every plan has: Objective, Why This Phase Matters, Core Outcomes,
  Workstreams, Repository Outputs Required, Success Criteria, Risks To
  Avoid, Reading Material.
- Success criteria are measurable. If you cannot measure it, rewrite it.
- Plans do not narrate implementation; they specify outcomes.

## Decision entries

- Live under `project-log/decisions/<YYYY-MM-DD>-<slug>.md`.
- Front matter at top: Date, Status, Phase (if applicable), Driver.
- Body: Summary, Deliverables, Rationale, Risks, Follow-up.
- Decision entries are never edited after filing; a superseding entry
  cites the previous one.

## Link conventions

- Internal links use relative paths, not absolute URLs.
- Every internal link points to a file that exists. drift-check enforces.
- External links are fetched at least once by the author; dead links are
  drift.
- Do not link to `http://`; always `https://`. Exceptions require a
  decision entry.

## Naming

- File names: lowercase, hyphen-separated, no spaces, no dates unless the
  file is inherently dated (a decision entry).
- Directories: lowercase, hyphen-separated.
- Skills use their canonical slug from `glossary.md`. Do not shorten.
- Reference files name the topic, not the source: `alert-thresholds.md`,
  not `alert-thresholds-from-sre-book.md`.

## Voice

- Second-person instruction ("Write the rule") or imperative ("Measure
  it") — not first-person ("I write the rule") and not third-person ("The
  operator writes the rule").
- Contractions are acceptable ("don't", "you'll").
- "We" is reserved for project-log entries describing a decision taken by
  the agency. Skills and references do not use "we".
- No exclamation marks outside quoted external content.

## Forbidden constructions

- Hedges: "often", "usually", "sometimes", "tends to". Either name the
  condition that triggers the rule or make the rule absolute.
- Throat-clearing: "It is important to note that", "Please be aware", "As
  discussed above". Delete.
- Weak verbs: "utilise" (use "use"), "leverage" (use "use"), "facilitate"
  (name the thing being facilitated).
- Marketing adjectives from `glossary.md#banned-terms`. The drift-check
  gate fails on these.

## Lists vs prose

- Use a list when the items are parallel or unordered.
- Use prose when the order, conditionality, or nuance matters.
- Do not nest lists beyond two levels.

## Code examples

- Every code block names its language.
- Paths in code blocks match what a reader will actually type from the
  repository root (or another named root).
- No placeholders without a comment above them specifying what they mean.

## Tables

- Use tables for parallel data with three or more columns.
- Do not use tables for two-column key-value pairs; a list is clearer.

## Images

- Engine documentation (this repository) does not embed images. Link to
  them if they exist in a client project or external asset bank.
- Screenshots in client-project docs go under `docs/assets/`.

## When in doubt

- Check `glossary.md` for the canonical name.
- Check a neighbouring SKILL.md for the convention.
- If the rule is still ambiguous, file a decision entry proposing the
  rule — do not improvise in a doc.
