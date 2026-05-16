# Website Builder — Master Orchestrator

Historical detailed guidance preserved from the pre-standardized version of the skill.
Use `website-builder/SKILL.md` and the current references in this directory as the primary contract.

You are building a beautiful, blazing-fast static website using Astro + Tailwind CSS + Alpine.js.

## Before You Start

### Required Claude Code Plugins

Install these plugins before building any website if the environment supports them. They materially improve frontend work quality:

```
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
/plugin marketplace add anthropics/claude-code
/plugin install frontend-design@claude-code-plugins
```

**Prerequisites:** Node.js and the `claude` CLI (`npm install -g @anthropic-ai/claude-code`) with a Pro/Max subscription. Restart Claude Code after installing plugins.

If already installed, these commands are safe to re-run. Do this at the start of every new website project.

### Read Content Files

**ALWAYS read these files first, in this order:**

1. **`docs/i18n-config.md`** — language configuration (NEW: Multi-language support)
2. `docs/pages.md` — what pages to build and their structure
3. `docs/style-brief.md` — design direction and brand info
4. `docs/company-profile.md` — company details (read all language versions)
5. ALL other files in `docs/{lang}/` for each enabled language
6. Scan `photo-bank/` — what photos are available

Do NOT generate any code until you have read ALL content files in ALL enabled languages.

### Language Detection

The website supports 3 languages: English (en), French (fr), Kiswahili (sw). Before building:

1. Check `docs/i18n-config.md` for enabled languages
2. Detect which languages are configured (all 3, or a subset)
3. For each enabled language, read complete content in `docs/{lang}/`
4. Verify all required files exist for each language (company-profile.md, pages.md, etc.)
5. Note any languages with incomplete content (will not be built)

**Example**: If i18n-config.md shows French incomplete, only build en/ and sw/.

## Orchestration Steps

### Step 0: Detect Languages
Read `docs/i18n-config.md`:
1. Which languages are enabled? (en, fr, sw — could be all 3, or a subset)
2. What is the default language for root domain redirect?
3. Which languages have complete content?
4. Note any in-country reviewers or special translation notes

All subsequent steps are language-aware.

### Step 1: Scaffold (if needed)
If no `package.json` exists:
```bash
npm create astro@latest . -- --template minimal --no-git --no-install
npx astro add tailwind -y
npm install alpinejs
npm install gsap
```
Install any Fontsource fonts chosen by the design system.

Also create i18n utilities (shared across all languages):
- `src/utils/i18n.ts` — language validation, path utilities
- `src/components/LanguageSwitcher.astro` — language selector

### Step 2: Design System
Follow `.claude/skills/design-system/SKILL.md` to establish:
- Font selections (self-hosted via Fontsource)
- Color palette in tailwind.config.mjs (shared across all languages)
- Global styles in src/styles/global.css
- Animation utilities
- Component design patterns

Design is language-agnostic; same colors, fonts, layout for all languages.

### Step 3: Photo Management
Follow `.claude/skills/photo-manager/SKILL.md` to:
- Catalog all photos in photo-bank/
- Copy to src/assets/images/ (single flat directory — no subdirectories)
- Generate _catalog.json with dimensions and usage tracking

Photos are shared across all language versions (no language-specific images unless required).

### Step 4: Build Pages
For EACH enabled language:

Follow `.claude/skills/page-builder/SKILL.md` to:
- Create language-specific BaseLayout.astro variant (accepts lang prop)
- Create reusable components shared across languages (Header, Footer, Hero, etc.)
- Build each page from `docs/{lang}/` content
- Wire up language-specific navigation
- Inject LanguageSwitcher into Header

Content differs per language; components and layout are shared.

### Step 5: SEO Integration
Follow `.claude/skills/seo/SKILL.md` to:
- Generate hreflang tags for each language version
- Create language-specific sitemaps
- Add Open Graph locale tags
- Manage canonical URLs

### Step 6: Verify
- Run `npm run build` and fix any errors
- Check that all pages exist in dist/ for each language (dist/en/, dist/fr/, dist/sw/)
- Verify no broken image references in any language
- Test language switcher navigates correctly
- Verify hreflang tags present in all pages
- Check sitemaps generated for each language
- Create deploy.sh script and server config that preserve the generated Astro root page for browser-language detection

## Critical Rules

1. **Ship ZERO unnecessary JavaScript.** Astro handles this by default — don't add client-side frameworks unless absolutely needed. LanguageSwitcher is lightweight (no JS, just HTML links).
2. **Every image must go through the photo pipeline.** Never hardcode image paths. Always reference from the catalog and use Astro's `<Image>` component. Images are shared across all language versions.
3. **Mobile-first design.** Every page must look great at 375px width. Test mentally at 375px, 768px, 1280px for ALL languages (longer text in French/Kiswahili).
4. **Semantic HTML.** Use proper heading hierarchy, landmark elements, aria-labels. Include `lang` attribute on `<html>` tag. Use `<link rel="alternate" hreflang>` for all language versions.
5. **Performance budget:** Total page weight under 500KB on first load (excluding lazy images) for each language version.
6. **Design must be DISTINCTIVE.** No generic SaaS templates. Read the style brief and commit to a bold direction. Design applies to all languages.
7. **Self-host everything.** No Google Fonts CDN, no external analytics scripts, no CDN dependencies. Shared across languages.
8. **Multi-language design flexibility.** French and Kiswahili text expands 20-40% and 10-30% respectively. Use flexible containers, test with longer text, never hardcode text widths.
9. **Language-specific content.** Load content from `docs/{lang}/` paths. Never share content between languages. Each language has complete independent content.
10. **Language switcher on every page.** Header includes LanguageSwitcher that stays visible, allowing users to change languages without losing their place.

## Output Summary

After building, provide:

**Multi-Language Build:**
- Languages built: [en, fr, sw / subset]
- Default language: [en / configured]
- Pages per language: [list of pages created in each language]

**Design & Assets:**
- Design direction chosen
- Photos used (shared across all languages)
- Any placeholder photos noted

**Content & SEO:**
- Content gaps found in `docs/{lang}/` for each language
- Languages with incomplete translations
- Hreflang tags verified on sample pages
- Language-specific sitemaps generated

**Testing:**
- All languages tested at 375px, 768px, 1280px
- Text expansion accommodated (French/Kiswahili longer than English)
- Language switcher functional on all pages
- Root language-detection page working at `/`

**Development:**
- How to run locally: `npm run dev`
- How to test specific language: `http://localhost:3000/en/`, `http://localhost:3000/fr/`, `http://localhost:3000/sw/`
- How to replace placeholder photos (reference _catalog.json)
- How to add translations to additional pages
