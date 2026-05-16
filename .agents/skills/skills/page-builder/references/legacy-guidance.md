# Page Builder Skill

Historical detailed guidance preserved from the pre-standardized version of the skill.
Use `page-builder/SKILL.md` and the current references in this directory first.

Transform markdown content into stunning, production-grade Astro pages.

## Copywriting Reference

Before writing ANY page copy, read **`references/website-copywriting.md`** for copy formulas and **`references/conversion-design-rules.md`** for layout, CTA, UX anti-pattern rules, 60-30-10 colour rule, SCAMPER differentiation, and dual decision-maker rule. Also read **`blog-writer/references/human-voice-standards.md`** for the AI vocabulary blacklist. All generated text must sound 100% human-written.

**`references/interaction-design-principles.md`** — ISO 9241-110 interaction principles applied to static websites. Use as a checklist when building every page: task suitability, self-descriptiveness, conformity with expectations, learnability, controllability, error robustness, user engagement.

**`references/component-design-rules.md`** — Research-backed rules for every component: navbar (max 80px, 24px gaps, 8px radius), hero (max 10 words, don't fill viewport, 50-80% image overlay), cards (critical content at top, one CTA, nested border-radius formula), features, images (Rule of Thirds, emotional selection), icons (never mix styles), testimonials (quote first, name last), FAQ (first-person questions), footer (distinct background), pricing (premium tier left for anchoring), progressive disclosure (3-tier model). Also includes the Site Pattern Library for exploration, evaluation, and acquisition pages.

**`references/ui-states.md`** — the 5 states of every view (ideal, loading, empty, error, partial). Skeleton screen patterns, empty state anatomy (visual + explanation + CTA), error message 3-requirement rule, toast notifications, confirmation dialogs, and state design checklist.

**`references/touch-interactions.md`** — touch target sizing (44px mandatory), thumb zone mapping, hover fallback via `@media (hover: hover)`, mobile keyboard optimisation (`inputmode`, `enterkeyhint`, `autocomplete`), gesture patterns (CSS scroll-snap), and mobile form interaction rules.

**`references/aria-patterns.md`** — skip links, focus management (`:focus-visible`, focus traps), ARIA live regions (`role="alert"` vs `role="status"`), accessible disclosure (`<details>`), tabs (arrow key navigation), accordions (`aria-expanded`), semantic HTML checklist, and colour-independence rules.

**`references/advanced-navigation.md`** — hamburger debate (desktop: never), mobile off-canvas menu (Alpine.js + focus trap), accordion sub-menus, megamenu pattern, sticky hide-on-scroll-down nav, search integration, breadcrumbs, footer architecture (3-5 columns), and active state wayfinding.

**`references/ux-writing-patterns.md`** — microcopy patterns for every UI state: error messages (3-requirement rule applied per context), empty state copy (per feature type), loading text (verb matching), success toasts, form labels, button/CTA copy table, confirmation dialog structure, navigation labels, help text/tooltips, and voice/tone scale by user emotion.

**`references/design-hardening.md`** — edge case resilience: text overflow strategies (truncate, clamp, break), i18n text expansion rules (French +30%, Kiswahili +20%), image fallbacks, empty section handling, network degradation (3G performance budget), browser compatibility matrix, form resilience, accessibility resilience (high contrast, zoom, screen reader order), and print stylesheet. Run hardening checklist before deploy.

**Persuasion & conversion references** (from `sales-copywriting` skill):
- `sales-copywriting/references/headline-mastery.md` — Read for ALL headlines (10 formulas + 4 U's scoring)
- `sales-copywriting/references/fascination-bullets.md` — Read when writing bullet points that need to persuade
- `sales-copywriting/SKILL.md` — Read FULL skill when building landing pages, sales pages, or product pages

**Split-test conversion rules** (Brunson, 100+ tests):
- `references/conversion-rules.md` — Read when building any sales page, landing page, or order form. Contains data-backed rules for headlines (red, specific numbers, present tense), CTAs (button colour, copy, placement, no-delay), forms (Mad Libs, micro-commitment, two-step, inline), social proof (Facebook-style, placement at top of order form), pricing (dollar discounts, payment plans, trial offers), layout (simplification, pop-up timing, mobile testing), and the Master Control Blueprint as a default page structure.

## Universal Guidelines Reference

Before building pages, review these references:

**`universal-guidelines/UNIVERSAL-DESIGN-GUIDELINES.md`** — core standards for every page.

**`universal-guidelines/ux-laws-and-psychology.md`** — apply these on every page:
- **F-Pattern**: place the most important words at the start of every line and paragraph
- **Inverted Pyramid**: most critical information first, always
- **Hick's Law**: limit navigation items, pricing options, and form fields to ≤7
- **Von Restorff**: one primary CTA must look like nothing else on the page
- **Endowed Progress**: show progress bars pre-loaded at 20%; pre-check one onboarding step
- **Law of Proximity**: group related elements; separate unrelated ones by visible space
- **Jakob's Law**: use familiar patterns — never reinvent navigation without reason

**`references/conversion-design-rules.md`** — layout and UX anti-patterns to avoid on every page, plus button anatomy (all 6 states), Flow Theory checklist, and Endowed Progress applications.

This skill applies these universal content and UX principles to Astro implementation.

## Before Building ANY Page

**Read these files first:**
1. `design-tokens.md` — the design system decisions (fonts, colors, patterns)
2. `src/assets/images/_catalog.json` — available photos and their dimensions
3. `docs/{lang}/pages.md` — page structure and navigation for THIS language
4. The specific `docs/{lang}/*.md` file for the page content
5. **Universal Design Guidelines** — for content strategy and UX principles
6. **Language Standards** — tone, grammar, and style for THIS language (from language-standards skill)
7. **Voice DNA** — if the client has existing writing (blog posts, LinkedIn, proposals), build a voice profile before writing any copy (see `blog-writer/references/human-voice-standards.md` — Voice DNA Extraction)

**Multi-Language Note:** You are building pages for ONE language at a time. The website-builder will call you once per enabled language. Read content from `docs/{lang}/` (e.g., `docs/en/`, `docs/fr/`, `docs/sw/`), not the root `docs/` directory.

## Build Order

### First Time Only (All Languages)
1. `src/utils/i18n.ts` — language validation and utilities (shared, not language-specific)
2. `src/components/LanguageSwitcher.astro` — language switcher (shared)
3. `src/layouts/BaseLayout.astro` — language-aware HTML shell (shared, accepts lang prop)
4. `src/components/Header.astro` — language-aware navigation (shared, includes LanguageSwitcher)
5. `src/components/Footer.astro` — language-aware footer (shared)
6. Reusable components (Hero, ServiceCard, TeamMember, etc.) — shared across languages

### Per Language
7. Dynamic pages from `src/pages/[lang]/*.astro` — generate once per enabled language
8. Load language-specific content from `docs/{lang}/`
9. Pass lang prop through all components

**Note:** Components are shared across all languages. Content differs per language.

## BaseLayout.astro

Must include a language prop and hreflang tags:

```astro
---
import '../styles/global.css';
import type { Language } from '../utils/i18n';
import { languages, getHrefLangPath } from '../utils/i18n';

interface Props {
  lang: Language;  // language code (en, fr, sw)
  title: string;
  description?: string;
  ogImage?: string;
}

const { lang, title, description = '', ogImage = '/og-image.png' } = Astro.props;
const siteTitle = 'Company Name'; // from docs/{lang}/company-profile.md
const currentPath = new URL(Astro.request.url).pathname.replace(/^\/[a-z]{2}/, '') || '/';

// Language label for Open Graph
const langToLocale = (l: Language) => {
  const locales = { en: 'en_GB', fr: 'fr_FR', sw: 'sw_KE' };
  return locales[l];
};
---

<!DOCTYPE html>
<html lang={lang}>  {/* dynamic lang attribute */}
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content={description} />
  <meta property="og:title" content={title} />
  <meta property="og:description" content={description} />
  <meta property="og:image" content={ogImage} />
  <meta property="og:locale" content={langToLocale(lang)} />  {/* language variant */}
  <title>{title} | {siteTitle}</title>

  {/* Hreflang tags for all language versions */}
  {languages.map(langCode => (
    <link
      rel="alternate"
      hreflang={langCode}
      href={`https://example.com${getHrefLangPath(langCode, currentPath)}`}
    />
  ))}
  <link
    rel="alternate"
    hreflang="x-default"
    href={`https://example.com/en${currentPath}`}
  />

  <!-- Structured Data -->
  <script type="application/ld+json" set:html={JSON.stringify({
    "@context": "https://schema.org",
    "@type": "Organization",
    "name": siteTitle,
    // ... from docs/{lang}/company-profile.md
  })} />
