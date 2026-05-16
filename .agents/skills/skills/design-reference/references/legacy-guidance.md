# Design Reference Skill

Turn client-provided reference websites into a structured design guide that feeds directly into the design-system, page-builder, and brand-alignment skills.

## When to Use

The client provides up to 5 URLs of websites they admire and says something like:

- "I like these websites"
- "Build something similar to these"
- "Here are some references"
- "I want my site to feel like this"

## Input

The client provides 1 to 5 URLs. Accept them in any format:

- Listed in conversation
- Written in `docs/style-brief.md` under a references section
- Provided as a simple list

**Hard limit: 5 URLs maximum.** If the client provides more, ask them to choose their top 5. Analysing too many references dilutes the findings.

## Step 1: Visit Every Reference Site

Use the WebFetch tool to visit each URL. For each site, analyse the **homepage** first, then follow up to 2 internal pages (about, services, or contact) if they are linked from the homepage.

For each reference site, extract:

### Layout and Structure

- Overall page layout approach (single column, split, grid, asymmetric)
- How the hero section is constructed (full-bleed image, video, text-only, split layout, animated)
- Section rhythm and spacing (tight or generous, alternating backgrounds, dividers)
- How content blocks flow down the page
- Footer structure and content
- Whether the site uses a sidebar, and where

### Navigation

- Number of navigation items and their labels
- Navigation style (sticky, transparent-to-solid on scroll, hamburger on desktop, mega menu)
- How the mobile menu behaves
- Whether there is a prominent CTA in the navigation bar
- How sub-pages are organised

### Typography

- Heading style (serif, sans-serif, display, all-caps, mixed case)
- Approximate heading sizes and weight (bold, light, extra-bold)
- Body text style and readability
- Whether text is large and spacious or compact and dense
- Any decorative text treatments (gradient text, outlined text, oversized characters)

### Colour and Visual Tone

- Dominant colour palette (dark, light, colourful, monochrome, earthy, bold)
- Background approach (white, dark, coloured sections, gradients, textures)
- Accent colour usage and where it appears
- Overall mood (luxury, playful, corporate, warm, minimal, industrial, editorial)
- Contrast strategy (high contrast, soft tones, dark mode)

### Imagery and Media

- Photo style (professional studio, candid, lifestyle, aerial, abstract)
- Image treatment (full-bleed, rounded corners, overlapping, masked shapes, duotone)
- Whether illustrations or icons are used prominently
- Video usage (background video, embedded, none)
- Image-to-text ratio on key pages

### Interactions and Animation

- Scroll animations (fade in, slide up, parallax, reveal on scroll)
- Hover effects on cards, buttons, images, or links
- Page transitions or loading animations
- Any interactive elements (sliders, tabs, accordions, counters)
- Whether animations feel subtle or dramatic

### Calls to Action

- Primary CTA style (button shape, colour, size, placement)
- CTA wording patterns (action-oriented, inviting, formal)
- How many CTAs appear per page
- Whether CTAs are repeated at section breaks or only at top and bottom

### Features and Functionality

- Contact forms and their complexity
- Testimonial or review display format
- Team or staff presentation style
- Service/product listing approach
- Blog or news section presence
- Social media integration
- Map or location display
- Any unique or standout features

## Step 2: Identify Common Patterns

After visiting all reference sites, identify what the client is drawn to. Look for patterns that appear across multiple references:

### Strongly Recurring (appeared in 3+ sites)

These are likely core preferences the client expects. Prioritise them.

### Partially Recurring (appeared in 2 sites)

These are probable preferences. Include them unless they conflict with strongly recurring patterns.

### Unique to One Site (appeared in 1 site only)

Note these but do not assume the client wants them. They may have admired that site for other reasons.

## Step 3: Filter Through Our Standards

Not everything from reference sites should be adopted. Filter every finding against our established practices.

### Must Respect

| Our Standard | How It Applies |
|-------------|----------------|
| **Astro + Tailwind + Alpine.js** | All features must be achievable within this stack. No React, Vue, or heavy JS frameworks. |
| **Zero unnecessary JavaScript** | Flashy JS-heavy interactions should be noted but translated into CSS/Alpine.js equivalents or omitted. |
| **Self-hosted everything** | External font services, analytics scripts, or CDN dependencies from reference sites are not adopted. Identify the fonts and find Fontsource equivalents. |
| **Mobile-first** | Desktop-first patterns from reference sites are reinterpreted as mobile-first. |
| **Performance budget** | Under 500KB first load, 95+ Lighthouse. Heavy video backgrounds or large animation libraries are noted but flagged. |
| **East African English** | Any copy style observations are filtered through our language and tone standard. |
| **Brand alignment** | Reference patterns serve the client's brand and ideal customer, not the reference site's. |
| **Accessibility** | Any pattern that compromises accessibility (low contrast text, missing alt text, keyboard traps) is corrected in the guide. |
| **Distinctive design** | Even when drawing from references, the final site must feel original to the client, not a clone. |

### Translation Rules

When a reference site uses technology or patterns outside our stack:

| Reference Site Uses | We Translate To |
|--------------------|-----------------|
| React/Vue components | Astro components + Alpine.js for interactivity |
| Framer Motion / Lottie | CSS animations + GSAP ScrollTrigger (if justified) |
| Google Fonts CDN | Fontsource self-hosted equivalent |
| Video backgrounds | Static hero image with subtle CSS animation, or flag as optional enhancement |
| Infinite scroll | Paginated sections or "Load more" with Alpine.js |
| Complex carousels | Simple Alpine.js slider or CSS scroll-snap |
| Parallax libraries | CSS `background-attachment: fixed` or lightweight IntersectionObserver |
| Cookie banners / chat widgets | Note as optional; do not include by default |

