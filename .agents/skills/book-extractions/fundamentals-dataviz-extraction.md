# Peter Cook - Fundamentals of HTML, SVG, CSS and JavaScript for Data Visualisation

**Source:** Peter Cook, *Fundamentals of HTML, SVG, CSS and JavaScript for Data Visualisation* (Leanpub, 2022).

## Use this for

- Building custom data visualisations beyond what a charting library offers.
- Reviewing SVG-based viz code for correctness (namespace, transforms, attribute names).
- Onboarding to D3 — the book covers the four-language fundamentals D3 sits on top of.

## High-signal insights

1. **SVG coordinate system origin is top-left, not bottom-left.** Y grows downward.
2. **Use `cx` / `cy` for circles and ellipses, not `x` / `y`.** Cook's explicit warning.
3. **Default SVG stroke is white, default fill is black.** Both must be set explicitly to avoid surprises.
4. **Path command syntax.** Uppercase = absolute coordinates; lowercase = relative. `M` move-to, `L` line-to, `C` cubic curve, `Q` quadratic, `A` arc, `Z` close.
5. **Transforms compose right-to-left.** `transform="translate(10,20) rotate(45)"` rotates first, then translates.
6. **`getBBox()` not `getBoundingClientRect()`** for SVG element dimensions.
7. **`createElementNS(svgNS, 'rect')` not `createElement('rect')`.** SVG namespace is required when creating elements via DOM.
8. **`viewBox` decouples internal coordinates from rendered size.** Set `viewBox="0 0 800 400"` and CSS width/height; the SVG scales while preserving aspect ratio.
9. **`object-fit` does not work on inline SVG;** use `preserveAspectRatio` on the `viewBox` instead.
10. **JS array methods are the data-binding engine.** `forEach` for side effects, `map` to transform, `filter` to subset, `reduce` to aggregate. D3's selections wrap these.

## Beyond the book (supplementary for AI agent reference)

The book covers HTML/SVG/CSS/JS fundamentals only. For working viz code, the supplement covers:

- **D3 selections + enter/update/exit + v7 `.join()`**.
- **Scales:** linear, log, time, band, ordinal, sequential — `d3.scaleLinear().domain([0, max]).range([height, 0])`.
- **Axes:** `d3.axisBottom(scale)`, `d3.axisLeft(scale)`.
- **Generators:** `d3.line()`, `d3.area()`, `d3.arc()`, `d3.pie()`, `d3.stack()`.
- **Margin convention:** `const margin = {top, right, bottom, left}; const innerWidth = width - margin.left - margin.right;`.
- **Responsive viz:** `viewBox` + `ResizeObserver` to redraw at container-width changes.
- **Accessibility:** `role="img"`, `<title>`, `<desc>`, `aria-label`, `prefers-reduced-motion`.
- **Runnable skeletons:** bar, line, scatter, donut, stacked area.

Full reference in the `data-visualization` skill: `C:\Users\Peter\.claude\skills\data-visualization\references\svg-css-js-implementation.md`.

## Skill cross-reference

Augments the existing `data-visualization` skill (Knaflic-led, story-first) with SVG/CSS/JS implementation fundamentals plus the D3 supplement.
