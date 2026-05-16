---
title: AI Slop Prevention — Design Authenticity Gate
description: Detection framework for AI-generated aesthetic clichés. Every design decision must pass this gate before shipping. Ensures websites look human-designed, not machine-generated.
sources: pbakaus/impeccable "frontend-design" + "audit" + "critique" + "bolder" + "delight" skills (2025)
---

# AI Slop Prevention — Design Authenticity Gate

AI coding tools produce recognisable visual signatures. These tells are increasingly familiar to designers, developers, and savvy users. A website that looks "AI-generated" signals low effort and erodes trust — the opposite of premium. This gate catches those tells before they ship.

**Rule:** Run this checklist during design-system setup AND after page-builder completes. If any item triggers, fix it before deploy.

---

## VISUAL ANTI-PATTERNS (NEVER USE)

### The AI Colour Palette
- **Cyan-on-dark backgrounds** — the default "tech" palette of AI-generated UIs
- **Purple-to-blue gradients** — the signature AI colour story; avoid as primary palette
- **Neon accents on dark backgrounds** — AI's go-to "modern" look; feels generic
- **Gradient text for "impact"** — especially on metrics or hero numbers; almost always AI-generated
- **Monochrome dark + single neon accent** — the lazy AI dark theme (dark gray + electric blue/purple)

**Instead:** Use the project's brand colours. If the brand IS blue-to-purple, differentiate through typography, layout, and spacing — not the same gradient-on-dark treatment every AI tool defaults to.

### The AI Layout
- **Card grids everywhere** — same-sized cards with icon + heading + text, repeated 3–6 times, is the #1 AI layout tell
- **Nested cards** — cards inside cards create visual noise and scream "generated"
- **Everything centred** — AI centres everything because it's the safest choice; real designers use asymmetry and left-alignment for energy
- **Uniform spacing everywhere** — no rhythm, no breathing room variation; every gap identical
- **Hero metrics layout** — big number + small label + supporting stats + gradient background = pure AI slop
- **Generic rounded rectangles** with a coloured border on one side — AI's favourite "card" variant

**Instead:** Use the Tidwell layout patterns in `design-system/SKILL.md`. Break grids intentionally. Mix full-width sections with constrained content. Use asymmetric layouts where the content calls for it.

### The AI Effects
- **Glassmorphism overuse** — blur effects, glass cards, and glow borders on everything. One glass element per page maximum, and only where it serves a purpose (see `liquid-glass-effects.md` for appropriate use)
- **Generic drop shadows on rounded rectangles** — AI defaults to `shadow-lg rounded-xl` on every container
- **Sparklines as decoration** — tiny charts that show nothing meaningful, placed for visual filler
- **Glow effects** — outer glow, text glow, border glow — the AI "premium" treatment that looks cheap

**Instead:** Use shadows with intention (the 2-layer shadow system in design-system). Use texture, photography, and whitespace for visual interest.

---

## TYPOGRAPHY ANTI-PATTERNS

- **System font defaults** — Inter, Roboto, Arial, Open Sans, Poppins. These are the fonts AI reaches for because they're "safe." Our skill already bans Inter/Roboto/Arial; extend this vigilance to ALL default-feeling choices
- **Monospace typography as "dev tool" aesthetic** — AI uses monospace to signal "technical" without any design thought
- **Large icons with rounded corners above every heading** — the AI "feature section" pattern (coloured circle + icon + heading + paragraph)
- **More than 2 font families** — AI sometimes pairs 3+ fonts thinking variety = sophistication; it creates chaos
- **Overly close font sizes** — 14px, 15px, 16px used on the same page creates muddy hierarchy. Use the modular scale (minimum 1.25 ratio between levels)

**Instead:** Choose distinctive fonts per `design-system/SKILL.md` sector guidance. One display + one body font. Strong size contrast between heading levels (modular scale 1.25–1.5).

---

## COPY ANTI-PATTERNS

- **Repetitive information** — AI restates the same point in the header, intro, and first section. Say it once, well
- **Redundant section explanations** — "Our Services: Below you'll find our services" — the heading IS the explanation
- **Generic placeholder copy** — "We are a team of passionate professionals dedicated to delivering excellence" — meaningless filler that AI generates when it has no real content
- **Buzzword density** — "leverage," "synergy," "cutting-edge," "innovative solutions," "seamlessly" — see `blog-writer/references/human-voice-standards.md` for the full banned words list
- **Symmetrical bullet points** — AI generates exactly 3 or 6 bullet points of identical length; real content has natural variation
- **Clichéd loading/empty state messages** — "Herding pixels," "Teaching robots to dance," "Consulting the magic 8-ball" — AI-generated "personality" that's immediately recognisable as generated

