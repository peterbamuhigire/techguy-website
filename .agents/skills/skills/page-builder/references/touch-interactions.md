---
title: Touch & Mobile Interaction Patterns
description: Touch target sizing, thumb zones, gesture patterns, mobile keyboard optimisation, device-native inputs, and haptic feedback. Apply to every mobile-facing component.
sources: Will Grant "101 UX Principles" (2018) + Adham Dannaway "Practical UI" (2022) + Lisandra Maioli "Fixing Bad UX Designs" (2018) + Adrian Kuleszo "How to Design Better UI Components 3.0" (2024)
---

# Touch & Mobile Interaction Patterns

Over 60% of web traffic is mobile. Touch interaction is fundamentally different from mouse interaction — there is no hover state, fingers are imprecise, and users operate with one hand in most contexts. Design for touch first.

---

## TOUCH TARGET SIZING (MANDATORY)

### Minimum Sizes

| Element | Minimum Size | Recommended | Tailwind |
|---------|-------------|-------------|----------|
| Buttons | 44 × 44px | 48 × 48px | `min-h-[44px] min-w-[44px]` |
| Links in body text | 44px tap height | 48px | `py-2` on inline links |
| Form inputs | 44px height | 48–56px | `h-12` or `h-14` |
| Icon buttons | 44 × 44px | 48 × 48px | `p-3` on 24px icon |
| Checkboxes / radios | 44 × 44px tap area | Full row clickable | `min-h-[44px]` on label |
| Navigation links | 44px height | 48px | `py-3` |
| Close / dismiss buttons | 44 × 44px | 48 × 48px | `p-3` |

**Rules (Grant, Ch 69 + Dannaway):**
- The **entire row** of a checkbox or radio must be tappable, not just the control
- The visual size can be smaller than 44px — but the **tap target** must extend to 44px minimum using padding
- Space between adjacent touch targets: **minimum 8px** to prevent accidental taps
- Make the whole button clickable, not just the text (Grant, Ch 9)
- Generous padding is usability, not decoration. Tight hit areas create hesitation and mis-taps.

```html
<!-- Icon button with sufficient tap area -->
<button class="flex h-12 w-12 items-center justify-center rounded-full
               hover:bg-neutral-100 dark:hover:bg-neutral-800"
        aria-label="Close menu">
  <svg class="h-5 w-5"><!-- X icon --></svg>
</button>
```

---

## THUMB ZONE MAPPING

Most users hold their phone in one hand and navigate with their thumb. Design primary actions within the natural thumb reach zone.

### The Thumb Zone (Portrait, Right-Handed)

```
┌─────────────────────┐
│   HARD TO REACH      │  ← Secondary nav, settings, notifications
│                       │
├───────────────────────┤
│   COMFORTABLE         │  ← Content reading area
│                       │
│                       │
├───────────────────────┤
│   EASY / NATURAL      │  ← Primary CTAs, main navigation
│                       │
└─────────────────────── ┘
```

**Rules:**
- **Primary CTA** — place in the bottom third of the screen (easy thumb reach)
- **Destructive actions** — place in the hard-to-reach zone (top) to prevent accidental taps
- **Sticky bottom CTAs** — effective for conversion actions (Add to Cart, Contact Us, Submit)
- **Bottom navigation** — preferred over top hamburger for frequently-used actions
- Sticky CTAs must never cover validation errors, helper text, consent banners, or the currently focused field
- When the keyboard opens, move, hide, or resize the sticky CTA so it does not obscure the task

### Sticky Bottom CTA Pattern
```html
<!-- Mobile sticky CTA bar -->
<div class="fixed bottom-0 left-0 right-0 z-40 border-t border-neutral-200
            bg-white/95 p-4 backdrop-blur-sm dark:border-neutral-700
            dark:bg-neutral-900/95 lg:hidden"
     style="padding-bottom: calc(1rem + env(safe-area-inset-bottom))">
  <a href="/contact" class="btn btn-primary block w-full text-center">
    Get a Free Quote
  </a>
</div>
```

- Only show on mobile (`lg:hidden`)
- Account for home indicator: `env(safe-area-inset-bottom)`
- Use `backdrop-blur` for a polished floating effect
- Add `border-t` to separate from content
- Leave enough bottom padding in page content so the sticky bar does not hide the final form field or message

---

## TOUCH VS MOUSE: KEY DIFFERENCES

