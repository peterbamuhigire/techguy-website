---
title: Intrinsic Layout & CSS Grid Patterns
description: Intrinsically responsive layout primitives, CSS Grid advanced patterns, container queries, modular scale, logical properties, and the composition-over-inheritance approach. Makes layouts responsive WITHOUT media queries.
sources: Heydon Pickering & Andy Bell "Every Layout" (3rd ed.) + Rachel Andrew "Get Ready for CSS Grid Layout" (2nd ed., 2019)
---

# Intrinsic Layout & CSS Grid Patterns

Intrinsic design means layouts that respond to their **content and container** — not to arbitrary viewport breakpoints. Media queries become manual overrides, not the primary responsive mechanism.

> "Instead of telling browsers what to do, we allow browsers to make their own calculations, and draw their own conclusions, to best suit the user." — Every Layout

---

## CORE PHILOSOPHY

### Composition Over Inheritance (Every Layout)

Don't style components as monolithic blocks (`.dialog`, `.card`, `.hero`). Instead, compose small **layout primitives** that each have one job:

| Primitive | Job | CSS Pattern |
|-----------|-----|-------------|
| **Stack** | Space elements vertically | `* + * { margin-block-start }` |
| **Box** | Pad content evenly | `padding` on all sides |
| **Center** | Centre content with max-width | `max-inline-size` + `margin-inline: auto` |
| **Cluster** | Distribute items horizontally with wrapping | `display: flex; flex-wrap: wrap; gap` |
| **Sidebar** | Two-column layout that collapses on narrow | `flex-wrap: wrap` with `flex-grow` |
| **Switcher** | Horizontal → vertical at threshold | `flex-wrap: wrap` with `calc()` threshold |
| **Cover** | Vertically centred hero content | `min-block-size` + flex column |
| **Grid** | Auto-filling responsive grid | `grid-template-columns: repeat(auto-fit, minmax())` |
| **Frame** | Aspect-ratio container | `aspect-ratio` or padding-hack |
| **Reel** | Horizontal scrolling strip | `overflow-x: auto` + flex no-wrap |
| **Container** | Container query context | `container-type: inline-size` |

These primitives compose into **any layout** — a dialog is a Stack inside a Box inside an Imposter (positioned overlay).

### The Axiom Approach

Define a few **axioms** (irreducible rules) and let CSS derive the rest:

```css
:root {
  --measure: 60ch;        /* Max line width for readability */
  --ratio: 1.5;           /* Modular scale ratio */
  --s0: 1rem;             /* Base spacing = body line-height */
  --s1: calc(var(--s0) * var(--ratio));       /* 1.5rem */
  --s2: calc(var(--s1) * var(--ratio));       /* 2.25rem */
  --s3: calc(var(--s2) * var(--ratio));       /* 3.375rem */
  --s4: calc(var(--s3) * var(--ratio));       /* 5.0625rem */
  --s5: calc(var(--s4) * var(--ratio));       /* 7.59rem */
  --s-1: calc(var(--s0) / var(--ratio));      /* 0.667rem */
  --s-2: calc(var(--s-1) / var(--ratio));     /* 0.444rem */
}
```

Every spacing value in the design derives from one ratio. Change `--ratio` and the entire design recalibrates harmoniously.

---

## LOGICAL PROPERTIES (Every Layout)

Use **logical properties** instead of physical properties. This ensures correct behaviour in all writing modes and languages (critical for multilingual sites: en, fr, sw).

| Physical | Logical | Why |
|----------|---------|-----|
| `width` | `inline-size` | Works in vertical writing modes |
| `height` | `block-size` | Works in horizontal writing modes |
| `max-width` | `max-inline-size` | Adapts to text direction |
| `min-height` | `min-block-size` | Adapts to text direction |
| `margin-top` | `margin-block-start` | Respects writing mode |
| `margin-bottom` | `margin-block-end` | Respects writing mode |
| `margin-left` | `margin-inline-start` | Respects text direction (LTR/RTL) |
| `margin-right` | `margin-inline-end` | Respects text direction |
| `padding-left` | `padding-inline-start` | Respects text direction |
| `padding-right` | `padding-inline-end` | Respects text direction |
| `text-align: left` | `text-align: start` | Respects text direction |
| `border-left` | `border-inline-start` | Respects text direction |

**Rule:** Use logical properties everywhere. Our multilingual sites (en, fr, sw) may not need RTL today, but logical properties cost nothing and future-proof the CSS.

---

## LAYOUT PRIMITIVES — CSS IMPLEMENTATIONS

### The Stack (Vertical Spacing)

The most fundamental primitive. Injects margin **between** elements via their common parent — no margin on first/last child.

```css
.stack > * + * {
  margin-block-start: var(--s1, 1.5rem);
}
```