</head>
<body class="font-body text-neutral-900 bg-surface antialiased">
  <Header lang={lang} />  {/* pass lang to Header */}
  <main>
    <slot />
  </main>
  <Footer lang={lang} />  {/* pass lang to Footer */}

  <!-- Scroll animation observer -->
  <script>
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible');
        }
      });
    }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });
    document.querySelectorAll('.animate-on-scroll').forEach(el => observer.observe(el));
  </script>

  <!-- Alpine.js for interactive components -->
  <script>
    import Alpine from 'alpinejs';
    window.Alpine = Alpine;
    Alpine.start();
  </script>
</body>
</html>
```

## Header Component

Must include (language-aware):
- Company logo/name (from docs/{lang}/company-profile.md)
- Navigation links (from docs/{lang}/pages.md nav_order) — language-specific
- Mobile hamburger menu (Alpine.js)
- **Language switcher** (NEW) — LanguageSwitcher component showing en/fr/sw options
- CTA button if specified
- Sticky/fixed positioning with backdrop blur
- Clean transition on scroll (background opacity change)

```astro
---
import type { Language } from '../utils/i18n';
import LanguageSwitcher from './LanguageSwitcher.astro';

interface Props {
  lang: Language;  // current language
}

const { lang } = Astro.props;
const currentPath = new URL(Astro.request.url).pathname.replace(/^\/[a-z]{2}/, '') || '/';
---

