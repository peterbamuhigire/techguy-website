# Score Calibration

**Read this when**: onboarding a new QA operator or resolving a scoring
disagreement between two operators.

**Purpose**: The rubric is only useful if two operators arrive at
similar scores for the same template. Calibration is the practice that
keeps scores defensible.

## Calibration principle

- Two independent operators score the same template without discussion.
- Compare scores category by category.
- Variance ≤ 1 point per category is within tolerance.
- Variance > 1 point in any category triggers a calibration session.

## Calibration session

1. Both operators review the category where they diverged.
2. Each cites the rubric clause and the evidence that produced the
   score.
3. If one operator is applying a clause the other overlooked, the
   overlooking operator adjusts.
4. If both are applying the clause but interpreting it differently, the
   pair writes a new sub-criterion or worked example into
   `scored-examples.md` that disambiguates.
5. The adjusted rubric is the new baseline.

## Calibration log

Every calibration session produces a short note:

```markdown
# Calibration — YYYY-MM-DD

**Template**: <template name, client>
**Operators**: <A>, <B>
**Diverged categories**: <list>

## Divergence

| Category | Score A | Score B | Cited clause |
|---|---|---|---|
| … | … | … | … |

## Resolution

<2–3 sentences>

## Rubric change

<The change filed into rubric.md or scored-examples.md>
```

Filed at `project-log/decisions/YYYY-MM-DD-rubric-calibration-<slug>.md`
when the resolution changes the rubric; filed at
`certification/calibration-log/YYYY-MM.md` when the resolution is about
operator training, not rubric change.

## First-month calibration

In the first month of a new QA operator's practical exam:

- Every template is scored by the new operator and the programme lead.
- Variances are recorded.
- By the end of the month, the variance across all templates should be
  ≤ 0.5 points average per category.
- If it is not, the operator is not yet certified.

## Cross-operator audits

On an ongoing basis, a random template per quarter is re-scored blind
by a second operator. Aggregate variance is reported in the public
scorecard as "Rubric calibration: <average variance>."

The target is ≤ 0.5 points. Above 1.0 signals rubric drift and
triggers a rubric-revision cycle.

## Why this matters

Without calibration, the rubric becomes a ceremonial artefact. The
engine's authority claim rests on the rubric producing consistent
scores — consistency is what turns "we think it's good" into "it meets
our standard."

---

## Resolving scorer disagreements (added 2026-05-04 from Fekeshazi)

Source: `fekeshazi-pm-ux-guide-extraction.md` Section 3.4 (User Research as Decision-Arbiter).

### The principle
> "Have you had a meeting when there was an important question and all participants had different opinions? How did you decide? Or even worse: who decided? Why don't you let the users answer these questions?"

When two scorers disagree on a category by ≥ 2 points (e.g., one says 6, another says 8), the tiebreaker is **not** the senior scorer's opinion. The tiebreaker is **fresh user-test data** addressing the disputed dimension.

### Procedure
1. Document the disagreement with specifics: which category, which template, which scorers, which scores.
2. Define the testable question (e.g., "Can users find the primary CTA within 5 seconds?").
3. Run a short test (5-second test, guerrilla test, or 3–5 person remote test).
4. The score that aligns with the test data wins.
5. Record the resolution in the project log for future calibration.

### Why this works
Subjective scoring drifts toward whoever is most senior or most opinionated. Anchoring on user-observed reality keeps the rubric honest and gives clients a defensible explanation for the score.

### When to skip
- Disagreements within 1 point — accept either; record both as a calibration note
- Categories that are objectively measurable (load time, accessibility-audit pass) — those don't need user-test arbitration; re-run the measurement
