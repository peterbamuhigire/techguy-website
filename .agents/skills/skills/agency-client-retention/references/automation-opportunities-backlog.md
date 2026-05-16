# Automation Opportunities Backlog

A prioritised inventory of where the agency should automate internal
repetitive work to expand margin and consistency — and where it must NOT
automate, because the human judgement is the product.

The principle: **automation is for margin expansion and consistency, not for
its own sake.** Per the Phase 8 plan, "automating client-facing work before
the process itself is stable" is an explicit risk to avoid.

This file pairs with `hybrid-agency-operating-model.md` (the operating model
the automation supports), `retainer-package-catalog.md` (where automation
shows up in delivery), and `okrs-and-client-reporting.md` (the reporting
layer that benefits most from automation).

---

## The automation principle

Three rules govern every automation decision at the agency.

### Rule 1 — Stabilise before you automate

Roetzer's warning: don't automate a process that is still changing.
Documentation precedes automation. If the process isn't written down in a
SKILL.md or a checklist that someone could execute manually, it isn't ready
to be automated.

### Rule 2 — Automate the work, not the relationship

The agency's commercial moat is senior judgement applied to specific
client situations. Anything that touches that judgement layer is *never*
automated:

- The strategy conversation.
- The recommendation in a monthly report.
- The discovery call.
- The expansion proposal.
- The case study writing.
- The retention conversation when a client is at risk.

What is automated: the assembly, the data fetching, the formatting, the
boilerplate, the file organisation, the QA scans. The leverage is in
freeing senior time *for* judgement work, not in replacing it.

### Rule 3 — Automate when manual work crosses 4 hours/week

A useful threshold. Below 4 hours/week of recurring manual work, automation
costs more in tooling and maintenance than it saves. Above that threshold,
the math flips.

A junior team member doing 6 hours/week of report formatting is the
canonical case for automation. A senior strategist doing 3 hours/week of
strategy commentary is not.

---

## The automation backlog (prioritised)

Each backlog item carries:

- **Domain** — what work area it's in.
- **Manual cost** — hours/week currently spent.
- **Automation effort** — tier 1 (no-code in 1 day), 2 (no-code in 1 week),
  3 (custom build, 1+ months).
- **Margin impact** — high / medium / low.
- **Risk** — what could go wrong if automated badly.
- **Status** — proposed / piloted / live / declined.

The 9 highest-leverage items, in order:

### 1. Project setup automation

**Domain.** New engagement kickoff (every Foundation/Growth/Authority
build).
**Manual cost.** 4–6 hours per project setup. At 12 builds/year = 60+ hours.
**Automation effort.** Tier 2 — no-code with project-template tools
(Notion templates, ClickUp templates, GitHub repo templates).
**Margin impact.** Medium-high.
**Risk.** Low (templates are easily versioned).

What to automate:

- Create new project workspace from template (Notion/ClickUp).
- Create new git repo from `.claude/skills/` submodule template.
- Provision dev/staging environments.
- Create client folder structure for assets, contracts, invoices.
- Generate kickoff email to client with onboarding pack.
- Create shared Slack channel; invite client contacts.
- Generate kickoff calendar invite series (weeks 1, 2, 4, 6, 8, launch).
- Provision time-tracking project codes.
- Pre-populate `project-log/` directory with kickoff entry.

What to leave manual:

- The kickoff strategy session itself.
- The handover meeting on day 1.
- Any decisions about scope or schedule.

### 2. Asset organisation automation

**Domain.** Photo/asset processing during build (per `photo-manager/`
skill).
**Manual cost.** 3–4 hours per build for a 50-photo set.
**Automation effort.** Tier 1–2. Already partially automated via
`image-compression` skill (Sharp pipeline). Extend.
**Margin impact.** High (compounds across every build).
**Risk.** Low (deterministic).

What to automate:

- Bulk image compression to 500KB target.
- Auto-rename files by descriptive metadata (sector + subject).
- Auto-generate `_catalog.json` with dimensions, format, suggested
  placement category.
