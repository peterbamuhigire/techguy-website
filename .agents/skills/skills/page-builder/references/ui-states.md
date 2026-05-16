---
title: UI State Patterns
description: Skeleton screens, empty states, loading indicators, toast notifications, error recovery, and offline patterns. Every view has 5 states — design all of them.
sources: Will Grant "101 UX Principles" (2018) + Adham Dannaway "Practical UI" (2022) + Adrian Kuleszo "How to Design Better UI Components 3.0" (2024) + Lisandra Maioli "Fixing Bad UX Designs" (2018)
---

# UI State Patterns

Every view in a website has up to **5 possible states**. Designing only the "happy path" (ideal state with perfect data) is the most common UI mistake. Design all five.

---

## THE 5 STATES OF EVERY VIEW

| State | When | What User Sees |
|-------|------|----------------|
| **Ideal** | Content loaded, data present | Normal designed view |
| **Loading** | Content being fetched | Skeleton screen or spinner |
| **Empty** | No data exists yet | Helpful guidance, not blank void |
| **Error** | Something went wrong | Clear message + recovery action |
| **Partial** | Some data present, some missing | Graceful degradation |

---

## LOADING STATE PREFERENCE HIERARCHY

When choosing how to handle loading, follow this order — prefer the first option that applies:

1. **Optimistic updates** — show the result immediately, sync in background (best for form submissions, toggles, likes). If the server rejects, revert with an error toast
2. **Skeleton screens** — show content shapes before data loads (best for lists, cards, pages). Reduces perceived wait by 30-40%
3. **Inline spinners** — show on the specific element loading (best for button actions, single-field updates)
4. **Full-page spinner** — last resort; only when the entire page depends on a single API call with no layout to skeleton

**Never:** Show a blank white screen while loading. Always show *something* — even a progress bar.

---

## 1. LOADING STATES

### When to Show What

| Delay | Response |
|-------|----------|
| **< 300ms** | No indicator — content appears instantly |
| **300ms – 2s** | Skeleton screen or inline spinner |
| **2s – 10s** | Progress indicator with message |
| **> 10s** | Progress bar with percentage + cancel option |

### Skeleton Screens (Preferred)

Skeleton screens show the **shape of content** before it loads. They reduce perceived wait time by 30–40% compared to spinners (users feel the page is loading faster).

**Rules:**
- Skeleton shapes must **match the actual layout** — same heights, widths, and positions as real content
- Use 2–3 skeleton "bone" heights: one for headings, one for body text, one for images
- Animate with a subtle shimmer (left-to-right gradient sweep at 1.5s interval)
- Transition to real content with a **200ms fade** — never pop in instantly

**Astro/Tailwind pattern:**
```html
<!-- Skeleton card -->
<div class="animate-pulse space-y-4 rounded-xl bg-white p-6 shadow-sm dark:bg-neutral-800">
  <div class="h-48 rounded-lg bg-neutral-200 dark:bg-neutral-700"></div>
  <div class="h-5 w-3/4 rounded bg-neutral-200 dark:bg-neutral-700"></div>
  <div class="h-4 w-full rounded bg-neutral-200 dark:bg-neutral-700"></div>
  <div class="h-4 w-5/6 rounded bg-neutral-200 dark:bg-neutral-700"></div>
  <div class="h-10 w-32 rounded-lg bg-neutral-200 dark:bg-neutral-700"></div>
</div>
```

**What to skeleton:**
- Card grids, blog post lists, team member sections
- Image placeholders (use actual aspect ratio)
- Text blocks (use 2–3 lines at varying widths: 100%, 85%, 60%)