**Tailwind equivalent:**
```html
<div class="space-y-6">
```

**Nested stacks** create typographic rhythm:
```html
<div class="space-y-12">          <!-- Large stack: sections -->
  <section class="space-y-6">     <!-- Medium stack: within section -->
    <h2>Section Title</h2>
    <div class="space-y-4">       <!-- Small stack: paragraphs -->
      <p>...</p>
      <p>...</p>
    </div>
  </section>
</div>
```

**Split stack** — push footer to bottom:
```css
/* Push last element to the bottom of a flex container */
.stack-split > :last-child {
  margin-block-start: auto;
}
```

### The Center (Constrained Content)

```css
.center {
  box-sizing: content-box; /* Padding adds to max-width, not subtracts */
  max-inline-size: var(--measure);
  margin-inline: auto;
  padding-inline: var(--s1);
}
```

**Tailwind equivalent:**
```html
<div class="mx-auto max-w-prose px-4">
```

**Key insight (Every Layout):** Use `box-sizing: content-box` on the Center so padding is **added outside** the max-width, ensuring consistent content width regardless of padding.

### The Cluster (Horizontal Distribution)

For nav links, tag lists, button groups — items that wrap naturally.

```css
.cluster {
  display: flex;
  flex-wrap: wrap;
  gap: var(--s1);
  justify-content: flex-start;
  align-items: center;
}
```

**Tailwind equivalent:**
```html
<div class="flex flex-wrap gap-4 items-center">
```

### The Sidebar (Two-Column with Collapse)

A layout with a sidebar that **collapses below the content** when space is insufficient — no media query needed.

```css
.with-sidebar {
  display: flex;
  flex-wrap: wrap;
  gap: var(--s1);
}
.with-sidebar > :first-child {
  flex-basis: 20rem;  /* Sidebar min width */
  flex-grow: 1;
}
.with-sidebar > :last-child {
  flex-basis: 0;
  flex-grow: 999;     /* Content takes all remaining space */
  min-inline-size: 50%; /* Forces wrap when sidebar would be > 50% */
}
```

When the container is too narrow for both columns, the sidebar wraps below — purely content-driven, no breakpoint.

### The Switcher (Horizontal → Vertical)

Switches from a horizontal row to a vertical stack when items would be narrower than a threshold.

```css
.switcher {
  display: flex;
  flex-wrap: wrap;
  gap: var(--s1);
}
.switcher > * {
  flex-grow: 1;
  flex-basis: calc((var(--measure) - 100%) * 999);
}
```

**How it works:** When the container is wider than `--measure`, `calc()` produces a large negative number → `flex-basis` is effectively 0 → items sit side-by-side. When narrower, the value is hugely positive → items each take full width → vertical stack.

### The Cover (Vertically Centred Hero)

```css
.cover {
  display: flex;
  flex-direction: column;
  min-block-size: 100vh; /* Or 100svh for mobile */
  padding: var(--s2);
}
.cover > * {
  margin-block: var(--s1);
}
.cover > :first-child:not(h1, h2) {
  margin-block-start: 0; /* Top element hugs top */
}
.cover > :last-child:not(h1, h2) {
  margin-block-end: 0; /* Bottom element hugs bottom */
}
.cover > h1, .cover > h2 {
  margin-block: auto; /* Centred heading */
}
```

### The Frame (Aspect Ratio)

```css
.frame {
  aspect-ratio: 16 / 9;
  overflow: hidden;
}
.frame > img, .frame > video {
  inline-size: 100%;
  block-size: 100%;
  object-fit: cover;
}
```

Common ratios: `16/9` (hero), `4/3` (card image), `1/1` (avatar), `3/2` (landscape photo).

### The Reel (Horizontal Scroll)

For image galleries, card carousels, and horizontally scrollable content on mobile.

```css
.reel {
  display: flex;
  gap: var(--s1);
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  scrollbar-width: none; /* Hide scrollbar — swipe to navigate */
}
.reel > * {
  flex: 0 0 auto;
  scroll-snap-align: start;
}
```

**Tailwind equivalent:**
```html
<div class="flex gap-4 overflow-x-auto snap-x snap-mandatory scrollbar-hide">
  <div class="w-[85vw] shrink-0 snap-start sm:w-[45vw] lg:w-auto lg:shrink">
```

---

## CSS GRID ADVANCED PATTERNS (Andrew)

### The Intrinsically Responsive Grid

The most powerful single line of CSS for responsive grids — **no media queries**:

```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(min(250px, 100%), 1fr));
  gap: var(--s1);
}
```

**How it works:**
- `auto-fit` — creates as many columns as will fit
- `minmax(250px, 1fr)` — each column is at least 250px, grows equally
- `min(250px, 100%)` — prevents overflow when container is < 250px
- Result: 4 columns at 1280px, 3 at 1024px, 2 at 768px, 1 at 375px — all automatic

