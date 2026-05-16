# Premium Discovery Protocol

A paid, time-boxed discovery that produces an experience map, a content architecture, an evidence pack, and a credible price floor. Run this when a brief is ambitious, ambiguous, or expensive.

## Why paid

Free discovery is a tax the agency pays every month. Paid discovery:

- Tests buyer commitment before any large commitment is asked.
- Lets the agency invest at premium quality (interviews, research, instrumentation).
- Produces an asset the client owns even if they do not proceed.
- Anchors the eventual price floor in evidence, not in a guess.

## When to require paid discovery

- The brief is broad ("redesign", "modernize", "reposition") with no validated outcome.
- Multiple buyer types or sectors must be reconciled.
- The client has been burned before and is testing the agency's process.
- The brief sits above the agency's standard fee floor and the buyer has not chosen the agency yet.

## When discovery is included instead

- Long-term retainer client with established trust.
- Repeat sector for the agency where most assumptions are pre-validated.
- Engagement scoped at a tier where bundled discovery is part of the standard offer.

## Inputs

- Initial sales conversation outputs from `premium-sales-conversation`.
- Access to customers (interviews) and stakeholders (workshops).
- Existing analytics, sales data, support data, and content inventory.
- Brand assets, technical inventory, and constraints.

## Discovery activities

- Hypothesis register. Write down what the agency and client believe today, with confidence ratings.
- Customer interviews. Five to seven per buyer type. Use `discovery-interview-guide.md` from `website-experience-mapping`.
- Stakeholder interviews. One per function: sales, support, operations, marketing, leadership.
- Analytics audit. Where is current traffic coming from, where does it go, where does it die.
- Content inventory. Pages, performance, freshness, ownership.
- SEO and intent landscape. What buyers actually search; what the site ranks for; what competitors own.
- Sector and competitor scan. What is the standard of proof in this category; what is the gap to close.

## Discovery deliverables

- Future-state experience map (one or more, depending on buyer types).
- Content architecture with page goals and proof requirements.
- Conversion architecture with primary CTA per page and analytics events.
- Technical and operational findings.
- Evidence pack: facts, quotes, numbers, sources.
- Price floor and scope recommendation for the build phase.
- Validation status: which decisions are evidence-supported and which remain hypotheses.

## Validation thresholds

- Each major decision in the discovery report is tagged High / Medium / Low confidence.
- High requires multiple consistent sources.
- Medium requires triangulation between two sources.
- Low requires explicit experiment or further research before build commits to it.

The client signs the build phase only on High and Medium decisions. Low decisions become experiments, not assumed facts.

## Walk-away rules

The agency walks away with a clean handover when:

- The discovery shows the brief cannot meet a premium standard at any reasonable budget.
- The client refuses to act on key findings (e.g. content investment, operational change).
- The fit score from sales has not improved during discovery.

Walking away after paid discovery is a clean ending. The client owns a useful asset; the agency keeps its standard.

## Hand-off into build

When discovery proceeds to build, hand:

- Future-state experience map → `website-experience-mapping`.
- Content architecture → `content-writing`, `seo`, `page-builder`.
- Conversion architecture → `cro-audit`, `form-ux-design`, `ecommerce-checkout`.
- Operational backlog → `service-blueprint-website-delivery`.
- KPI tree and measurement plan → `marketing-measurement-system`.
- Sales and pricing context → `agency-positioning`, `premium-sales-conversation`.
