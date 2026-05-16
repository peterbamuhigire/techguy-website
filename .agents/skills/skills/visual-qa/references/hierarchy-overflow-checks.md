# Structural Assertions: Hierarchy, Overflow, Empty-Section

The structural gate inside `scripts/visual-qa.sh`. Each assertion is
absolute — no thresholds, no warnings. A failure blocks deploy.

## 1. Heading Hierarchy

### Rule

- Exactly one `<h1>` per page.
- No skipped heading levels (no `<h3>` under `<h1>` without an intervening
  `<h2>`).
- No empty heading.
- Every heading text >= 3 characters (single-character decorative headings
  are banned).

### Implementation (Playwright assertion)

```ts
test('heading hierarchy', async ({ page }) => {
  await page.goto('/');
  const counts = await page.evaluate(() => {
    const headings = Array.from(document.querySelectorAll('h1, h2, h3, h4, h5, h6'));
    const levels = headings.map((h) => Number(h.tagName[1]));
    const texts = headings.map((h) => h.textContent?.trim() ?? '');
    return { levels, texts };
  });

  const h1Count = counts.levels.filter((l) => l === 1).length;
  expect(h1Count).toBe(1);

  for (let i = 1; i < counts.levels.length; i++) {
    expect(counts.levels[i] - counts.levels[i - 1]).toBeLessThanOrEqual(1);
  }

  for (const t of counts.texts) {
    expect(t.length).toBeGreaterThanOrEqual(3);
  }
});
```

### Common Failures and Fixes

| Failure | Fix |
|---|---|
| Two h1s on a page | Demote the second h1 to h2. The original h1 is usually the logo mark; change it to a visually-styled `<p>` or keep the h1 and downgrade the page title. |
| Skip from h2 to h4 | Insert an h3 or renumber the subordinate headings. |
| Empty heading | Remove the heading or populate it. Often an artifact of a CMS field left blank. |
| Decorative character as heading | Replace the element; use a `<span>` or `<div>` with visual styling. |

## 2. Horizontal Overflow

### Rule

No element produces horizontal scroll at a viewport width of 375px. Tables
and code blocks are allowed to scroll horizontally *inside* a contained wrapper;
the page body must not scroll.

### Implementation

```ts
test('no horizontal overflow at 375', async ({ page }) => {
  await page.setViewportSize({ width: 375, height: 812 });
  await page.goto('/');
  const overflow = await page.evaluate(() => {
    const body = document.body;
    return {
      bodyScroll: body.scrollWidth > body.clientWidth,
      html: document.documentElement.scrollWidth > document.documentElement.clientWidth,
      widerThanViewport: Array.from(document.querySelectorAll('body *')).filter((el) => {
        const r = (el as HTMLElement).getBoundingClientRect();
        return r.right > 375 + 1; // +1 allows sub-pixel fringe
      }).slice(0, 5).map((el) => el.tagName + '.' + (el as HTMLElement).className),
    };
  });
  expect(overflow.bodyScroll).toBe(false);
  expect(overflow.html).toBe(false);
  expect(overflow.widerThanViewport.length).toBe(0);
});
```

### Common Failures and Fixes

| Failure | Fix |
|---|---|
| Fixed-width table | Wrap in `<div class="overflow-x-auto">`; add `role="region"` and `tabindex="0"` for scroll focus. |
| Long word breaking layout | Add `overflow-wrap: anywhere` on body-text containers. |
| Oversized hero image | Set `max-width: 100%`; verify CSS is not hard-coded to `width: 1200px`. |
| Absolute-positioned ornament wider than viewport | Clip with `overflow: hidden` on the parent. |
| Grid with unconstrained min-content | Use `minmax(0, 1fr)` instead of `1fr` inside grid templates. |

## 3. Empty-Section Warning

### Rule

Every `<section>` contains at least 60 words of meaningful body copy, or is
explicitly marked `data-visual-qa="intentionally-sparse"` with a one-word
reason value (`gallery`, `map`, `divider`, etc.).

Rationale: the single most common AI-slop marker is a section that looks
impressive but carries no information. This assertion forces sparse sections
to declare themselves and forces the reviewer to justify them.

### Implementation

```ts
test('no empty sections', async ({ page }) => {
  await page.goto('/');
  const findings = await page.evaluate(() => {
    const MIN_WORDS = 60;
    const sections = Array.from(document.querySelectorAll('section'));
    return sections
      .filter((s) => s.getAttribute('data-visual-qa') !== 'intentionally-sparse')
      .map((s) => ({
        selector: s.id || s.className,
        words: (s.textContent ?? '').trim().split(/\s+/).length,
      }))
      .filter((s) => s.words < MIN_WORDS);
  });
  expect(findings).toEqual([]);
});
```

### Common Failures and Fixes

| Failure | Fix |
|---|---|
| Hero section with 4 words of copy | Rewrite the hero. 12 words minimum, following `content-writing` rules. |
| "How it works" section with 3 icons and 2 words per icon | Add subhead and descriptive copy. |
| Gallery section with no explanatory text | Mark `data-visual-qa="intentionally-sparse"` with reason `gallery`. |
| Newsletter CTA section | Mark `data-visual-qa="intentionally-sparse"` with reason `cta` — usually acceptable if the CTA carries the information. |

### The Opt-Out Is Audited

The slop-scan step reports a count of opt-out sections per page. More than
two opt-outs on a single page is a review flag.

## 4. Opt-Out Audit Rules

- No page may have more than 2 `intentionally-sparse` sections.
- Opt-out reasons must come from a closed vocabulary:
  `gallery | map | divider | cta | stats-strip | logo-row | media-embed`.
- Any other reason is a review flag.

## 5. Running Order in CI

```bash
npx playwright test tests/visual/structure.spec.ts
```

The structure spec runs before the screenshot diff; a structural failure
short-circuits the visual gate so reviewers do not waste time triaging diffs
when the markup is already broken.

## Reading

- WCAG 2.2 SC 1.3.1 (Info and Relationships), 1.4.10 (Reflow).
- "Atomic Design" by Brad Frost — for the discipline of section as a
  meaningful unit.
- `content-writing/references/krug-three-rules.md` — why empty sections are
  an information failure, not a spacing failure.
