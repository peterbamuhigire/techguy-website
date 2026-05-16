# Public Quality Scorecard

**Status**: Generated artefact — regenerated quarterly from live client
telemetry and CI gate history.
**Audience**: Prospects, operators, partners, the African web community.
**Cadence**: Published on the last Friday of each quarter.
**Source of truth**: the internal scorecard at
`dashboards/quality-scorecard.md` plus the quarterly experimentation
cross-client review.

## Framing

This page is the public version of the agency's quality evidence. It
is honest: a regressed client is listed; a missed experiment quarter is
named. The claim is "we ship at this standard"; the evidence is the
numbers below.

If the numbers ever look perfect, they are wrong. A real portfolio of
live sites has some amber and some red per quarter. The point is that
the floor has been defined, the gates enforce it, and the engine
improves — not that everything is always green.

## How this is generated

1. A quarterly job reads the internal scorecard, the cross-client
   experimentation review, and the CI gate history.
2. It aggregates: per-metric distributions, pass rates, experimentation
   outcomes, certified-operator counts, benchmark-site status.
3. It rewrites this file between the markers
   `<!-- PUBLIC-SCORECARD:BEGIN -->` and `<!-- PUBLIC-SCORECARD:END -->`.
4. Everything outside the markers is human-authored framing.

Failed generation is an incident: the file carries a `STALE` marker
and the following quarter's roll-forward explains why.

## Methodology

- **Scope.** Every active client site on the engine is included,
  anonymised where client confidentiality requires.
- **LCP / INP / CLS.** 75th-percentile over the most recent 30 days,
  aggregated across the portfolio.
- **Gate pass rate.** Percentage of CI runs across all client repos
  that passed every blocking gate.
- **Design-quality score.** Mean rubric score across primary templates
  scored in the quarter.
- **Uptime.** 30-day rolling mean across the portfolio.
- **Experiments.** Count of experiments decided in the quarter with
  the decision ratio (ship / kill / iterate).
- **Certification.** Count of currently-certified operators by track.

## Honesty rules

- **No curation.** A weak number appears; the remediation does not
  hide it.
- **No "we don't count that".** If the scope excludes something, the
  file names the exclusion.
- **Suppressed alerts are listed.** A suppression is a public item.
- **Retired projects are listed for one quarter post-retirement** so
  the portfolio history stays honest.

<!-- PUBLIC-SCORECARD:BEGIN -->
## Portfolio snapshot (auto-generated)

_This block is rewritten by the generation job each quarter. The
placeholder table below documents the schema; the first Phase 12
regeneration replaces it with real data._

### Performance distribution (portfolio p75)

| Metric | Median | 25th pct | 75th pct | Target |
|---|---|---|---|---|
| LCP | — | — | — | ≤ 2.5 s |
| INP | — | — | — | ≤ 200 ms |
| CLS | — | — | — | ≤ 0.1 |

### Gate pass rate (quarterly)

| Gate | Pass % |
|---|---|
| Performance | — |
| Accessibility | — |
| Visual QA | — |
| Security | — |
| Drift check | — |
| Design-quality score | — |

### Uptime

- Portfolio 30-day rolling uptime: _—_

### Design quality

- Portfolio mean rubric score across primary templates: _—_ / 10.
- Minimum shipped: 8 / 10 per category (gate rule).

### Experimentation

- Retainer clients with an active experiment this quarter: _—_
- Tests decided this quarter: _—_
- Decision split: _—_ ship / _—_ kill / _—_ iterate.

### Certification

- Currently-certified operators by track:
  - Strategist: —
  - Designer / Builder: —
  - SEO + Content: —
  - QA + Launch: —
- Cohort 2026-01 status: _see `certification/cohort-2026-01.md`_

### Benchmark library

- Published benchmark sites: _—_
- Last audit: _—_
- Index: `dashboards/benchmarks-index.md` (Phase 12 follow-up)

### Suppressed alerts

_None._

### Retirements this quarter

_None._

<!-- PUBLIC-SCORECARD:END -->

## Reading this page as a prospect

- If the performance distribution includes clients in the amber band,
  the engine is real — it serves real African clients on real 3G
  networks. Perfection on fibre is irrelevant.
- If the design-quality mean is ≥ 8.5, the engine holds the floor it
  claims.
- If experimentation is active on at least 30% of retainer clients,
  the learning loop is real.
- If the certification roster exists and is > 0, the engine is not
  founder-dependent.

## Reading this page as an operator

- The gate pass-rate column is the credibility of the whole thing. A
  drop there is the first thing to fix.
- The suppressed-alerts list is a working queue, not a resolved set.

## Reading this page as a partner studio

- The benchmark library is the reference implementation.
- The certified-operator roster is the hiring or partnership pool.
- The licensing matrix at `docs/licensing-matrix.md` governs what is
  reusable.

## Archive

Previous quarterly regenerations are retained at
`dashboards/public-scorecard-<YYYY-Qn>.md`. The current file is always
the most recent.
