---
title: Motion Design & Micro-Interactions
description: Animation timing system, micro-interaction patterns, transition performance rules, and prefers-reduced-motion implementation. Complements the "no auto-moving elements" rule in design-system/SKILL.md.
sources: Adham Dannaway "Practical UI" (2022) + Adrian Kuleszo "How to Design Better UI Components 3.0" (2024) + Will Grant "101 UX Principles" (2018) + Lisandra Maioli "Fixing Bad UX Designs" (2018)
---

# Motion Design & Micro-Interactions

Animation is a **communication tool**, not decoration. Every animation must have a purpose: guide attention, confirm actions, show relationships, or smooth transitions. If it doesn't serve one of these, remove it.

---

## CORE PRINCIPLES

1. **User-initiated only** — animation responds to user action (click, scroll, hover, focus). Never auto-play, auto-rotate, or auto-scroll (MANDATORY — see design-system/SKILL.md).
2. **Functional first** — animation communicates state change, spatial relationship, or feedback. Purely decorative animation is noise.
3. **Fast by default** — most UI transitions should be imperceptible (150–300ms). Users should never wait for an animation to finish before they can act.
4. **Respect user preferences** — always honour `prefers-reduced-motion`. This is not optional.
5. **Performance matters** — only animate `transform` and `opacity` (GPU-composited). Never animate `width`, `height`, `top`, `left`, `margin`, or `padding`.

---

## TIMING SYSTEM

### Duration Tokens

| Token | Duration | Easing | Use for |
|-------|----------|--------|---------|
| `instant` | 0ms | — | Immediate state changes (checkbox toggle, radio select) |
| `micro` | 100ms | `ease-out` | Hover colour shifts, focus rings, opacity changes |
| `fast` | 150ms | `ease-out` | Button press feedback, icon changes, tooltip show |
| `normal` | 250ms | `ease-in-out` | Dropdown open, accordion expand, tab switch |
| `slow` | 400ms | `ease-in-out` | Modal open/close, sidebar slide, page-level transitions |
| `emphasis` | 600ms | `cubic-bezier(0.16, 1, 0.3, 1)` | Scroll-triggered entrance animations, hero reveals |

**Rules (Dannaway):**
- Small UI feedback (hover, focus, press): **100–200ms** — if users notice the delay, it's too slow
- State changes (accordion, dropdown, modal): **200–400ms** — enough to track, not enough to wait
- Entrance animations (scroll reveal): **400–800ms** — deliberate but not sluggish
- Never exceed **1000ms** for any single animation — users will think the UI is broken

### Easing Functions

| Name | CSS | Feel | Use for |
|------|-----|------|---------|
| `ease-out` | `cubic-bezier(0, 0, 0.58, 1)` | Quick start, gentle stop | Elements entering (appear, slide in, fade in) |
| `ease-in` | `cubic-bezier(0.42, 0, 1, 1)` | Slow start, quick end | Elements leaving (disappear, slide out, fade out) |
| `ease-in-out` | `cubic-bezier(0.42, 0, 0.58, 1)` | Smooth both ends | State transitions (expand/collapse, position changes) |
| `spring` | `cubic-bezier(0.16, 1, 0.3, 1)` | Overshoot + settle | Emphasis animations, playful interactions |
| `linear` | `linear` | Constant speed | Progress bars, loading indicators only |

**Never use `linear`** for UI transitions — it feels robotic. Real objects accelerate and decelerate.

---

## MICRO-INTERACTION PATTERNS

### Button Feedback
```css
.btn {
  transition: background-color 150ms ease-out,
              transform 150ms ease-out,
              box-shadow 150ms ease-out;
}
.btn:hover {
  /* Subtle lift OR colour shift — not both */
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}
.btn:active {
  transform: translateY(0);
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}
```
- Hover: subtle lift (`translateY(-1px)`) + shadow increase — signals "this is interactive"
- Active/pressed: push down (`translateY(0)` or `scale(0.98)`) — confirms click registered
- Never animate button width or layout — only `transform`, `opacity`, `box-shadow`, `background-color`

