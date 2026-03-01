# CLAUDE.md - Static Website Project

This is a multi-language static website project built with Astro, Tailwind CSS, and Alpine.js. You are building a production-grade, visually stunning website from markdown content and client photos.

## Project Philosophy

We build **beautiful, blazing-fast, zero-JavaScript static websites** for clients who don't need a CMS. Every site must be distinctive - never generic. We ship performance by default and replace WordPress bloat with clean static HTML that scores 95-100 on Lighthouse.

## Architecture

```
docs/
  i18n-config.md   -> Language configuration (which languages are enabled)
  seo.md           -> SEO meta tags, structured data, sitemap config
  en/              -> English content (source language)
  fr/              -> French content (translated)
  sw/              -> Kiswahili content (translated)
photo-bank/
  branding/        -> Logos, brand marks
  hero/            -> Hero/banner images
  team/            -> Team headshots
  services/        -> Service images
  gallery/         -> Portfolio images
  about/           -> About page images
  testimonials/    -> Client photos
  misc/            -> Other images
.claude/skills/    -> Build instructions (git submodule) - you follow these
src/               -> Astro source code - you generate this
dist/              -> Built static site - Astro generates this
public/            -> Static assets (favicon, og-image, robots.txt)
```

The workflow is always: **read content -> establish design -> process photos -> build pages -> verify build**.

## Multi-Language Support

This site supports 3 languages: English (en), French (fr), Kiswahili (sw).

- **Configuration:** `docs/i18n-config.md` controls which languages are enabled
- **Content:** Each language has its own directory under `docs/{lang}/`
- **URL structure:** `/{lang}/page` (e.g., `/en/about`, `/fr/about`, `/sw/about`)
- **Default:** Root `/` redirects to the default language
- **Photos:** Shared across all languages (in `photo-bank/`)
- **Components:** Shared across all languages (accept `lang` prop)

### Language Standards
- **English:** British spelling (colour, organisation), formal East African professional tone
- **French:** Formal francophone African, vouvoiement (vous), professional and respectful
- **Kiswahili:** Standard East African, formal/respectful business register

### Text Expansion
- French: 20-40% longer than English
- Kiswahili: 10-30% longer than English
- All designs must accommodate longer text without breaking

## Skills

You have skills in `.claude/skills/`. Read them before generating any code.

