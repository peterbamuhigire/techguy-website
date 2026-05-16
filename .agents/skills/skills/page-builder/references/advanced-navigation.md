---
title: Advanced Navigation Patterns
description: Megamenus, mobile sub-menus, sticky scroll behaviour, search integration, breadcrumb patterns, and footer navigation architecture. Extends the navbar rules in component-design-rules.md.
sources: Will Grant "101 UX Principles" (2018) + Adrian Kuleszo "How to Design Better UI Components 3.0" (2024) + Lisandra Maioli "Fixing Bad UX Designs" (2018)
---

# Advanced Navigation Patterns

Navigation is the most critical UI system. If users can't find content, nothing else matters. These patterns extend the basic navbar rules in `component-design-rules.md`.

---

## THE HAMBURGER DEBATE

**Don't hide items in a hamburger menu on desktop** (Grant, Ch 23). The hamburger menu hides navigation behind a tap — on desktop, where screen space is abundant, this harms discoverability.

**Rules:**
- **Desktop (lg+):** Show all primary navigation links in a horizontal bar — never use a hamburger
- **Tablet (md):** Hamburger acceptable if > 5 navigation items; otherwise show horizontal links
- **Mobile (< md):** Hamburger is the standard pattern — users expect it
- The hamburger icon is universally recognised, but what's behind it is invisible. Keep critical paths out of the hamburger when possible.

### Mobile Off-Canvas Menu
```html
<div x-data="{ mobileMenuOpen: false }">
  <!-- Hamburger button -->
  <button @click="mobileMenuOpen = true" class="lg:hidden p-3"
          aria-label="Open menu" aria-expanded="false"
          :aria-expanded="mobileMenuOpen">
    <svg class="h-6 w-6"><!-- Hamburger icon --></svg>
  </button>

  <!-- Off-canvas overlay -->
  <div x-show="mobileMenuOpen" x-transition:enter="transition ease-out duration-300"
       x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
       x-transition:leave="transition ease-in duration-200"
       x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
       @click="mobileMenuOpen = false"
       class="fixed inset-0 z-40 bg-black/50 lg:hidden" aria-hidden="true">
  </div>

  <!-- Off-canvas panel -->
  <nav x-show="mobileMenuOpen" x-trap.noscroll="mobileMenuOpen"
       x-transition:enter="transition ease-out duration-300"
       x-transition:enter-start="translate-x-full" x-transition:enter-end="translate-x-0"
       x-transition:leave="transition ease-in duration-200"
       x-transition:leave-start="translate-x-0" x-transition:leave-end="translate-x-full"
       class="fixed right-0 top-0 z-50 h-full w-[85vw] max-w-sm bg-white
              shadow-2xl dark:bg-neutral-900 lg:hidden"
       aria-label="Main navigation">

    <!-- Close button in same position as hamburger -->
    <div class="flex items-center justify-end p-4">
      <button @click="mobileMenuOpen = false" class="p-3" aria-label="Close menu">
        <svg class="h-6 w-6"><!-- X icon --></svg>
      </button>
    </div>

    <!-- Navigation links -->
    <div class="space-y-1 px-4">
      <a href="/en/" class="block rounded-lg px-4 py-3 text-lg font-medium
                            hover:bg-neutral-100 dark:hover:bg-neutral-800">Home</a>
      <a href="/en/about" class="block rounded-lg px-4 py-3 text-lg font-medium
                                 hover:bg-neutral-100 dark:hover:bg-neutral-800">About</a>
      <!-- Sub-menu trigger -->
      <div x-data="{ subOpen: false }">
        <button @click="subOpen = !subOpen"
                :aria-expanded="subOpen"
                class="flex w-full items-center justify-between rounded-lg px-4 py-3
                       text-lg font-medium hover:bg-neutral-100 dark:hover:bg-neutral-800">
          Services
          <svg :class="subOpen && 'rotate-180'" class="h-4 w-4 transition-transform">
            <!-- Chevron down -->
          </svg>
        </button>
        <div x-show="subOpen" x-collapse class="ml-4 space-y-1 border-l-2 border-neutral-200
                                                pl-4 dark:border-neutral-700">
          <a href="/en/services/design" class="block rounded-lg px-4 py-2.5 text-neutral-600
                                               hover:bg-neutral-100 dark:text-neutral-400
                                               dark:hover:bg-neutral-800">Web Design</a>
          <a href="/en/services/branding" class="block rounded-lg px-4 py-2.5 text-neutral-600
                                                  hover:bg-neutral-100 dark:text-neutral-400
                                                  dark:hover:bg-neutral-800">Branding</a>
        </div>
      </div>
      <!-- CTA -->
      <div class="pt-4">
        <a href="/en/contact" class="btn btn-primary block w-full text-center">Contact Us</a>
      </div>
    </div>
  </nav>
</div>
```