### Card Hover
```css
.card {
  transition: transform 250ms ease-out, box-shadow 250ms ease-out;
}
.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 24px rgba(0,0,0,0.12);
}
```
- Lift effect: **2–6px translateY** maximum (more feels exaggerated)
- Image zoom inside card: `scale(1.05)` over `500ms` with `overflow-hidden` on container
- **Never scale the entire card** — only lift it or zoom the image within

### Link Hover
```css
a {
  text-decoration: underline;
  text-underline-offset: 3px;
  transition: text-decoration-color 150ms ease-out, color 150ms ease-out;
}
a:hover {
  text-decoration-color: transparent;
  /* OR: shift to a lighter/darker variant of the link colour */
}
```

### Focus Ring
```css
:focus-visible {
  outline: 2px solid var(--color-accent);
  outline-offset: 2px;
  border-radius: 4px;
  /* No transition on focus ring — it must appear instantly */
}
```
- Focus ring appears **instantly** (no transition) — keyboard users need immediate feedback
- Use `:focus-visible` (not `:focus`) to avoid showing rings on mouse click

### Form Field Focus
```css
input, textarea, select {
  transition: border-color 150ms ease-out, box-shadow 150ms ease-out;
  border: 1.5px solid var(--color-border);
}
input:focus {
  border-color: var(--color-accent);
  box-shadow: 0 0 0 3px rgba(var(--color-accent-rgb), 0.15);
}
```

### Toggle / Switch
```css
.toggle-thumb {
  transition: transform 200ms cubic-bezier(0.16, 1, 0.3, 1);
}
.toggle[aria-checked="true"] .toggle-thumb {
  transform: translateX(20px);
}
```
- Use spring easing for toggle — slight overshoot feels satisfying
- Background colour transition: 200ms ease-in-out

---

## SCROLL-TRIGGERED ANIMATIONS

Only type of "auto" animation permitted — because user controls the trigger (scrolling).

### Entrance Pattern
```css
.reveal {
  opacity: 0;
  transform: translateY(24px);
  transition: opacity 600ms ease-out, transform 600ms ease-out;
}
.reveal.visible {
  opacity: 1;
  transform: translateY(0);
}
```

```javascript
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      observer.unobserve(entry.target); // animate once only
    }
  });
}, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });

document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
```

### Stagger Pattern
```css
.reveal:nth-child(1) { transition-delay: 0ms; }
.reveal:nth-child(2) { transition-delay: 100ms; }
.reveal:nth-child(3) { transition-delay: 200ms; }
.reveal:nth-child(4) { transition-delay: 300ms; }
```
- Maximum stagger: **4–6 items** — beyond that, the last items feel delayed
- Maximum total stagger time: **500ms** — after that users are waiting, not delighting
- Stagger interval: **80–120ms** between items

### What to Animate on Scroll
- **Yes:** Section headings, cards, images, stats/counters, testimonials
- **No:** Navigation, footer, form fields, error messages, breadcrumbs, legal text
- **Rule:** Content the user came to read should not be gated behind animation. If the animation prevents reading, it's wrong.

---

## MODAL & OVERLAY ANIMATIONS

### Modal Open
```css
.modal-backdrop {
  opacity: 0;
  transition: opacity 250ms ease-out;
}
.modal-backdrop.active { opacity: 1; }

.modal-content {
  opacity: 0;
  transform: translateY(16px) scale(0.98);
  transition: opacity 250ms ease-out, transform 250ms ease-out;
}
.modal-content.active {
  opacity: 1;
  transform: translateY(0) scale(1);
}
```

### Modal Close
- Close faster than open: **200ms** (ease-in, not ease-out)
- Backdrop fades last, content disappears first
- Never block user from closing — close animation must not delay the next action

