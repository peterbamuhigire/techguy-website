---
name: website-experience-mapping
description: Map current and future-state customer experiences before sitemap and design, using alignment diagrams, customer journey maps, experience maps, and ecosystem maps. Translates outside-in research into page architecture, content priorities, conversion moments, and measurable touchpoints. Use before page-builder and design-system on every premium website that must change behaviour, not just describe a brand.
---

# Website Experience Mapping
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when

- A premium website must align stakeholders, content, navigation, and conversion architecture to a real outside-in customer experience.
- The brief is broad ("redesign", "modernize", "reposition") and risks becoming inside-out brochureware.
- Multiple buyer types, channels, devices, or sectors must be reconciled into one coherent site.
- Discovery surfaced friction, drop-off, or misalignment that the sitemap alone cannot fix.
- The agency must defend page count, content depth, or scope decisions during proposal or design review.

## Do not use when

- The work is a single landing page test where a hypothesis-led CRO experiment is faster.
- The team already has a validated, recent experience map and only needs implementation.
- The client cannot supply customer access or proxy research and refuses paid discovery.

## Required inputs

- Business goal, commercial KPI, and the behaviour the website must change.
- Available customer evidence: interviews, support tickets, sales calls, analytics, reviews, search terms.
- Stakeholder list across sales, support, operations, fulfilment, and leadership.
- Existing site structure, top entry pages, and known friction points.
- Constraints: locales, regulated content, accessibility, performance budget, CMS, integrations.

## Workflow

1. Frame the mapping effort. Pick one map type per goal: customer journey map for a discrete buyer flow; experience map for a broad cross-channel reality; service blueprint when backstage operations must change; ecosystem map when multiple actors and platforms intersect; mental-model diagram when the site must match how users actually think about the task.
2. Investigate. Combine internal interviews, customer interviews, analytics, search data, and review mining. Capture verbatim language, decision moments, emotions, and unmet needs.
3. Illustrate. Lay out lanes for stages, actions, thoughts, emotions, touchpoints, opportunities, and metrics. Mark moments of truth, drop-off, and trust gaps.
4. Hold an alignment workshop. Walk stakeholders through the current state, surface disagreements, agree on the future-state experience, and capture concrete commitments.
5. Translate the future-state map into website architecture: sitemap, page goals, content priorities, primary CTAs, proof placement, form fields, analytics events, and measurement plan.
6. Hand off to `page-builder`, `seo`, `content-writing`, `form-ux-design`, and `service-blueprint-website-delivery` with explicit input artifacts.
7. Schedule a review window after launch to update the map with real behaviour and feed `experimentation`.

## Quality standards

- Every page on the resulting sitemap maps to at least one customer stage, intent, and decision.
- Each "moment of truth" has a named page, content asset, proof element, and analytics event.
- Emotional low points are paired with explicit reassurance, evidence, or service-recovery copy on the page that addresses them.
- Backstage gaps that affect the website (slow quote, broken handoff, missing FAQ) are routed to `service-blueprint-website-delivery` rather than hidden in copy.
- The map names sources, sample sizes, and confidence so future stakeholders can challenge or update it.
- The future-state map states a measurable outcome per stage (lead quality, qualified call rate, time-to-value, retention).

## Anti-patterns

- Decorative journey maps with smiley faces and no decisions, evidence, or links to pages.
- Mapping the inside-out sales funnel and calling it a customer journey.
- Skipping employee experience and backstage operations, then blaming the website for poor conversion.
- Producing a map that nobody owns after the workshop.
- Using a single persona to justify a site that must serve multiple buyer types.

## Outputs

- One labelled experience artefact (CJM, experience map, ecosystem map, or service blueprint) with sources and dates.
- Future-state map with measurable outcomes per stage.
- Sitemap and page-goal table derived from the map.
- Conversion and proof placement plan: where each piece of evidence must appear.
- Analytics event plan tied to the map's moments of truth.
- Backlog of backstage and operations fixes routed to `service-blueprint-website-delivery`.

## References

- `references/mapping-method-selector.md` — choose the right map type for the brief.
- `references/discovery-interview-guide.md` — outside-in interview protocol and question bank.
- `references/map-to-sitemap-conversion.md` — turn a future-state map into pages, content, CTAs, and analytics.
- `references/alignment-workshop-runbook.md` — stakeholder workshop facilitation, decisions, and follow-up.
