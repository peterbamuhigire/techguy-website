# Per-Template Design-Quality Report Template

**Read this when**: filing a design-quality score for a primary template.

**Purpose**: Standard format for `reports/design-quality/<template>.md`
in a client project. The `scripts/design-quality-score.sh` script reads
these files to compute the pipeline's step-12 outcome.

## Template

Copy into the project's `reports/design-quality/<template>.md`.

```markdown
# Design Quality — <Template Name>

**Client**: <slug>
**Template**: <home | services | service-detail | contact | blog-index | blog-post | ...>
**Scored by**: <operator name>
**Date**: YYYY-MM-DD
**Build**: <commit sha>

## Summary

- **Overall score**: <number> (minimum across categories)
- **Pass to ship**: yes / no (threshold: all categories ≥ 8)
- **Blocking categories (if any)**: <list>

## Category scores

### 1. Typographic rhythm — <N>/10
- Evidence:
- Rubric clauses cited:
- Remediation queued if < 9:

### 2. Colour discipline — <N>/10
- Evidence:
- Rubric clauses cited:
- Remediation queued if < 9:

### 3. Spacing consistency — <N>/10
- Evidence:
- Rubric clauses cited:
- Remediation queued if < 9:

### 4. Hierarchy strength — <N>/10
- Evidence:
- Rubric clauses cited:
- Remediation queued if < 9:

### 5. Copy quality — <N>/10
- Evidence:
- Rubric clauses cited:
- Remediation queued if < 9:

### 6. Trust-signal placement — <N>/10
- Evidence:
- Rubric clauses cited:
- Remediation queued if < 9:

### 7. Section originality — <N>/10
- Evidence:
- Rubric clauses cited:
- Remediation queued if < 9:

## Slop-scan

- Script run: scripts/slop-scan.sh dist/<route>
- Result: pass / fail
- Findings (if any):

## Screenshots

- Desktop: <path to screenshot>
- 3G mobile: <path to screenshot>

## Second-operator review

If this score triggers calibration (variance with a second operator >
1 point), link the calibration note here.

- Second operator: <name> / not yet reviewed
- Variance: <category: delta>
- Calibration link: <path>
```

## Rules

- Every primary template has a report. Missing reports fail the
  pipeline.
- Scores are integers 0–10. Decimal scores are drift.
- Every sub-8 score has a queued remediation. "We'll fix later" is not
  a remediation.
- Reports are committed with the build that produced them; they are
  not generated on deploy.

## Machine-readable footer

To let the CI script parse scores without parsing prose, the last three
lines of the report must be:

```
<!-- SCORES:
1=<N>, 2=<N>, 3=<N>, 4=<N>, 5=<N>, 6=<N>, 7=<N>, overall=<min>
-->
```

The script reads this footer and fails the build if overall < 8 on
main.
