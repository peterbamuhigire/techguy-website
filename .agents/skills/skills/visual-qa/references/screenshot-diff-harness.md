# Screenshot Diff Harness

Playwright-based harness used by `scripts/visual-qa.sh` to capture and diff
screenshots for every primary template.

## Why Playwright

- Consistent cross-browser rendering (Chromium, Firefox, WebKit on the same
  machine).
- Network throttling for deterministic image loading.
- Built-in screenshot comparison with pixel threshold.
- The engine already ships a Playwright starter at
  `deploy/templates/playwright-starter/`; the visual harness extends that
  starter instead of creating a second tool.

## Install (once per project)

```bash
npm i -D @playwright/test pixelmatch pngjs
npx playwright install --with-deps chromium
```

WebKit and Firefox are added for any site with a substantial iOS Safari user
base (most African B2C sites). The CI matrix stays Chromium-only for speed
unless the project opts in.

## Viewport Matrix

| Viewport | Width | Height | Device | Reason |
|---|---|---|---|---|
| mobile | 375 | 812 | iPhone 12 Pro dimensions | dominant African mobile profile |
| tablet | 768 | 1024 | iPad dimensions | conversion verification |
| desktop | 1280 | 800 | laptop dimensions | primary desktop target |

Additional breakpoints may be captured if the design system calls out a third
primary breakpoint, but the matrix above is the floor.

## Theme Matrix

- Always: default (light).
- When the project supports dark mode: dark.
- When the project supports high-contrast: add.
- When the project supports reduced-motion as a visual variant: add.

## Threshold

- Per-pixel RGBA difference cap: **0.1%** of total page area.
- Anti-aliasing tolerance: enable `pixelmatch`'s default `0.1` threshold.
- Dynamic content (CMS-driven banners, current year, live copy) is masked
  before capture; see "Masking" below.

## Baseline Directory Layout

```
tests/visual/
  baseline/
    home/
      375.png
      768.png
      1280.png
      375-dark.png
      768-dark.png
      1280-dark.png
    services/
      ...
    service-detail/
      ...
    contact/
      ...
    blog/
      ...
    blog-post/
      ...
  fixtures/
    contact-error-state.json
    service-detail-fixtures.json
  visual.config.ts
```

One directory per canonical template. A template that has multiple states
(contact form pristine vs error state) produces multiple pngs with a suffix:
`375-error.png`.

## Canonical Capture Script

`tests/visual/capture.spec.ts` (added to the Playwright starter):

```typescript
import { test, expect } from '@playwright/test';

const viewports = [
  { label: '375', width: 375, height: 812 },
  { label: '768', width: 768, height: 1024 },
  { label: '1280', width: 1280, height: 800 },
];

const routes = [
  { name: 'home', url: '/' },
  { name: 'services', url: '/services/' },
  { name: 'service-detail', url: '/services/example/' },
  { name: 'about', url: '/about/' },
  { name: 'contact', url: '/contact/' },
  { name: 'blog', url: '/blog/' },
  { name: 'blog-post', url: '/blog/first-post/' },
];

for (const route of routes) {
  for (const vp of viewports) {
    test(`${route.name} @ ${vp.label}`, async ({ page }) => {
      await page.setViewportSize({ width: vp.width, height: vp.height });
      await page.goto(route.url, { waitUntil: 'networkidle' });
      // Freeze dynamic content.
      await page.evaluate(() => {
        document.querySelectorAll('[data-dynamic]').forEach((el) => {
          (el as HTMLElement).textContent = '';
        });
      });
      await expect(page).toHaveScreenshot(`${route.name}/${vp.label}.png`, {
        maxDiffPixelRatio: 0.001, // 0.1%
        animations: 'disabled',
        mask: [
          page.locator('[data-visual-qa-mask]'),
        ],
      });
    });
  }
}
```

## Masking

Content that changes per build but is not a regression (timestamps, form
nonces, a cycling testimonial) is masked rather than baselined. Rules:

- Mask the smallest possible region.
- Mark masked elements with `data-visual-qa-mask` in the source.
- Log every mask in `tests/visual/MASKS.md` with a one-line justification and
  a review date.
- Masks that would hide genuine regressions are banned.

## Running the Gate

```bash
# Full gate (CI)
npx playwright test tests/visual/ --config=tests/visual/visual.config.ts

# Update baselines (only on intentional change)
npx playwright test tests/visual/ --update-snapshots

# One template only
npx playwright test -g "home @"
```

## CI Behaviour

- Green: diff within threshold; pipeline advances.
- Red: at least one diff above threshold. CI uploads:
  - `reports/visual/diff/<route>/<vp>.diff.png`
  - `reports/visual/diff/<route>/<vp>.actual.png`
  - `reports/visual/diff/<route>/<vp>.expected.png`
- Merge is blocked until the PR either:
  a. fixes the regression and reruns green, or
  b. updates the baseline with a committed `--update-snapshots` and a
     reviewer-approved diff in the PR.

## Flake Control

- Disable CSS transitions globally in the spec (`animations: 'disabled'`).
- Wait for `networkidle` before capture.
- Disable web font FOUT by waiting for `document.fonts.ready`.
- Capture with a fixed seed for any JS-driven randomness.
- Rerun once on CI flake; if the rerun fails, treat as a real diff.

## Large Images and Git LFS

- Track `tests/visual/baseline/**/*.png` in Git LFS when the total baseline
  directory exceeds 20 MB.
- Repos under 20 MB of baselines may keep the files in Git directly.
- Either way, baselines are part of the repository — never stored in a CI
  cache that an operator cannot reproduce locally.

## Triage

| Symptom | Most likely cause |
|---|---|
| Full-page diff | font swap race, network-idle not reached, global layout token change |
| Horizontal stripe diff | sticky header/footer height change |
| Small rectangle diff in hero | image replaced or compressed differently |
| Diff only in dark mode | missing token override, late theme-injection |
| Intermittent diff | animated SVG, unthrottled web-vital beacon, flash-of-unstyled-text |

## References

- Playwright visual comparison: https://playwright.dev/docs/test-snapshots
- pixelmatch: https://github.com/mapbox/pixelmatch
- *Refactoring UI* by Adam Wathan and Steve Schoger — the heuristics the
  harness protects.
- `design-system/references/ai-slop-prevention.md` — banned visual patterns.
