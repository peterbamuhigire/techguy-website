---
title: Design Hardening — Edge Case Resilience
description: Defensive design patterns for text overflow, i18n resilience, error recovery, browser compatibility, network degradation, and input sanitisation. Ensures websites survive real-world conditions — long names, slow networks, missing images, and unexpected content.
sources: pbakaus/impeccable "harden" skill (2025) + Will Grant "101 UX Principles" (2018) + Lisandra Maioli "Fixing Bad UX Designs" (2018)
---

# Design Hardening — Edge Case Resilience

Real users have 47-character surnames, 3G connections, ad blockers, unusual screen sizes, and screen readers. A "finished" website that only works with ideal test data is not finished. Harden every component against real-world conditions.

---

## 1. TEXT OVERFLOW & WRAPPING

Every text container must have an overflow strategy. Never assume content length.

### Strategies by Context

| Context | Strategy | CSS |
|---------|----------|-----|
| Navigation labels | Truncate with ellipsis | `overflow: hidden; text-overflow: ellipsis; white-space: nowrap;` |
| Card titles | Clamp to 2 lines | `-webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical; overflow: hidden;` |
| Hero headlines | Allow wrapping, control line length | `max-width: 20ch` (short), `max-width: 35ch` (long) |
| Body text | Natural wrap with `max-width` | `max-width: 65ch` (measure) |
| Button text | Single line, truncate if needed | `white-space: nowrap; overflow: hidden; text-overflow: ellipsis;` |
| Table cells | Truncate or wrap depending on column | Per-column decision |
| URLs / emails | Break at any character | `overflow-wrap: break-word; word-break: break-all;` |

### Tailwind Patterns
```html
<!-- Single-line truncate -->
<span class="truncate">Very long navigation label that should truncate</span>

<!-- Multi-line clamp (2 lines) -->
<p class="line-clamp-2">Card title that wraps to a maximum of two lines before truncating</p>

<!-- Break long words/URLs -->
<p class="break-all">user@verylongdomainname.example.com</p>

<!-- Controlled line length -->
<p class="max-w-prose">Body text constrained to readable measure</p>
```

### Test With
- Names: "Wolfeschlegelsteinhausenbergerdorff" (35+ characters)
- Titles: 1-word titles AND 15-word titles
- Empty strings (should not collapse layout)
- URLs: `https://subdomain.example.com/very/long/path/that/keeps/going`
- Numbers: 1, 1000, 1000000, 1000000000 (formatting matters)

---

## 2. INTERNATIONALISATION (i18n) RESILIENCE

Our sites support 3 languages (en, fr, sw). French expands ~30%, Kiswahili ~20%. Design for the longest variant.

### Text Expansion Rules

| English Length | French Expansion | Design Implication |
|---------------|-----------------|-------------------|
| 1–10 characters | +200% (up to 3×) | Buttons, labels, nav items need flex room |
| 11–20 characters | +80–100% | Short headings, CTAs |
| 21–70 characters | +40–60% | Subheadings, form labels |
| 71+ characters | +20–30% | Body text, descriptions |

### Defensive Patterns

**Buttons:** Never set fixed widths. Use `min-width` + `padding`.
```html
<!-- BAD: fixed width breaks with French -->
<button class="w-32">Submit</button>

<!-- GOOD: flexible with minimum -->
<button class="min-w-[8rem] px-6 py-3">Submit</button>
```

**Navigation:** Test with all 3 languages at all breakpoints.
- French nav items can be 50% longer — ensure they fit before hamburger threshold
- Kiswahili compound words can be very long — `hyphens: auto` as fallback

**Cards:** Set `min-height` instead of `height` so cards expand for longer translations.

**Headings:** Use `clamp()` and `max-width` in characters (`ch`) not pixels to accommodate expansion.

### Character Set Resilience
- French: é, è, ê, ë, ç, à, â, ô, ù, û, ü, ÿ, î, ï, œ, æ
- Kiswahili: standard Latin alphabet (no special characters, but longer compound words)
- Ensure fonts include full Latin Extended character set
- Test with: "Résumé des activités d'évaluation" (accented characters)