### Mobile Sheet (Bottom Drawer)
```css
.sheet {
  transform: translateY(100%);
  transition: transform 300ms cubic-bezier(0.16, 1, 0.3, 1);
}
.sheet.open {
  transform: translateY(0);
}
```

---

## LOADING & PROGRESS ANIMATIONS

### Spinner (Indeterminate)
```css
.spinner {
  width: 24px; height: 24px;
  border: 2.5px solid var(--color-border);
  border-top-color: var(--color-accent);
  border-radius: 50%;
  animation: spin 800ms linear infinite;
}
@keyframes spin { to { transform: rotate(360deg); } }
```
- Show spinner after **300ms delay** — if the action completes faster, no spinner needed
- Size: 20–24px inline, 32–48px for full-page loading
- **Never use animated looping progress bars** (Grant, Ch 57) — they provide no information

### Skeleton Screens (Preferred over Spinners)
```css
.skeleton {
  background: linear-gradient(90deg,
    var(--color-surface) 25%,
    var(--color-surface-alt) 50%,
    var(--color-surface) 75%
  );
  background-size: 200% 100%;
  animation: shimmer 1.5s ease-in-out infinite;
  border-radius: 4px;
}
@keyframes shimmer {
  0% { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}
```
- Skeleton shapes must **match the layout** that will replace them
- Transition from skeleton → real content: fade in over **200ms**

### Progress Bar (Determinate)
- Always show **numeric percentage** alongside the bar (Grant, Ch 58)
- Fill animation: `transition: width 300ms ease-out`
- Use `linear` easing only for the continuous fill
- Green for completion, brand colour for in-progress

---

## PERFORMANCE RULES

### Only Animate Composited Properties
**Safe to animate** (GPU-composited, no layout/paint):
- `transform` (translate, scale, rotate)
- `opacity`
- `filter` (blur, brightness — use sparingly)

**Never animate** (triggers layout reflow):
- `width`, `height`, `max-width`, `max-height`
- `top`, `right`, `bottom`, `left`
- `margin`, `padding`
- `border-width`, `font-size`

### will-change
```css
/* Only add when animation is about to start */
.card:hover { will-change: transform; }

/* Never set globally — wastes GPU memory */
/* BAD: * { will-change: transform; } */
```

### Animation Budget
- Maximum **3 simultaneous animations** in any viewport at once
- Stagger groups so only 1 group animates at a time
- Pause off-screen animations (IntersectionObserver handles this)
- Test on low-end devices — if animation drops below 60fps, simplify or remove

---

## `prefers-reduced-motion` IMPLEMENTATION (MANDATORY)

### Global Disable
```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

### Selective Approach (Preferred)
```css
/* Default: no motion */
.reveal { opacity: 1; transform: none; }

