# Decision: Phase 12 — African Authority Engine

**Date**: 2026-04-16
**Status**: Implemented (repository deliverables)
**Phase**: 12 of 12 (website-agency-engine roadmap)
**Strategic driver**: external market test. The internal evaluation
framework handled Phases 1–11; Phase 12 is judged by African market
position, not internal scoring.

## Summary

Installed the repository outputs required to convert the engine from
"world-class agency" to "recognised continental standard for premium
African web practice." Six workstreams shipped as repository
infrastructure; four workstreams have operational outcomes that
depend on real clients, real operators, real publishing, and real
conference engagements and are therefore tracked on the public
roadmap as in-flight.

Six workstreams:

1. **Africa Excellence Layer.** New `africa-excellence/` skill with
   six references (low-bandwidth patterns, mobile-money UX,
   USSD-aware design, African language pack, Africa trust signals,
   cultural patterns).
2. **Open-source benchmark library.** Public roadmap commits to at
   least three sites covering different sectors and countries;
   infrastructure for their publication (licensing matrix, public
   scorecard, and index location) is in place. The sites themselves
   are built in client-project repositories; that is operational.
3. **Case-study corpus and public scorecard.**
   `dashboards/public-scorecard.md` template with quarterly-
   regeneration contract; case-study corpus is an ongoing
   operational output.
4. **Operator certification network.** Certification materials from
   Phase 11 become public under CC BY-NC 4.0; network growth is
   operational.
5. **Knowledge commons and upstream contribution.** Licensing matrix
   and LICENSE file; public roadmap commits to one upstream OSS
   contribution per year and one research note per year.
6. **Continental presence.** `they-ask-you-answer` updated with the
   quarterly publishing rhythm; conference presence is operational.

## Deliverables

### New skills
- `africa-excellence/SKILL.md` + 6 references:
  - `low-bandwidth-patterns.md`
  - `mobile-money-ux.md`
  - `ussd-aware-design.md`
  - `african-language-pack.md`
  - `africa-trust-signals.md`
  - `cultural-patterns.md`

### New public-facing files
- `dashboards/public-scorecard.md` — quarterly public quality record.
- `docs/licensing-matrix.md` — what is open, what is closed, and
  under which licence.
- `docs/roadmap-public.md` — the curated public roadmap.
- `LICENSE` — the four-licence repository license file.

### Updates to existing skills
- `agency-positioning/SKILL.md` — premium-positioning proof assets
  section references certification, public scorecard, benchmark
  library, case-study corpus, and design-quality rubric (updated in
  Phase 11; consistent with Phase 12 posture).
- `they-ask-you-answer/SKILL.md` — continental publishing rhythm
  section integrating quarterly cornerstone, benchmark release,
  community contribution, conference presence, and media
  relationships.

## Rationale

African studios buy from people they have read, seen speak, and seen
ship. Authority compounds when the standards are open and the work is
referenceable. Without published benchmarks, licensing clarity, and a
public scorecard, the agency competes on price with every freelancer
in the LinkedIn search.

The licensing choices are deliberate:

- **CC BY 4.0** for skills and references — the floor is public
  because the floor is the point.
- **CC BY-SA 4.0** for plan documents — the strategic roadmap should
  stay open when forked.
- **CC BY-NC 4.0** for certification — reuse is fine; running a
  competing certification on our exam bank is not.
- **Proprietary** for agency-positioning — the business layer
  remains competitive posture.
- **MIT** for code — standard permissive; copy freely.

The Africa Excellence Layer codifies what the engine's global defaults
imply but had not yet named. The references are the operational spec
for running the engine in African markets; nothing in the rubric,
performance gate, or page-builder work contradicts them.

## Risks accepted

- **Benchmark library is a commitment, not a shipped asset.** Three
  open-source reference sites require real client-project
  repositories. The licensing and publishing infrastructure is in
  place; the sites will ship as client engagements permit.
- **Case-study corpus is ongoing.** Eight case studies with
  measurable outcomes require client work to have completed with
  measurable outcomes. The template, scoring rubric, and public-
  scorecard integration are in place.
- **Conference and media outreach is operational.** The
  they-ask-you-answer skill now references the rhythm; execution is
  the agency founder's calendar discipline.
- **Public scorecard generation is pending.** Same dependency as
  Phase 11's internal scorecard — the generation script activates
  once the first live-telemetry client is instrumented.

## Follow-ups

- First open-source benchmark site: target a Ugandan SME services
  site as the first reference implementation.
- First public scorecard regeneration: end of the next full quarter
  after the first retainer client has 30 days of live telemetry.
- First upstream OSS contribution: select a project (Astro, Tailwind,
  axe-core, Playwright, Lighthouse CI, GrowthBook, Sharp); open a
  substantive PR within 12 months.
- First research note: topic candidate — "LCP budgets on real African
  3G: what the engine measured across X retainer projects."
- First conference talk or hosted workshop: target DevFest 2026 or
  DroidConKE 2026; application window opens mid-year.

## Cross-reference

- Plan: `docs/plans/website-agency-engine/phase-12-african-authority-engine.md`
- Phase 11 decision: `2026-04-16-phase-11-world-class-operating-discipline.md`
- Phase 10 decision: `2026-04-16-phase-10-hard-enforcement-gates.md`
- Public roadmap: `docs/roadmap-public.md`
- Public scorecard: `dashboards/public-scorecard.md`
- Licensing: `docs/licensing-matrix.md`, `LICENSE`
