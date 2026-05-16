# Design System Skill

Establish a cohesive, distinctive visual identity for the website before any pages are built.

## Input

Read `docs/style-brief.md` for:
- Industry and brand mood
- Specific color preferences (or let you choose)
- Preferred style direction
- Reference websites they admire

Also read `docs/company-profile.md` for industry context.

## Design Process

### 1. Choose Aesthetic Direction

Based on the industry and brief, commit to ONE bold direction:

| Industry | Good Directions |
|----------|----------------|
| Legal / Finance | Editorial, Luxury, Art Deco, Swiss/Grid |
| Healthcare | Organic, Warm Minimal, Soft Geometric |
| Tech / SaaS | Neo-Brutalist, Bold Geometric, Futuristic |
| Creative Agency | Maximalist, Experimental, Avant-Garde |
| Real Estate | Luxury, Editorial, Warm Modern |
| Education | Playful, Friendly, Colorful Minimal |
| Restaurant / Food | Organic, Warm, Textured, Artisanal |
| Construction | Industrial, Bold, Utilitarian |
| NGO / Non-profit | Warm, Human, Earthy, Hopeful |

**NEVER default to:** purple gradient on white, generic SaaS card layout, Inter + gray + rounded corners.

### 2. Typography

Choose fonts from **Fontsource** (npm packages, self-hosted):

- **Display/Heading font:** Something with CHARACTER. Examples: Clash Display, Cabinet Grotesk, Satoshi, General Sans, Instrument Serif, Playfair Display, DM Serif Display, Sora, Plus Jakarta Sans, Outfit, Manrope
- **Body font:** Highly readable, pairs well. Examples: DM Sans, Nunito Sans, Source Sans 3, Libre Franklin, Atkinson Hyperlegible

Install via: `npm install @fontsource-variable/{font-name}` or `npm install @fontsource/{font-name}`

Import in `src/styles/global.css`:
```css
@import '@fontsource-variable/clash-display';
@import '@fontsource/dm-sans/400.css';
@import '@fontsource/dm-sans/500.css';
@import '@fontsource/dm-sans/700.css';
```

**Rules:**
- NEVER use Inter, Roboto, Arial, system-ui as primary fonts
- NEVER use the same font pair across different projects
- Heading font should feel distinctive; body font should be invisible (easy to read)
- Limit to 2 font families max (a third readable script font is acceptable for very short phrases only)

### Typography Precision Rules (from Paduraru research)

**Line-height formula:** `line-height = font-size × 1.6`
- Body text at 16px → 16 × 1.6 = 25.6 → round to **26px line-height** (Tailwind: `leading-relaxed` ≈ this)
- Larger headings → shorter line-height; smaller text → taller line-height (inverse relationship)
- Body text standard: **16px font / 26px line-height** is the research-backed default

