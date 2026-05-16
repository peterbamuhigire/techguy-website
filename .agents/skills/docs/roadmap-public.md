# Public Roadmap

**Status**: Curated public view of the engine roadmap.
**Cadence**: Updated at each quarterly review.
**Source of truth**: `docs/plans/website-agency-engine/` (internal).
**Purpose**: So the African web community can see where the engine is
going.

The internal plan is long and opinionated. The public roadmap distils
it to the commitments the agency is willing to be held to publicly.

## Shipped

### Phase 10 — Hard enforcement and visual-QA gates (2026-04-16)
Every client project is built on a canonical 15-step CI pipeline with
blocking gates on performance (3G-calibrated), accessibility (WCAG
2.2 AA), visual QA, and security. Thresholds are calibrated for
African 3G mobile reality.

Public evidence: `templates/ci/website.yml`, `lighthouserc.json`,
`performance-budgets.json`, the three Phase 10 skills
(`accessibility-audit`, `visual-qa`, `security-gate`).

### Phase 11 — World-class operating discipline (2026-04-16)
The governance layer: observability, experimentation, documentation
drift-check, design-quality scoring, certification programme.

Public evidence: `observability/`, `experimentation/`,
`design-quality-score/` skills; `scripts/drift-check.sh`,
`scripts/slop-scan.sh`; `glossary.md`, `docs/doc-style-guide.md`,
`docs/deprecation-policy.md`; `certification/syllabus.md`,
`certification/exam.md`.

### Phase 12 — African authority engine (2026-04-16, concurrent)
The Africa-realistic excellence layer and the commitments to run the
engine in public.

Public evidence: `skills/africa-excellence/` skill + 6 references;
`docs/licensing-matrix.md`; `LICENSE`; this roadmap;
`dashboards/public-scorecard.md`.

## In-flight

These are ongoing operational outcomes the repository cannot complete
without real operators, real clients, and real publishing:

- **Multi-operator validation.** Three non-founder operators running
  complete projects from intake to launch.
- **Certification cohort 2026-01.** First cohort enrolled, syllabus
  published, exam written, practical projects scored.
- **Telemetry generation script.** The live-data generator for
  `dashboards/quality-scorecard.md`.
- **Benchmark library.** Three open-source reference sites:
  East African SME, Kenyan B2B technology, Nigerian fintech or
  healthtech. Each passes every Phase 10 gate, scores ≥ 9/10 on the
  rubric, is indexed, and carries a walkthrough.
- **Case-study corpus.** Eight published case studies with measurable
  client outcomes, tied to gate and rubric evidence.
- **First experimentation cycle.** 30% of retainer clients running an
  active experiment with a documented hypothesis.
- **Upstream contribution.** At least one substantive PR per year to
  a project the engine depends on (Astro, Tailwind, axe-core,
  Playwright, Lighthouse CI, GrowthBook, Sharp).
- **Continental presence.** At least one conference talk or hosted
  workshop within 12 months.
- **Public research note.** One research note per year on an Africa-
  specific web topic.

## Priorities for next quarter

Quarterly reviews update this list.

1. Implement the scorecard generation script against live telemetry
   from the first retainer client.
2. Provision the GrowthBook self-host and run the first documented
   experiment for a retainer client.
3. Publish the first open-source benchmark site.
4. Onboard the first non-founder operator into a real project.
5. Calibration pass: two operators blind-score the four worked
   examples in `skills/design-quality-score/references/scored-examples.md`
   and file a calibration note.

## How to suggest a roadmap change

- Public: open an issue on the repository titled "Roadmap proposal:
  …".
- Operators or partners: file a PR against this file with a brief
  rationale.
- Proposals are reviewed at the following quarterly governance review.

## What this roadmap will not include

- Client names and individual project names (those belong in case
  studies, with consent).
- Pricing changes (those are agency-positioning work and do not ship
  publicly).
- Hiring plans (not roadmap material).

## Read also

- `project-log/decisions/2026-04-16-phase-10-hard-enforcement-gates.md` — Phase 10 decision record.
- `project-log/decisions/2026-04-16-phase-11-world-class-operating-discipline.md` — Phase 11 decision record.
- `project-log/decisions/2026-04-16-phase-12-african-authority-engine.md` — Phase 12 decision record.
- `docs/licensing-matrix.md` — what is open and what is closed.
- `dashboards/public-scorecard.md` — the evidence for each shipped
  commitment.