**What NOT to skeleton:**
- Navigation (should load instantly — it's in the HTML)
- Footer (below fold, not urgent)
- Static content that doesn't depend on data fetching

### Inline Spinners

Use when a **single element** is loading within an otherwise loaded page (e.g., form submission, button action).

```html
<button class="btn" disabled>
  <svg class="mr-2 h-4 w-4 animate-spin" viewBox="0 0 24 24">
    <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="3"
            fill="none" opacity="0.25"/>
    <path d="M12 2a10 10 0 0 1 10 10" stroke="currentColor" stroke-width="3"
          fill="none" stroke-linecap="round"/>
  </svg>
  Sending...
</button>
```

### Button State Requirements

Every important button must have these six states designed and implemented:

1. **Enabled** — clearly interactive and readable
2. **Hover** — immediate mouse feedback
3. **Focus** — visible keyboard focus ring with 3:1 contrast
4. **Pressed** — instant confirmation that the click/tap registered
5. **Disabled** — visually unavailable, paired with an explanation when not obvious
6. **Loading** — preserves the action label context, e.g. "Sending..." not spinner-only

**Rules:**
- Hover and focus are different states and must not share the exact same treatment.
- Loading states keep the original action recognizable; do not replace context with a bare spinner.
- Disabled is not a substitute for explanation. If users cannot infer why an action is unavailable, tell them.
- Focus must not be obscured by sticky headers, bottom CTA bars, cookie banners, or chat widgets.

**Rules (Grant):**
- **Never use animated looping progress bars** — they give no information about progress (Ch 57)
- Use a **spinner** for indeterminate waits (Ch 56) — the user knows "something is happening"
- Use a **linear progress bar** with percentage for determinate waits (Ch 55) — file uploads, multi-step processes
- Show a **numeric indicator** on progress bars (Ch 58) — "3 of 7" or "42%" not just a moving bar

---

## 2. EMPTY STATES

An empty state is **not an error** — it's an opportunity. When a view has no data (first visit, cleared filters, no search results), the empty state should **guide the user** toward action.

### Empty State Anatomy

Every empty state needs 3 elements:

1. **Visual** — illustration, icon, or image (not just text on a blank page)
2. **Explanation** — what this area is and why it's empty (1–2 sentences)
3. **Action** — a clear CTA to populate the view

### Patterns by Context

**First-Time / Zero Data (Grant, Ch 20):**
```html
<div class="flex flex-col items-center py-16 text-center">
  <div class="mb-6 text-neutral-300 dark:text-neutral-600">
    <!-- Illustration or icon (64–96px) -->
    <svg class="mx-auto h-16 w-16">...</svg>
  </div>
  <h3 class="mb-2 text-lg font-semibold text-neutral-900 dark:text-neutral-100">
    No blog posts yet
  </h3>
  <p class="mb-6 max-w-sm text-neutral-500 dark:text-neutral-400">
    Your published articles will appear here. Start writing your first post to share your expertise.
  </p>
  <a href="/blog/new" class="btn btn-primary">Write your first post</a>
</div>
```

**Search / Filter — No Results:**
```html
<div class="flex flex-col items-center py-12 text-center">
  <svg class="mb-4 h-12 w-12 text-neutral-300"><!-- Search icon --></svg>
  <h3 class="mb-2 text-lg font-semibold">No results for "your query"</h3>
  <p class="mb-4 max-w-sm text-neutral-500">
    Try adjusting your search or filters to find what you're looking for.
  </p>
  <div class="flex gap-3">
    <button class="btn btn-secondary" onclick="clearFilters()">Clear filters</button>
    <a href="/contact" class="btn btn-ghost">Contact us for help</a>
  </div>
</div>
```

**Content Removed / Completed:**
- "All caught up!" — positive messaging when a queue is empty
- Show a subtle illustration + suggestion for next action
- Never leave a completely blank white space

### Rules
- Empty states are **task-oriented** — tell users what to do, not just what's missing (Grant, Ch 20)
- Use **specific advice** per feature, not generic "Nothing here" messages
- Make "getting started" tips **easily dismissible** — one tap to skip the entire tutorial (Grant, Ch 21)
- If your UI needs extensive explanation, the **UI is too complex** — simplify instead of explaining

---

## 3. ERROR STATES

### Error Message Anatomy (3 Requirements)

Every error message must answer three questions (Maioli):

1. **What went wrong?** — state the problem clearly
2. **Where is the problem?** — highlight the specific element
3. **How to fix it?** — provide an actionable recovery step

**Good:** "The email address format is invalid. Please enter a valid email (e.g., name@example.com)."
**Bad:** "Error occurred." / "Error 422." / "Something went wrong."

### Form Validation Errors

```html
<div class="space-y-1">
  <label for="email" class="block text-sm font-medium text-neutral-700">
    Email address
  </label>
  <input
    id="email"
    type="email"
    aria-invalid="true"
    aria-describedby="email-error"
    class="w-full rounded-lg border-2 border-red-500 px-4 py-3
           focus:border-red-500 focus:ring-red-200"
  />
  <p id="email-error" role="alert" class="flex items-center gap-1.5 text-sm text-red-600">
    <svg class="h-4 w-4 shrink-0"><!-- Exclamation icon --></svg>
    Please enter a valid email address (e.g., name@example.com)
  </p>
</div>
```

**Rules:**
- Error indicator = red border + icon + text (never colour alone — 10% of users are colour-blind)
- Place error message **directly below the field**, not in a banner at the top
- Jump to the first error field after form submission (scroll + focus)
- Validate on **blur** (when user leaves the field), not on every keystroke
- Show success state (green border + checkmark) when a previously-errored field is corrected

### Page-Level Errors

**404 Page (Grant):**
```html
<main class="flex min-h-[60vh] flex-col items-center justify-center px-4 text-center">
  <p class="text-6xl font-bold text-neutral-200 dark:text-neutral-700">404</p>
  <h1 class="mt-4 text-2xl font-bold">Page not found</h1>
  <p class="mt-2 max-w-md text-neutral-500">
    The page you're looking for doesn't exist or has been moved.
  </p>
  <div class="mt-8 flex flex-wrap gap-4">
    <a href="/" class="btn btn-primary">Go to homepage</a>
    <a href="/contact" class="btn btn-secondary">Contact us</a>
  </div>
</main>
```

- **Never** show a dead-end 404 — always include navigation, search, and homepage link
- Include the URL that was attempted (helps user spot typos)
- Match the 404 page to the site's design system (not a generic server page)

**Server Error (500):**
- "We're having trouble loading this page. Please try again in a moment."
- Include a "Try again" button that reloads the page
- Never expose stack traces, error codes, or technical details to users

### Network / Offline Errors

```html
<div role="alert" class="fixed bottom-4 left-4 right-4 z-50 flex items-center gap-3
                         rounded-xl bg-amber-50 px-4 py-3 text-amber-800 shadow-lg
                         border border-amber-200 md:left-auto md:right-4 md:max-w-sm">
  <svg class="h-5 w-5 shrink-0"><!-- Wifi-off icon --></svg>
  <div>
    <p class="font-medium">You're offline</p>
    <p class="text-sm text-amber-600">Changes will sync when you're back online.</p>
  </div>
  <button class="ml-auto text-amber-400 hover:text-amber-600" aria-label="Dismiss">
    <svg class="h-4 w-4"><!-- X icon --></svg>
  </button>
</div>
```

---

## 4. SUCCESS / CONFIRMATION STATES

### Toast Notifications

Temporary messages that confirm an action completed successfully.

```html
<div role="status" aria-live="polite"
     class="fixed bottom-4 right-4 z-50 flex items-center gap-3
            rounded-xl bg-white px-4 py-3 shadow-lg border border-neutral-200
            dark:bg-neutral-800 dark:border-neutral-700">
  <div class="flex h-8 w-8 items-center justify-center rounded-full bg-green-100">
    <svg class="h-4 w-4 text-green-600"><!-- Check icon --></svg>
  </div>
  <div>
    <p class="font-medium text-neutral-900 dark:text-neutral-100">Message sent</p>
    <p class="text-sm text-neutral-500">We'll get back to you within 24 hours.</p>
  </div>
  <button aria-label="Dismiss" class="text-neutral-400 hover:text-neutral-600">
    <svg class="h-4 w-4"><!-- X icon --></svg>
  </button>
</div>
```

**Rules:**
- Position: **bottom-right** on desktop, **bottom-center full-width** on mobile
- Auto-dismiss after **5 seconds** for success, **persist until dismissed** for errors
- Maximum **1 toast visible** at a time (stack = cognitive overload)
- Use `role="status"` and `aria-live="polite"` for screen reader announcement
- Include a dismiss button — user should always be able to close immediately
- Animate: slide up + fade in (250ms), slide down + fade out (200ms)

### Confirmation Dialogs

For **destructive or irreversible** actions only (delete, cancel subscription, leave without saving).

```html
<div class="rounded-xl bg-white p-6 shadow-2xl max-w-sm dark:bg-neutral-800">
  <div class="mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-red-100">
    <svg class="h-6 w-6 text-red-600"><!-- Alert triangle --></svg>
  </div>
  <h3 class="text-lg font-semibold">Delete this item?</h3>
  <p class="mt-2 text-sm text-neutral-500">
    This action cannot be undone. The item and all its data will be permanently removed.
  </p>
  <div class="mt-6 flex gap-3">
    <button class="btn btn-secondary flex-1">Cancel</button>
    <button class="btn bg-red-600 text-white flex-1">Delete</button>
  </div>
</div>
```

**Rules (Dannaway):**
- **Add friction to destructive actions** — require confirmation, use red colouring, label the button with the specific action ("Delete item" not "OK")
- Prefer **undo** over confirmation when possible (Grant, Ch 15) — "Item deleted. [Undo]" is less disruptive than "Are you sure?"
- Confirmation buttons: dangerous action on the **right**, safe action (Cancel) on the **left**
- Never use "Yes" / "No" — use specific verbs: "Delete" / "Cancel", "Discard" / "Keep editing"
- Destructive actions deserve their own variant, not a muted secondary style that hides the risk

---

## 5. PARTIAL / DEGRADED STATES

When some data is available but other parts are missing:

- Show what you have, skeleton the rest
- If an image fails to load: show a neutral placeholder (brand colour background + icon), never a broken image icon
- If a section has no content: hide the section entirely rather than showing an empty container
- If a service is degraded: show a subtle banner at the top (not a blocking modal)

**Image Fallback:**
```html
<div class="flex h-48 items-center justify-center rounded-lg bg-neutral-100 dark:bg-neutral-800">
  <svg class="h-8 w-8 text-neutral-300"><!-- Image icon placeholder --></svg>
</div>
```

---

## STATE DESIGN CHECKLIST

For every page/component, verify you've designed:

- [ ] **Ideal state** — content loaded, everything present
- [ ] **Loading state** — skeleton or spinner appropriate to the wait time
- [ ] **Empty state** — helpful guidance with illustration + CTA (not blank space)
- [ ] **Error state** — clear message + where + how to fix + recovery action
- [ ] **Partial state** — graceful handling of missing images, incomplete data
- [ ] **Success feedback** — toast or inline confirmation after user action
- [ ] **Offline indicator** — if applicable, show connection status
- [ ] **Screen reader announces** — `role="alert"` for errors, `role="status"` for success
- [ ] **Reduced motion** — loading animations respect `prefers-reduced-motion`
