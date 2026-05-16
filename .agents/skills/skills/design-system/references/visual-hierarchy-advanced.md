---
title: Advanced Visual Hierarchy — Layout, Composition & Direction
description: The physics of how viewers scan and respond to layouts — apply when designing hero sections, cards, CTAs, and full page compositions
source: Conrad Bohnke, "From Zero to UI/UX Hero" (2024) — Chapter: Visual Design
---

# Advanced Visual Hierarchy — Layout, Composition & Direction

These principles go deeper than "big = important." They explain the physics of how human eyes move across a canvas and how to use that to guide every viewer toward the desired action.

---

## The 8px Spacing System — Semantic Values

All spacing in multiples of 8. The *meaning* of each increment:

| Space | Value | Use Case |
|-------|-------|----------|
| 8px | Closely related elements | Icon next to nav text; icon beside a button label |
| 12px | Elements within CTAs or input fields | Icon + label inside a button |
| 16px | Content that belongs closely together | Title + subtitle; two CTA buttons side by side |
| 32px | Distinct but related elements | Title + body text paragraph below it |
| 64px | Statistics or secondary content beneath main content | Sub-features below hero CTA |
| 64–160px | Between major page sections | Hero → Features; Features → Testimonials |

Be consistent: if you use 16px between a title and body text in one component, use 16px everywhere.

---

## Grid Types — Match to Content Purpose

| Grid | Best For | Structure |
|------|----------|-----------|
| **Block grid** (single column) | Articles, blog posts, About pages | Linear reading flow — no distraction |
| **Column grid** | Pricing tables, product listings, service cards | 12 cols desktop / 8 tablet / 4 mobile; 20px gutters |
| **Modular grid** | Galleries, e-commerce products, app screens | Rows AND columns create a matrix |
| **Hierarchical (freestyle) grid** | Creative portfolios, brand landing pages | Dynamic sizing — largest elements = highest importance |

---

## Visual Tension — Composition Direction

Composition direction signals emotion before a word is read:

- **Horizontal composition**: calm, stable, trustworthy → meditation apps, legal services, healthcare
- **Vertical composition**: bold, alert, strong → leadership, finance, executive services
- **Diagonal composition**: movement, energy, action → tech startups, sports brands, forward-motion messaging

Choose the composition direction that matches the brand's emotional register. Don't accidentally use a calm horizontal layout for an "act now" urgency campaign.

---

## Arnheim's Structural Net

Every canvas has an inherent structure before any design elements are placed. Visual forces (tension lines, directional flow) guide viewer perception. Design elements must work *with* this structure, not against it.

**In practice:**
- Balance elements proportionally — a heavy left side needs either a counterweight on the right or intentional asymmetric tension
- Use whitespace, typography, and alignment to create rhythm
- Use contrast and emphasis to surface the most critical information
- Every design should feel like all elements are "woven into a structural net" — nothing floats randomly

---

## Rule of Thirds

Divide the canvas into a 3×3 grid (two horizontal lines, two vertical lines). Place the most important elements at the intersections of those lines — the four "power points." Elements placed there receive the most natural visual attention.

**Apply to:**
- Hero section: place the headline or CTA at a power point intersection
- Photography: position the subject's face or main focal point at an intersection
- Cards: primary text and CTA at bottom-left or bottom-right intersection points

---

## Golden Ratio

Width-to-height ratio of 1:1.618. Creates proportions that feel naturally balanced because they mirror patterns found throughout nature.

**Practical application:**
- Use for image crops and container proportions
- Set sidebar width as ~38% of total width (the golden complement to 62%)
- Card height-to-width ratios built on 1.618 feel inherently comfortable

---

## Shape of Element — Directional Lines

Diagonals, lines, and axes within design elements guide the viewer's eye along a path.

**How to use it:**
- A diagonal banner or swoosh from top-left to bottom-right naturally pulls the eye from the logo toward the CTA
- Horizontal dividers slow the eye; diagonal elements accelerate movement
- Arrows (explicit or implied by shape) should always point toward the desired next action

---

## Subject Matter as Eye Direction

Use visual cues embedded in photography and illustration to direct the viewer's attention toward key information.

**Techniques:**
- **Gaze direction**: a person in a hero image looking toward your CTA will pull the viewer's eye there. A person looking away from your CTA pulls the eye off-page.
- **Extended hands**: pointing toward or reaching toward the CTA
- **Torchlight / spotlight**: illuminated direction in an image naturally draws attention
- **Arrows**: implied by shadows, movement blur, architectural lines in photography

**Always check:** In every hero section containing a person, what is their eyeline pointing at? If it's pointing away from the CTA or off-screen, consider flipping the image.

---

## The Von Restorff Effect — Making CTAs Impossible to Miss

The human brain remembers distinctive, unique items more easily than those that blend in.

**For CTAs:**
- Use a contrasting colour for primary CTA buttons (e.g., orange button on a navy-dominant site)
- Make the primary CTA larger than surrounding elements
- Use distinct shapes or bold typography for critical information
- Add whitespace around the primary CTA — isolation amplifies it

**Critical constraint:** Apply sparingly. Too many "standout" elements cancel each other out and create visual noise. One primary CTA stands out. Five CTAs, all distinct, stand out together — which means none do.

---

## Symmetrical vs Asymmetrical Balance

**Symmetrical layouts:**
- Elements evenly distributed on either side of a central axis
- Conveys: stability, formality, professionalism
- Best for: corporate, legal, financial, institutional sites

**Asymmetrical layouts:**
- Elements balanced by visual weight (size, colour, texture, space) rather than position
- Conveys: creativity, dynamism, modernity
- Best for: creative agencies, lifestyle brands, startups

Neither is better — match the brand's character. But commit to one approach per page or section.

---

## Icon Sizing Standards (8px System)

| Context | Size | Reason |
|---------|------|--------|
| Standard UI icons (nav, buttons) | 24px | Google's Material Design standard; divisible by 8 |
| Small UI elements (chevrons, dropdowns) | 16px | Minimal, not distracting |
| Large decorative icons (feature sections, testimonials) | 32–64px | Visual emphasis |
| Hero illustration icons | 64px+ | Dominant visual element |

**Rules:**
- Always use sizes divisible by 8 (or at minimum 4) for consistent grid alignment
- Use vector (SVG) icons — scale without quality loss
- Consistent style throughout (all filled OR all outlined — never mixed on the same page)
- Complex icons must be paired with text labels
