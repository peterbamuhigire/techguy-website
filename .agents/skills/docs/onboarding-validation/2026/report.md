# Onboarding Validation Report — 2026 Cohort

**Status**: Template; to be filled as each operator completes their ramp.
**Owner**: Operations lead.
**Cadence**: Update at every stage gate; finalise at end of first solo project.
**Purpose**: Evidence that the engine runs without the founder.

The success criterion for Phase 11 is explicit: at least three operators other
than the founder have run a complete project from intake to launch using only
the published skills, with quality variance across operators ≤ 5% on the
published scorecard.

This file is the artefact that proves it.

## How this document is used

Do not treat this as a marketing or training asset. It is the internal
evidence-of-scale document. Fabricating a pass here destroys the governance
layer; an honest fail teaches the engine where to fix itself.

Each operator completes their own section. The operations lead consolidates
findings at the bottom.

## Persona scope

Four operator personas are validated in this programme. Ramp-time targets come
from the Phase 11 plan and are non-negotiable.

| Persona | First solo target | Primary skills owned |
|---|---|---|
| Strategist | First solo discovery ≤ 2 weeks | website-builder, design-reference, sector-strategies, brand-strategy |
| Designer / Builder | First solo build ≤ 4 weeks | design-system, photo-manager, page-builder, visual-qa |
| SEO + Content operator | First solo SEO production ≤ 3 weeks | seo, blog-writer, seo-audit, content-writing |
| QA + Launch operator | First solo launch ≤ 4 weeks | accessibility-audit, visual-qa, security-gate, deploy |

A fifth "generalist" persona is not validated — the engine is explicit that
generalist operators produce drift.

## Per-operator template

Copy this block into a new file at
`docs/onboarding-validation/<operator-slug>/friction-log.md` and also summarise
in the table below.

```markdown
# Friction Log — <Operator Name> (<Persona>)

**Start date**: YYYY-MM-DD
**First solo project**: <project slug>
**Ramp target**: <from table above>
**Certification cohort**: cohort-2026-XX

## Stage-gate entries

### Stage: <name — e.g. "intake", "discovery", "design-system", "page-build", "seo", "launch">
- Date:
- Skills used:
- Time spent:
- Where the skill was clear:
- Where the skill was unclear or contradicted itself:
- What I had to ask the founder about:
- What I had to guess at:
- Whether the gate passed on first attempt:
- Evidence link (PR, commit, screenshot, report file):

## Design-quality rubric score at hand-off

- Typographic rhythm:
- Colour discipline:
- Spacing consistency:
- Hierarchy strength:
- Copy quality:
- Trust-signal placement:
- Section originality:
- **Total**: /10

## Phase 10 gate outcomes

- Performance gate: pass / fail (route + score)
- Accessibility gate: pass / fail (violations count)
- Visual QA: pass / fail (diff pixels)
- Security gate: pass / fail
- Drift check: pass / fail

## Questions for the operations lead
```

## Cohort summary

| Operator | Persona | Start | First solo | Ramp days | Rubric score | Gates passed first time | Notes |
|---|---|---|---|---|---|---|---|
| — | Strategist | | | | | | |
| — | Designer / Builder | | | | | | |
| — | SEO + Content | | | | | | |
| — | QA + Launch | | | | | | |
| — | <fifth operator> | | | | | | |

Target: at least five operators in the 2026 cohort. Evaluation passes only when
at least three non-founder operators have shipped a full project.

## Quality variance

Compute after all first-solo projects are complete:

- Rubric score range across operators: ________ (target ≤ 0.5 points)
- Phase 10 gate pass-rate range: ________ (target ≤ 5 percentage points)
- Ramp-time slip rate: ________ (target: 0 of 4 personas over target)

If variance exceeds target, do not close the phase. Identify the skills where
operators diverged and file follow-up skill updates.

## Systemic findings

Fill in at end of cohort:

- Skills that repeatedly caused friction:
- Skills that repeatedly needed founder clarification:
- Gates that repeatedly failed on first attempt:
- References that were under-used (operators did not discover them):
- References that were over-used (operators substituted them for SKILL.md):

Every systemic finding becomes a skill update or a drift-check rule.

## Sign-off

- Operations lead: _______________________ Date: __________
- Founder (witness, not signatory): _______________________ Date: __________

Until this file is signed, Phase 11's success criterion on multi-operator
validation is **not met** — regardless of what the CI pipeline says.