**Text colour — never use pure black:**
- Pure black (#000000) on white = maximum contrast → eye strain during extended reading
- Use **dark grey** for body text: e.g., `text-gray-900` (#111827) or `text-gray-800` (#1F2937)
- Pure white text on pure black background = **halation effect** — letters appear to bleed/glow
- Especially affects users with astigmatism (estimated 33% of adults)
- Tailwind defaults: `text-gray-900` on `bg-white` is the correct pairing, not `text-black`

**Type scale discipline:**
- Maximum **3 font sizes per section** (heading / subhead / body — not more)
- Centre-align only for short text (≤2 lines) — longer text always left-aligned
- Sentence case everywhere; ALL CAPS only for very short labels (badges, tags); never for body text

### Minimum Body Font Size (MANDATORY)

Body text must be **minimum 16px** (`text-base` in Tailwind). For audiences over 45, consider 18px. Smaller text causes eye strain and drives visitors away — readability trumps aesthetics.

### No Auto-Moving Elements (MANDATORY)

Never use any element that moves, rotates, or changes by itself:
- No auto-rotating carousels or sliders
- No auto-scrolling text or tickers
- No auto-playing videos or audio
- No animated client logo strips that move continuously
- No testimonial carousels that rotate on a timer

Self-moving elements are annoying, reduce conversions, and trigger banner blindness. Use static layouts or user-controlled interactions (click/swipe) instead.

**Exception:** Subtle scroll-triggered fade/slide animations (`.animate-on-scroll`) are fine — they respond to user action (scrolling), not a timer.

### Highlight Ratio Rule

On any single screen view, no more than 40% of visible text should be "highlighted" (bold, coloured, large, or in a button). When everything is bold, nothing is bold. Highlights work by contrast with surrounding plain content.

- Use bold text sparingly — 1-2 key phrases per paragraph maximum
- Avoid colouring more than 2-3 elements per screen view
- If a section has 3+ buttons visible at once, reduce to 1-2
- If every heading uses a colour background, remove them — headings should look like text, not buttons

### Safe Design Limits (Hard Maximums)

Each additional colour, font, or font size creates friction. Friction is good if you want visitors to pause and notice something. Friction is bad if you want them to read without interruption.

- **Max 2 font families** (heading + body)
- **Max 4 font sizes** (heading / subheading / body / CTA or small text)
- **Max 2-3 text colours** (body / headings / CTA — use 3 only if headings and body need different colours)
- Everything must remain readable: readable families, large enough sizes, good contrast to background

### 3. Color Palette

Define in `tailwind.config.mjs`:

```javascript
export default {
  theme: {
    extend: {
      colors: {
        primary: {
          50: '...',
          100: '...',
          // ... full scale 50-950
          DEFAULT: '...',  // 600 or 700 usually
        },
        secondary: { /* ... */ },
        accent: { /* ... */ },
        neutral: { /* ... */ },
        surface: {
          DEFAULT: '...',  // page background
          raised: '...',   // cards, elevated elements
          sunken: '...',   // recessed areas
        }
      },
      fontFamily: {
        display: ['Clash Display Variable', 'sans-serif'],
        body: ['DM Sans', 'sans-serif'],
      },
    }
  }
}
```

**Color rules:**
- Dominant color with sharp accent outperforms evenly-distributed palettes
- Dark backgrounds + light text can feel more premium than white backgrounds
- Use surface colors for depth (not just white and gray)
- Accent color should be used SPARINGLY — for CTAs and key highlights only
- Generate full color scales (50-950) for flexibility

### 4. Global Styles

Create `src/styles/global.css`:

```css
@import 'tailwindcss';

/* Font imports */
@import '@fontsource-variable/...';

/* CSS Custom Properties for non-Tailwind use */
:root {
  --transition-smooth: cubic-bezier(0.4, 0, 0.2, 1);
  --transition-bounce: cubic-bezier(0.34, 1.56, 0.64, 1);
}

/* Smooth scrolling */
html {
  scroll-behavior: smooth;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* Selection color matching brand */
::selection {
  background-color: var(--color-primary-200);
  color: var(--color-primary-900);
}

/* Scroll-triggered animation utilities */
.animate-on-scroll {
  opacity: 0;
  transform: translateY(30px);
  transition: opacity 0.6s var(--transition-smooth),
              transform 0.6s var(--transition-smooth);
}

.animate-on-scroll.visible {
  opacity: 1;
  transform: translateY(0);
}

/* Stagger delays for groups */
.stagger-1 { transition-delay: 0.1s; }
.stagger-2 { transition-delay: 0.2s; }
.stagger-3 { transition-delay: 0.3s; }
.stagger-4 { transition-delay: 0.4s; }
.stagger-5 { transition-delay: 0.5s; }
```

### 5. Animation Strategy

Use a lightweight Intersection Observer script (add to BaseLayout):

```javascript
// Scroll animation observer
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });

document.querySelectorAll('.animate-on-scroll').forEach(el => observer.observe(el));
```

For more complex animations (parallax, text reveals), use GSAP:
```javascript
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
gsap.registerPlugin(ScrollTrigger);
```

Only import GSAP where actually needed (Astro island architecture handles this).

### 6. Spacing System — 8pt Grid (MANDATORY)

All spacing, sizing, and dimension values must be **multiples of 8** (8, 16, 24, 32, 40, 48, 64, 80, 96...):
- Most screen resolutions are divisible by 8 → elements land on whole pixels → crisp rendering
- Consistent rhythm across the design → faster implementation, fewer arbitrary decisions
- Tailwind's default spacing scale (2=8px, 4=16px, 6=24px, 8=32px, 10=40px, 12=48px...) aligns perfectly

**Apply the 8pt grid to:**
- Padding and margins: `p-4` (16px), `p-6` (24px), `p-8` (32px), `gap-4`, `gap-6`, `gap-8`
- Icon sizes: 16px, 24px, 32px, 48px (never 20px or 28px)
- Button heights: 40px, 48px, 56px (never 42px or 50px)
- Section padding: `py-16` (64px), `py-20` (80px), `py-24` (96px)
- Component heights: 40px min-height for inputs/buttons (44px preferred for touch targets)

**Exception:** 4px baseline grid for text line-height increments only.

### 7. Shadow System — Two-Layer Technique

Most designers use one shadow layer. Two layers are required for realistic, premium shadows:

**Layer 1 — Core shadow** (tight, dark, close to element):
```css
/* Narrow, darker shadow immediately adjacent */
box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), /* core shadow */
            0 8px 24px rgba(0, 0, 0, 0.08); /* cast shadow */
```

**Layer 2 — Cast shadow** (wider, lighter, extends further):

**Tailwind shadow mapping:**
- `shadow-sm`: subtle elevation (inputs, small cards)
- `shadow-md`: standard card elevation
- `shadow-lg`: raised cards, dropdowns
- `shadow-xl`: modals, floating elements
- Hover state: step up one shadow level (e.g., `hover:shadow-lg` on a `shadow-md` card)

**Shadow rules:**
- **Never place shadow above an element** — contradicts natural light; users find it unfamiliar
- Light direction is always from above — shadow always falls below/below-and-to-the-right
- Larger elements cast larger shadows — proportional sizing
- Dark mode: never use white or light shadows — use a darker shade of element colour + lighter tint of background
- Inner shadow (`inset`) signals a recessed input field — use on form inputs to suggest "type here"

### 8. Component Patterns

Document these design decisions for the page-builder to follow:

**Buttons — All 6 States Required (design each one):**
1. **Default** — resting state, interactive, enabled
2. **Hover** — cursor is over button; colour shift or scale(1.02)
3. **Active/Pressed** — click/tap occurring; darker/depressed appearance
4. **Focus** — keyboard navigation highlight; visible ring (`ring-2 ring-offset-2`)
5. **Loading/Progress** — action is processing; spinner inside, button disabled
6. **Disabled** — non-interactive; `opacity-50 cursor-not-allowed`

All button tiers (primary/secondary/tertiary) must share the same `border-radius`, typography, and shadow style — only fill/colour changes between tiers.

**Button placement rule (F/Z-pattern):**
- Forward/next actions: right side
- Back/cancel actions: left side
- To discourage destructive actions: place Cancel in primary position, Confirm in secondary

**Cards:**
- Consistent border-radius (match button radius)
- **Nested radius rule (MANDATORY):** Never round inner elements the same as their parent card. Use the formula: `outer radius = inner radius + padding`. For example, a card with `rounded-2xl` (16px) and `p-4` (16px) padding means inner elements get `rounded-xl` (12px) or less — NOT `rounded-2xl`. If both radii match, nested corners look bulgy and uneven. Subtract the padding from the parent radius to get the correct inner radius.
- Subtle shadow or border — not both
- Hover: lift effect (translateY(-4px) + shadow increase)
- **Glass effect option:** For cards over gradient/image backgrounds, consider `bg-white/15 backdrop-blur-lg border border-white/20` — see `liquid-glass-effects.md` for full guide and sector-specific suitability

**Sections:**
- Generous vertical padding (py-20 to py-32)
- Max-width container with comfortable side padding
- Alternating background tones for visual rhythm
- Section headings: display font, large, with a subtle accent element (line, dot, gradient text)

**Footer:**
- Footer MUST have a visually distinct background colour from the page body. When footer blends into the page, visitors can't find policies, contact info, or social links — or they scroll past CTAs thinking the page continues.

**Images:**
- rounded-lg or rounded-2xl consistently
- object-cover for all background/hero images
- Subtle hover zoom on interactive images

### 9. Tidwell Layout Architecture Patterns

From *Designing Interfaces* (Tidwell, Brewer, Valencia — O'Reilly 2020). Full pattern reference: `book-extractions/tidwell-cognition-visual-patterns.md`.

**Visual Framework** — shared identity across every page.
- Every page shares: logo position, primary nav, utility nav, footer, font hierarchy, and colour use.
- The frame is constant; the centre-stage content changes. Users notice what changes, not what stays.
- Implement via a single layout template — separate style from content.

**Center Stage** — primary task occupies the largest, most dominant area.
- Centre stage must be at least 2× as wide/tall as any surrounding panel.
- Headlines and high-contrast type anchor the viewer's eye at the start of primary content.
- Toolbars, sidebars, and related content are subordinate — never let them compete visually.

**Grid of Equals** — equal-weight items in a consistent grid.
- Every item uses the same template: same dimensions, same image aspect ratio, same text hierarchy.
- Visual inequality in a "grid of equals" implies unintended ranking — avoid unless deliberate.
- Highlight one item (featured, larger) only when it truly is special.

**Titled Sections** — every content block has a short, scannable title.
- "What we do" beats "A comprehensive suite of end-to-end solutions."
- Whitespace between sections (not dividers) is cleaner; boxes add noise when too numerous.
- If you can't title a section concisely, the content grouping is probably wrong — reorganise.

**Progressive Disclosure** — show only what's needed; reveal detail on demand.
- Tier 1: essential — visible by default.
- Tier 2: supporting detail — revealed on expand, tab, or click.
- Tier 3: edge cases / advanced — help overlay or separate page.
- Forcing all users to process Tier 3 information is a cognitive tax on the majority who never need it.

**Module Tabs** — tabbed content within a page (not page-level navigation).
- Maximum ~8 tabs per group; never double-row the tabs.
- Selected tab must be unambiguously indicated (visual connection to content panel, not colour alone).
- If tab labels won't fit in a single row at narrow widths, use a dropdown selector instead.

**Accordion** — collapsible panels in a vertical stack.
- Use when users may need multiple sections open at once (unlike tabs).
- First section should default-open (most important/most common).
- Section headers must be full-width clickable (44px min height) with a visible expand/collapse indicator.

### 10. Tidwell Action Design Patterns

**Prominent Done/Next Button** — every screen has one obvious "what do I do next" action.
- Primary action button: most visually prominent interactive element on the page.
- Secondary action: ≤30% visual weight of primary (less colour, less size, less padding).
- One primary CTA per screen — two equal-weight CTAs create paralysis.

**Button Groups** — group related actions; separate unrelated ones.
- Same graphic treatment within a group (same height, border, colour, icon style).
- Destructive actions must be visually separated from primary actions — never adjacent.
- Place button groups to the left or right of what they act upon (proximity principle).

**Preview Before Commit** — show the result before costly/irreversible action.
- Photo/file uploads: show thumbnail preview before saving.
- Bulk operations: show count + list before "Confirm delete" dialog.
- Email sends, payments, and publication actions benefit from a review step.

**Spinners and Loading Indicators:**
- <300ms: no indicator needed
- 300ms–3s: spinner or determinate progress bar
- >3s: progress bar with estimated time + cancel option
- Full-page loads: use skeleton screens (content placeholders), not spinners
- Never leave blank white space where content is loading.

**Cancelability** — any operation >2 seconds must be stoppable.
- Show Cancel button adjacent to progress indicator.
- On cancel: restore prior state fully — no partial data left behind.

### 11. Tidwell Visual Style Rules

**Preattentive Variables** — detected in <200ms before conscious reading: colour, size, shape, orientation, motion.
- Use preattentive variables to guide the eye to priority content (CTA, error state, headline).
- Desaturate design to grayscale to test whether hierarchy survives colour removal.
- Colour alone is insufficient — 10% of men have some form of colour-blindness; always pair colour with shape + text.

**Photography for Direction:**
- Subject's gaze direction controls viewer eye movement — model facing CTA directs viewer to CTA.
- Avoid stock clichés: happy diverse team, road winding to horizon, handshake, sunset.
- Decorative images in functional interfaces are distracting — use sparingly.

**Icon Standards:**
- Icons must share consistent visual style: all filled OR all outline; same stroke weight.
- Never use icon alone — pair with text label for maximum comprehension.
- Follow established conventions: magnifying glass = search, envelope = message, house = home.

## Liquid Glass / Glassmorphism

For projects where glassmorphism suits the brand (Corporate, Tourism, Portfolio, Creator sectors), consult **`liquid-glass-effects.md`** for:
- Tailwind CSS v4 implementation patterns (cards, navbars, modals, hero overlays)
- Sector-specific suitability matrix (HIGH for Corporate/Tourism/Portfolio, LOW for Healthcare)
- Performance guidelines (max 3 glass elements, blur 8-16px, solid fallbacks)
- Accessibility requirements (contrast, `prefers-reduced-motion`, `prefers-contrast`)
- SVG liquid distortion filter (advanced, Chromium-only)
- Dark mode glass adaptation

**Rule of thumb:** Glass is seasoning, not the main course — use it on 2-3 key elements, not the entire page.

## Universal Guidelines

Before starting design decisions, review these references:

**`universal-guidelines/UNIVERSAL-DESIGN-GUIDELINES.md`** — core standards:
- Color theory and accessibility requirements
- Typography scales and readability standards
- Spacing systems and visual hierarchy
- Accessibility standards (WCAG 2.1 AA)
- Mobile-first responsive design approach
- Trust and credibility signals

**`universal-guidelines/ux-laws-and-psychology.md`** — the psychology behind design decisions:
- UX laws quick reference table (Hick, Fitts, Miller, Von Restorff, Endowed Progress, etc.)
- Cognitive load theory — reduce extraneous load in every layout decision
- Flow theory — how spacing and composition keep users engaged
- Aesthetic-Usability Effect — why visual quality directly impacts perceived trustworthiness
- Prospect-Refuge theory — designing for both freedom to explore and sense of safety

**`design-system/references/visual-hierarchy-advanced.md`** — layout physics:
- 8px spacing system with semantic values (which spacing goes where)
- Grid type selection (block vs column vs modular vs hierarchical)
- Visual tension and composition direction (horizontal/vertical/diagonal)
- Arnheim's Structural Net — how visual forces guide viewer attention
- Rule of Thirds and Golden Ratio for placement
- Subject matter and gaze direction — photography choices that direct attention to CTAs

**`design-system/references/responsive-patterns.md`** — mobile-first responsive architecture:
- Fluid typography with `clamp()` formulas (H1–body scaling across breakpoints)
- Responsive spacing system (8pt grid tokens that scale at md/lg/xl)
- Grid breakpoint recipes (1-col → 2-col → 3-col Tailwind patterns)
- Responsive component transforms (nav, cards, hero, forms per breakpoint)
- Safe area handling (notch, home indicator, viewport meta)
- Responsive testing checklist (12-point verification)

**`design-system/references/intrinsic-layout.md`** — intrinsically responsive layout system:
- Layout primitives (Stack, Box, Center, Cluster, Sidebar, Switcher, Cover, Grid, Frame, Reel, Container)
- CSS Grid `repeat(auto-fit, minmax())` for zero-breakpoint responsive grids
- Modular scale (ratio-based spacing + font sizing from one axiom)
- Logical properties (`inline-size`, `block-start` — multilingual-ready)
- Container queries for component-level responsiveness
- Subgrid for cross-card alignment
- Measure axiom (`max-inline-size: 60ch` on all text elements)

**`design-system/references/motion-design.md`** — animation timing system and micro-interactions:
- Duration tokens (instant → emphasis) with easing functions
- Micro-interaction patterns (button, card, link, focus, form field, toggle)
- Scroll-triggered animation patterns with stagger rules
- Modal/overlay animation sequences
- Loading animations (spinner, skeleton, progress bar)
- Performance rules (GPU-composited properties only, animation budget)
- Complete `prefers-reduced-motion` implementation (global + selective)

**`design-system/references/ux-quality-checklist.md`** — post-design validation:
- Design Grid quality check (count alignment lines — fewer = cleaner)
- 5-Second Test (can users identify the page purpose in 5 seconds?)
- Association Space verification (does the design trigger the right brand adjectives?)
- Hierarchy of Needs audit (functional → reliable → usable → pleasurable, in order)
- Cognitive overload audit (4 causes: inconsistency, unnecessary actions, competing elements, ambiguous signifiers)
- Expert review against ISO 9241-110 interaction principles
- Complete pre-launch UX checklist (visual + content + interaction + performance + trust)

**`design-system/references/ai-slop-prevention.md`** — AI-generated aesthetics detection gate:
- Visual anti-patterns (cyan-on-dark, purple gradients, glassmorphism overuse, neon accents, hero metrics layout)
- Typography anti-patterns (system font defaults, monospace laziness, overly close sizes)
- Layout anti-patterns (card grids everywhere, nested cards, everything centred, uniform spacing)
- Copy anti-patterns (redundant info, buzzword density, symmetrical bullets, clichéd loading text)
- 5-point AI Slop Audit (screenshot, palette, layout, copy, personality tests)

**Run the AI slop check during design-system setup AND after page-builder completes.**

**Run the UX quality checklist after completing the design system and before page-builder starts.**

This skill applies those universal principles to your specific sector/brand.

## Output

Create these files:
1. `tailwind.config.mjs` — with full theme configuration
2. `src/styles/global.css` — with font imports, base styles, animation utilities
3. `design-tokens.md` — a reference document summarizing all design decisions for other skills to read

The `design-tokens.md` should include:
- Aesthetic direction chosen and why
- Font pairing with installation commands
- Color palette with hex values
- Component patterns (buttons, cards, sections)
- Animation approach
- Spacing rhythm
- Do's and Don'ts specific to this project
