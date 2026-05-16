# Experiment Logbook Template

**Read this when**: opening a new experiment file for a client project.

**Purpose**: The per-experiment file format that lives at
`project-log/experiments/<test-slug>.md` in a client project. Combined
with the hypothesis template, this file is the institutional memory of
what was tested and what was learnt.

## File structure

The hypothesis template produces most of the content. This file adds
the standing structure around it so files are discoverable and
auditable.

## Minimum sections (in order)

1. **Metadata** — slug, client, filed date, owner, status.
2. **Hypothesis** — per `hypothesis-template.md`, sections 1–5.
3. **Variants and assignment** — sections 6.
4. **Stopping rule and decision rule** — sections 7–8.
5. **Risks** — section 9.
6. **Implementation notes** — links to PRs, feature-flag IDs, staging
   preview URLs.
7. **Pre-launch QA checklist** — assignment balance, event firing,
   control-path safety.
8. **Run log** — dated bullets of anything notable during the run
   (deploys, campaigns, anomalies, tickets).
9. **Results** — section 10.
10. **Decision and rationale** — section 11.
11. **Follow-ups** — new tests, skills updated, documentation updated.

## Status lifecycle

- **Draft** — sections 1–9 populated; section 10 is empty.
- **Running** — test is live; run log is appended.
- **Decided** — sections 10 and 11 filled.
- **Retired** — losing variant removed from code; this is the
  permanent state.

Never delete a retired experiment file. The learning is in the archive.

## Naming

- Slug format: `<domain>-<short-description>-<YYYY-MM>`.
- Examples: `homepage-hero-founder-photo-2026-04`,
  `pricing-page-money-back-badge-2026-05`.
- Slug is set once and does not change.

## Cross-links

- Link the file from the monthly report that announces the decision.
- Link from the quarterly review.
- Link from any skill reference that incorporated the learning.

## Integration with monthly-report

The `monthly-report` skill queries this directory for:

- Tests decided within the target month.
- Tests still running at month-end.

The skill surfaces the hypothesis summary, decision, and primary
metric lift. It does not re-run the analysis.
