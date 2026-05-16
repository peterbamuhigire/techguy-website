---
title: ARIA & Advanced Accessibility Patterns
description: Focus management, live regions, accessible modals/tabs/accordions/disclosure widgets, keyboard navigation, and skip links. Extends the WCAG AA foundation in universal-guidelines.
sources: Will Grant "101 UX Principles" (2018) + Lisandra Maioli "Fixing Bad UX Designs" (2018) + Adham Dannaway "Practical UI" (2022)
---

# ARIA & Advanced Accessibility Patterns

WCAG 2.1 AA compliance is the baseline (see `universal-guidelines/UNIVERSAL-DESIGN-GUIDELINES.md`). This reference covers the **implementation patterns** for interactive components that require ARIA attributes, focus management, and keyboard support.

**First rule of ARIA:** Use native HTML elements whenever possible. `<button>`, `<a>`, `<input>`, `<select>`, `<details>` already have built-in accessibility. Only add ARIA when native elements can't do the job.

---

## SKIP LINKS (MANDATORY)

Every page must have a skip link as the **first focusable element** (Grant, Ch 63).

```html
<a href="#main-content"
   class="fixed left-2 top-2 z-[9999] -translate-y-full rounded-lg bg-neutral-900
          px-4 py-2 text-sm font-medium text-white transition-transform
          focus:translate-y-0 focus:ring-2 focus:ring-accent">
  Skip to content
</a>

<!-- Later in the page -->
<main id="main-content" tabindex="-1">
  <!-- Page content -->
</main>
```

**Rules:**
- Visually hidden by default, appears on keyboard focus (Tab key)
- Must skip navigation and go directly to `<main>` content
- Target element needs `tabindex="-1"` so focus can be programmatically set
- For long pages with multiple sections, consider additional skip links: "Skip to footer", "Skip to search"

---

## FOCUS MANAGEMENT

### Focus Ring Styling
```css
/* Only show focus ring on keyboard navigation, not mouse click */
:focus-visible {
  outline: 2px solid var(--color-accent);
  outline-offset: 2px;
  border-radius: 4px;
}

/* Remove default browser outline — :focus-visible handles it */
:focus:not(:focus-visible) {
  outline: none;
}
```

**Rules:**
- Focus ring must have **3:1 contrast ratio** against the background (WCAG 2.1 AA)
- Focus ring must be **visible in both light and dark mode**
- Never use `outline: none` without a `:focus-visible` replacement
- Tab order must follow **visual reading order** (left-to-right, top-to-bottom) — never use `tabindex` > 0

### Focus Trap (Modals & Dialogs)

When a modal opens, keyboard focus must be **trapped inside** — Tab cycles through modal elements only, not the background page.

```html
<div role="dialog" aria-modal="true" aria-labelledby="modal-title"
     class="fixed inset-0 z-50 flex items-center justify-center">
  <!-- Backdrop -->
  <div class="absolute inset-0 bg-black/50" aria-hidden="true"></div>

  <!-- Modal content -->
  <div class="relative z-10 max-w-md rounded-xl bg-white p-6 shadow-2xl dark:bg-neutral-800">
    <h2 id="modal-title" class="text-lg font-semibold">Confirm Action</h2>
    <p class="mt-2 text-sm text-neutral-500">Are you sure you want to proceed?</p>
    <div class="mt-6 flex gap-3">
      <button class="btn btn-secondary" data-close-modal>Cancel</button>
      <button class="btn btn-primary">Confirm</button>
    </div>
  </div>
</div>
```

**Focus trap implementation (Alpine.js):**
```html
<div x-data="{ open: false }"
     @keydown.escape.window="open = false">

  <button @click="open = true">Open Modal</button>

  <template x-if="open">
    <div role="dialog" aria-modal="true" aria-labelledby="modal-title"
         x-trap.noscroll="open"
         @click.self="open = false">
      <!-- x-trap handles focus trapping automatically -->
      <div class="modal-content">
        <h2 id="modal-title">Title</h2>
        <button @click="open = false">Close</button>
      </div>
    </div>
  </template>
</div>
```

**Focus trap rules:**
- On open: focus moves to the **first focusable element** inside the modal (or the close button)
- Tab cycles through modal elements only — never escapes to background
- Escape key closes the modal
- On close: focus returns to the **element that triggered the modal**
- Background content: add `aria-hidden="true"` and `inert` to prevent screen reader access
- Prevent background scroll: `overflow: hidden` on `<body>` while modal is open

---

## LIVE REGIONS

Live regions announce dynamic content changes to screen readers without requiring focus.

### Alert (Urgent, Interrupts)
```html
<!-- Form validation error — announces immediately -->
<div role="alert" class="text-red-600">
  Please enter a valid email address.
</div>
```
- `role="alert"` = `aria-live="assertive"` — interrupts whatever the screen reader is saying
- Use for: **error messages, critical warnings, time-sensitive alerts**
- Use sparingly — frequent assertive announcements are disorienting