- Auto-detect logo files; pick best variant.
- Auto-generate placeholder thumbnails for previews.
- Auto-resize OG images to required dimensions (1200×630).

What to leave manual:

- Curating which photos to use.
- Cropping decisions for hero images.
- Approving photos for accessibility (alt text remains human-written).

### 3. QA checks (build pre-launch)

**Domain.** Pre-launch build checklist (40+ items per
`agency-positioning/references/proof-library.md`).
**Manual cost.** 6–8 hours per launch.
**Automation effort.** Tier 2.
**Margin impact.** High.
**Risk.** Medium (false negatives could let a real issue slip through).

What to automate:

- Lighthouse + Core Web Vitals scan with pass/fail thresholds.
- Broken-link crawl.
- Schema validity check (all schema types pass Google's validator).
- Accessibility scan (WCAG 2.1 AA, axe-core or Pa11y).
- Multi-language hreflang validation.
- Image alt-text presence check (presence, not quality).
- Form submission test on every form (synthetic submission).
- Sitemap validity + Search Console submission.
- Uptime monitor activation.
- Backup verification.

What to leave manual:

- Visual QA on key pages (the eye check).
- Content proofreading.
- Real-device testing for the top 5 pages.
- The launch-day handover conversation.

### 4. Reporting preparation

**Domain.** Monthly client reports (per `monthly-report-template.md`).
**Manual cost.** 4–6 hours per client per month. At 20 retainer clients =
80–120 hours/month.
**Automation effort.** Tier 2.
**Margin impact.** Very high.
**Risk.** Medium (data needs validation; bad data → bad recommendations).

What to automate:

- GA4 data fetch into report template.
- Search Console position fetch for tracked keyword set.
- CRM lead-source data fetch.
- Looker Studio dashboard refresh.
- Auto-population of data tables in the report template.
- Delta calculation (vs prior month, vs same month last year).
- OG image generation for the report PDF cover.
- PDF rendering and email assembly.

What to leave manual:

- The "What this means" commentary on every section.
- The "What we recommend" section.
- The "What we changed" section (sourced from `project-log/`).
- The strategic framing.
- The send (a human reads the final report before it goes).

The contract is strict: per Session 11 in MEMORY.md, no `project-log/`
entry → no report. Automation does not bypass this rule.

### 5. Proposal assembly

**Domain.** Proposals for engagements and expansion offers (per
`agency-positioning/references/premium-proposal-template.md` and
`expansion-offers-matrix.md`).
**Manual cost.** 4–8 hours per proposal. At 30 proposals/year = 120–240
hours.
**Automation effort.** Tier 2.
**Margin impact.** Medium-high.
**Risk.** Medium (a templated proposal that doesn't match the prospect
reads as boilerplate).

What to automate:

- Pull relevant case excerpts from `proof/` (per `proof-library.md`).
- Pull testimonials matched by sector and tier.
- Pull metrics matched by sector.
- Pull the right proposal template (Foundation/Growth/Authority).
- Pre-populate prospect name, sector, contact details from CRM.
- Generate base scope from the relevant tier in `scope-matrix.md`.
- Render PDF.

What to leave manual:

- The Snapshot section (the commercial diagnosis specific to this
  prospect).
- The Discovery section (the strategic frame).
- The Activity Center (the specific recommendation, not a generic list).
- The Why Us paragraph (matched to the specific prospect).
- The signature step.

The proposal template provides 70% of the document. The remaining 30%
must always be written, never templated.

### 6. Documentation generation

**Domain.** Client handover documentation, design system docs, technical
runbooks.
**Manual cost.** 6–10 hours per build.
**Automation effort.** Tier 2.
**Margin impact.** Medium.
**Risk.** Low.

What to automate:

- Generate post-launch client documentation pack from project log + repo
  README + CMS structure.
- Generate design system tokens documentation from `tailwind.config.mjs`.
- Generate component inventory from `src/components/` directory.
- Generate sitemap document from page structure.
- Generate access credentials handover (template populated from password
  manager export).
- Generate technical runbook from project README + deployment pipeline.

What to leave manual:

- The strategic narrative in the handover.
- The "what to watch for" recommendations.
- Walk-through video recording.

### 7. Time tracking and capacity reporting

**Domain.** Internal capacity management (per `hybrid-agency-operating-
model.md`).
**Manual cost.** 2 hours/week for the founder, 30 min/week per team
member.
**Automation effort.** Tier 1 (off-the-shelf tooling: Harvest, Toggl,
Everhour, ClickUp Time).
**Margin impact.** Medium (informs pricing and hiring decisions).
**Risk.** Low.

What to automate:

- Auto-track time against project codes via integration.
- Weekly capacity reports per team member.
- Forecasted vs actual hours per project.
- RER calculation per project.
- Capacity utilisation alerts (>120% absolute capacity for 3+ weeks).
- Hiring trigger alerts.

What to leave manual:

- The decision to hire.
- The decision to re-scope an over-budget project.
- The conversation with a team member who is consistently over capacity.

### 8. Inbound lead intake and qualification

**Domain.** Lead-flow handling from authority content + Dream 100 work.
**Manual cost.** 2–3 hours/week of triage.
**Automation effort.** Tier 1–2.
**Margin impact.** Low-medium.
**Risk.** Medium (an auto-replied warm lead can feel cold).

What to automate:

- Calendly link delivery on form submission.
- CRM record creation with first-touch URL captured.
- Auto-assignment to founder.
- 5-part Soap Opera onboarding sequence (per
  `they-ask-you-answer/references/agency-content-plan.md`).
- Lead scoring against MAD-R criteria using stated answers.
- Auto-deferral to nurture for prospects below the floor.

What to leave manual:

- The first reply to a qualified lead. Always personal, always within 4
  business hours.
- The discovery call.
- The disqualification conversation when a lead is wrong-fit.

### 9. Retainer health monitoring

**Domain.** Early-warning churn detection (per `post-launch-review-
cadence.md`).
**Manual cost.** 1 hour/week to manually scan signals across 20 retainers.
**Automation effort.** Tier 2.
**Margin impact.** Very high (preventing one churn pays back years).
**Risk.** Low (alerts trigger human action; humans decide).

What to automate:

- Alert if monthly call is skipped or postponed twice.
- Alert if monthly report has been sent but not opened within 5 business
  days.
- Alert if traffic drops > 25% month-over-month.
- Alert if conversion drops > 30%.
- Alert if SME interview slot is missed (Content retainers).
- Alert if invoice is > 14 days overdue.
- Alert on internal restructure signals (LinkedIn changes at the client
  org).

What to leave manual:

- The recovery action.
- The phone call.
- The decision to fire a problem retainer.

---

## Items that are NOT in the backlog (and never will be)

These are the candidates we deliberately refuse to automate. Listed here
so the team has a permanent reference and the temptation does not return.

### Strategic recommendations

The "What we recommend" section of every monthly report. The expansion
recommendation at every quarterly review. The strategic frame at every
annual review. These are senior judgement applied to specific data — the
core of what the client is paying for.

### Case study writing

Per `agency-positioning/references/case-study-template.md`. The 7-part
case study structure is rigorous, but the strategic-frame paragraph and
the outcome commentary are written, not assembled. AI-assisted drafting
is permitted; AI-generated case studies are not.

### Discovery calls

The first 30 minutes with a new prospect is the highest-leverage hour the
agency runs. Never delegated, never automated, never templated.

### Sales-call follow-ups

The Friday sales pipeline pass (per
`they-ask-you-answer/references/editorial-calendar-and-rhythm.md`). Each
follow-up touch is personal and specific. Marketing-automation drip
sequences for cold-leads are fine; for active-pipeline prospects, no.

### Authority content writing

Per Sheridan's "in-house media company" rule. Cornerstone articles,
weekly anchors, and signature talks are written by the senior team using
SME interviews. Drafting tools assist; they do not author.

### Discovery and qualification of new sectors

When the agency considers entering a new sector, the analysis is human.
Off-the-shelf market research is input; the decision is judgement.

### Feedback in CFR conversations

Per `okrs-and-client-reporting.md` Part 3. Every piece of team feedback
is given in person or in a threaded message, not scheduled by software.

### Annual reviews

The 120-minute annual renewal-and-expansion review is the most-watched
client conversation of the year. No template, no automation, no
delegation.

---

## Implementation discipline

### Stable before automated

Before any item in the backlog is built into automation, the manual
process must be:

- Documented in writing (a SKILL.md, a checklist, a runbook).
- Executed manually for at least 3 consecutive cycles (months/projects/
  reviews).
- Stable enough that the documentation hasn't been edited in 30 days.

If any of those three conditions fail, the automation work is premature.

### One automation at a time

The team works on one automation backlog item at a time. Two parallel
automations split attention; neither lands.

### Pilot before full deployment

Every new automation runs in pilot mode for 4 weeks against a single
client or project before being rolled out across the book. Pilot
includes: parallel manual execution to verify the automated output;
weekly review of edge cases; explicit decision to graduate or extend
pilot.

### Maintenance ownership

Every automation has a named owner who maintains it. When the underlying
tool, API, or process changes, the owner adapts the automation. An
unmaintained automation fails silently and quietly destroys margin.

### Removal discipline

Any automation that has not been used in 90 days is removed. Tooling
graveyards (old Zaps, abandoned scripts, broken integrations) drain
attention and confuse new hires.

---

## The current state, year by year

A realistic implementation arc for a 5-person agency:

### Year 1
- Automate items 2 (asset organisation) and 4 (reporting preparation,
  data-fetch only).
- Stabilise the rest manually.

### Year 2
- Automate items 1 (project setup), 3 (QA checks), 7 (time tracking).
- Pilot item 5 (proposal assembly).

### Year 3
- Automate item 5 (proposal assembly) fully.
- Pilot items 6 (documentation generation) and 9 (retainer health
  monitoring).

### Year 4+
- All 9 items live and maintained.
- Begin evaluating second-order opportunities (multilingual workflow
  automation, CRO experiment scheduling, SME interview transcription).

The pace is deliberate. A 5-person agency that tries to automate all 9
items in year 1 burns 3 months of senior time on tooling, ships none of
it well, and degrades client experience in the meantime.

---

## Anti-patterns

- **Automating before documenting.** The automation captures the wrong
  process and entrenches it.
- **Automating to avoid hiring.** Automation enables a smaller team to
  serve more clients well, but cannot substitute for the senior judgement
  layer. Hire when capacity math demands it.
- **Automating client-facing copy.** Even good AI-generated copy reads
  generic to a sophisticated buyer. The agency's voice is the moat.
- **Tooling sprawl.** Five overlapping tools each doing 30% of a job is
  worse than one tool doing 60%. Audit tooling annually; consolidate.
- **Black-box automations.** The team must be able to explain what the
  automation does, where, and why. "It just works" is dangerous.
- **Skipping the pilot.** Going from manual to deployed across all
  clients without a 4-week pilot guarantees an embarrassing client
  incident.
- **No removal discipline.** Half-built or abandoned automations sap
  attention and create technical debt.

---

## How to add to this backlog

When a team member identifies a new automation opportunity:

1. Document the manual process first. If undocumented, no proposal yet.
2. Measure the manual cost honestly (hours/week, frequency, occasions
   per year).
3. Estimate the automation effort.
4. Estimate the risk and what could go wrong.
5. Submit as a proposal in the next monthly retrospective.
6. Decision is made by the founder + senior strategist.
7. Approved items enter the backlog at the right priority position.

Items below the 4-hour/week threshold are declined.