**Instead:** Mine real client language from `docs/{lang}/company-profile.md`. Use the copywriting formulas in `page-builder/references/website-copywriting.md`. Vary sentence and paragraph length naturally.

---

## INTERACTION ANTI-PATTERNS

- **Bounce or elastic easing on everything** — feels dated and toy-like. Reserve spring easing for 1–2 emphasis moments per page maximum (see `motion-design.md`)
- **Hover effects on every element** — AI adds hover transforms to things that aren't interactive, confusing users about what's clickable
- **Identical transitions everywhere** — same 300ms ease-in-out on every element; no timing hierarchy
- **Auto-playing anything** — carousels, videos, animations that start without user action (already banned in design-system, but AI loves to add them)

---

## THE AI SLOP AUDIT (5-POINT CHECK)

Run this on every completed page:

1. **The Screenshot Test** — take a screenshot, show it to someone for 5 seconds. If they say "that looks AI-generated" or "that looks like a template," it fails
2. **The Palette Test** — remove all text. Do the colours alone look like they came from a specific brand, or could they belong to any website? Brand-specific = pass
3. **The Layout Test** — is there any layout element that surprises? Any asymmetry, any unexpected proportion, any bold compositional choice? If every section is a centred heading + centred text + centred cards, it fails
4. **The Copy Test** — read the first sentence of every section. Could this text appear on 100 other websites unchanged? If yes, it needs client-specific language mining
5. **The Personality Test** — does this website have a visual personality that would be recognisable without the logo? Distinctive typography, distinctive colour use, distinctive layout choices? If you could swap the logo and it would fit another brand, it fails

---

## WHAT MAKES DESIGN LOOK HUMAN

The antidote to AI slop is **intentional imperfection and distinctive choices:**

- **Asymmetric layouts** — not everything centred; content that flows naturally
- **Typographic personality** — fonts chosen for the specific brand, not for safety
- **Breathing room variation** — generous space where content needs room to land, tight space where elements are related
- **One bold visual choice per page** — an oversized heading, a full-bleed image, an unexpected colour block
- **Content-driven layout** — sections shaped by what they contain, not by a repeating template
- **Photography over illustration** when the client has real photos — real > generic
- **Restraint** — knowing when NOT to add another visual effect, gradient, or animation

---

## INTEGRATION

This reference is a quality gate. Check it:
- During `design-system` — when choosing colours, fonts, and component patterns
- During `page-builder` — when assembling sections and writing copy
- During `cro-audit` — as part of the visual quality assessment
- Before `deploy` — as a final pre-launch check in `ux-quality-checklist.md`

---

## Enterprise anti-patterns (added 2026-05-04 from Synechron Enterprise UX)

Source: `enterprise-ux-financial-insurance-extraction.md` Part I (diagnosis of why most enterprise apps fail).

These five patterns appear most often in B2B / SaaS / dashboard work. Detect early and fail loudly.

### 1. Feature overload
**Symptom:** every page is a wall of buttons, fields, tabs, dropdowns. The user can't tell what the primary task is.
**Detection cue:** > 7 primary actions visible above the fold on the main task page.
**Fix:** Identify the top 3 user goals. Surface those. Demote everything else to secondary navigation or settings.

### 2. Uninformed design
**Symptom:** the design was made by product owners + developers with zero user research.
**Detection cue:** no personas, no user interviews, no journey maps in project artifacts.
**Fix:** stop. Run discovery (see `enterprise-ux-maturity-checklist.md` Level 3 activities).

### 3. Inconsistent
**Symptom:** different fonts, different colors, different button styles across screens. No shared component vocabulary.
**Detection cue:** ≥ 3 button styles for "primary" action across the product.
**Fix:** establish design tokens; build a component library; refactor screens to use it.

### 4. Old-fashioned look
**Symptom:** decisions driven by the technology stack ("our framework only does X"), not by modern design language.
**Detection cue:** flat 1990s tables, no whitespace, default-OS controls only, no responsive design.
**Fix:** adopt a modern token system (typography, spacing, color) and a responsive layout grid.

### 5. Cluttered information
**Symptom:** content & info screens with no hierarchy strategy. Walls of text, dense tables, no scannable structure.
**Detection cue:** average page word count > 800 with no headings, lists, or visual breaks.
**Fix:** apply content hierarchy — H2 every 200–300 words, lists for ≥ 3 parallel items, callout boxes for the "one thing to remember."

### Audit checklist
- [ ] No page has > 7 primary actions above the fold
- [ ] Every project has personas + at least one user interview transcript on file
- [ ] Component library defines exactly 1 primary, 1 secondary, 1 tertiary button
- [ ] Layout is responsive on the 3 most-trafficked breakpoints
- [ ] Average paragraph ≤ 4 lines; hierarchy headings every 200–300 words
