# Hypothesis Template

**Read this when**: opening a new experiment file.

**Purpose**: A test without a documented hypothesis is opinion with
numbers attached. This template is the filled-out form every experiment
carries at `project-log/experiments/<test-slug>.md`.

## Template

Copy this into the experiment file and fill it in **before** writing
code. If the team cannot fill a field, the test is not ready.

```markdown
# Experiment — <short name>

**Slug**: <test-slug>
**Client**: <client-slug>
**Filed**: YYYY-MM-DD
**Owner**: <name>
**Status**: Draft | Running | Decided | Retired

## 1. Audience and segment

- Who is being tested (e.g. all visitors, new visitors only, mobile
  visitors, visitors from paid channels, specific country).
- Any explicit exclusions (authenticated users, bot traffic).
- Traffic volume the segment sees per week.

## 2. Current behaviour and baseline

- Primary metric baseline over the last 28 days: <number>.
- How the metric is measured: <event name, dashboard link>.
- Known fluctuations (weekday seasonality, paid-spend pulses).

## 3. Hypothesis statement

Written in the form:

> We believe **<change>** will cause **<effect on metric>** for
> **<audience>** because **<reason>**, measured by **<metric over
> window>**.

Example:

> We believe replacing the hero image with a named-founder photograph
> will cause primary-CTA click-through to rise by at least 10% for new
> mobile visitors from organic search because social-proof cues are
> stronger than product imagery at this stage of trust, measured by
> `primary_cta_click` / unique sessions over 14 days.

Rules:
- One variable per test unless an agreed factorial design.
- The reason must be derivable from a user-research, cognitive, or
  conversion-framework source, not from taste.
- The metric window ends at the stopping rule, not "until we feel
  good".

## 4. Success metric and minimum detectable effect

- Primary metric: <metric>.
- Baseline rate: <rate>.
- Minimum detectable effect (absolute or relative): <effect>.
- Required sample size (each variant): <N> (computed from the primer).
- Expected duration at current traffic: <days>.

## 5. Guardrail metrics

Metrics that, if harmed, disqualify a winner on the primary metric.
Typical guardrails:

- Bounce rate (upper bound)
- Time-to-first-interaction (upper bound)
- Accessibility / error-rate regressions (any increase)
- Secondary conversion paths (lower bound)

Each guardrail has a concrete threshold:

- <guardrail> must not worsen by more than <delta>.

## 6. Variants

- **Control (A)**: <description>; ~50% traffic.
- **Treatment (B)**: <description>; ~50% traffic.
- Assignment: deterministic per visitor via GrowthBook (or alternative).

## 7. Stopping rule

One of:

- **Sample-size rule**: stop when each variant has reached N = <N>
  sessions.
- **Calendar rule**: stop at <date>, whichever is later, to span at
  least one full week of traffic.

Peeking is not a stopping rule.

## 8. Decision rule

Written before the test runs. Fill three cases:

- **Ship treatment** if: <condition>.
- **Kill treatment** if: <condition>.
- **Iterate** if: <condition>.

Example:
- Ship treatment if primary metric lifts ≥ 10% with 95% CI not crossing
  zero, and no guardrail breaches.
- Kill treatment if primary metric falls or any guardrail breach.
- Iterate if primary metric lifts < 10% but the direction is positive
  and qualitative evidence supports a further test.

## 9. Risks and ethical considerations

- Any risk of misrepresenting the brand.
- Any risk of leaking PII in a variant.
- Any accessibility regression introduced by the treatment.
- Any legal concern (disclosure rules, pricing, offers).

If risks are material, the test requires approval from the programme
lead before running.

## 10. Results

*Filled after stopping rule hits.*

- Actual sample size per variant: <N_A>, <N_B>.
- Primary metric per variant: <rate_A>, <rate_B>.
- Lift: <absolute>, <relative>, 95% CI: [<low>, <high>].
- Guardrail outcomes: <table>.
- Statistical decision: significant / not significant / inconclusive.

## 11. Decision and rationale

*Filled at decision time.*

- Decision: ship / kill / iterate.
- Rationale (2–4 sentences):
- Follow-up test (if iterate):
- Learning captured into skills:
- Link to the month's monthly-report entry:
```

## Filing rules

- The file is created in the client project at
  `project-log/experiments/<test-slug>.md`.
- Sections 1–9 are filled before merging any test code.
- Sections 10–11 are filled within 7 days of stopping.
- Retired tests remain in the log; they do not get deleted.

## Cross-reference

- `stat-significance-primer.md` — to fill section 4 and section 10.
- `ab-infrastructure.md` — to implement section 6.
- `quarterly-review-template.md` — where tests roll up.
