---
title: Component Design Rules
description: Research-backed rules for every major web component — navbars, heroes, cards, features, images, icons, navigation. Apply when building any Astro page component.
sources: Elisa Paduraru "Roots of UI/UX Design" (2024) + Luca Panzarella "UI & UX Web Design Simply Explained" (2022)
---

# Component Design Rules

Apply these rules when building each component. These are specific, measurable rules — not guidelines.

---

## BEFORE CREATING A NEW COMPONENT

Do not start by drawing.
Start by checking whether the problem is already solved elsewhere in the system.

Before adding a new component:

1. audit adjacent screens for an existing component or near-duplicate
2. check whether the need can be solved by a new variant, state, or slot on an existing component
3. document why a new component is justified if reuse fails

Every unnecessary one-off component increases design debt, code debt, and review overhead.

## TOKEN ARCHITECTURE

Component styling should resolve through three layers:

- primitive tokens: raw palette, spacing, radius, type scale, shadow values
- semantic tokens: purpose-based names such as `color-action-primary` or `space-section-lg`
- component tokens: scoped values such as `button-primary-bg` or `card-border-muted`

Avoid raw hex codes, arbitrary spacing values, and one-off shadows in component code when a token should own the decision.

## COMPONENT DOCUMENTATION CONTRACT

Every shared component should be documentable with:

- purpose
- anatomy
- variants
- states
- content rules
- accessibility behavior
- responsive behavior
- when to use and when not to use

If the team cannot describe those clearly, the component is not mature enough to standardize.

---

## THE 8 INTERACTIVE STATES

Every interactive element (button, link, card, form field, nav item) must design for **8 states**. Missing states signal unfinished work.

| State | Visual Signal | When |
|-------|--------------|------|
| **Default** | Base appearance | Element at rest |
| **Hover** | Colour shift, lift, or underline change | Mouse over (desktop only — use `@media (hover: hover)`) |
| **Focus** | 2-3px outline via `:focus-visible` | Keyboard navigation (NOT mouse click) |
| **Active** | Press-down effect (scale 0.98 or translateY) | During click/tap |
| **Disabled** | 50% opacity, `cursor: not-allowed` | Element not available |
| **Loading** | Inline spinner, disabled interaction | Action in progress |
| **Error** | Red border + icon + message | Validation failed |
| **Success** | Green border + checkmark | Action completed |

**Rules:**
- Not every element needs all 8 — buttons need all 8; links need 4 (default, hover, focus, active); static cards need 2 (default, hover)
- Use `:focus-visible` (NOT `:focus`) — keyboard users get focus rings, mouse users don't
- Focus ring: `outline: 2px solid var(--color-accent); outline-offset: 2px;` — appears **instantly** (no transition)
- Disabled elements: never remove from DOM; use `aria-disabled="true"` + visual dimming
- Loading state: replace button text with spinner + "Sending..." — disable the button to prevent double-submit

### Native HTML Elements to Prefer

**`<dialog>` for modals** — handles focus trapping, `Escape` to close, and backdrop natively:
```html
<dialog id="confirm-dialog">
  <h2>Confirm action</h2>
  <p>This cannot be undone.</p>
  <button onclick="this.closest('dialog').close()">Cancel</button>
  <button onclick="confirmAction()">Confirm</button>
</dialog>
```

**`inert` attribute** — disables all interaction on background content when modal is open:
```html
<main inert><!-- Background content frozen --></main>
<dialog open><!-- Active modal --></dialog>
```

**`<details>/<summary>` for accordions** — no JavaScript needed:
```html
<details>
  <summary>Frequently asked question?</summary>
  <p>The answer content, hidden until clicked.</p>
</details>
```

---

## NAVBARS

- Border-radius: minimum **8px** — sharp-edged navbars feel unwelcoming
- Buttons inside navbar must share the **same border-radius** as the nav bar itself
- Navigation link gaps: **minimum 16px**; standard **24px**
- Navbar height: **maximum 80px** — taller headers consume too much viewport
- Icon opacity in navbar: use primary colour tint OR **50–60% opacity** — never same colour as nav text
- Active state must be visually unambiguous — users must always know which page they're on

