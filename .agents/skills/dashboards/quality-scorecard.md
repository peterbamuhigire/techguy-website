# Internal Quality Scorecard

**Status**: Generated artefact — regenerated weekly from live telemetry.
**Owner**: operations lead.
**Source**: RUM + Sentry + Plausible/GA4 + CI gate history per project.
**Public counterpart**: `dashboards/public-scorecard.md` (Phase 12).

This file replaces the Phase 9 operator-narrated scorecard. No operator
fills in numbers by hand; numbers come from the live sources defined in
the observability skill. An operator who edits a metric cell edits a
cache, not the truth.

## How this is generated

1. A weekly job (self-hosted cron or GitHub Action on schedule) runs the
   generation script (to be implemented; the script's contract lives at
   `scripts/generate-quality-scorecard.sh` — Phase 11 follow-up).
2. The job reads per-project telemetry and CI gate history.
3. The job rewrites this file between the markers `<!-- SCORECARD:BEGIN -->`
   and `<!-- SCORECARD:END -->`.
4. Everything outside the markers is human-authored framing that survives
   generation.

## Framing

- The scorecard is truth-telling, not marketing. A regressed client is
  listed honestly; the fix belongs to the operators, not the dashboard.
- Numbers carry an age: if a source was unreachable during the last
  generation, the cell shows `n/a` and flags the project.
- Weekly run cadence: Mondays, 03:00 UTC. A missed run is recorded in
  `project-log/incidents/`.

## Thresholds and colour rules

| Metric | Green | Amber | Red |
|---|---|---|---|
| LCP p75 (route avg) | ≤ 2.5 s | 2.5–4.0 s | > 4.0 s |
| INP p75 | ≤ 200 ms | 200–500 ms | > 500 ms |
| CLS p75 | ≤ 0.1 | 0.1–0.25 | > 0.25 |
| JS error rate | ≤ 0.5% | 0.5–1% | > 1% |
| Uptime 30-day | ≥ 99.9% | 99.5–99.9% | < 99.5% |
| Phase 10 gate pass-rate | 100% | 95–100% | < 95% |
| Design-quality rubric | ≥ 9/10 | 8/10 | < 8/10 |

Colour is visual shorthand; the numbers are the truth.

<!-- SCORECARD:BEGIN -->
## Projects (auto-generated)

_This block is rewritten by the generation job. The placeholder rows
below are the expected schema; the job fills them with real data once a
project is live._

| Project | LCP p75 | INP p75 | CLS p75 | Err rate | Uptime 30d | Gate pass | Rubric | Last update |
|---|---|---|---|---|---|---|---|---|
| _no projects yet_ | — | — | — | — | — | — | — | — |

## Alerts in the last 7 days

_Rewritten by the generation job._

- _none_

## Suppressed alerts

_Rewritten by the generation job from project runbooks._

- _none_

## Certified operators (roster, sourced from cohort records)

_Rewritten by the generation job from `certification/cohort-*.md`._

- _cohort 2026-01: pending enrolment_

<!-- SCORECARD:END -->

## Definitions

- **p75** — 75th-percentile value across all real-user sessions for the
  route over the rolling 7-day window.
- **Gate pass** — percentage of CI runs in the week where all Phase 10
  and Phase 11 gates passed without a bypass.
- **Rubric** — the most recent design-quality score for the project's
  primary templates.

## Bypasses

A project that ships with a waived gate is flagged red on that row,
regardless of the metric. The waiver must link to the decision entry
that authorised it.

## When generation fails

If the generation job fails:

- The file is not rewritten.
- The header carries a `STALE` marker added by the CI watchdog.
- An incident is opened.

An edit to the file by a human while generation is failing is treated as
drift and reverted at the next successful run. If a correction is
genuinely needed, file a decision entry describing the expected vs
observed value, and fix the generation script.

## See also

- `observability/SKILL.md` — the telemetry contract.
- `monthly-report/SKILL.md` — the per-client version of the same data.
- `dashboards/public-scorecard.md` — the aggregate public view (Phase 12).
