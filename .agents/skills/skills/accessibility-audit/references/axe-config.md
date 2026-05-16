# axe-core Configuration

Runtime configuration for the accessibility gate. Keeps the ruleset tight to
WCAG 2.2 AA, adds the two engine-specific rules, and documents every
suppression.

## Preferred Runner

The engine standardises on `@axe-core/cli` for the CI gate. Alternatives
(axe-playwright, jest-axe) are accepted only for per-component unit tests, not
as the primary gate.

## Install

```bash
npm i -D @axe-core/cli
```

## Invocation

The canonical invocation lives in `scripts/a11y-gate.sh`. Manual runs:

```bash
# All primary routes against a running static preview on :4321
npx axe http://localhost:4321/ \
  http://localhost:4321/services/ \
  http://localhost:4321/about/ \
  http://localhost:4321/contact/ \
  http://localhost:4321/blog/ \
  --exit \
  --save reports/a11y/axe-summary.json \
  --dir reports/a11y/ \
  --tags wcag2a,wcag2aa,wcag21a,wcag21aa,wcag22aa,best-practice
```

The `--exit` flag causes the process to exit non-zero when violations are
found; CI depends on this behaviour.

## Tag Scope

| Tag | Included | Rationale |
|---|---|---|
| `wcag2a` | yes | baseline |
| `wcag2aa` | yes | baseline |
| `wcag21a` | yes | baseline |
| `wcag21aa` | yes | baseline |
| `wcag22aa` | yes | engine target |
| `best-practice` | yes | catches common issues axe classifies outside WCAG |
| `experimental` | no | noise |
| `wcag2aaa` | no (manually tested) | tested via manual checklist |

## Severity Policy

Axe reports four severities: minor, moderate, serious, critical.

| Severity | Gate behaviour |
|---|---|
| critical | block deploy |
| serious | block deploy |
| moderate | warn; create ticket, fix within sprint |
| minor | warn; fix opportunistically |

## Rule Suppressions

Every suppression must be documented with: a rule id, a justification, a
date, and a review date (annual). Store in
`accessibility-audit/references/axe-suppressions.json` — **the file is
empty by default.** If a suppression is needed, the format is:

```json
{
  "suppressions": [
    {
      "rule": "color-contrast",
      "reason": "Brand lockup in header uses a custom dark scrim that the scanner cannot see. Verified 4.7:1 in browser.",
      "scope": "selector: header .brand-lockup",
      "added_by": "peter",
      "added_on": "2026-04-16",
      "review_on": "2027-04-16"
    }
  ]
}
```

Suppressions must:
- name a specific selector, not the whole page
- reference the evidence for the manual verification
- have a review date within 12 months

## Custom Rules Added by the Engine

Implemented as axe custom checks loaded via `--script` flag:

1. **focus-visible-dark-mode** — asserts a visible focus ring when
   `prefers-color-scheme: dark` is applied.
2. **reduced-motion-default** — asserts no CSS animation outside a
   `@media (prefers-reduced-motion: no-preference)` block when the animation
   lasts more than 500 ms.

Both rules live in `accessibility-audit/references/custom-checks.js` and are
loaded by `a11y-gate.sh`. If the file is not present, CI warns but does not
fail — create it before adding the custom rules to the build contract.

## Page Preparation

Some pages need state (logged in, cookie banner accepted, form half-filled)
before the gate is representative. For these cases, drive the page to its
audited state with Playwright and pass the resulting HTML to axe:

```js
// tests/a11y/drive-contact-form.spec.ts
import { test } from '@playwright/test';
import { AxeBuilder } from '@axe-core/playwright';

test('contact form error state is accessible', async ({ page }) => {
    await page.goto('/contact/');
    await page.click('button[type=submit]'); // trigger errors
    const results = await new AxeBuilder({ page })
        .withTags(['wcag2a', 'wcag2aa', 'wcag22aa'])
        .analyze();
    expect(results.violations.filter(v => ['serious','critical'].includes(v.impact))).toEqual([]);
});
```

## Reports

Axe writes one JSON file per URL under `reports/a11y/`. The CI step also
generates `reports/a11y/summary.md`:

```markdown
# Accessibility Gate Summary

Run: 2026-04-16T10:12:00Z
Routes: 5
Critical: 0
Serious: 0
Moderate: 2 (pagination-aria, region)
Minor: 4

## Top violations

1. ...
```

## Known False Positives

- `color-contrast` on text that sits over a hero image gradient — verify in
  browser with the element picker and add a suppression or a scrim.
- `region` on single-section pages — ensure every chunk of content is inside
  a landmark; do not suppress.

## Reading

- Deque University axe-core rule index: https://dequeuniversity.com/rules/axe/
- axe-core GitHub: https://github.com/dequelabs/axe-core
- "Automated accessibility testing tools: how much do they really catch?"
  (Deque, 2024) — the source for the 40% baseline.