---

## 3. IMAGE & MEDIA RESILIENCE

### Image Fallbacks
When an image fails to load (404, slow network, ad blocker), show a branded placeholder — never a broken image icon.

```html
<!-- Image with fallback -->
<img
  src="/images/team-photo.jpg"
  alt="Team photo"
  class="h-48 w-full rounded-lg object-cover"
  onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';"
/>
<div class="hidden h-48 w-full items-center justify-center rounded-lg bg-neutral-100 dark:bg-neutral-800">
  <svg class="h-8 w-8 text-neutral-300"><!-- Image placeholder icon --></svg>
</div>
```

### Rules
- Always set explicit `width` and `height` (or `aspect-ratio`) to prevent CLS
- Background images: provide a solid colour fallback that's visible while loading
- Video embeds: show a poster image before loading the iframe
- SVG icons: inline critical icons; external SVGs need a fallback
- `loading="lazy"` on everything below the fold; `loading="eager"` on hero only

---

## 4. EMPTY SECTION HANDLING

When a section has no content (no testimonials, no blog posts, no team photos):

**Rule:** Hide the entire section rather than showing an empty container.

```html
<!-- Astro: conditionally render -->
{testimonials.length > 0 && (
  <section>
    <!-- testimonials content -->
  </section>
)}
```

**Never:** Show a section with only a heading and no content. An empty "Our Team" section with no team members is worse than no section at all.

**Exception:** First-time/zero-data states in interactive features — these get the empty state treatment from `ui-states.md`.

---

## 5. NETWORK DEGRADATION

Design for slow connections (3G is common in East Africa).

### Progressive Loading
1. HTML + critical CSS loads first (Astro handles this by default)
2. Above-fold images: `loading="eager"`, optimised via Sharp
3. Below-fold images: `loading="lazy"` with explicit dimensions
4. JavaScript (Alpine.js): deferred, non-blocking — `<script defer>`
5. Fonts: `font-display: swap` with metric-matched fallback

### Performance Resilience
- **No JS = still functional** — all content readable, navigation works, forms submit (Astro server-renders everything)
- **Slow JS = no broken state** — Alpine.js components show their default state before JS initialises
- **Failed image = branded placeholder** (see section 3)
- **Failed font = readable fallback** — metric-matched system font stack

### Critical Resource Budget
- HTML + critical CSS: under **50KB**
- First meaningful paint: under **1.5s on 3G**
- Total page weight: under **500KB** first load (per CLAUDE.md performance budget)
- No render-blocking resources except critical CSS

---

## 6. BROWSER COMPATIBILITY

### Baseline Support
- Chrome/Edge 90+ (Chromium)
- Safari 15+ (iOS Safari is the primary mobile browser in East Africa)
- Firefox 90+
- Samsung Internet 15+

### Common Gotchas

| Feature | Issue | Fix |
|---------|-------|-----|
| `gap` in flexbox | Not supported in Safari < 14.1 | Use `margin` fallback or ensure Safari 15+ baseline |
| `aspect-ratio` | Not in Safari < 15 | Padding-bottom hack fallback |
| `backdrop-filter` | Needs `-webkit-` prefix in Safari | `backdrop-filter: blur(); -webkit-backdrop-filter: blur();` |
| `container queries` | Not in Safari < 16 | Progressive enhancement — use media queries as fallback |
| CSS `clamp()` | Not in IE11 | IE11 is not in our support matrix; safe to use |
| `scroll-behavior: smooth` | Not in Safari < 15.4 | Acceptable — falls back to instant scroll |
| `:focus-visible` | Not in Safari < 15.4 | Use `:focus` fallback for older Safari |
| `color-mix()` | Not in Safari < 16.2 | Pre-compute colours in design tokens |