<!-- Mobile menu with Alpine.js -->
<header class="sticky top-0 z-50 bg-white/95 backdrop-blur-lg">
  <nav x-data="{ open: false }" class="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
    {/* Logo */}
    <a href={`/${lang}/`}>Logo / Company Name</a>

    {/* Desktop nav */}
    <div class="hidden md:flex gap-8 items-center">
      <a href={`/${lang}/about`}>About</a>
      <a href={`/${lang}/services`}>Services</a>
      {/* More links from pages.md */}
    </div>

    {/* Language Switcher */}
    <div class="hidden md:block">
      <LanguageSwitcher currentLang={lang} currentPath={currentPath} />
    </div>

    {/* Mobile toggle */}
    <button @click="open = !open" class="md:hidden">Menu</button>

    {/* Mobile menu */}
    <div x-show="open" x-transition class="absolute top-full left-0 right-0 bg-white md:hidden">
      <a href={`/${lang}/about`}>About</a>
      <a href={`/${lang}/services`}>Services</a>
      {/* Language Switcher in mobile menu */}
      <LanguageSwitcher currentLang={lang} currentPath={currentPath} />
    </div>
  </nav>
</header>
```

**LanguageSwitcher (NEW):** This component is automatically included. It shows language options (English, Français, Kiswahili) and navigates to the same page in the selected language. See i18n/SKILL.md for the component definition.

## Hard UX Rules (from conversion research)

### No Carousels or Sliders (MANDATORY)

Never use auto-rotating carousels, sliders, or any self-moving content on any page. This includes:
- Homepage header carousels
- Testimonial carousels
- Client logo carousels
- Blog post carousels

**Why:** Carousels rotate faster than visitors can read. Visitors ignore them (banner blindness) or find them annoying. Multiple studies show carousels reduce clicks and conversions. Use static content or tabbed content instead.

**Exception:** A manually controlled image gallery (user clicks arrows) is acceptable for portfolios or product photos.

### No Dropdown Navigation Menus (MANDATORY)

Never use dropdown menus in the main navigation. They:
- Are annoying and hard to use (especially on mobile)
- Cause visitors to skip top-level pages
- Make it harder to find information

**Alternatives:**
- 3-5 services? List them as top-level navigation items
- Many services? Create a dedicated Services overview page with links to each
- About sub-pages (team, story, values)? Combine into one About page

**Exception:** Mobile hamburger menu is fine (it's a toggle, not a hover dropdown). Mega menus are acceptable for e-commerce sites with many product categories.

### Homepage Section Ordering

Homepage sections follow the inverted pyramid — most important information first:

1. **What you do / for whom** — tagline, value proposition (+ photo for solopreneurs, CTA for e-commerce)
2. **Unique selling point** — if not clear from #1, explain why you're different
3. **Credibility** — testimonials, client logos, trust signals, statistics
4. **Overview of offers** — services/products with CTAs to dive deeper
5. **More credibility** — case studies, awards, certifications that support #4
6. **Featured content** — lead magnet, blog posts, or specific offer
7. **Final CTA** — last nudge before footer

**The homepage must NOT simply mirror the navigation.** Don't repeat "About | Services | Blog | Contact" as sections with thin descriptions. Add context, solve problems, build trust.

### CTA Placement Rule

Never place a CTA button before you've given the visitor enough context to want to click it. A CTA asking people to "Contact Us" before explaining what you do is wasted. Place CTAs AFTER:
- Explaining the benefit
- Addressing likely objections
- Providing evidence (testimonial, statistic, case study)

**Homepage exception:** Multiple CTAs are expected on homepages (see ordering above), but each CTA should follow its relevant context section.

### False Bottom Avoidance

A "false bottom" is an area that looks like the end of the page when content continues below. Avoid:
- Full-width coloured sections followed by another full-width section of the same colour
- Large amounts of whitespace between sections
- CTA sections that feel like a natural ending when there's more content below

**Fix:** Ensure visual continuity — alternate section backgrounds, add subtle separators, or use a design element that signals "more below."

### Testimonials in Context (MANDATORY)

Never create a standalone "Testimonials" page. Instead, place testimonials where they support specific claims:
- Homepage: below the value proposition to reinforce trust
- Service pages: next to the service the testimonial references
- About page: reinforcing team credibility
- Contact page: reducing hesitation before reaching out

Each testimonial should reinforce the claim made in the section above it. A testimonial about fast support belongs near the "support" section, not lumped with unrelated quotes.

---

## Section Patterns

### Hero Sections
Every page gets a hero. Vary the style per page:

- **Homepage hero:** Full-viewport, dramatic. Background image or gradient, large display font headline, subtitle, CTA button. Consider split layout (text left, image right) or full-bleed image with overlay.
- **Inner page hero:** Shorter (40-50vh), page title prominent, optional breadcrumb, background image with overlay.

**MANDATORY:** Every Hero component MUST include a `bgImage` prop with a relevant photograph and an appropriate gradient overlay (e.g. `bg-gradient-to-r from-primary-900/80 to-primary-900/40`). Plain-colour heroes without a background image are not permitted. Select a contextually appropriate photo from `src/assets/images/` for each page.

```astro
<!-- Homepage Hero Example -->
<section class="relative min-h-screen flex items-center">
  {heroImage && (
    <Image
      src={heroImage}
      alt="..."
      class="absolute inset-0 w-full h-full object-cover"
      widths={[640, 1024, 1920]}
      loading="eager"
    />
  )}
  <div class="absolute inset-0 bg-gradient-to-r from-primary-900/80 to-primary-900/40" />
  <div class="relative z-10 max-w-7xl mx-auto px-6">
    <h1 class="font-display text-5xl md:text-7xl text-white animate-on-scroll">
      {headline}
    </h1>
  </div>