## Step 4: Generate the Design Reference Guide

Create `docs/design-reference.md` with the following structure:

```markdown
---
generated: true
sources: [list of URLs analysed]
generated_date: YYYY-MM-DD
---

# Design Reference Guide

## Reference Sites Analysed

| # | URL | What the Client Likely Admires |
|---|-----|-------------------------------|
| 1 | ... | Brief summary of standout qualities |
| 2 | ... | ... |

## Core Design Direction

One paragraph summarising the overall aesthetic direction
these references point toward. Name the direction clearly
(e.g., "Editorial Minimal", "Warm Corporate", "Bold Industrial").

## Layout Patterns

### Recommended Page Structure
- Homepage layout approach
- Inner page layout approach
- Section rhythm and spacing guidance

### Hero Section
- Recommended hero style with reasoning
- Fallback approach if photos are limited

### Section Flow
- How sections should alternate
- Background treatment between sections
- Spacing recommendations

## Typography Direction

### Heading Font
- Style: [serif/sans-serif/display]
- Character: [description of the feel]
- Fontsource candidates: [2-3 specific font names to evaluate]
- Reference: "Similar to what [reference site] uses"

### Body Font
- Style: [serif/sans-serif]
- Priority: readability
- Fontsource candidates: [2-3 specific font names]

### Text Treatment
- Heading sizes and weight pattern
- Any decorative treatments to consider
- What to avoid

## Colour Direction

### Palette Mood
- Overall tone: [dark/light/colourful/earthy/etc.]
- Dominant colour family: [description]
- Accent usage: [how and where]

### Background Strategy
- Page background approach
- Section background alternation
- Whether dark sections are appropriate

### Colour Candidates
Suggest 2-3 palette directions with hex values for the
design-system skill to evaluate. Do not lock in a final
palette — that is the design-system's job.

## Navigation Pattern

- Recommended nav style
- Number of items
- Mobile menu approach
- CTA in navigation: yes/no and style

## Image and Media Approach

### Photo Treatment
- Border radius
- Hover behaviour
- Layout style (grid, overlapping, full-bleed, contained)

### Recommended Image Roles
Map to photo-manager categories:
- Hero: [style and dimensions]
- Team: [style and dimensions]
- Services: [style and dimensions]
- Gallery: [if applicable]

## Animation and Interaction

### Scroll Animations
- Entry animation style (fade, slide, scale)
- Speed and timing feel
- Stagger behaviour for groups

### Hover Effects
- Button hover style
- Card hover style
- Image hover style

### What to Skip
- Animations from references that are too heavy for our stack
- Interactions that would require frameworks outside our stack

## Call-to-Action Style

- Primary CTA: shape, colour approach, size
- CTA wording direction (aligned with east-african-english)
- Placement pattern across pages

## Standout Features to Consider

List specific features from reference sites worth
implementing, with feasibility notes:

| Feature | Seen On | Feasibility | Notes |
|---------|---------|-------------|-------|
| ... | ... | Easy/Moderate/Complex | ... |

## Features to Skip

List features from reference sites that do not fit
our stack, performance budget, or the client's needs:

| Feature | Reason to Skip |
|---------|---------------|
| ... | ... |

## Do's and Don'ts for This Project

### Do
- [Specific guidance based on reference analysis]

### Don't
- [Specific warnings based on reference analysis]
```

## Step 5: Save and Report

1. Write the completed guide to `docs/design-reference.md`
2. Summarise the findings for the client in conversation:
   - Name the design direction identified
   - List the 3-5 most important patterns extracted
   - Note any reference features that were filtered out and why
   - Confirm which Fontsource font candidates to evaluate
3. Ask the client if the direction feels right before proceeding to the design-system skill

## How This Skill Connects to Others

```
Client provides URLs
        ↓
  design-reference        ← THIS SKILL (analyse → generate guide)
        ↓
  docs/design-reference.md is created
        ↓
  design-system reads it  ← alongside docs/style-brief.md
        ↓
  page-builder reads it   ← for layout patterns, section structure, features
        ↓
  brand-alignment reads it ← to verify the final site honours the reference direction
```

The design-system skill should read `docs/design-reference.md` alongside `docs/style-brief.md` when making typography, colour, and component decisions. If the two files conflict, the style brief takes priority — it represents the client's direct instructions, while the reference guide represents interpreted preferences.

## Rules

1. **Never clone a reference site.** Extract patterns and qualities, not specific designs. The client's site must be original.
2. **Never copy text from reference sites.** Content comes only from the client's `docs/` files.
3. **Always filter through our stack.** If a feature cannot be built with Astro + Tailwind + Alpine.js without significant compromise, flag it honestly.
4. **Name fonts by Fontsource availability.** Do not recommend a font that is not available on Fontsource. If a reference site uses a proprietary font, find the closest Fontsource alternative.
5. **Be honest about limitations.** If a reference site achieves its effect through heavy JavaScript, video, or a framework outside our stack, say so clearly and propose the best achievable alternative.
6. **Maximum 5 URLs.** Do not analyse more, even if the client insists. Quality of analysis drops with quantity.
7. **Confirm before proceeding.** Always present the guide summary to the client and get confirmation before the design-system skill begins work.
