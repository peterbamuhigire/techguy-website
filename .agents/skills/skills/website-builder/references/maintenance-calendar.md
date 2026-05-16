# Maintenance Calendar

Use this calendar to keep the repository coherent as it grows.
Without a rhythm, standards decay and contradictions accumulate.

## Weekly Rhythm

### Weekly Operational Review

Owners:

- repo owner
- project manager or operations owner

Review:

- active project blockers
- stage-gate slippage
- launch incidents
- QA defects
- urgent documentation drift

Output:

- short action list
- owners and dates

## Monthly Rhythm

### Monthly Quality And Commercial Review

Review:

- project margin trend
- delivery speed
- launch quality
- proposal win rate
- client satisfaction and retention signals

Also review:

- skills or templates that caused friction
- repeated manual work that should become a reference or template

Output:

- monthly improvement list
- updates to dashboard notes

## Quarterly Rhythm

### Quarterly Repository Governance Review

Review:

- contradictory instructions
- outdated references
- candidate deprecations
- weak coverage areas
- quality gaps surfaced by recent projects
- whether documentation reflects the actual system

Output:

- governance decisions
- deprecations
- roadmap updates

### Quarterly Documentation Audit

Run `scripts/drift-check.sh` in strict mode (`DRIFT_STRICT=1`) and file a
written audit report in `project-log/decisions/YYYY-MM-DD-docs-audit-Qn.md`.
The audit covers:

- dead internal links
- deprecated-entity references outside compatibility window
- dated framing
- banned terms
- SKILL.md 500-line rule
- duplicated guidance across reference files

Output:

- audit report (never "no findings" without evidence)
- skill updates triggered by findings

### Quarterly Experimentation Review

Review all experiments run in the quarter across retainer clients.

Per-client: each client's `project-log/experiments/review-<YYYY-Qn>.md`
(template in `experimentation/references/quarterly-review-template.md`).

Cross-client: `dashboards/experimentation-learning-<YYYY-Qn>.md`.

Output:

- wins shipped across clients
- patterns that moved and patterns that stayed local
- skill updates proposed

### Quarterly Public Scorecard Regeneration

Regenerate `dashboards/public-scorecard.md` (Phase 12) from live
telemetry and aggregate it without operator narration. Broken
generation is an incident.

## Semiannual Rhythm

### Playbook And Training Review

Review:

- role tracks
- onboarding effectiveness
- handoff quality between roles
- whether standards are explicit enough for new operators

Output:

- updated training map
- handbook index refresh

## Annual Rhythm

### Certification Recertification Cycle

Every certified operator renews certification 12 months after their
initial pass. Output:

- refreshed exam reflecting any phase or skill changes since last pass
- structured engine feedback from each recertifying operator
- updates to the cohort records under `certification/cohort-*.md`

### World-Class Benchmark Review

Review:

- premium positioning consistency
- profitability consistency
- launch quality consistency
- client outcome evidence
- referral and retention patterns
- onboarding speed for new operators

Output:

- full evaluation refresh
- benchmark score update
- next-year priorities

## Calendar Rule

If a review cadence exists but no artifact records the outcome, the review did not happen.