**Tailwind (close equivalent):**
```html
<div class="grid grid-cols-[repeat(auto-fit,minmax(min(250px,100%),1fr))] gap-6">
```

### Named Grid Areas

For complex page layouts (header, sidebar, main, footer):

```css
.page {
  display: grid;
  grid-template-areas:
    "header header"
    "sidebar main"
    "footer footer";
  grid-template-columns: 280px 1fr;
  grid-template-rows: auto 1fr auto;
  min-block-size: 100vh;
}
.header  { grid-area: header; }
.sidebar { grid-area: sidebar; }
.main    { grid-area: main; }
.footer  { grid-area: footer; }

/* Collapse to single column on mobile */
@media (max-width: 768px) {
  .page {
    grid-template-areas:
      "header"
      "main"
      "sidebar"
      "footer";
    grid-template-columns: 1fr;
  }
}
```

### The `fr` Unit (Andrew)

`fr` = fraction of remaining space after fixed and content-sized tracks are placed.

```css
/* 3 equal columns */
grid-template-columns: 1fr 1fr 1fr;

/* Sidebar (fixed) + content (flexible) */
grid-template-columns: 280px 1fr;

/* Content-sized + remainder */
grid-template-columns: auto 1fr;

/* Golden ratio columns */
grid-template-columns: 1fr 1.618fr;
```

### Grid Alignment

```css
.grid {
  /* Align all items within their cells */
  align-items: start;     /* Block axis (vertical) */
  justify-items: stretch; /* Inline axis (horizontal) */

  /* Align the grid itself within its container */
  align-content: start;
  justify-content: center;
}

/* Align individual items */
.featured {
  align-self: center;
  justify-self: end;
}
```

### Subgrid (Grid Level 2 — Andrew)

Allows nested grids to **inherit parent grid tracks** — aligns child content with the parent's columns.

```css
.parent {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--s1);
}
.child {
  display: grid;
  grid-column: span 3;
  grid-template-columns: subgrid; /* Inherits parent's 3 columns */
}
```

**Use case:** Cards in a grid where titles, descriptions, and CTAs align across cards — even when content lengths differ.

**Browser support:** All modern browsers (Chrome 117+, Firefox 71+, Safari 16+).

---

## CONTAINER QUERIES (Every Layout — The Container)

Container queries let components respond to their **parent container's size** — not the viewport. This is the final piece of intrinsic design.

### Setup

```css
/* Make an element a container query context */
.container-context {
  container-type: inline-size;
  container-name: card; /* Optional: named container */
}

/* Query the container's width */
@container (min-width: 400px) {
  .card-content {
    display: grid;
    grid-template-columns: 200px 1fr;
  }
}

@container card (min-width: 600px) {
  .card-content {
    grid-template-columns: 300px 1fr 200px;
  }
}
```

### When to Use Container Queries vs Media Queries

| Use Case | Container Query | Media Query |
|----------|----------------|-------------|
| Card layout changing based on where it's placed | Yes | No |
| Navigation changing from mobile to desktop | No | Yes |
| Sidebar content adapting when sidebar narrows | Yes | No |
| Full-page layout structure changes | No | Yes |
| Component in a design system used in multiple contexts | Yes | No |

**Rule of thumb:** If the component appears in different-width containers on the same viewport, use container queries. If it only changes with the overall viewport, use media queries.

### Tailwind Container Queries

```html
<!-- Parent: define as container -->
<div class="@container">
  <!-- Child: respond to container width -->
  <div class="flex flex-col @md:flex-row @lg:grid @lg:grid-cols-3">
```

Requires `@tailwindcss/container-queries` plugin.

---

## THE MEASURE AXIOM (Every Layout)

The single most important typographic rule: **limit line length to 60–75 characters**.

```css
/* Apply measure to all text-containing elements */
p, h1, h2, h3, h4, h5, h6, li, figcaption, blockquote, dt, dd {
  max-inline-size: var(--measure, 60ch);
}
```

**Why `ch` not `px`?** The `ch` unit equals the width of the "0" character in the current font. It scales with font size — a heading with `font-size: 2.5rem` and `max-inline-size: 60ch` will be physically wider than body text with the same `60ch`, but both will have ~60 characters per line.

**The `ch` unit makes responsive typography automatic.** No breakpoints needed for text width — it's always proportional to the text itself.

---

## MODULAR SCALE (Every Layout)

A modular scale produces harmonious spacing and sizing by multiplying a base value by a consistent ratio.

### Scale Calculation