### Status (Polite, Non-Interrupting)
```html
<!-- Toast notification — waits for screen reader to finish current speech -->
<div role="status" aria-live="polite" class="toast">
  Message sent successfully.
</div>
```
- `role="status"` = `aria-live="polite"` — waits for a natural pause to announce
- Use for: **success messages, status updates, search result counts**

### Live Region Rules
- The live region element must **exist in the DOM before content is added** — dynamically creating the container and content simultaneously won't trigger announcement
- Keep announcements **concise** — "3 results found" not "We searched our database and found 3 matching results for your query"
- Add `aria-atomic="true"` if the entire region should be re-read on any change (not just the changed portion)
- Never put an entire page section in a live region — only the changing text

**Pattern for dynamic content:**
```html
<!-- Empty container exists on page load -->
<div id="search-status" role="status" aria-live="polite" class="sr-only"></div>

<script>
// When search results update:
document.getElementById('search-status').textContent = '12 results found for "web design"';
</script>
```

---

## ACCESSIBLE DISCLOSURE (DETAILS/SUMMARY)

For FAQ sections, expandable content, and read-more patterns. Use native `<details>` — it has built-in keyboard support and ARIA semantics.

```html
<details class="group border-b border-neutral-200 dark:border-neutral-700">
  <summary class="flex cursor-pointer items-center justify-between py-4
                   text-lg font-medium text-neutral-900 dark:text-neutral-100
                   [&::-webkit-details-marker]:hidden">
    What services do you offer?
    <svg class="h-5 w-5 shrink-0 text-neutral-400 transition-transform
                group-open:rotate-180" viewBox="0 0 20 20" fill="currentColor">
      <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z"/>
    </svg>
  </summary>
  <div class="pb-4 text-neutral-600 dark:text-neutral-400">
    <p>We offer web design, branding, and digital marketing services...</p>
  </div>
</details>
```

**Rules:**
- Use native `<details>/<summary>` — no ARIA needed, keyboard works automatically
- Arrow keys are NOT expected for details — only Enter/Space to toggle
- Screen readers announce "collapsed/expanded" state automatically
- Chevron rotates on open (visual indicator) with `group-open:rotate-180`

---

## ACCESSIBLE TABS

When content is organised in tabs (e.g., pricing plans, service categories).

```html
<div x-data="{ activeTab: 'monthly' }">
  <!-- Tab list -->
  <div role="tablist" aria-label="Pricing plans" class="flex gap-1 rounded-lg bg-neutral-100 p-1">
    <button role="tab"
            :id="'tab-monthly'"
            :aria-selected="activeTab === 'monthly'"
            :aria-controls="'panel-monthly'"
            :tabindex="activeTab === 'monthly' ? 0 : -1"
            @click="activeTab = 'monthly'"
            @keydown.right="activeTab = 'annual'; $nextTick(() => $el.nextElementSibling.focus())"
            :class="activeTab === 'monthly' ? 'bg-white shadow-sm font-semibold' : 'text-neutral-500'"
            class="flex-1 rounded-md px-4 py-2 text-sm transition-colors">
      Monthly
    </button>
    <button role="tab"
            :id="'tab-annual'"
            :aria-selected="activeTab === 'annual'"
            :aria-controls="'panel-annual'"
            :tabindex="activeTab === 'annual' ? 0 : -1"
            @click="activeTab = 'annual'"
            @keydown.left="activeTab = 'monthly'; $nextTick(() => $el.previousElementSibling.focus())"
            :class="activeTab === 'annual' ? 'bg-white shadow-sm font-semibold' : 'text-neutral-500'"
            class="flex-1 rounded-md px-4 py-2 text-sm transition-colors">
      Annual
    </button>
  </div>

  <!-- Tab panels -->
  <div role="tabpanel" id="panel-monthly" aria-labelledby="tab-monthly"
       x-show="activeTab === 'monthly'" tabindex="0" class="mt-4">
    <!-- Monthly pricing content -->
  </div>
  <div role="tabpanel" id="panel-annual" aria-labelledby="tab-annual"
       x-show="activeTab === 'annual'" tabindex="0" class="mt-4">
    <!-- Annual pricing content -->
  </div>
</div>
```

**Keyboard navigation:**
- **Left/Right arrow** — move between tabs
- **Enter/Space** — activate focused tab
- **Home** — move to first tab
- **End** — move to last tab
- **Tab** — move focus from tab to tab panel content
- Only the **active tab** has `tabindex="0"` — inactive tabs have `tabindex="-1"`

---

## ACCESSIBLE ACCORDION

Multiple expandable sections where **one or more** can be open simultaneously (unlike tabs).

```html
<div class="divide-y divide-neutral-200 dark:divide-neutral-700">
  <div x-data="{ open: false }">
    <h3>
      <button @click="open = !open"
              :aria-expanded="open"
              aria-controls="accordion-1"
              class="flex w-full items-center justify-between py-4 text-left
                     text-lg font-medium text-neutral-900 dark:text-neutral-100">
        <span>What is your refund policy?</span>
        <svg :class="open && 'rotate-180'" class="h-5 w-5 shrink-0 transition-transform"
             viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z"/>
        </svg>
      </button>
    </h3>
    <div id="accordion-1" x-show="open" x-collapse role="region"
         aria-labelledby="accordion-heading-1"
         class="pb-4 text-neutral-600 dark:text-neutral-400">
      <p>We offer a 30-day money-back guarantee on all services...</p>
    </div>
  </div>
  <!-- More accordion items... -->
</div>
```