| Mouse | Touch | Design Implication |
|-------|-------|-------------------|
| Hover state exists | No hover | Never hide information behind hover — use tap to reveal |
| Precise cursor (1px) | Imprecise finger (~44px) | Larger targets, more spacing between interactive elements |
| Right-click context menu | Long-press (uncommon) | Don't rely on right-click equivalents |
| Scroll wheel | Swipe gesture | Support momentum scrolling, pull-to-refresh |
| Double-click | Double-tap (zoom) | Avoid double-tap actions — conflicts with native zoom |
| Drag-and-drop easy | Drag conflicts with scroll | Avoid drag interactions on mobile; use tap alternatives |
| Cursor changes signal | No cursor feedback | Use visual affordances (button shapes, underlines, colours) |

### Hover Fallback Strategy
```css
/* Desktop: hover effect */
@media (hover: hover) {
  .card:hover { transform: translateY(-4px); box-shadow: ...; }
}

/* Touch: use active state instead */
@media (hover: none) {
  .card:active { transform: scale(0.98); }
}
```

- `@media (hover: hover)` — device has a primary pointing device that supports hover
- `@media (hover: none)` — touch-only device, no hover capability
- Use these media queries to deliver appropriate interactions per device type

---

## MOBILE KEYBOARD OPTIMISATION

### `inputmode` Attribute (MANDATORY for Mobile Forms)

The `inputmode` attribute controls which keyboard layout appears on mobile. Always set it.

| Input Type | `inputmode` | Keyboard Shown | Example |
|-----------|-------------|----------------|---------|
| Email | `email` | @ and . keys prominent | `<input type="email" inputmode="email">` |
| Phone | `tel` | Number pad with +, -, () | `<input type="tel" inputmode="tel">` |
| Number (integer) | `numeric` | Number pad only | `<input inputmode="numeric" pattern="[0-9]*">` |
| Number (decimal) | `decimal` | Number pad with decimal point | `<input inputmode="decimal">` |
| URL | `url` | .com, /, : keys prominent | `<input type="url" inputmode="url">` |
| Search | `search` | Shows "Search" on return key | `<input type="search" inputmode="search">` |
| General text | `text` | Standard keyboard (default) | `<input type="text">` |

### `enterkeyhint` Attribute

Controls the label on the mobile keyboard's return/enter key:

| Value | Shows | Use When |
|-------|-------|----------|
| `enter` | "Return" | Multi-line text (textarea) |
| `done` | "Done" | Last field in a form |
| `go` | "Go" | URL or search input |
| `next` | "Next" | Moving to next field in a multi-field form |
| `search` | "Search" | Search input |
| `send` | "Send" | Chat or message input |

```html
<input type="email" inputmode="email" enterkeyhint="next"
       autocomplete="email" placeholder="you@example.com">
```

### `autocomplete` Attribute (Grant, Ch 34: Device-Native Input)

Let the browser/device auto-fill known values. This dramatically reduces friction on mobile.

| Field | `autocomplete` Value |
|-------|---------------------|
| Full name | `name` |
| Email | `email` |
| Phone | `tel` |
| Street address | `street-address` |
| City | `address-level2` |
| Country | `country-name` |
| Postal code | `postal-code` |
| Credit card number | `cc-number` |
| Credit card expiry | `cc-exp` |
| Credit card CVC | `cc-csc` |
| New password | `new-password` |
| Current password | `current-password` |
| One-time code | `one-time-code` |

**Rules:**
- Always allow paste into password fields (Grant, Ch 36) — password managers depend on this
- Never clear user-entered data unless specifically asked to (Grant, Ch 38)
- Be case-insensitive for emails, usernames, and search (Grant, Ch 43)
- Allow phone numbers in any format — parse them server-side (Grant, Ch 49)
- Use native date pickers only when the browser's implementation is good; otherwise use 3 text fields for DOB

---

## GESTURE PATTERNS

### Supported Gestures for Static Websites

| Gesture | Use Case | Implementation |
|---------|----------|---------------|
| **Tap** | Primary interaction — buttons, links, selections | Standard `click` event |
| **Swipe horizontal** | Image galleries, carousels (user-controlled) | CSS scroll-snap + `overflow-x: auto` |
| **Scroll vertical** | Page content | Native — never hijack scroll |
| **Pull-to-refresh** | Feed-style content (if applicable) | Native browser behaviour |
| **Pinch-to-zoom** | Images, maps | Native — NEVER disable (Grant, Ch 65) |
| **Long-press** | Avoid — no standard web behaviour | Don't use — conflicts with native text selection |