### Testing Order
1. Chrome desktop (primary development)
2. Safari mobile (iOS) — most common mobile browser for our audience
3. Chrome mobile (Android)
4. Safari desktop
5. Firefox desktop
6. Samsung Internet

---

## 7. FORM RESILIENCE

### Input Validation
- Validate **server-side always** — client-side validation is a UX convenience, not security
- Accept flexible formats: phone numbers with/without country code, spaces, dashes
- Email: don't over-validate — `user@domain.tld` is sufficient; don't reject `+` or `.` in local part
- Names: accept apostrophes, hyphens, spaces, accented characters, and very long names

### Keyboard & Input
- Use correct `inputmode` on every field (see `touch-interactions.md`)
- `autocomplete` attributes on every form field — browsers fill forms faster
- `enterkeyhint` to label the mobile keyboard return key appropriately
- Tab order must follow visual order — never jump unpredictably

### Fallback Behaviour
- JavaScript disabled: form still submits (use `action` attribute + server handler)
- Alpine.js not loaded: form fields visible and functional in default state
- Validation message not visible: error still submitted to server, user gets server-side error page

---

## 8. ACCESSIBILITY RESILIENCE

Beyond WCAG AA compliance (covered in `aria-patterns.md`), harden for edge cases:

### High Contrast Mode
- Test with Windows High Contrast Mode — borders and outlines become the primary UI
- Use `@media (forced-colors: active)` to adjust where needed
- Never rely solely on `background-color` for interactive state — add borders too

### Zoom Resilience
- Test at 200% zoom — no content hidden, no horizontal scroll
- Test at 400% zoom — content still readable, critical actions accessible
- Use `rem` for all sizing so user font-size preferences are respected

### Screen Reader Order
- DOM order matches visual order
- Hidden content (hamburger menu, accordion panels) uses `hidden` attribute or `aria-hidden="true"`
- Dynamic content uses `aria-live` regions (see `aria-patterns.md`)

---

## 9. PRINT RESILIENCE

Every page should print cleanly, even if users never intend to print.

```css
@media print {
  /* Hide interactive elements */
  nav, .hamburger, .sticky-header, footer .social-icons,
  .cookie-banner, [x-data] { display: none !important; }

  /* Expand all content */
  details { open: true; }
  .accordion-content { display: block !important; max-height: none !important; }

  /* Show URLs after links */
  a[href]:after { content: " (" attr(href) ")"; font-size: 0.8em; }

  /* Single column, full width */
  body { max-width: 100%; font-size: 12pt; line-height: 1.5; }

  /* Page breaks */
  h2, h3 { page-break-after: avoid; }
  img, figure { page-break-inside: avoid; }
}
```

---

## HARDENING CHECKLIST

Before deploying any page, verify:

- [ ] **Text overflow** — tested with long names, titles, and URLs at all breakpoints
- [ ] **French/Kiswahili expansion** — no layout breaks with +30% text length
- [ ] **Empty sections** — hidden when no content; no empty shells visible
- [ ] **Image fallbacks** — broken images show branded placeholder, not browser default
- [ ] **CLS prevention** — all images have explicit dimensions or aspect-ratio
- [ ] **3G performance** — first paint under 1.5s, total under 500KB
- [ ] **No-JS fallback** — content readable, navigation works, forms submit
- [ ] **Font fallback** — page readable before web fonts load
- [ ] **Browser testing** — Safari iOS, Chrome Android, Chrome desktop minimum
- [ ] **Zoom test** — readable and functional at 200% zoom
- [ ] **High contrast** — interactive elements visible in Windows High Contrast Mode
- [ ] **Print stylesheet** — page prints cleanly with no UI chrome
- [ ] **Character support** — French accented characters render correctly in all fonts
- [ ] **Form resilience** — accepts flexible input formats, validates server-side

---

## INTEGRATION

Reference this file:
- During `page-builder` — defensive CSS and fallback patterns for every component
- During `design-system` — font selection must include Latin Extended characters
- During `deploy` — pre-launch hardening check
- During `seo-audit` — CLS and performance checks relate to hardening
