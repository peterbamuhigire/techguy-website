---
name: design-quality-score
description: Canonical rendered-output design-quality scoring layer. Defines the 7-category visual rubric + 8th UX-maturity (process) category, the slop-scan static check, and the pre-launch scoring gate that prevent premium claims from drifting into generic AI-aesthetic output. Scored per primary template; a project ships only when every primary template scores ≥ 8/10.
---

# Design Quality Score
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- Before any site launches — each primary template is scored.
- Before promoting a visual baseline change to main.
- During visual QA when the operator suspects the output is drifting
  toward generic AI aesthetic.
- During certification practical exams — the score is part of the
  evidence.

## Do not use when
- Scoring copy-only or data-only changes. The rubric measures rendered
  design, not isolated content.
- Scoring early design mocks before they become shipped templates; use
  `design-reference` and `design-system` at mock stage.

## Core contract

Every primary template is scored against the 7-category rubric before
launch. The minimum score to ship is **8/10 per category and 8/10
overall**. A category below 8 blocks deploy.

The scoring is:
1. **Defensible against the rubric**, not against taste. Every score
   cites the rubric clause that justifies it.
2. **Evidenced**. The operator files a per-template report with the
   score, the evidence (screenshots, specific class names, specific
   copy), and the rationale.
3. **Repeatable**. A second operator scoring the same template arrives
   within one point per category.

## Workflow

1. Build the site and confirm Phase 10 gates (perf, a11y, visual-qa,
   security) have passed on the CI or locally.
2. For each primary template (home, services, service-detail, contact,
   blog-index, blog-post, and any client-specific templates), open the
   template on a desktop and on a 3G-throttled mobile profile.
3. Walk the rubric category-by-category. Use the worked examples in
   `references/scored-examples.md` as calibration.
4. Run the static checks via `scripts/slop-scan.sh` for banned
   headline patterns, banned colour combinations, and other mechanical
   flags. The script is not the score — it is the floor.
5. Run `scripts/design-quality-score.sh` which aggregates the operator
   scores from `reports/design-quality/<template>.md` and produces the
   overall pass/fail for the pipeline.
6. For premium, ecommerce, lead-generation, or high-ticket templates, run the
   sibling `premium-ui-ux-design` gate and attach the premium score table.
7. File the per-template reports. Total score goes in the scorecard.
8. If any category scores below 8, the template does not ship; remediate
   and re-score.

## Required inputs

- A built production-like render of the site (`dist/` or deployed
  preview).
- The design-system tokens for the client (colour, type, spacing) so
  the operator can verify adherence.
- The brand style guide for copy and photography expectations.
- At least one prior benchmark scored site at the same rubric (the
  Phase 12 benchmark library when available).

## Quality standards

- Every scored report cites the rubric clause by number.
- A score is defensible in a 5-minute walkthrough with a second operator.
- The aggregate score appears in `dashboards/quality-scorecard.md` row
  for the project.
- A score below 8 with a decision entry saying "we'll fix later" is
  not permitted to ship. The decision entry is the fix, not the
  waiver.

## Anti-patterns

- Scoring against taste. "I don't like it" is not a category; the
  rubric is.
- Scoring only the home page. Every primary template must be scored.
- Scoring desktop only. 3G-throttled mobile is a first-class view.
- Letting `slop-scan.sh` pass substitute for the human walkthrough.
  The script catches common failures; the rubric catches design
  failures.
- Inflating scores to clear the gate. A second operator spot-check is
  the long-term audit.

## Outputs

- `reports/design-quality/<template>.md` per primary template.
- An aggregate row in `dashboards/quality-scorecard.md`.
- A pass or fail exit code from `scripts/design-quality-score.sh`
  consumed by the canonical CI pipeline step 12.

## References

- `references/rubric.md` — the 7-category rubric with sub-criteria.
- `references/scored-examples.md` — worked examples with scores and
  rationales.
- `references/banned-patterns.md` — the list of banned patterns the
  slop-scan enforces.
- `references/score-calibration.md` — how two operators calibrate
  scoring to stay within one point per category.
- `references/report-template.md` — the per-template report format.
- `../premium-ui-ux-design/SKILL.md` — premium website gate for perceived
  value, conversion clarity, visual polish, and production fit.

## Notes

- This skill composes with `visual-qa` (visual-qa detects regressions,
  design-quality-score measures absolute quality).
- The skill composes with `design-system` (the rubric assumes the
  tokens are correct; violating tokens is a separate drift issue).
- In the canonical CI, this skill runs advisory on PRs and blocking
  on main.