</section>
```

### Content Sections
- Alternate background colors for visual rhythm (surface → surface-raised → surface)
- Generous padding: `py-20 md:py-28 lg:py-32` (scales across all languages)
- Max content width: `max-w-7xl mx-auto px-6`
- Use `animate-on-scroll` on section children with stagger classes

### Dynamic Routes

All pages are generated under language paths:

```
src/pages/[lang]/
├── index.astro          → /en/, /fr/, /sw/
├── about.astro          → /en/about, /fr/about, /sw/about
├── services.astro       → /en/services, /fr/services, /sw/services
└── [slug].astro         → /en/{slug}, /fr/{slug}, /sw/{slug}
```

**Route Configuration Example:**
```astro
---
export async function getStaticPaths() {
  const languages = ['en', 'fr', 'sw'];
  return languages.map(lang => ({
    params: { lang },
  }));
}

const { lang } = Astro.params;
// Load content from docs/{lang}/company-profile.md
---
```

Content loaded from `docs/{lang}/`, not `docs/`.

### Services/Features Grid
```astro
<div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
  {services.map((service, i) => (
    <div class={`animate-on-scroll stagger-${i + 1}`}>
      <ServiceCard {...service} />
    </div>
  ))}
</div>
```

### Team Grid
```astro
<div class="grid sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
  {members.map(member => (
    <TeamMember
      name={member.name}
      role={member.role}
      photo={member.photo}  <!-- from catalog -->
      bio={member.bio}
    />
  ))}