**Navbar styles (pick one per project):**
- Simple / transparent — clean, minimal
- Light — white background, drop shadow
- Dark — inverted, high contrast
- Blurred glass — `backdrop-blur` + semi-transparent background (see `liquid-glass-effects.md`)

**Mobile:**
- Hamburger menu at ≥768px breakpoint
- Mobile nav should slide in from right or top, never push content
- Close X button must be in the same position the hamburger was

---

## HERO SECTIONS

**Purpose:** First-time visitors scan (not read) — hero must capture attention within 3 seconds and communicate what the site does.

**Title rules:**
- **Maximum 10 words** — concise H1 using the display font
- Subtitle/description: H5 or H6 beneath the title (supporting context, not a repeat of the title)
- Clear typographic hierarchy: headline → subhead → CTA (three distinct visual weights)

**Structural rules:**
- **Do NOT fill the entire viewport height** — reveal the top of the next section to signal more content and encourage scrolling
- CTA button is the primary focal point — one primary action, one optional secondary (ghost/outline)
- Apply F-Pattern and Z-Pattern to CTA placement (see `ux-laws-and-psychology.md`)

**Background rules:**
- Full-width background images: add **50–80% black (or brand colour) overlay** before placing text
- This range preserves image detail while guaranteeing text legibility
- Never overlay text on unfiltered photography without checking contrast ratio
- Background images must have sufficient resolution for 2x/retina displays

**What belongs in the hero:**
- Brand identity: logo, company name, clear value proposition
- Primary CTA button
- Search bar (for exploration sites: travel, real estate, e-commerce)
- Newsletter/email capture (use sparingly — do not place two different CTAs at equal weight)

**Hero styles:**
- Full background image (most common for service businesses)
- Side image / split screen (SaaS, product pages)
- Background video (attention-grabbing; must have overlay + fallback image)
- Gradient / glassmorphism (tech, creative, modern brands)

---

## FEATURE SECTIONS

**Alignment by description length:**
- **Short descriptions (≤2 lines):** centre-align text — visually balanced and easy to scan
- **Long descriptions (>2 lines):** left-align text — users can follow through extended reading

**Content rules:**
- If descriptions are too long: condense while retaining core idea (3-5 lines maximum)
- Do not use full content width — breathing room improves aesthetics and readability
- For short benefit statements (4–5 words): use **checkmarks instead of bullet points** — adds perceived value
- Icons must align precisely with the text they accompany — misaligned icons cause confusion
- Limit feature grid to **3 or 6 items** per row (3 on desktop is most balanced; 4 can work for simple icons)

**Feature styles:**
- Minimalistic (text only — for bold typography-driven brands)
- With icons (most effective — icons aid scanning and memory)
- With screenshots/images (SaaS, product features)
- Alternating text/image rows (for detailed feature explanations)

---

## CARDS

**Visual hierarchy rules:**
- Critical content at **top of card** — always (image, then title, then supporting text, then CTA)
- Use typography weight + whitespace + contrast to emphasise priority information
- **One clear action per card** — multiple links dilute purpose and create decision paralysis

**Card image rules:**
- Maintain **consistent margins** on all sides of images within cards
- Image border-radius must be **smaller than the card's border-radius** (the image lives inside the card)
- Formula: `inner radius = outer card radius − card padding` (e.g., card = `rounded-2xl` (16px) + `p-4` (16px) → image gets `rounded-xl` (12px) or less, never equal)
- Equal inner and outer radii create a "bulgy" appearance — a visible quality signal to trained eyes

**Consistency rules:**
- Consistent framing across all cards in a grid — prevents visual disorder
- Inconsistent card framing (different image heights, different padding) reads as unfinished work
- Cards scale down to smaller screens and scroll vertically on mobile (never horizontal swipe as default)

**Card types:**
| Card Type | Key Rule |
|-----------|----------|
| Blog cards | Consistent format across all posts; different images never break grid |
| Profile/team | Avatar + name + role + social links only; detail goes on profile page |
| Pricing | Price, features list, and buy button are the THREE required elements; present side-by-side for comparison |
| Service | Benefit-led headline, 3-4 bullet points max, one CTA |
| Testimonial | Quote first, then attribution (name, title, company); never name-first |
| Stats/numbers | Large number, short label beneath — no prose inside stat cards |