**Mobile menu rules:**
- Slides from **right** (matches hamburger position) — never push content
- **Close X** in the same position the hamburger was (spatial consistency)
- Width: **85vw** or **max-w-sm** — don't cover the full screen (peek of background signals dismissibility)
- Use `x-trap.noscroll` for focus trapping and scroll prevention
- Touch targets: **48px minimum height** for all links
- Show CTA button prominently at the bottom of the menu

---

## MOBILE SUB-MENU PATTERNS

### Accordion Sub-Menus (Preferred for Static Sites)

For sites with 2-level navigation, use accordion-style sub-menus in the mobile off-canvas menu.

**Rules:**
- Parent item is a button (toggles sub-menu), not a link
- Sub-menu items indented with left border (visual hierarchy)
- Chevron rotates on open
- Only **one sub-menu open at a time** (optional — depends on depth)
- Sub-menu links use slightly smaller text and lighter colour weight

### Split Menu Items (Grant, Ch 25)

For deep hierarchies, split the mobile menu into **subsections** so users don't face a wall of 20+ links:

```
Services                    >
├── Design & Build
│   ├── Web Design
│   ├── App Design
│   └── UI/UX Review
├── Marketing
│   ├── SEO
│   ├── Content Strategy
│   └── Social Media
└── Support
    ├── Maintenance
    └── Hosting
```