</div>
```

### Testimonials

**Always exactly 3 testimonials** in a `grid grid-cols-1 md:grid-cols-3` layout.

**Testimonials must come from the client.** Never fabricate, generate, or invent testimonials. The client provides real customer quotes in `docs/{lang}/testimonials.md`. We may:
- Rewrite for clarity and grammar (preserving the customer's meaning)
- Translate into enabled languages
- Trim for length (keeping the strongest statement)

**If no testimonials exist in docs:** omit the testimonials section entirely and add a `<!-- TODO: Client to provide 3 customer testimonials -->` comment. Never use placeholder or fictional quotes — fake social proof destroys trust and may violate advertising regulations.

**TestimonialCard props:** `quote`, `name`, `location`, `type` (no `business` prop).

```astro
<TestimonialCard
  quote="Direct quote from the client's testimonials.md file..."
  name="Real Customer Name"
  location="Kampala, Uganda"
  type="Retail"
/>
```

### Screenshots / Product Previews
Screenshots MUST be clickable with a fullscreen lightbox — use Alpine.js `$dispatch('open-lightbox', { src, alt })` event and a `<Lightbox />` component in BaseLayout. Never show screenshots as static thumbnails.

### CTA Sections
Bold, contrasting background. Clear action. One button, one message.

### Contact
- Contact info (from docs/contact.md)
- Simple form (Astro can handle this with form actions or static)
- Embedded map (optional, use iframe)
- Social links

## Image Usage Rules

**ALWAYS use Astro's Image component:**
```astro
---
import { Image } from 'astro:assets';
import heroImg from '../assets/images/hero-office.jpg';
---

<Image
  src={heroImg}
  alt="Descriptive alt text"
  widths={[640, 1024, 1920]}
  sizes="(max-width: 640px) 640px, (max-width: 1024px) 1024px, 1920px"
  loading="lazy"
  class="rounded-xl object-cover"  {/* inner radius < parent card radius */}
