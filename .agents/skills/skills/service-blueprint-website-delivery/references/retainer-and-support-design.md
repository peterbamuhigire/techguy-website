# Retainer and Support Design

Premium retainers are not "block of hours sold cheap". They are a service product priced on outcome.

## Retainer archetypes

- Hosting + monitoring only: pure technical SLA. Lowest tier. Should not be sold without a separate strategy retainer if conversion KPI matters.
- Maintenance + content: technical SLA plus content cadence. Right for content-led businesses that already know what to publish.
- Improvement retainer: monthly experiments tied to KPI plus content plus technical SLA. Right for sites where conversion or retention is the goal.
- Strategic partner retainer: improvement plus quarterly business review, sector research, executive-level reporting. Right for clients where the website is mission-critical.

Price each tier so it stands alone. Do not let the lowest tier eat improvement work.

## Hours model

- Estimate hours per archetype per month from prior projects, with a 20% contingency for triage.
- Track hours weekly. Anomalies surface before invoice surprises.
- Cap roll-over to one month. Indefinite roll-over breaks capacity planning.

## Scope rules

- List included activities and exclusions in plain language.
- Define what counts as a "minor change" vs a "feature". Use the change-request gate.
- State the response and turnaround SLA per request type.
- Name what triggers an out-of-scope conversation: project-shaped work, third-party integration, brand redesign, multilingual expansion, ecommerce.

## Change-request gate

Every request runs through three questions:

1. Is it inside the retainer scope as written?
2. If yes, what does it cost in hours, and what work moves to make room?
3. If no, what is the smallest separate scope that delivers it without disrupting the retainer plan?

Approval requires written confirmation. No verbal approvals on scope changes.

## Reporting cadence

- Weekly: ticket status, anomalies.
- Monthly: hours used, changes shipped, KPI movement, experiment results, content shipped, risks, next month's plan. Hand to `monthly-report` skill.
- Quarterly: business review with the decision maker — KPI vs target, what worked, what to invest more in, what to stop.

## Renewal logic

- Renew at current price only if KPI moved at or above target.
- Renew at higher price if scope expanded (more pages, languages, integrations, content volume).
- Walk away early if the client repeatedly violates the change-request gate or the operating rhythm. Hand-off cleanly via `agency-client-retention` exit playbook.

## Profitability gate

Before signing a retainer:

- Estimate fully loaded cost of expected hours (including overhead and risk buffer).
- Multiply by the agency's target margin.
- That is the floor price. Sign at or above; never below.

A retainer sold below the floor turns into resentment within three months.