**Hover states:**
- Lift: `translateY(-4px)` + increased shadow
- Scale: `scale(1.02)` (subtle only — larger scale feels unstable)
- Colour shift: background colour tint change
- Pick ONE hover style and use it consistently across all cards

---

## IMAGES

**Fundamental facts:**
- Brain processes images **60,000× faster than text** — images set mood before copy is read
- 1/10 second is enough to form a general perception of any visual scene
- Every image needs a **clear focal point** that survives cropping at any aspect ratio

**Quality rules:**
- Blurry or low-quality images signal low product quality — compress AFTER optimising quality
- Test every image across multiple screen sizes before publishing
- "If an image is hard to interpret on a small screen, it's not the right choice"

**Visual style rules:**
- Establish a photography style guide (mood board) before selecting images
- All stock images must come from collections with **consistent style, colour palette, and composition**
- Inconsistent image styles fragment brand identity even if typography and colour are consistent

**Text overlaid on images:**
- Apply colour filter at **50–80% opacity** (black or brand colour)
- This range: preserves image detail + guarantees text legibility
- Never overlay text on unfiltered photography — check WCAG contrast ratio first

**Composition rules (Rule of Thirds):**
- Divide image into 9 equal parts (3×3 grid)
- Place subjects at intersections, not in the centre
- Off-centre subjects create energy and visual interest; centred subjects feel static

**Emotional image selection:**
- People (especially faces) → confidence and relatability
- Nature scenes → calm and trust
- Abstract/geometric → modern and precise
- Avoid: harsh, cold, clinical images — they create negative first impressions

**Open Images principle:**
- Prefer images with minimal visual clutter that leave room for text overlay and UI elements
- Busy images fight with UI; clean images collaborate with it

---

## ICONS

**Core rules:**
- Simple icons outperform complex icons — complexity invites misinterpretation
- **Never mix icon styles** within a project (outline + filled + 3D together = visual confusion)
- Line widths must be **uniform across all icons** AND match the line weight of surrounding typography
- Icon border-radius should match the roundness of other UI elements (rounded buttons → rounded icons)

**Icon sizes (standard frames):**
- 16×16px — smallest functional size (inline, small labels)
- 24×24px — standard UI size (most common)
- 32×32px — medium emphasis (feature lists)
- 48px+ — hero/section emphasis only

**Always contain icons in a defined frame; resize the frame, not the icon.**

**Three icon functions:**
1. **Clarification** — reinforce adjacent text; users who process icons skip the text (fast scanners); users who need context read the text
2. **Interactive** — represent an action; must look distinctly interactive
3. **Decorative** — aesthetic only; must NOT look interactive

**Colour treatment:**
- Do not use same colour as surrounding text for icons
- Use a tint of the primary colour OR set opacity to **50–60%**

**Icon libraries for this stack (Lucide is the default):**
- Lucide: outline style, consistent line weight, 24px default — use as primary
- Heroicons: similar quality, compatible aesthetic
- Never mix libraries within a project

---

## TESTIMONIALS

**Structure order (mandatory):**
1. Star rating (if using stars — use 5 stars or omit)
2. Quote text — the social proof statement
3. Attribution: photo → name → title/company (in this order)

**Never:** Name-first testimonials. The person's authority is established after the quote has already convinced the reader.

**Display rules:**
- A grid of 3 testimonials (desktop) or single-column (mobile) is most trusted
- Use real photos when available — stock headshots destroy credibility instantly
- Short quotes (2–3 sentences) outperform long quotes — users don't read long testimonials

---

## STATS/NUMBERS SECTIONS

- Large, bold display number (use display font)
- Short descriptive label beneath (4 words maximum)
- Group 3 or 4 stats — never 2 (too sparse) or 6+ (loses focus)
- Include source for statistics when they are market-level claims (adds credibility)
- Animate numbers counting up on scroll (Alpine.js) for engagement