```
Ratio: 1.5 (Perfect Fifth — musical term)
Base: 1rem (user's default font size)

Scale points:
--s-2: 0.444rem  (1 / 1.5 / 1.5)
--s-1: 0.667rem  (1 / 1.5)
--s0:  1rem       (base)
--s1:  1.5rem     (1 × 1.5)
--s2:  2.25rem    (1 × 1.5²)
--s3:  3.375rem   (1 × 1.5³)
--s4:  5.063rem   (1 × 1.5⁴)
--s5:  7.594rem   (1 × 1.5⁵)
```

### Common Ratios

| Ratio | Name | Feel |
|-------|------|------|
| 1.2 | Minor Third | Tight, compact — dashboards |
| 1.25 | Major Third | Balanced — most websites |
| 1.333 | Perfect Fourth | Generous — editorial |
| 1.5 | Perfect Fifth | Bold — landing pages |
| 1.618 | Golden Ratio | Classical — luxury brands |

### Font Size + Spacing Derived from One Scale

```css
:root {
  --ratio: 1.25;
  --s0: 1rem;
  /* Spacing */
  --s1: calc(var(--s0) * var(--ratio));
  --s2: calc(var(--s1) * var(--ratio));
  --s3: calc(var(--s2) * var(--ratio));
  /* Font sizes use the same scale */
  --font-small: calc(var(--s0) / var(--ratio));
  --font-base: var(--s0);
  --font-h4: var(--s1);
  --font-h3: var(--s2);
  --font-h2: var(--s3);
  --font-h1: calc(var(--s3) * var(--ratio));
}
```

One ratio governs both spacing and typography → automatic visual harmony.

---

## INTRINSIC FLUID SIZING

### Viewport-Relative Root Font Size (Every Layout)

Instead of breakpoint-based font scaling, use `calc()` to create a fluid base:

```css
:root {
  font-size: calc(1rem + 0.5vw);
}
```

- At 320px viewport: `16px + 1.6px = 17.6px`
- At 1280px viewport: `16px + 6.4px = 22.4px`
- The `1rem` ensures it **never drops below** the user's chosen default
- All `rem`-based values scale proportionally — the entire interface is fluid

**With clamp (preferred — explicit bounds):**
```css
:root {
  font-size: clamp(1rem, 0.875rem + 0.5vw, 1.375rem);
}
```

### Never Use `px` for Font Sizes (Every Layout)

> "Setting fonts using `px` makes browsers assume you want to fix the fonts at that size. The font size chosen by the user in their browser settings is disregarded."

More users adjust their default font size than use Edge or IE combined. Using `rem` and `em` respects user preferences. Using `px` overrides them.

**Rules:**
- Font sizes: always `rem` or `em`
- Spacing (margin, padding, gap): always `rem` (or modular scale custom properties)
- Max-width for text: always `ch`
- Media queries: `em` (not `px` — they scale with user font preferences)
- Border, outline, box-shadow: `px` is acceptable (these are visual chrome, not content)

---

## ANTI-PATTERNS

| Anti-Pattern | Why It's Bad | Intrinsic Alternative |
|-------------|-------------|----------------------|
| Fixed widths (`width: 400px`) | Breaks on any screen that isn't 400px | `max-inline-size` + `flex-basis` |
| Fixed heights (`height: 300px`) | Content overflow, truncation | `min-block-size` or `aspect-ratio` |
| Breakpoint-driven column changes only | Arbitrary, doesn't respond to content | `repeat(auto-fit, minmax())` |
| `px` for font sizes | Ignores user preferences, breaks zoom | `rem`, `em`, `clamp()` |
| Styling components monolithically | Duplicated layout code across components | Compose layout primitives |
| Using `float` for layout | Fragile, requires clearfix hacks | Flexbox or Grid |
| `!important` for overrides | Specificity wars | Use cascade, custom properties |
| Negative margins for spacing | Fragile, breaks at boundaries | `gap` property |

---

## IMPLEMENTATION CHECKLIST

- [ ] **Modular scale** defined in `:root` custom properties (ratio + base)
- [ ] **Measure axiom** applied to all text elements (`max-inline-size: 60ch`)
- [ ] **Logical properties** used instead of physical (block/inline not top/left)
- [ ] **No `px` for font sizes** — `rem`, `em`, `clamp()` only
- [ ] **Fluid root font size** via `calc(1rem + 0.5vw)` or `clamp()`
- [ ] **Intrinsic grid** uses `repeat(auto-fit, minmax())` — no breakpoint needed
- [ ] **Stack primitive** used for all vertical spacing (not per-element margins)
- [ ] **Sidebar pattern** collapses without media query
- [ ] **Container queries** used for components in multiple contexts
- [ ] **`gap` property** used everywhere (not margin hacks)
- [ ] **Subgrid** used for cross-card alignment in grids
- [ ] **Reel** used for horizontal scrolling (scroll-snap, not JS carousel)
- [ ] **`100svh`** used instead of `100vh` for mobile viewport