### Swipeable Gallery (CSS-Only)
```html
<div class="flex snap-x snap-mandatory gap-4 overflow-x-auto scroll-smooth
            scrollbar-hide px-4 pb-4 -mx-4">
  <div class="w-[85vw] shrink-0 snap-center sm:w-[45vw] lg:w-auto lg:shrink">
    <!-- Card content -->
  </div>
  <!-- More cards... -->
</div>
```

**Rules:**
- Use `scroll-snap` for controlled swipe stops
- On desktop (`lg:`), convert to a standard grid — swipe is a mobile pattern
- Show partial next card (85vw, not 100vw) to signal "swipe for more"
- Never require swipe to access critical content — it must be reachable via scroll or navigation

### Gestures to AVOID on Web
- **Double-tap** — conflicts with native zoom
- **Long-press** — conflicts with native text selection and context menu
- **Multi-finger gestures** — not reliably detected on web
- **Drag-and-drop** — conflicts with scroll; offer tap-based alternatives on mobile
- **Custom swipe detection via JS** — fragile, conflicts with native scroll; use CSS scroll-snap instead

---

## MOBILE-SPECIFIC INTERACTION RULES

### Never Disable Zoom (Grant, Ch 65)
```html
<!-- CORRECT -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- WRONG — accessibility violation -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
```
- Users with low vision depend on pinch-to-zoom
- WCAG 2.1 AA requires that zoom is not disabled
- If zoom breaks your layout, your layout is the problem

### Don't Move the UI While the User is Using It (Grant, Ch 40)
- Never insert content above the user's current scroll position (causes layout shift)
- Never auto-scroll while the user is reading
- Cookie banners: **position at bottom**, not top — top banners push content down
- Lazy-loaded images: always set explicit `width` and `height` to reserve space (prevents CLS)

### Touch-Friendly Scrollable Areas
- Use `overflow-x: auto` with `-webkit-overflow-scrolling: touch` for momentum scrolling
- Add `scrollbar-hide` (Tailwind plugin) for cleaner mobile appearance
- Indicate scrollability: show partial next item or add subtle scroll indicator dots

---

## MOBILE FORM INTERACTION

### Virtual Keyboard Management
- When keyboard opens, ensure the **active field is visible** above the keyboard
- Use `scroll-margin-bottom: 50vh` on form fields so they scroll into view with room
- Fixed bottom CTAs must **hide or adjust** when keyboard is open to avoid covering the input
- Test on both iOS (keyboard pushes viewport) and Android (keyboard overlays viewport)

### Input Best Practices
- Input height: **48–56px** on mobile (comfortable tap + thumb typing)
- Use `font-size: 16px` minimum on inputs — iOS zooms in on fields smaller than 16px
- Field spacing: **16–24px** between fields (enough to tap without hitting adjacent fields)
- Multi-step forms: show step count ("Step 2 of 4") and named progress indicator

---

## DEVICE CAPABILITY DETECTION

### CSS Feature Queries
```css
/* Touch-only device */
@media (pointer: coarse) {
  .touch-target { min-height: 48px; }
}

/* Fine pointer (mouse) */
@media (pointer: fine) {
  .touch-target { min-height: 36px; }
}

/* Device has hover capability */
@media (hover: hover) {
  .card:hover { /* hover effects */ }
}

/* Device does NOT have hover */
@media (hover: none) {
  .card { /* always show info, no hover reveal */ }
}
```

### JavaScript Detection
```javascript
// Check if device supports touch
const isTouchDevice = 'ontouchstart' in window || navigator.maxTouchPoints > 0;

// Check for reduced motion preference
const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
```

---

## MOBILE INTERACTION CHECKLIST

- [ ] All touch targets **44×44px minimum** (48px recommended)
- [ ] **8px minimum spacing** between adjacent interactive elements
- [ ] Primary CTA in **thumb-friendly zone** (bottom third)
- [ ] No information hidden behind **hover-only** interactions
- [ ] `inputmode` set on **every form field**
- [ ] `autocomplete` set on **every form field** with known values
- [ ] **Pinch-to-zoom not disabled** (`user-scalable=no` never used)
- [ ] Input fields use **16px+ font size** (prevents iOS auto-zoom)
- [ ] Galleries use **CSS scroll-snap**, not JS swipe detection
- [ ] Sticky CTAs account for **safe-area-inset-bottom**
- [ ] **No content shifts** when images lazy-load (explicit dimensions set)
- [ ] Form submit button is **full-width on mobile** (`w-full md:w-auto`)
- [ ] Virtual keyboard doesn't **obscure the active field**
- [ ] `@media (hover: hover)` used for **hover-specific styles**
