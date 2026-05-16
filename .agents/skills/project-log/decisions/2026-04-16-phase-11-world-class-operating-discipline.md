# Decision: Phase 11 — World-Class Operating Discipline

**Date**: 2026-04-16
**Status**: Implemented (repository deliverables)
**Phase**: 11 of 12 (website-agency-engine roadmap)
**Evaluation driver**: 2026-04-12 evaluation dimension "Governance and
Scalability" 8.4 → target ≥ 9.3. Converts Phase 9 governance from
documented to demonstrated.

## Summary

Shipped the world-class operating-discipline layer: multi-operator
validation scaffolding, certification programme, documentation
drift-eradication gate, live-telemetry contract, experimentation
infrastructure, and rendered-output design-quality scoring. The phase
converts the engine from "documented to run without the founder" into
"has the gates, scripts, and rubrics that make running without the
founder measurable."

Six workstreams shipped:

1. Multi-operator validation programme and certification curriculum.
2. Documentation coherence and drift-eradication (glossary, drift-check
   script, doc style guide, deprecation policy).
3. Live telemetry and observability (RUM + errors + analytics + alerts)
   with generated quality scorecard.
4. Experimentation and CRO operations (hypothesis template,
   stat-significance primer, A/B infrastructure, logbook, quarterly
   review).
5. Anti-slop and premium-output validation (7-category rubric,
   slop-scan, CI-blocking score).
6. Cross-cutting integration into existing skills (website-builder,
   monthly-report, agency-positioning, deploy, maintenance calendar).

## Deliverables

### New skills
- `observability/SKILL.md` + 5 references
- `experimentation/SKILL.md` + 5 references
- `design-quality-score/SKILL.md` + 5 references

### New scripts
- `scripts/drift-check.sh` — pipeline step 11 (blocking)
- `scripts/slop-scan.sh` — floor for the design-quality-score gate
- `scripts/design-quality-score.sh` — pipeline step 12 (advisory on PR,
  blocking on main)

### New governance files
- `glossary.md` — canonical-name authority
- `docs/doc-style-guide.md` — writing standards
- `docs/deprecation-policy.md` — rename and retirement rules

### New operator artefacts
- `docs/onboarding-validation/2026/report.md`
- `certification/syllabus.md`
- `certification/exam.md` — 60-question bank across shared + 4 tracks
- `certification/cohort-2026-01.md`

### New dashboard
- `dashboards/quality-scorecard.md` — generated weekly (generation
  script is Phase 11 follow-up; placeholder block documents schema)

### Updates to existing skills
- `website-builder/references/maintenance-calendar.md` — quarterly drift
  audit, quarterly experimentation review, quarterly public-scorecard
  regeneration, annual certification recertification
- `monthly-report/SKILL.md` — live-telemetry pre-flight, refusal to
  render without reachable sources, experimentation integration
- `deploy/SKILL.md` — launch decision record (observability,
  experimentation, design-quality, runbook review)
- `agency-positioning/SKILL.md` — premium-positioning proof assets
  (certification, scorecard, benchmarks, corpus, rubric)

### CI pipeline
- `templates/ci/website.yml` already includes steps 11 (drift-check) and
  12 (design-quality-score) from Phase 10 work; this phase supplies the
  actual scripts, making those steps functional.

## Rationale

The 2026-04-12 evaluation flagged that Phase 9 gave the engine the right
governance structures but did not demonstrate that:

- a second or third operator can run the system cleanly
- the governance rhythm will be maintained instead of decaying

Phase 11 addresses both: the certification programme and the
onboarding-validation report force demonstration, and the drift-check
gate and maintenance-calendar additions make maintenance part of CI
rather than aspirational.

The live-telemetry work closes the gap where the quality dashboard was
defined but not connected to data. The experimentation work installs
the scientific feedback loop the engine lacked. The design-quality
scoring turns "premium" from a marketing claim into a reproducible
score.

## Risks accepted

- **Generation script is Phase 11 follow-up.** The scorecard file has
  the marker block and the definitions; the weekly regeneration job is
  not yet implemented. The placeholder block documents expected schema;
  first client with live telemetry triggers the implementation.
- **Onboarding validation is scaffolding.** The success criterion on
  three non-founder operators shipping complete projects cannot be met
  without real operators. The templates, friction-log format, and
  report structure are in place; running them requires hiring or
  partnering that is outside repository scope.
- **Experimentation success criterion (30% retainer clients with active
  experiments) is operational.** The skill, templates, and
  infrastructure reference are in place; actual test launches happen in
  client engagements.
- **Two rubric calibrations** between operators are required to
  validate the rubric's consistency claim. Pending the second operator.

## Follow-ups

- Implement `scripts/generate-quality-scorecard.sh` when the first
  client has live RUM + errors + analytics reporting into the
  centralised endpoint.
- Provision the GrowthBook self-host.
- Onboard the first cohort operator; record friction and adjust
  skills accordingly.
- Run `drift-check.sh` in strict mode and resolve any findings before
  the first public scorecard publication.
- File the first calibration note between two operators scoring the
  same template (Example 4 in `scored-examples.md` is the blind
  calibration exercise).

## Cross-reference

- Plan: `docs/plans/website-agency-engine/phase-11-world-class-operating-discipline.md`
- Completion report: `docs/plans/2026-04-16-phase-11-*-completion.md`
  (filed alongside this decision)
- Previous phase: `2026-04-16-phase-10-hard-enforcement-gates.md`
- Next phase: `2026-04-16-phase-12-*` (Phase 12 shipped alongside)