/>
```

- Hero images: `loading="eager"` (above the fold)
- Everything else: `loading="lazy"`
- ALWAYS provide descriptive alt text
- ALWAYS use object-cover for background-style images
- Check _catalog.json for available images before using ANY image
- **Image cards MUST NEVER have white space.** Always add `img { display: block; }` in the base layer of global.css. Every image inside a card must use `w-full h-full object-cover` (or `object-contain` for product shots only). The image container must have `overflow-hidden` and a height constraint (`h-full`, `aspect-[ratio]`, or explicit height). Never leave an image at its default inline display — this causes a baseline gap that produces ugly white space at the bottom of cards.

## Multi-Language Text Expansion

French ~30% longer than English (1.2–1.4×); Kiswahili ~20% longer (1.1–1.3×). Use `min-width`/`max-width`, never fixed widths. Test all buttons, labels, CTAs, and nav items with longer text. No text in images. Verify French/Kiswahili hero headlines don't break layout.

## Responsive Checklist (Every Page, Every Language)

- 375px: single column, 16px+ text, 44×44px touch targets, no horizontal scroll
- 768px: 2-col grids where appropriate, French/Kiswahili text fits
- 1280px: max-w-7xl, generous whitespace, buttons flex for longer translated text
- Navigation: hamburger mobile / full nav desktop / language switcher visible
- Images: responsive srcsets, object-cover on all background images

## Accessibility Requirements

- Proper heading hierarchy (one h1 per page, sequential h2-h6)
- Alt text on all images
- aria-labels on icon-only buttons
- Focus-visible styles on interactive elements
- Sufficient color contrast (4.5:1 for body text, 3:1 for large text)
- **Element-vs-background contrast check (MANDATORY):** Before using ANY colour class on a button, badge, text, or element, verify that the colour token actually exists in the theme (`global.css` `@theme` block) AND that it contrasts against its parent section background. For example, `bg-amber` does not exist if the theme only defines `bg-amber-500`; an undefined class renders no background, making the element invisible. Always cross-reference the exact token names in `@theme`. On dark backgrounds (navy, sea-800, sea-900), use `bg-highlight` (amber) or `bg-white`; on light backgrounds, use `bg-primary`, `bg-sea-800`, or `bg-navy`.
- Skip-to-content link in BaseLayout
- Keyboard navigable mobile menu

## Performance Rules

No external scripts/fonts/analytics CDN. Self-host via Fontsource. Astro auto-optimises images (WebP/AVIF). Alpine.js only for interactivity. Lazy load all below-fold images.

## Content Best Practices

Apply `content-writing` skill and `references/website-copywriting.md` to all copy. Read `blog-writer/references/human-voice-standards.md` for the AI vocabulary blacklist. Key rules: benefit-driven headlines, no throat-clearing ledes, Fog Index 8-10, client language mining, outcome over feature. CTAs use specific action language ("Discuss Your Project" not "Contact Us") — 1-2 per section, positioned after value prop. **Krug scanning rules (mandatory):** users scan not read — use headings that stand alone as labels, ≤3-sentence paragraphs, bullet any list of 3+, bold key terms on first use; cut word count in half then cut half again; kill happy talk and instructions; apply `web-usability-krug` global skill for full reference.

## Tidwell Navigation and Mobile Rules

Full patterns: `book-extractions/tidwell-navigation-mobile-forms.md`.
- **Clear Entry Points:** 2-4 task-oriented "front doors" on landing pages — visually dominate over utility nav
- **Escape Hatch:** every constrained page (wizard, modal, 404) needs a visible route back; clickable logo = escape hatch
- **Breadcrumbs:** required >2 levels deep — Home > Category > Current Page, each item except current is a link
- **Sitemap Footer:** task-oriented header + full-site footer = proven two-part navigation; structure: categories + legal + contact
- **Vertical Stack Mobile:** single column; first 100px = content only — never waste with stacked logo/ad/nav ("layer cake")
- **Mobile Touch Targets:** 44×44px minimum; full row of radio/checkbox clickable, not just the control
- **Strip to Essentials:** remove sidebars, ads, social rows, newsletter popups on mobile; minimise taps

## Content Parsing (Multi-Language)

Read `docs/{lang}/*.md` for THIS language only — never mix languages or read from root `docs/`. YAML frontmatter = structured data; `## Heading` = section break; `**bold**` after heading = field value. Parse flexibly. Apply language standards and text expansion awareness to all layouts.