**Rules:**
- Trigger must be a `<button>` inside a heading element (screen readers can navigate by heading)
- `aria-expanded="true/false"` on the button communicates state
- `aria-controls` links button to the content panel
- Panel gets `role="region"` and `aria-labelledby` pointing to the heading
- Keyboard: Enter/Space toggles, no arrow key navigation needed (unlike tabs)

---

## SEMANTIC HTML CHECKLIST

Before adding any ARIA, ensure proper semantic HTML structure:

### Landmarks
```html
<header>        <!-- role="banner" — site header -->
<nav>           <!-- role="navigation" — main and secondary nav -->
<main>          <!-- role="main" — primary page content -->
<aside>         <!-- role="complementary" — sidebar -->
<footer>        <!-- role="contentinfo" — site footer -->
<section>       <!-- with aria-label for named sections -->
<form>          <!-- role="form" when it has aria-label -->
```

### Headings
- **One `<h1>` per page** — the page title
- Headings follow **sequential order** — never skip from H2 to H4
- Screen reader users navigate by headings — every section needs one
- Use headings for structure, not for styling (use CSS for visual size)

### Form Labels
```html
<!-- Explicit label (preferred) -->
<label for="name">Full name</label>
<input id="name" type="text" autocomplete="name">

<!-- Grouped fields -->
<fieldset>
  <legend>Contact preference</legend>
  <label><input type="radio" name="contact" value="email"> Email</label>
  <label><input type="radio" name="contact" value="phone"> Phone</label>
</fieldset>
```

### Links vs Buttons
- `<a>` — navigates to a URL (new page or anchor)
- `<button>` — performs an action (toggle, submit, open modal)
- Never use `<div onclick>` or `<span onclick>` for interactive elements
- Links must describe their destination (Grant, Ch 62): "Read our privacy policy" not "Click here"

---

## COLOUR & NON-VISUAL CUES

### Don't Use Colour Alone (Grant, Ch 64)
```html
<!-- BAD: Only colour indicates error -->
<input style="border-color: red">

<!-- GOOD: Colour + icon + text -->
<input class="border-red-500" aria-invalid="true" aria-describedby="error-msg">
<p id="error-msg" class="text-red-600">
  <svg class="inline h-4 w-4"><!-- Error icon --></svg>
  This field is required
</p>
```

- Error states: red border + icon + error message text
- Success states: green border + checkmark + confirmation text
- Required fields: "(required)" text label, not just `*` or colour
- Links: underline + colour (not colour alone) — both in light and dark mode

### Contrast Requirements (Summary)
| Element | Minimum Ratio | WCAG Level |
|---------|--------------|------------|
| Body text (≤18px) | 4.5:1 | AA |
| Large text (>18px bold, >24px regular) | 3:1 | AA |
| UI components (borders, icons) | 3:1 | AA |
| Focus indicators | 3:1 | AA |

---

## SCREEN READER UTILITIES

### Visually Hidden (Screen Reader Only)
```css
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}
```
Use for: labels that are visually obvious but need to be announced, icon-only button labels, skip links.

### aria-hidden
```html
<!-- Decorative icon — hide from screen reader -->
<svg aria-hidden="true" class="h-5 w-5">...</svg>
<span>Settings</span>

<!-- Interactive icon — needs label instead -->
<button aria-label="Settings">
  <svg aria-hidden="true" class="h-5 w-5">...</svg>
</button>
```

---

## ACCESSIBILITY TESTING CHECKLIST

- [ ] **Keyboard-only navigation** — can reach every interactive element with Tab, activate with Enter/Space
- [ ] **Focus order** follows visual layout — no jumping around
- [ ] **Focus visible** — clear ring on every focused element in both light and dark mode
- [ ] **Skip link** present and functional as first Tab stop
- [ ] **Headings** — one H1, sequential order, no skipping
- [ ] **Images** — all have `alt` text (decorative images: `alt=""` + `aria-hidden="true"`)
- [ ] **Form fields** — all have associated `<label>` with `for` attribute
- [ ] **Error messages** — `role="alert"`, include what/where/how-to-fix
- [ ] **Colour contrast** — 4.5:1 body text, 3:1 large text and UI elements
- [ ] **No colour-only** cues — always paired with icon, text, or pattern
- [ ] **Zoom 200%** — page remains usable when zoomed to 200%
- [ ] **Screen reader** — test with VoiceOver (Mac/iOS) or NVDA (Windows)
- [ ] **Modals** — focus trapped, Escape closes, focus returns to trigger
- [ ] **Live regions** — dynamic content announced appropriately
- [ ] **`prefers-reduced-motion`** — animations disabled/simplified