**Rules (Grant):**
- No more than **7±2 items** visible in any single menu level (Miller's Law)
- Group related items under descriptive headings
- Headings are non-clickable labels (styled differently from links)
- If a section has only 2 items, don't group it — show flat

---

## MEGAMENU PATTERN (Desktop Only)

For sites with **15+ navigation items** across multiple categories. Rare for most client sites — only use when content depth demands it.

```html
<nav class="relative" x-data="{ megaOpen: null }">
  <ul class="hidden lg:flex items-center gap-6">
    <li @mouseenter="megaOpen = 'services'" @mouseleave="megaOpen = null">
      <button @click="megaOpen = megaOpen === 'services' ? null : 'services'"
              :aria-expanded="megaOpen === 'services'"
              class="flex items-center gap-1 py-2 font-medium">
        Services
        <svg class="h-4 w-4" :class="megaOpen === 'services' && 'rotate-180'">
          <!-- Chevron -->
        </svg>
      </button>

      <!-- Megamenu panel -->
      <div x-show="megaOpen === 'services'"
           x-transition:enter="transition ease-out duration-200"
           x-transition:enter-start="opacity-0 -translate-y-2"
           x-transition:enter-end="opacity-100 translate-y-0"
           @mouseenter="megaOpen = 'services'" @mouseleave="megaOpen = null"
           class="absolute left-0 top-full z-50 w-full border-t bg-white
                  shadow-xl dark:bg-neutral-900 dark:border-neutral-700">
        <div class="mx-auto grid max-w-7xl grid-cols-3 gap-8 px-8 py-8">
          <!-- Column 1 -->
          <div>
            <h3 class="mb-3 text-xs font-semibold uppercase tracking-wider text-neutral-400">
              Design & Build
            </h3>
            <ul class="space-y-2">
              <li><a href="/en/services/web-design" class="block rounded-lg px-3 py-2
                         hover:bg-neutral-100 dark:hover:bg-neutral-800">
                <span class="font-medium">Web Design</span>
                <span class="block text-sm text-neutral-500">Custom websites that convert</span>
              </a></li>
              <!-- More items -->
            </ul>
          </div>
          <!-- Columns 2, 3... -->
        </div>
      </div>
    </li>
  </ul>
</nav>
```

**Megamenu rules:**
- **Desktop only** — on mobile, use accordion sub-menus instead
- Open on hover with `mouseenter` + click toggle for accessibility
- Keep megamenu **within the viewport** — never force horizontal scrolling
- Maximum **3–4 columns** — more feels overwhelming
- Each column has a **heading** (non-clickable) + **3–7 links**
- Include brief descriptions (1 line) under each link for clarity
- Add a subtle entrance animation (fade + slide, 200ms)
- Close on `mouseleave` with a small delay (150ms) to prevent accidental closure

---

## STICKY NAVIGATION

### Scroll Behaviour Strategy

| Pattern | Best For | Behaviour |
|---------|----------|-----------|
| **Always sticky** | Short navbars (≤60px) | Nav stays fixed at top on all scroll |
| **Hide on scroll down, show on scroll up** | Longer navbars | Reclaims viewport space while reading |
| **Sticky after hero** | Landing pages with tall heroes | Nav appears after scrolling past hero section |

### Hide-on-Scroll-Down Pattern (Recommended)
```html
<header x-data="stickyNav()" x-init="init()"
        :class="{ '-translate-y-full': hidden, 'shadow-md': scrolled }"
        class="fixed top-0 left-0 right-0 z-50 bg-white/95 backdrop-blur-sm
               transition-transform duration-300 dark:bg-neutral-900/95">
  <!-- Nav content -->
</header>

<script>
function stickyNav() {
  return {
    hidden: false,
    scrolled: false,
    lastScroll: 0,
    init() {
      window.addEventListener('scroll', () => {
        const currentScroll = window.scrollY;
        this.scrolled = currentScroll > 20;

        if (currentScroll > this.lastScroll && currentScroll > 80) {
          this.hidden = true;  // Scrolling down — hide
        } else {
          this.hidden = false; // Scrolling up — show
        }
        this.lastScroll = currentScroll;
      }, { passive: true });
    }
  };
}
</script>
```

**Rules:**
- Add `backdrop-blur` + slight transparency for a polished floating effect
- Add `shadow-md` only **after scrolling** (not at page top — it looks odd against the hero)
- Threshold: start hiding after **80px** of scroll (avoid jitter at page top)
- Transition: `translate-y` over **300ms** — smooth but not slow
- On mobile: sticky nav consumes precious viewport — hide-on-scroll-down reclaims space
- Account for sticky nav height when linking to anchors: `scroll-margin-top: 80px` on sections

---

## SEARCH INTEGRATION

### When to Include Search
- **Always** if the site has > 20 pages or a blog with > 10 posts
- **Optional** for brochure sites with < 10 pages (simpler navigation suffices)
- Search should be a **text field with a button labelled "Search"** (Grant, Ch 11)

### Desktop: Search in Navigation
```html
<div class="relative ml-auto hidden lg:block">
  <form action="/search" method="GET" role="search">
    <label for="search-desktop" class="sr-only">Search</label>
    <input id="search-desktop" type="search" name="q" inputmode="search"
           placeholder="Search..."
           class="w-48 rounded-full border border-neutral-200 bg-neutral-50 px-4
                  py-2 pl-10 text-sm transition-all focus:w-64 focus:border-accent
                  dark:border-neutral-700 dark:bg-neutral-800">
    <svg class="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-neutral-400">
      <!-- Search icon -->
    </svg>
  </form>
</div>
```

### Mobile: Search Icon → Expandable
```html
<button @click="searchOpen = !searchOpen" class="p-3 lg:hidden" aria-label="Search">
  <svg class="h-5 w-5"><!-- Search icon --></svg>
</button>

<div x-show="searchOpen" x-transition class="absolute inset-x-0 top-full border-t
     bg-white p-4 shadow-lg dark:bg-neutral-900 lg:hidden">
  <form action="/search" method="GET" role="search">
    <input type="search" name="q" inputmode="search" autofocus
           placeholder="Search..." class="w-full rounded-lg border px-4 py-3">
  </form>
</div>
```

**Search rules (Kuleszo):**
- Search field must be a **visible text input**, not an icon-only toggle on desktop
- Placeholder: "Search..." — not "Type here" or "What are you looking for?"
- On submit: show results with the **most relevant first** (Grant, Ch 91)
- Categorize search results into **sections** if mixed content types (Grant, Ch 82)
- Show "No results" state with suggestions (see `ui-states.md`)

---

## BREADCRUMB NAVIGATION

Show the user's position in the site hierarchy (Grant, Ch 72).

```html
<nav aria-label="Breadcrumb" class="py-3">
  <ol class="flex flex-wrap items-center gap-1.5 text-sm text-neutral-500">
    <li>
      <a href="/en/" class="hover:text-neutral-900 dark:hover:text-neutral-100">Home</a>
    </li>
    <li aria-hidden="true" class="text-neutral-300">/</li>
    <li>
      <a href="/en/services" class="hover:text-neutral-900 dark:hover:text-neutral-100">Services</a>
    </li>
    <li aria-hidden="true" class="text-neutral-300">/</li>
    <li>
      <span aria-current="page" class="font-medium text-neutral-900 dark:text-neutral-100">
        Web Design
      </span>
    </li>
  </ol>
</nav>
```

**Rules:**
- Show on **every page below the homepage** (not on homepage itself)
- Use `aria-current="page"` on the current page (last item, not a link)
- Separator: `/` or `>` with `aria-hidden="true"` (screen readers use the list structure)
- On mobile: truncate to show only **parent + current** if breadcrumb is too long
- Position: below the header, above the page title
- Never replace primary navigation — breadcrumbs are supplementary

---

## FOOTER NAVIGATION (Grant, Ch 27)

Repeat important navigation links in the footer. Users who scroll to the bottom are either **lost** or **looking for something specific**.

### Footer Architecture
```
┌─────────────────────────────────────────────────────────────┐
│ Logo + Brief Description (1-2 sentences)                     │
├──────────┬──────────┬──────────┬──────────┬─────────────────┤
│ Company  │ Services │ Resources│ Legal    │ Contact         │
│ About    │ Design   │ Blog     │ Privacy  │ Address         │
│ Team     │ Branding │ FAQ      │ Terms    │ Phone           │
│ Careers  │ SEO      │ Guide    │ Cookies  │ Email           │
│ Press    │ Content  │ Support  │ Sitemap  │ [Social Icons]  │
├──────────┴──────────┴──────────┴──────────┴─────────────────┤
│ © 2026 Company Name. All rights reserved.                    │
│ Language Switcher: EN | FR | SW                              │
└─────────────────────────────────────────────────────────────┘
```

**Rules:**
- **3–5 column groups** maximum — more feels cluttered
- Each column: **heading + 4–7 links**
- Include: company info, services, resources, legal pages, contact info
- **Social icons in footer only** — never in the header (they take users away from the site)
- Language switcher: accessible with `aria-label="Language selection"`
- On mobile: columns stack vertically, or use accordion pattern for groups
- Footer has a **distinct background** from the main content (darker shade, brand colour tint)
- Copyright line + legal links at the very bottom

### Mobile Footer
```html
<footer class="bg-neutral-900 text-neutral-300">
  <div class="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
    <!-- Logo + description -->
    <div class="mb-8">
      <img src="/logo-white.svg" alt="Company Name" class="h-8" />
      <p class="mt-3 max-w-sm text-sm text-neutral-400">
        Brief company description in one sentence.
      </p>
    </div>

    <!-- Link columns: grid on desktop, accordion on mobile -->
    <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-4">
      <!-- Each column -->
      <div>
        <h3 class="text-sm font-semibold uppercase tracking-wider text-neutral-100">Services</h3>
        <ul class="mt-4 space-y-3">
          <li><a href="/en/services/design" class="text-sm hover:text-white">Web Design</a></li>
          <!-- More links -->
        </ul>
      </div>
      <!-- More columns -->
    </div>

    <!-- Bottom bar -->
    <div class="mt-12 border-t border-neutral-800 pt-8 flex flex-col sm:flex-row
                sm:items-center sm:justify-between gap-4">
      <p class="text-sm text-neutral-500">© 2026 Company Name. All rights reserved.</p>
      <div class="flex gap-4">
        <a href="/en/privacy" class="text-sm text-neutral-500 hover:text-white">Privacy</a>
        <a href="/en/terms" class="text-sm text-neutral-500 hover:text-white">Terms</a>
      </div>
    </div>
  </div>
</footer>
```

---

## ACTIVE STATE & WAYFINDING

Users must **always know where they are** (Grant, Ch 71 + Maioli).

**Rules:**
- **Active navigation link** — visually distinct from inactive links (underline, bold, accent colour, or background highlight)
- **Breadcrumbs** — show path from homepage to current page
- **Page title** — matches the navigation label that was clicked
- **Browser title** — `Page Name | Company Name` format
- **URL** — readable and matches the site structure (`/en/services/web-design`)

**Active state pattern:**
```html
<!-- Desktop nav -->
<a href="/en/about"
   class="border-b-2 border-transparent px-1 py-2 text-sm font-medium text-neutral-500
          hover:border-neutral-300 hover:text-neutral-700
          aria-[current=page]:border-accent aria-[current=page]:text-neutral-900"
   aria-current="page">
  About
</a>
```

- Use `aria-current="page"` on the active link (accessible)
- Style with `aria-[current=page]:` Tailwind variant (automatic)
- For sub-pages: highlight both the parent section AND show breadcrumbs

---

## NAVIGATION CHECKLIST

- [ ] **Desktop:** All primary links visible (no hamburger)
- [ ] **Mobile:** Hamburger opens off-canvas menu from right
- [ ] **Close button** in same position as hamburger
- [ ] **Sub-menus:** Accordion pattern on mobile, dropdown/megamenu on desktop
- [ ] **Menu items:** Maximum 7±2 at any level
- [ ] **Active state:** Current page clearly indicated
- [ ] **Breadcrumbs:** On every page below homepage
- [ ] **Search:** Visible text field on desktop, icon toggle on mobile
- [ ] **Footer:** Repeats key navigation links in 3–5 columns
- [ ] **Social icons:** Footer only, never header
- [ ] **Sticky nav:** Hide-on-scroll-down, show-on-scroll-up
- [ ] **Language switcher:** Accessible with `aria-label`
- [ ] **Focus trap:** Mobile menu traps focus with `x-trap`
- [ ] **Keyboard:** All nav elements reachable via Tab
- [ ] **Logo links to homepage** (top-left position)
- [ ] **Contact in last nav position** — most common user expectation
