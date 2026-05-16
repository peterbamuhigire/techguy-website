# Certified Engine Operator — Syllabus

**Version**: 1.0 (2026-04-16)
**Programme**: Certified Operator of the Website Agency Engine.
**Duration**: 6 weeks part-time, or 3 weeks intensive.
**Cohort size**: 5–8 operators per cohort.
**Recertification**: every 12 months against the latest engine state.

## Why this certification exists

The engine's premium positioning depends on quality that does not degrade when
operators change. Certification is the mechanism that lets the agency staff,
partner, and recommend operators without diluting that quality.

If the exam is not hard enough to fail, the certification is not worth holding.
This programme is designed around that property.

## Tracks

Every candidate declares a primary track at enrolment. A generalist certificate
is not offered — the engine treats generalism as a drift risk.

1. **Strategist** — discovery, brand brief, sector strategy, page-goal mapping.
2. **Designer / Builder** — design system, photo management, page build,
   visual QA.
3. **SEO + Content operator** — SEO implementation, blog production, post-build
   SEO audit.
4. **QA + Launch operator** — accessibility, visual QA, security gate, deploy,
   rollback.

Operators can re-certify on a second track after holding the first for 12
months.

## Prerequisites

All candidates must:

- have read CLAUDE.md, AGENTS.md, and the executive-summary of the roadmap
- have read the Phase 10 and Phase 11 plan files
- have a working local environment with the canonical CI pipeline installed
  via `scripts/install-canonical-ci.sh`
- hold the reading list for their track at least in scanned form

## Required reading by track

### All tracks
- *Refactoring UI* (Wathan, Schoger)
- *Don't Make Me Think* (Krug, 3rd ed.)
- *Docs for Developers* (Bhatti et al.)

### Strategist
- *Building a StoryBrand* (Miller)
- *Obviously Awesome* (Dunford)
- *The Mom Test* (Fitzpatrick)
- *They Ask, You Answer* (Sheridan)

### Designer / Builder
- *Refactoring UI* (Wathan, Schoger)
- *Practical Typography* (Butterick)
- *Designing Interfaces* (Tidwell, Brewer, Valencia — 3rd ed.)

### SEO + Content operator
- *The Art and Business of Online Writing* (Kleon) or equivalent
- *Growth Hacking with Content Marketing* (Fishbein)
- *They Ask, You Answer* (Sheridan)

### QA + Launch operator
- *Site Reliability Engineering* (Beyer et al.) — chapters on alerting,
  on-call, and post-mortems
- *Observability Engineering* (Majors, Fong-Jones, Miranda)
- *Trustworthy Online Controlled Experiments* (Kohavi, Tang, Xu) — for
  understanding why launches are not "done" at deploy

## Curriculum — shared modules (all tracks)

### Module S1 — Engine orientation (week 1)
- CLAUDE.md, AGENTS.md, repository layers
- Five-layer mental model: commercial → strategy → build → launch →
  governance
- Skill lifecycle: SKILL.md, references, scripts, canonical CI
- **Exit quiz**: 20 questions, 90% to pass.

### Module S2 — Canonical CI pipeline (week 1)
- The 15 ordered steps in `templates/ci/website.yml`
- When a gate failure blocks deploy
- Reading a failed CI run
- **Exit quiz**: reproduce the pipeline from memory, labelling blocking vs
  advisory gates.

### Module S3 — Africa calibration (week 2)
- `deploy/references/africa-calibration.md`
- 3G network profile, 350 KB budget, data-cost respect
- `Save-Data` handling
- **Practical**: inspect a live client site on throttled 3G and file a
  report.

### Module S4 — Drift, documentation, and the 500-line rule (week 2)
- `docs/doc-style-guide.md`, `docs/deprecation-policy.md`, `glossary.md`
- Running `drift-check.sh` locally
- When to write a reference vs expand SKILL.md

## Curriculum — track modules

### Track T1: Strategist (weeks 3–5)
- T1.1 Intake and qualification (agency-positioning, proposal-skills)
- T1.2 Strategy brief and trust architecture (brand-strategy, sector-strategies)
- T1.3 Page-goal mapping and search intent (seo, page-builder)
- T1.4 Discovery-to-brief handoff
- **Practical**: run a real discovery end-to-end on a paying or mock client
  and produce a signed brief.

### Track T2: Designer / Builder (weeks 3–5)
- T2.1 Design-system provisioning and token discipline
- T2.2 Photo management and sector image conventions
- T2.3 Page-build patterns and component library
- T2.4 Visual QA (Tidwell patterns + screenshot baselines)
- **Practical**: build a full primary template set; rubric score ≥ 8/10.

### Track T3: SEO + Content (weeks 3–5)
- T3.1 SEO implementation (metadata, schema, hreflang, analytics-event-map)
- T3.2 Blog production (ideation, outlining, writing, editing)
- T3.3 Post-build SEO audit and remediation
- T3.4 Content governance and client handoff
- **Practical**: ship ten indexed pages (primary + blog) and produce a
  30-day indexation and CTR report.

### Track T4: QA + Launch (weeks 3–5)
- T4.1 Accessibility gate (axe + keyboard + screen reader + manual)
- T4.2 Visual QA, drift, and design-quality-score pre-launch gate
- T4.3 Security gate (dep audit, headers, SRI, secrets, supply chain)
- T4.4 Launch, post-deploy smoke, and rollback drill
- **Practical**: run a supervised launch and execute a rollback drill.

### Shared — Final integration module (week 6)
- End-to-end simulated project with peer review
- Friction-log submission
- Rubric scoring (self + peer + examiner)

## Assessments

Two required, both must pass.

### Written exam
- 60 questions across shared and track modules.
- Duration: 120 minutes.
- Pass mark: 80%.
- Questions are taken from `certification/exam.md`.

### Practical exam
- A real test project assigned by the programme lead; scope matches the
  operator's track.
- Duration: 3 weeks.
- Deliverables:
  - stage-gate evidence per `docs/onboarding-validation/*/friction-log.md`
  - design-quality rubric score ≥ 8/10
  - Phase 10 gates all green on the canonical CI
  - drift-check green
  - operator-run demo to two examiners
- Fail conditions: any gate red on the canonical pipeline at final review;
  rubric score < 8; evidence of founder intervention on blocking tasks.

## Issuance

- On pass: operator receives certification ID `ENG-<track>-<cohort>-<seq>`,
  e.g. `ENG-T2-2026-01-03`, and is listed at
  `certification/cohort-<cohort>.md`.
- Certificate PDF is generated from the cohort record and signed by the
  programme lead.
- Certified operator agrees to the code of conduct at
  `certification/code-of-conduct.md` (see Phase 12).

## Recertification

- Every 12 months from initial pass date.
- Refreshed exam reflecting the latest engine state (any phase shipped since
  last exam).
- At recertification, operator submits structured "engine feedback" per the
  Phase 12 Knowledge Commons workstream; the feedback informs the next
  quarterly skill update.
- Lapsed certification does not revoke the issued ID but removes operator
  from the public list.

## Failure and retake

- A candidate may retake the written exam after 14 days.
- A failed practical exam requires a written remediation plan from the
  programme lead and a new test project; no retake fee, but cohort slot is
  not guaranteed.
- Two failed practicals disqualify the candidate for 12 months.

## Programme governance

- Syllabus owner: agency founder (until Phase 12 hands this to a named
  programme lead).
- Syllabus review: annually, at the same time as the engine's annual
  evaluation re-run.
- Changes to syllabus: require a decision entry under
  `project-log/decisions/`.