| Skill | When to use | Reads | Produces |
|-------|-------------|-------|----------|
| `website-builder` | Starting a build or full rebuild | All docs/, photo-bank/ | Orchestrates everything |
| `i18n` | Always (cross-cutting) | docs/i18n-config.md | Language infrastructure |
| `design-reference` | When client provides reference URLs | Client URLs | docs/design-reference.md |
| `sector-strategies` | Industry-specific design direction | docs/en/company-profile.md | docs/sector-brief.md |
| `design-system` | Before building any pages | docs/en/style-brief.md, company-profile.md | tailwind.config.mjs, global.css, design-tokens.md |
| `photo-manager` | Before building pages, after design | photo-bank/**/* | src/assets/images/*/, _catalog.json |
| `page-builder` | After design + photos are ready | docs/{lang}/*.md, design-tokens.md, _catalog.json | src/pages/{lang}/, components/, layouts/ |
| `seo` | After pages are built | docs/seo.md, all pages | hreflang tags, sitemaps, structured data |
| `blog-writer` | When publishing blog articles | docs/{lang}/company-profile.md, blog pages | docs/{lang}/blog/*.md, Astro blog pages, Article JSON-LD |
| `deploy` | After all pages are built | src/, dist/ | deploy.sh, nginx.conf, verification report |

**Execution order matters:** website-builder -> i18n -> design-system -> photo-manager -> page-builder -> seo -> deploy.

## Critical Rules

### Content is truth
- ALL text content comes from `docs/{lang}/*.md` files. Never invent company names, services, team members, or any factual content.
- If a docs file has placeholder text like `[Write 2-3 paragraphs...]`, keep it as a placeholder in the built site or use a generic "Coming soon" - never fabricate content.
- YAML frontmatter in docs files contains structured data (name, email, phone, etc.). Use these values exactly.

### Photos are dimension-aware
- NEVER place a photo without first measuring its dimensions (use `identify` from ImageMagick or Python PIL).
- NEVER use a small image in a large slot (no upscaling).
- Every photo used must be tracked in `src/assets/images/_catalog.json`.
- Photos are copied from `photo-bank/` to `src/assets/images/{category}/` - never moved or modified.
- If no suitable photo exists for a slot, use a CSS gradient/solid color placeholder and document it in the catalog's `placeholders_needed` array.
- NEVER reference external placeholder services (no unsplash, no placeholder.com, no picsum).

### Design must be distinctive
- Read `docs/en/style-brief.md` and commit to a BOLD aesthetic direction appropriate to the industry.
- NEVER use Inter, Roboto, Arial, or system fonts as primary typefaces.
- NEVER default to purple-gradient-on-white or generic SaaS card layouts.
- Use fonts from Fontsource (self-hosted, no external CDN requests).
- Every project should look different. Vary themes, fonts, layout approaches, and color palettes.

### Performance is non-negotiable
- Zero unnecessary JavaScript. Astro ships no JS by default - keep it that way.
- Alpine.js only for interactive elements (mobile menu, accordions, tabs, modals).
- Self-host everything: fonts, icons, scripts. No external CDN dependencies.
- Use Astro's `<Image>` component for all images (auto WebP/AVIF, responsive srcsets, lazy loading).
- Hero images use `loading="eager"`. Everything else uses `loading="lazy"`.
- Target: total page weight under 500KB on first load (excluding lazy-loaded images).

### Accessibility is required
- Proper heading hierarchy: one `<h1>` per page, sequential `<h2>`-`<h6>`.
- Descriptive `alt` text on every image.
- `aria-label` on icon-only buttons and non-obvious interactive elements.
- Keyboard-navigable mobile menu.
- Color contrast: 4.5:1 for body text, 3:1 for large text.
- Focus-visible styles on all interactive elements.
- Include a skip-to-content link in BaseLayout.

### Mobile-first, always
- Design for 375px first, then enhance for 768px and 1280px+.
- Navigation: hamburger on mobile, full nav on desktop.
- Touch targets minimum 44x44px.
- No horizontal scroll at any viewport width.
- Typography scales: use responsive Tailwind classes (text-3xl md:text-4xl lg:text-5xl).

## Tech Stack

- **Astro** (latest) - static site generator, zero JS by default, component islands
- **Tailwind CSS v4** - utility-first styling with design tokens in config
- **Alpine.js** - lightweight interactivity (17KB, no build step)
- **GSAP** (optional) - scroll-triggered animations, parallax
- **Fontsource** - self-hosted Google Fonts alternatives
- **Lucide** or **Phosphor** - SVG icon sets

## Common Commands

```bash
npm run dev          # Start dev server at localhost:4321
npm run build        # Build to dist/
npm run preview      # Preview production build
```

## File Naming Conventions

### Photos in photo-bank/
- `Logo-{variant}.png` - brand logos (in branding/)
- `Hero-{description}.jpg` - hero/banner images (in hero/)
- `Team-{name}.jpg` - team member headshots (in team/)
- `Service-{name}.jpg` - service/product images (in services/)
- `Gallery-{name}.jpg` - portfolio/gallery images (in gallery/)
- `About-{description}.jpg` - about page images (in about/)
- `Client-{name}.jpg` - client logos or testimonial photos (in testimonials/)

### Components in src/components/
- PascalCase: `Header.astro`, `ServiceCard.astro`, `TeamMember.astro`
- One component per file
- Props interface defined at the top of the component

### Pages in src/pages/
- Language-prefixed: `src/pages/en/index.astro`, `src/pages/fr/about.astro`
- Slugs must match `docs/{lang}/pages.md` definitions

## Photo Replacement Workflow

The user will replace placeholder photos after the initial build:

1. `src/assets/images/_catalog.json` tracks every image with its path, dimensions, and where it's used.
2. To replace: drop a new file at the same path with the same filename.
3. Run `npm run build` - Astro regenerates optimized versions.
4. The catalog's `notes` field describes what each photo should be.

Always include helpful `notes` like "Needs: wide office exterior shot, min 1600x900".

## Deployment Model

Sites deploy via git pull and build. No server-side runtime, no database, no CMS.

```
Local:  edit -> build -> git push
Server: git pull -> npm run build -> nginx serves dist/
```

## When Updating an Existing Site

If the site already exists (src/ is populated):
- Read the existing `design-tokens.md` to maintain visual consistency.
- Read the existing `_catalog.json` to know what photos are available.
- Only regenerate the files that need to change - don't rebuild everything.
- Preserve any manual customizations the user may have made to components.
- Run `npm run build` after changes to verify nothing is broken.

## Error Handling

- If `docs/en/` is empty or missing critical files, tell the user what's needed before proceeding.
- If `photo-bank/` is empty, build with CSS gradient placeholders and document all needed photos.
- If `npm run build` fails, read the error output, fix the issue, and try again.
- If a font package fails to install, fall back to another distinctive font - never fall back to system fonts.
- If a language directory (fr/, sw/) is empty, skip that language in the build.
