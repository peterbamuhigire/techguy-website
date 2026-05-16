# Structured Visual Review Checklist

The QA operator runs this checklist once per primary template, per launch.
The checklist is the human review of the automated gate's findings. Both must
pass for the template to ship.

File the signed checklist under
`project-log/launches/<project>/visual-qa.md`.

## Preparation

- Build completed and preview running locally at `:4321`.
- `visual-qa.sh` has been run; diffs, structural failures, and slop-scan
  findings are open for triage.
- Review on desktop at 1280 first, then mobile at 375, then tablet at 768.
- Review in both light and dark mode if the project supports dark.

## 1. Visual Hierarchy (per template)

- [ ] Squint test passes: at 3 metres distance (or 25% zoom) the page's
      primary message is still the first thing the eye lands on.
- [ ] The hero headline is visually dominant over body copy (>= 2x body size).
- [ ] The primary CTA is visually dominant over secondary actions.
- [ ] Section breaks are clearly separated; no two sections merge visually.
- [ ] The footer is visually distinct from the body (surface, contrast, or
      separator).

## 2. Typography Rhythm

- [ ] Vertical rhythm reads as a consistent beat down the page.
- [ ] Line height on body copy feels generous but not loose (around 1.6).
- [ ] Heading sizes come from the design-system type scale; no custom size.
- [ ] No widow or orphan (single word on a line of its own) in body copy.
- [ ] No orphan heading that sits above a page break.
- [ ] Line length on body copy is 45-75 characters at each breakpoint.

## 3. Spacing Consistency

- [ ] Margins and padding feel consistent across sections (same-role sections
      share the same spacing).
- [ ] No section feels cramped or adrift from the next.
- [ ] 8pt grid is respected; no odd pixel offsets.
- [ ] No sticky element overlaps content when focused.

## 4. Colour Discipline

- [ ] Palette matches `design-system/tokens.css`; no orphan colour.
- [ ] Accents are used deliberately, not decoratively.
- [ ] Contrast in context meets WCAG (measured with DevTools picker on real
      rendered pixels, not tokens).
- [ ] Dark mode keeps the same palette relationships as light mode.

## 5. Imagery

- [ ] Every image is compressed and in a modern format (AVIF > WebP > JPEG).
- [ ] Every image has a deliberate reason for being on the page.
- [ ] No stock-photo obvious tells (see `slop-rules.md` rule 8).
- [ ] Every image has `width` and `height` attributes to prevent CLS.
- [ ] LCP image has `fetchpriority="high"` or is preloaded.

## 6. Copy Quality (surface-level)

*Deep copy review is `content-writing` and `design-quality-score`. This
checklist catches copy-visual interactions.*

- [ ] No headline matches a banned pattern (`slop-rules.md` rule 3).
- [ ] No section is a single short slogan with no body.
- [ ] No placeholder copy ("Lorem ipsum", "Your tagline here", "Coming soon").
- [ ] Numbers, currencies, and units are formatted correctly for the locale.

## 7. Trust-Signal Placement

- [ ] Above the fold: the page carries at least one trust signal relevant to
      the buyer's risk (logo row, rating, named testimonial, regulator badge).
- [ ] In the conversion section: the page carries a social-proof element
      within the same viewport as the CTA.
- [ ] No fake urgency ("only 3 left!") or fake reviews.

## 8. Motion

- [ ] All motion respects `prefers-reduced-motion: reduce`.
- [ ] Hover transitions are 150-300 ms; no 800 ms slow-fade.
- [ ] No parallax heavier than 20px of offset.
- [ ] No auto-playing hero video with sound.

## 9. Mobile Specifics (at 375)

- [ ] Nav toggle is reachable with thumb.
- [ ] CTA is sticky or consistently visible within one scroll of any section.
- [ ] Tap targets >= 44x44 CSS pixels.
- [ ] Forms render single-column with labels above inputs.
- [ ] No element causes horizontal scroll.

## 10. Dark Mode (when supported)

- [ ] Every image is either transparent, dark-safe, or has a dark variant.
- [ ] Icon fills invert or swap correctly.
- [ ] No white hairline or box-shadow that assumes a white background.
- [ ] Focus ring still visible against dark surfaces.
- [ ] System theme toggle respected; a manual toggle, if present, is reachable.

## Sign-off

| Field | Value |
|---|---|
| Project |  |
| Template |  |
| Viewports reviewed | 375 / 768 / 1280 |
| Themes reviewed | light / dark / hc |
| Automated diff result | PASS / FAIL / APPROVED-UPDATE |
| Structural assertions result | PASS / FAIL |
| Slop-scan result | PASS / WARN / FAIL |
| Manual checklist | PASS / FAIL |
| Decision | ship / fix-and-rerun |

Signed: _________________________ Date: _______________

File: `project-log/launches/<project>/visual-qa.md`.

## Reading

- *Refactoring UI* by Adam Wathan and Steve Schoger — the visual heuristics
  behind this checklist.
- *Practical Typography* by Matthew Butterick — the typography section.
- `design-system/references/ai-slop-prevention.md` — the visual banned list.
