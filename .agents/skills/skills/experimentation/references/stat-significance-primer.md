# Statistical Significance — Operator Primer

**Read this when**: filling the hypothesis template's sections 4 and 10,
or when reviewing a test result before deciding.

**Purpose**: The minimum statistical literacy an engine operator needs
to run honest A/B tests. Not a substitute for the canonical reference —
Kohavi, Tang, and Xu's *Trustworthy Online Controlled Experiments* —
but enough that an operator can size a test, read a confidence interval,
and avoid the common failure modes.

## The vocabulary

- **Effect size** — how big the difference is between control and
  treatment, expressed absolutely (e.g. 2 percentage points) or
  relatively (e.g. +20% over control).
- **Statistical significance** — a statement about the probability that
  the observed effect happened by chance under the null hypothesis.
  Usually reported as a p-value or as a confidence interval.
- **Power** — the probability the test would detect a real effect of
  the size the team cares about. Standard: 80%.
- **Confidence level** — the probability that the true effect lies
  inside the reported confidence interval. Standard: 95%.
- **False positive** — concluding an effect exists when it does not.
  Standard cap: 5% (α = 0.05).
- **False negative** — concluding no effect exists when it does. Linked
  to power; a power of 80% means a 20% false-negative rate at the
  chosen effect size.

## Why p-values alone mislead

A p-value is "the probability of seeing data this extreme or more if
the null were true." It is **not** the probability that the treatment
works, and it does not communicate effect size.

Two tests can share `p = 0.04`:
- Test A: +0.5% lift, 95% CI [0.01%, 0.99%]. Real but small.
- Test B: +20% lift, 95% CI [0.5%, 39.5%]. Real but uncertain.

Always report both the effect size and the confidence interval. The
decision rule in the hypothesis template uses the CI, not the p-value.

## Sample size sizing

For a binary metric (conversion rate), the sample size each variant
needs is well-approximated by:

```
N ≈ (16 × p × (1 - p)) / d²
```

where:
- `p` is the baseline conversion rate (as a proportion, e.g. 0.03)
- `d` is the absolute minimum detectable effect (as a proportion, e.g.
  0.003 for 3%→3.3%)
- 16 is the multiplier for 95% confidence and 80% power

Example: baseline 3%, target +10% relative (absolute +0.3% → d = 0.003)

```
N ≈ (16 × 0.03 × 0.97) / 0.003² ≈ 51,733 per variant
```

At 1,000 events per week, that is 52 weeks per variant — too slow.
Options: raise the effect size the team will act on, combine variants,
or accept the project is not yet ready for formal A/B testing.

For continuous metrics (revenue per visitor), sizing depends on variance;
consult the platform's calculator. GrowthBook exposes a power curve.

## Confidence intervals

Report the 95% confidence interval around the lift. Interpretations:

- CI entirely above zero → treatment is a winner.
- CI entirely below zero → treatment is a loser.
- CI crossing zero → inconclusive; either ship the smaller set and re-
  test, or discard.

A wide CI around a large point estimate is less conclusive than a
narrow CI around a moderate one.

## Sequential testing and peeking

Classical A/B tests assume a single look at the data at the stopping
rule. Peeking multiple times inflates the false-positive rate. If a
team checks every day and stops the moment `p < 0.05`, the effective
false-positive rate can be > 25%.

Two valid approaches:

1. **Fixed-horizon test**. Decide the stopping rule in advance (the
   hypothesis template's section 7). Do not check p-values until the
   rule hits.
2. **Sequential testing**. Use a platform (GrowthBook, Statsig) that
   implements sequential methods (mixture Sequential Probability Ratio
   Test, Bayesian with always-valid intervals). These let you peek
   honestly at the cost of needing larger samples for the same power.

The engine's default is the fixed-horizon test. Any sequential design
is recorded in the hypothesis file's section 7.

## Guardrails

Every test has guardrails. They are evaluated with the same
significance framework but at a more conservative threshold (typically
`p < 0.01`) because we want to detect harm even at small effect sizes.

## Common failure modes

- **Underpowered test** — ran a test, got "not significant", shipped
  the losing variant because the team ran out of patience. The result
  was never conclusive in either direction.
- **Effect-size creep** — after the test starts, someone suggests the
  minimum detectable effect should be smaller because the observed
  lift is smaller. Changing the question after the test runs is
  unethical; run a new test.
- **Segment spelunking** — finding a winning segment post-hoc and
  declaring a win. Pre-register segments; do not invent them after
  seeing the data.
- **Novelty effect** — users respond to newness in week 1; the lift
  fades by week 4. Run at least one full week, ideally two.
- **Interaction effect** — another test running at the same time
  shares traffic. Coordinate the schedule; the platform should prevent
  overlap for the same audience.

## Reading a GrowthBook/Statsig result

A typical result card shows:

- Variant, sample, primary metric rate, lift, 95% CI, p-value.

Decision checklist:

1. Did the test run to the stopping rule? If no, stop.
2. Does the CI exclude zero at 95%? If no, inconclusive.
3. Are all guardrails healthy? If no, cannot ship.
4. Is the lift larger than the minimum detectable effect? If no, the
   test does not justify shipping even if significant.
5. Any known external event during the test window? If yes, consider
   whether to re-run.

## Bayesian vs frequentist

The engine does not require one over the other. Pick whichever your
platform supports well. The decision rule in the hypothesis file must
be consistent with the chosen framework.

## Canonical reading

- Kohavi, Tang, Xu — *Trustworthy Online Controlled Experiments* (2020).
- Chris Goward — *You Should Test That* (2012) for the practical CRO
  programme design.
- Ron Kohavi's online course notes (Stanford and Microsoft) for
  sequential testing depth.

## Minimum operator test

Before certifying, an operator must be able to:

- Compute a sample size from baseline and minimum detectable effect.
- Read a 95% CI and declare winner / loser / inconclusive.
- Identify peeking in an experiment file.
- Spot an under-powered test.
- Identify at least two guardrails for a given primary metric.
