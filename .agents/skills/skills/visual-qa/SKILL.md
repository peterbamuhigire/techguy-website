---
name: visual-qa
description: Rendered-output review loop. Owns the Playwright screenshot-diff harness, hierarchy and overflow checks, empty-section warnings, AI-slop scan on rendered pages, and the structured visual review checklist. Runs in the canonical CI pipeline as a hard gate; failed diff requires explicit reviewer approval to merge.
---

# Visual QA
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- Every build of a client site, as a CI-time gate before deploy.
- Before shipping any new template or component.
- When reviewing a design change that affects layout, hierarchy, or rhythm.

## Do not use when
- Evaluating whether a design system is correct at the token level — that is
  `design-system`.
- Reviewing copy quality alone — that is `content-writing` and
  `design-quality-score`.

## Core contract
Every primary template passes:
1. Screenshot diff under 0.1% pixel difference vs the approved baseline at
   three viewports (375, 768, 1280) and in every theme the project supports.
2. Heading hierarchy assertion: exactly one h1, no skipped levels.
3. Horizontal overflow assertion: no element produces horizontal scroll at 375px.
4. Empty-section warning: every `<section>` contains >= 60 words of body copy
   or an explicit `data-visual-qa="intentionally-sparse"` opt-out.
5. AI-slop scan: no banned palettes, banned easing curves, banned headline
   patterns, generic icon overuse, or low-information hero sections.
6. Structured review checklist in `references/review-checklist.md` completed
   and signed by the QA operator.

A failed diff requires explicit reviewer approval and a baseline update PR.

## Canonical Command

```bash
# From a client project root with .Codex/skills/ submodule
bash .Codex/skills/scripts/visual-qa.sh
```

The command:
1. Starts a static preview on `:4321`.
2. Captures screenshots per template, per viewport, per theme.
3. Diffs against `tests/visual/baseline/`.
4. Runs the structural assertions (hierarchy, overflow, empty-section).
5. Runs `scripts/slop-scan.sh` against rendered HTML and CSS.
6. Writes `reports/visual/diff/` and `reports/visual/summary.md`.
7. Exits non-zero on any diff above threshold or structural failure.

## Workflow

1. Build the site.
2. Run the canonical command.
3. For any diff above 0.1%:
   a. If the change is intentional, commit the new baseline with a one-line
      reason in the commit message (`visual-qa baseline update: hero image
      refresh for Mara campaign`).
   b. If the change is unintentional, fix the regression and re-run.
4. Complete the structured checklist once per template per launch.
5. File the signed checklist under `project-log/launches/<project>/visual-qa.md`.

## Required inputs
- A built static output at `./dist/`.
- The template list from `performance-budgets.json` (shared source).
- Baselines committed under `tests/visual/baseline/<template>/<viewport>.png`.

## Quality standards
- Baselines are reviewed by a human; never auto-accepted.
- Diffs live in PR comments with before/after thumbnails.
- Hierarchy, overflow, and empty-section are absolute assertions; no
  thresholds.
- AI-slop is evaluated per `design-system/references/ai-slop-prevention.md`
  plus the additions in `references/slop-rules.md`.
- The structured checklist is a human review of the gate's findings, not a
  replacement.

## Anti-patterns
- Auto-accepting baseline updates in CI. Baselines are the acceptance contract.
- Shipping a page with an empty section because "it was just a spacer".
- Shipping hero headlines like "Welcome to <brand>" or "Your one-stop solution".
- Using gradient hero backgrounds from the banned palette.
- Adding a visual-qa opt-out on every section to pass the gate.
- Letting visual QA become a single-reviewer opinion. The rubric is the gate.

## Outputs
- `tests/visual/baseline/<template>/<viewport>.png` — committed baselines.
- `reports/visual/diff/<template>/<viewport>.diff.png` — diff images when a
  diff exceeds threshold.
- `reports/visual/summary.md` — CI-friendly summary.
- A signed manual checklist per launch.
- A blocking CI status on any above-threshold diff or structural failure.

## References
- `references/screenshot-diff-harness.md` — Playwright harness and thresholds.
- `references/baseline-management.md` — how baselines are captured, versioned,
  and updated.
- `references/hierarchy-overflow-checks.md` — the structural assertions.
- `references/slop-rules.md` — banned patterns (extension of
  `design-system/references/ai-slop-prevention.md`).
- `references/review-checklist.md` — the structured human review sheet.

## Notes
- This skill complements `design-quality-score`; that skill scores the
  rendered output on a rubric, while this skill gates pixel-level regressions.
- Baseline images are stored in Git LFS on large projects; see
  `baseline-management.md` for the threshold.
- Do not treat the visual gate as optional for non-visual-heavy projects; a
  text-heavy site regresses hierarchy and spacing just as often.

