---
name: experimentation
description: Canonical experimentation and CRO layer. Defines the hypothesis template, statistical-significance primer, A/B infrastructure contract, and quarterly review cadence that turn retainer work into a structured learning loop rather than opinion exchange. Every retainer client runs at least one test per quarter; every test has a documented hypothesis and a decision rule.
---

# Experimentation
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- A retainer client has a conversion, engagement, or retention question
  that cannot be answered by existing analytics alone.
- A strategist or SEO operator wants to test a hypothesis before rolling
  a change across a site.
- A client has shipped a major redesign and needs the "did it work"
  question answered with evidence, not opinion.

## Do not use when
- The team has not agreed on the metric. Run `ux-psychology` or
  `cro-audit` to shape the question first.
- The site has insufficient traffic. Under ~1,000 primary-CTA events
  per week, experimentation power is too low to beat noise; use
  qualitative methods instead.
- The change is a bug fix. Fixes ship without experimentation.

## Core contract

Every experiment honours five properties:

1. **Documented hypothesis** using `references/hypothesis-template.md`.
2. **Minimum detectable effect** computed before start, not after.
3. **Stopping rule** declared before the test begins — sample-size or
   calendar-date based.
4. **Guardrail metrics** named so a winner on the primary metric that
   harms a guardrail still loses.
5. **Decision rule** written before the test — how the operator decides
   to ship, kill, or iterate regardless of result.

A test without these five is not an experiment; it is opinion with
numbers attached.

## Workflow

1. **Form the hypothesis** using the template. Record in
   `project-log/experiments/<test-slug>.md` in the client project.
2. **Size the test.** Use the sample-size calculator in the
   stat-significance primer; pick a minimum detectable effect the team
   would actually ship on.
3. **Choose variant scope.** One variable per test unless the
   infrastructure supports a factorial design and the traffic supports
   it.
4. **Implement the variants.** Default platform: GrowthBook. Assignment
   is deterministic per visitor.
5. **Instrument.** Every variant fires an assignment event into the
   analytics stack; outcomes fire the same event names as production.
6. **Pre-flight.** Confirm on staging that assignment is balanced and
   outcome events fire.
7. **Run to the stopping rule.** No peeking; no pausing the winner
   early unless a guardrail breaches.
8. **Analyse.** Significance test from the primer; report confidence
   intervals, not only p-values.
9. **Decide.** Ship, kill, iterate. Log the decision and its rationale.
10. **Share.** The result goes into the client's monthly report and the
    agency's quarterly experimentation review.

## Required inputs

- A retainer client with weekly primary-metric volume sufficient to
  power the test (generally ≥ 1,000 events/week on the primary metric).
- An agreed primary metric and guardrail metrics.
- Experimentation platform (default GrowthBook) provisioned on the
  client project.
- Analytics event map already in place.

## Quality standards

- Every experiment has a hypothesis file filed before code merges.
- Power and sample-size calculations are present and match the traffic
  reality on the site.
- Primary metric is a real business metric (conversion, revenue, sign-up,
  qualified lead), not a proxy like dwell time unless explicitly
  approved.
- Tests do not fork the site indefinitely; losers are removed within 14
  days of decision.
- Quarterly review runs whether or not there are winners.

## Anti-patterns

- Running a test to "see what happens." That is not experimentation; it
  is page-level gambling.
- A/B testing the homepage hero every quarter without learning
  anything durable. Each test should end in a documented belief update.
- Treating a 5% lift on a sample of 200 as a win. Check the primer.
- Ignoring seasonality. A test over a holiday week in one market is not
  transferable to another.
- Shipping the winner without instrumentation. Every ship becomes a
  new baseline that later tests must respect.

## Outputs

- `project-log/experiments/<test-slug>.md` per test, containing the
  hypothesis, setup, results, and decision.
- A quarterly review file at `project-log/experiments/review-<YYYY-Qn>.md`
  per client, summarising wins, losses, and learning.
- Aggregate learning notes consolidated into `seo`, `page-builder`, and
  `content-writing` references when a pattern repeats across clients.
- A row in `dashboards/quality-scorecard.md` indicating whether the
  client has an active experiment.

## References

- `references/hypothesis-template.md` — the required template for every
  test.
- `references/stat-significance-primer.md` — p-values, confidence
  intervals, sample sizing, sequential testing, peeking.
- `references/ab-infrastructure.md` — GrowthBook default setup; Statsig
  and PostHog alternatives.
- `references/experiment-logbook-template.md` — the per-test log
  structure.
- `references/quarterly-review-template.md` — the per-client quarterly
  review.

## Notes

- This skill does not set the metric; `agency-positioning`,
  `brand-strategy`, and `ecommerce-analytics` each own metric
  definition for their domain.
- A/B platform choice is a decision entry; GrowthBook is the default
  for open-source posture, cost, and African-bandwidth friendliness.
- The `monthly-report` skill surfaces the experiment's decision and
  evidence line to the client; it does not re-run the analysis.

