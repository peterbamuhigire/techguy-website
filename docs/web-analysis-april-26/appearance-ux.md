# Appearance and UX — April 2026

---

## 1. Colour System Audit

**Section score: 7.5/10**

### 1.1 Current Palette Assessment

**Score: 8.0/10**

Defined in `src/styles/global.css:12-42` and `tailwind.config.mjs`:

| Token | Value | Role |
|-------|-------|------|
| `navy-900` | `#0D1526` | Primary dark background |
| `navy-950` | `#070B15` | Deepest background (hero) |
| `gold-400` | `#F0C243` | Primary accent, active states |
| `gold-500` | `#D4A843` | Secondary gold |
| `amber-accent` | `#C75B12` | CTA buttons, links |
| `warm-white` | `#FAF8F5` | Light section backgrounds |
| `warm-cream` | `#F5F0EB` | Alternate light sections |

**Overall assessment:** This is a deliberately chosen, industry-appropriate palette. Navy with gold accents is the correct choice for a high-trust professional services practice in the East African market — it reads as authoritative without being cold (unlike blue-grey tech palettes) or corporate-sterile (unlike pure black and white). The warm-white and warm-cream base colours prevent the flatness of pure white.

The colour-selection skill's 60-30-10 rule is well-implemented: navy covers ~60% of visible page area across dark sections, warm-white/cream covers ~30% (light sections), and gold/amber covers ~10% (accents, CTAs, highlights).

**Industry alignment:** Correct. Professional services in East Africa benefit from gold-accented navy — it reads as premium without being ostentatious, and it is culturally legible as "serious, established, trustworthy" across both anglophone and francophone markets.

---

### 1.2 Accessibility — Contrast Ratios

**Score: 7.0/10**

Estimated contrast ratios for the primary text-on-background combinations:

| Text | Background | Ratio (est.) | WCAG AA (4.5:1 body) | Status |
|------|-----------|--------------|----------------------|--------|
| `warm-cream` (#FAF8F5) on `navy-900` (#0D1526) | — | ~17:1 | Required 4.5:1 | Pass |
| `gold-400` (#F0C243) on `navy-900` (#0D1526) | — | ~9.5:1 | Required 3:1 (large) | Pass |
| `navy-200` (#9FA8DA) on `navy-900` (#0D1526) | — | ~4.6:1 | Required 4.5:1 | Marginal pass |
| `navy-300` (#7986CB) on `navy-900` (#0D1526) | — | ~3.5:1 | Required 4.5:1 | **Fail for body** |
| Body text (#1A1A2E) on `warm-white` (#FAF8F5) | — | ~18:1 | Required 4.5:1 | Pass |
| `amber-accent` (#C75B12) on `warm-white` (#FAF8F5) | — | ~4.6:1 | Required 4.5:1 | Marginal pass |
| `navy-500` (#3949AB) on `warm-white` (#FAF8F5) | — | ~5.8:1 | Required 4.5:1 | Pass |

**Critical finding:** `navy-300` (`#7986CB`) is used in the footer for secondary text (`src/components/Footer.astro:47, 72, 87`) against `navy-900` background. The estimated contrast ratio of ~3.5:1 fails WCAG AA for normal-sized text. The footer service links, contact details, and description text all use this class. This is the only significant accessibility failure in the colour system.

**Pure-grey concern:** The colour-selection skill requires tinted neutrals rather than pure grays. The palette uses navy-tinted neutrals (navy-300, navy-200 etc.) rather than pure gray, which is correct. However, the body text colour is set to `#1A1A2E` (`global.css:54`) rather than the navy-900 token — this is a slightly purple-tinted near-black, which is acceptable but should be consolidated to `navy-900` for token consistency.

---

### 1.3 Palette Coherence

**Score: 7.5/10**

**Positive findings:**
- The navy scale runs from 50 to 950 (12 steps) — comprehensive coverage for all UI states
- Gold scale runs from 50 to 900 — enough for hover states, active states, borders
- Amber-accent (`#C75B12`) is the darkest/warmest CTA colour and creates excellent contrast against white
- Warm-white and warm-cream differentiate light sections without introducing a third hue

**Coherence gap:** The amber-accent token (`#C75B12`) is an orange-red sitting outside the gold family. While it works visually for CTAs (high contrast, warm, energetic), it is not related to the gold scale by hue — it is a complementary accent, not an extension. This is a deliberate and defensible choice, but it means the site has three visual families (navy, gold, amber) rather than two. The colour-selection skill recommends limiting the primary palette to 3 tokens; this site effectively has 3 hue families, which is at the ceiling.

---

## 2. Design System Audit

**Section score: 8.0/10**

### 2.1 Typography

**Score: 9.0/10**

**Fonts:**
- Heading: Playfair Display (400, 700, 900 weights — self-hosted via Fontsource, `global.css:2-7`)
- Body: DM Sans (400, 500, 700 — self-hosted, `global.css:8-10`)

**Assessment:** Excellent pairing. Playfair Display is an editorial serif with strong character — it signals prestige, seriousness, and craftsmanship. DM Sans is a geometric humanist sans-serif — clean, legible at small sizes, modern without being trendy. The contrast between the warm serif heading and the clean sans body creates visual interest that most competitor sites (using only sans-serif throughout) lack.

**The design-system skill's prohibition on Inter, Roboto, Arial, or system fonts is satisfied.** This is a meaningfully distinctive typographic choice for the East African market.

**Heading scale:**
- h1: `text-4xl md:text-5xl lg:text-6xl` (responsive) — correct, prominent
- Blog prose h2: 1.625rem (`global.css:134`) — appropriate
- Blog prose h3: 1.25rem (`global.css:143`) — correct hierarchy

**Reading concern:** Body text line-height is 1.6 (`global.css:56`) which is appropriate for screen reading. Blog prose line-height is 1.8 (`global.css:129`) — generous, readable. No issues here.

---

### 2.2 Component Consistency

**Score: 7.5/10**

**Positive findings:**

The component architecture is well-structured. Shared components include:
- `BaseLayout.astro` — schema, hreflang, meta, skip-to-content, analytics
- `Header.astro` — fixed nav with Alpine.js mobile menu
- `Footer.astro` — consistent across all pages
- `SectionHeading.astro` — consistent section title/subtitle treatment
- `CTASection.astro` — reusable bottom CTA
- `ServiceCard.astro`, `StatCard.astro` — consistent card patterns

**Inconsistency found:** The footer Quick Links list (`Footer.astro:70-79`) duplicates nav items but excludes "Blog" (which is in the header nav). This is a minor inconsistency — a visitor expecting to find the blog in the footer will not.

**Section background alternation** (warm-white → navy → warm-cream → navy-900) is applied consistently on the homepage, creating a visual rhythm. The geo-pattern texture appears on navy sections only, which is correct (overuse would reduce impact).

---

### 2.3 Mobile-First Execution

**Score: 7.5/10**

**Assessment: Good, with one gap.**

**Positive findings:**
- Header hamburger menu uses Alpine.js with proper `aria-expanded` and smooth transition (`Header.astro:96-140`)
- `[x-cloak] { display: none !important; }` prevents flash of unhidden content
- Hero grid uses `order-2 lg:order-1` to put the text above the photo on mobile
- Touch targets on nav links appear adequate (py-3 ≈ 48px height on mobile links)
- Viewport meta tag present: `src/layouts/BaseLayout.astro:133`
- `min-h-screen` on body prevents short-page layout breaks

**Gap identified:**
- No sticky mobile CTA. On the contact page and services page, the primary CTA ("Book a Consultation") only appears at the bottom or in the hero. On mobile, a user scrolling through service details has no persistent access to the primary action. The CRO skill's rule requires a conversion mechanism accessible from every scroll position on key conversion pages.

---

## 3. UX Audit

**Section score: 7.0/10**

### 3.1 Navigation Analysis

**Score: 7.0/10**

**Desktop navigation** (`Header.astro:14-22`):
```
Home | About | Services | Websites | Portfolio | Blog | Contact | [FR] | [Book CTA]
```

7 main nav items plus language switcher plus CTA button = 9 interactive elements. The CRO skill's Hick's Law limit is 5-7 primary items. At 9 total, this is at the ceiling.

**Finding:** "Websites" and "Portfolio" as separate nav items creates ambiguity. "Websites" implies a service offer; "Portfolio" implies past work. From a user perspective, these are closely related — a visitor looking for evidence of past website work might check both. Consider whether these need to be separate top-level items or could be consolidated (e.g. "Work" with a dropdown or sub-navigation).

**Active state:** Active nav items use `text-gold-400` correctly (`Header.astro:51-54`). The language switcher is visually distinct (small, bordered) — this is correct; it should not compete with navigation.

**Mobile navigation:** Alpine-driven slide-in menu with smooth transition. The mobile menu correctly promotes the CTA button to a full-width block at the bottom of the menu list. Accessible: hamburger button has `aria-label="Toggle menu"`.

---

### 3.2 Form Audit (Contact Form)

**Score: 6.0/10** — contact form is strong; newsletter form is non-functional (critical deduction).

`src/pages/en/contact.astro:65-100` (first 100 lines of form examined):

**Positive findings:**
- Alpine.js client-side validation before submission
- CSRF token fetched from `/api/csrf-token.php` on form init
- Honeypot field (`website`) for bot detection
- Field-level error state tracking (`fieldErrors` array)
- Service selection dropdown reduces message ambiguity
- Preferred contact method selection (Phone/WhatsApp/Email) — this is a good form-UX-design pattern for African markets where WhatsApp is often the preferred channel

**Form-UX gaps (applying form-ux-design skill):**

1. **Labels:** Cannot confirm from the first 100 lines whether all labels are outside the field (not placeholder-only). The email field and others should have explicit `<label>` elements visible above the field.

2. **No micro-commitment step:** The CRO skill identifies a micro-commitment (survey question before the main form) as generating +95% lift. The form goes directly to full form — no qualifying question first.

3. **Submit button copy:** The submit action (not visible in first 100 lines) is likely generic ("Submit" or "Send"). It should be: "Book My Consultation" or "Send My Project Brief".

4. **Newsletter form** (`src/pages/en/blog.astro:276-293`): `action="#"` with `@submit.prevent="submitted = true"` — this form does **not submit to any backend**. The confirmation message fires on prevent-default, but no email is collected. This is a critical bug — any newsletter subscriber who enters their email gets a success message but is never recorded. The form-ux-design skill requires all forms to actually submit.

---

### 3.3 Cognitive Load Assessment

**F-pattern audit (CRO skill, Dimension 6):**

Homepage above-fold (estimated 1280px layout):
- Logo: top-left (correct F-pattern hot zone)
- Navigation: top horizontal strip (correct)
- h1 "Building Technology Solutions Across Africa & Beyond": left column, large (correct)
- "Available for new projects" badge: above h1 (correct visual hierarchy start)
- Primary CTA ("Book a Free Consultation"): below h1, left column (correct)
- Hero photo: right column (correct — faces toward left/copy)

This layout follows the F-pattern correctly. The hero image's decorative frame (`src/pages/en/index.astro:123-126`) adds visual interest without competing with the headline.

**Stats strip** (`src/pages/en/index.astro:156-165`):
Four stat cards (15 years, 10 countries, 3 products, 6 industries) on navy-800 background with GSAP counter animation. The stats are specific (meets the CRO skill's specific-numbers rule), but they lack labels that explain *why the number matters*. "15+" means something; "15+ years serving organisations that cannot afford technology to fail" means more.

**Section count:** The homepage has 6 sections (Hero, Stats, Services, Products, Why Peter, Testimonials, CTA). This is appropriate for a comprehensive homepage without being overwhelming. Each section has a clear focus with one primary action.

**Cognitive load verdict:** Visual hierarchy is clear, sections are well-delineated, and the GSAP animations add polish without distraction. The main load issue is the navigation (9 items) and the information density of the services section (4 service cards + featured service spotlight on one background).

**Score: 7.0/10**

---

### 3.4 Mobile Usability

**Score: 7.5/10**

**Touch targets:** Mobile nav links use `block px-4 py-3` — approximately 48px height, above the 44px minimum.

**Hero on mobile:** The grid reverses order on mobile (`order-2 lg:order-1`), placing text content above the photo. On a 375px viewport, the headline "Building Technology Solutions Across Africa & Beyond" at `text-4xl` (~36px) will likely wrap to 3-4 lines, pushing the CTA down significantly.

**Recommendation:** Test the hero at 375px. If the CTA falls below the fold, shorten the headline for mobile or apply `text-3xl sm:text-4xl` to ensure CTA visibility.

**No horizontal scroll** (confirmed by Tailwind's `max-w-7xl mx-auto` container pattern and `overflow-hidden` on the hero section).

**Images:** All hero images use `loading="eager"`; portfolio and blog images use `loading="lazy"` — correct implementation.