/* Only add motion when user hasn't opted out */
@media (prefers-reduced-motion: no-preference) {
  .reveal {
    opacity: 0;
    transform: translateY(24px);
    transition: opacity 600ms ease-out, transform 600ms ease-out;
  }
  .reveal.visible {
    opacity: 1;
    transform: translateY(0);
  }
}
```

### What Reduced Motion Means
- **Remove:** Parallax, scroll-linked movement, entrance animations, hover zoom, stagger effects
- **Keep:** Instant state changes (colour shifts, opacity), focus rings, loading spinners (slowed)
- **Replace:** Slide-in → instant appear; zoom → fade; bounce → static
- **Never remove functionality** — only remove the motion. A dropdown must still open; it just appears instantly instead of sliding.

### JavaScript Check
```javascript
const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
if (!prefersReducedMotion) {
  // Initialize GSAP, IntersectionObserver animations, etc.
}
```

---

## ANTI-PATTERNS (NEVER DO)

| Anti-Pattern | Why It's Bad | Alternative |
|-------------|-------------|-------------|
| Auto-rotating carousels | Banner blindness, users can't read in time | Static hero or user-controlled tabs |
| Parallax scrolling | Motion sickness, performance hog, accessibility fail | Static backgrounds or subtle `translateY` on scroll |
| Bouncing scroll indicators | Annoys users, adds no value | Partial next-section visibility |
| Animated page transitions (SPA-style) | Slows navigation, breaks back button | Instant page loads (Astro default) |
| Hover-only animations on touch | Touch has no hover state | Make interactions tap-friendly |
| Loading animations > 1s without progress | Users think it's broken | Show skeleton or determinate progress |
| Animations that block interaction | User must wait to click/type | Allow interaction during animation |
| Spring animations on every element | Feels chaotic and toy-like | Reserve spring for 1–2 emphasis moments per page |
| **Bounce easing** (`ease-bounce`) | Dated, tacky — a 2015 trend that screams "template" | Use `ease-out-quart` or `ease-out-expo` for emphasis |
| **Elastic easing** (`ease-elastic`) | Toy-like, distracting — undermines professional tone | Use spring (`cubic-bezier(0.16, 1, 0.3, 1)`) for subtle overshoot |

---

## PERCEIVED PERFORMANCE

Animation isn't just about movement — it shapes how fast the interface *feels*.

### The 80ms Threshold
- Actions that complete within **80ms feel instant** — no animation needed
- Between 80ms–300ms: a subtle transition confirms the action happened
- Above 300ms: the user is consciously waiting — provide visual feedback

### Active vs Passive Waiting
- **Active waiting** (user sees progress): feels 40% shorter than actual time
- **Passive waiting** (blank screen): feels 40% longer than actual time
- Always prefer skeleton screens over empty loading states — they make waits feel active

### Easing Psychology
- **Ease-out** (fast start, slow end): feels responsive — "the interface is eager to help"
- **Ease-in** (slow start, fast end): feels sluggish — only use for elements leaving
- **Linear**: feels robotic and mechanical — only for progress bars and spinners
- **Ease-out-expo** (`cubic-bezier(0.16, 1, 0.3, 1)`): feels premium and intentional — best for emphasis

### Recommended Easing Curves

| Curve | CSS | Best For |
|-------|-----|----------|
| `ease-out-quart` | `cubic-bezier(0.25, 1, 0.5, 1)` | Standard UI transitions (enter, expand) |
| `ease-out-quint` | `cubic-bezier(0.22, 1, 0.36, 1)` | Smooth entrances, slide-ins |
| `ease-out-expo` | `cubic-bezier(0.16, 1, 0.3, 1)` | Emphasis, hero reveals, spring-like feel |
| `ease-in-quart` | `cubic-bezier(0.5, 0, 0.75, 0)` | Elements leaving (close, collapse) |

**Banned curves:** `bounce`, `elastic`, `back` (overshoot) on general UI. These feel dated and amateurish in 2026. The subtle overshoot of `ease-out-expo` achieves the same energy without the cartoon feel.

---

## MOTION TOKEN NAMING

Use semantic names for motion values in your design tokens, not raw numbers:

```css
:root {
  /* Durations */
  --duration-instant: 0ms;
  --duration-micro: 100ms;
  --duration-fast: 150ms;
  --duration-normal: 250ms;
  --duration-slow: 400ms;
  --duration-emphasis: 600ms;

  /* Easings */
  --ease-default: cubic-bezier(0.25, 1, 0.5, 1);      /* ease-out-quart */
  --ease-emphasis: cubic-bezier(0.16, 1, 0.3, 1);      /* ease-out-expo */
  --ease-enter: cubic-bezier(0.22, 1, 0.36, 1);        /* ease-out-quint */
  --ease-exit: cubic-bezier(0.5, 0, 0.75, 0);          /* ease-in-quart */
}
```

**Rule:** Reference tokens in all animations — never hard-code `300ms ease-in-out` directly. Tokens ensure consistency and make timing adjustments project-wide.