---

## FAQ SECTIONS

- Use accordion pattern — all collapsed by default
- First item can be pre-opened to signal interactivity
- Questions written in first-person user voice: "Can I cancel anytime?" not "Cancellation policy"
- 6–10 questions is optimal; fewer looks thin, more looks evasive
- Group related questions together (billing questions together, technical questions together)

---

## FOOTER

**MANDATORY rule:** Footer must have a **visually distinct background colour** from the page body.
- When footer blends into the page, visitors cannot find policies, contact info, or social links
- Scroll past CTAs thinking the page is still going

**Footer structure:**
- Logo + short company description (1–2 sentences)
- Navigation columns (grouped by type: Services, Company, Legal, Contact)
- Social media icons (with accessible text labels)
- Newsletter signup (optional — keep form to email field + button only)
- Legal row: Privacy Policy, Terms of Use, © Year Company Name. All rights reserved.

**Footer link gaps: minimum 8px between links; 16px between column groups.**

---

## CONTACT SECTIONS

**Trust signals to include:**
- Phone number (makes the business feel real and accessible)
- Physical address (even for remote businesses — a street address builds trust)
- Business hours
- Response time promise ("We reply within 2 business hours")

**Form rules:** See `form-ux-design/SKILL.md` for complete form UX guidance.

**Map embed:** Include a Google Maps embed for businesses with physical locations — it is a powerful trust signal. Use `loading="lazy"` iframe with `youtube-nocookie.com` equivalent restriction.

---

## PRICING SECTIONS

**Layout rules:**
- Side-by-side comparison (desktop) — never stack vertically on desktop for comparative pricing
- Recommended/popular tier must be visually distinct: larger, different background, "Most Popular" badge
- Consistent features list across all tiers — use checkmarks (included) and X marks (not included)
- Price must be THE largest text element in each pricing card
- CTA button inside each card, not below the pricing section

**Psychological rules (Anchoring):**
- Present premium tier FIRST (left or top) — anchors the high price, makes middle tier feel reasonable
- Annual/monthly toggle: show annual selected by default (higher perceived value)
- Dollar savings displayed for annual ("Save $240/year") convert better than percentage savings

---

## PROGRESSIVE DISCLOSURE — INFORMATION HIERARCHY

Apply this three-tier model to every section:

1. **Essential** — always visible at first view (headline, key benefit, primary CTA)
2. **Important** — above the fold or within natural scroll (supporting details, secondary features)
3. **Supplementary** — 1–2 clicks or scrolls away (FAQs, fine print, extended case studies)

**Checklist for every section:**
- [ ] Can users understand the purpose of this section in 5 seconds?
- [ ] Is the essential information visible without scrolling within the section?
- [ ] Is every element on this page justifiable at this level of disclosure?
- [ ] Does every element advance the user to the next step or support a decision?

---

## SITE PATTERN LIBRARY

### Homepage — Exploration Site (Airbnb, Amazon, TripAdvisor pattern)
Header → Hero (value statement + search bar) → Featured/highlighted content rows → Category summaries → Social proof → Footer

### Homepage — Evaluation Site (SaaS, service business, Dropbox/Spotify pattern)
Header → Hero (image + headline + CTA) → Feature highlights → Detailed features → Social proof → Repeat CTA → Footer
Mobile: 1–2 columns; straightforward responsive adaptation

### Landing / Acquisition Page (post-CTA — email capture, trial, purchase)
**Remove navigation** — user should not have easy exit
Hero (headline + value prop) → Social proof (above the fold) → Features → More social proof → CTA → FAQ → Final CTA
Single action throughout — no competing CTAs

### About Page
Hero (brand story hook) → Origin story (narrative, not résumé) → Mission/values → Team → Partners/clients → CTA
Apply brand-storytelling skill for narrative structure

### Services/Solutions Page
Hero (category headline) → Service cards (3–6 items) → Process/how it works → Case studies or testimonials → CTA

### Contact Page
Headline + subhead (not just "Contact Us") → Form (name, email, message, optional phone) → Contact details alongside form → Map (if physical location) → Response time promise
