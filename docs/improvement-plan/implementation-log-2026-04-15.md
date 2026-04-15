# Improvement Plan Implementation Log

Date: 2026-04-15 (initial) | Updated: 2026-04-15 (pass 2)

This log records the concrete implementation work completed in the website codebase against the improvement plan in `docs/improvement-plan/`.

---

## Pass 1 — 2026-04-15

### Phase 1: Foundation and Measurement

- Replaced placeholder analytics and verification handling with environment-driven support in `src/layouts/BaseLayout.astro`.
- Corrected `hreflang` handling from `fr-FR` to `fr` in the base layout and `astro.config.mjs`.
- Added `Disallow: /api/` to [public/robots.txt](/C:/wamp64/www/techguy-website/public/robots.txt).
- Added [src/pages/404.astro](/C:/wamp64/www/techguy-website/src/pages/404.astro).
- Implemented working newsletter capture endpoint in [public/api/newsletter.php](/C:/wamp64/www/techguy-website/public/api/newsletter.php) and wired shared newsletter submission handling through the base layout.

### Phase 2: Positioning

- Established the category claim, hero language, and expert posture in [src/data/site.ts](/C:/wamp64/www/techguy-website/src/data/site.ts).
- Rewrote the English and French homepages to position the practice around authority websites, software systems, and strategic ICT delivery.
- Removed weak availability language from the primary homepage messaging.

### Phase 3: Sales Copywriting

- Built a clearer CTA ladder across homepage, pricing, services, and contact.
- Rewrote the English contact page as a diagnostic-led qualification flow.
- Added pricing transparency and offer architecture in [src/pages/en/pricing.astro](/C:/wamp64/www/techguy-website/src/pages/en/pricing.astro) and [src/pages/fr/tarifs.astro](/C:/wamp64/www/techguy-website/src/pages/fr/tarifs.astro).
- Added reusable copy-driven components for offers, FAQs, proof blocks, author boxes, and quick answers.

### Phase 4: Trust

- Reworked the English About page to be buyer-facing rather than CV-led.
- Added reusable testimonial and proof components.
- Integrated proof-oriented sections into the homepage and services page.

### Phase 5 (partial): Geo Expansion

- Added bilingual pricing routes and corrected alternate-language mapping for those routes.
- Strengthened multilingual signals and category-level localisation in homepage messaging.

### Phase 6: Technical SEO and Structured Data

- Expanded sitewide schema coverage in `BaseLayout` with ProfessionalService, WebSite, Person, and Breadcrumb schema.
- Added FAQ schema support through the shared FAQ component.
- Added article metadata support through the base layout for blog articles.

### Phase 7 (partial): TAYA Content

- Strengthened the blog/article conversion path with newsletter capture and clearer CTA architecture.
- Preserved the existing article library while introducing reusable authority-content components.

### Phase 8: AI Search

- Added `QuickAnswer` and `AuthorBox` components for AI-readable article structure and E-E-A-T reinforcement.
- Updated the flagship AI article to use article metadata and direct-answer formatting.
- Added event tracking hooks for newsletter signups, CTA clicks, form starts, form submit attempts, scroll depth, and time-on-page.

### Phase 9: Retention and Offers

- Added explicit retainer architecture to the homepage and services page.
- Added qualification scoring cues and stronger fit language on the contact page.
- Added project tiers and ongoing-support visibility to pricing and homepage flows.

### Phase 10 (partial): Elite Finish

- Added documentation-friendly structures for proof, offers, FAQs, and authority content.
- Installed a code-level measurement foundation that supports ongoing optimisation.

---

## Pass 2 — 2026-04-15

This pass addressed the gaps identified in a post-pass-1 audit. The estimated site score after pass 1 was 7.5–7.8/10 (not 8.6 as logged), primarily due to missing geo page architecture.

### Phase 5 (COMPLETED): Geo Service Landing Pages

**9 new geo landing pages created** — the single largest SEO gap from pass 1.

**Uganda service pages (EN):**
- `src/pages/en/it-consulting-uganda.astro` — Primary keyword: `IT consultant Uganda`
- `src/pages/en/software-development-uganda.astro` — Primary keyword: `software development Uganda`
- `src/pages/en/website-development-uganda.astro` — Primary keyword: `website developer Uganda`

**East Africa service pages (EN):**
- `src/pages/en/it-consulting-east-africa.astro` — Primary keyword: `IT consultant East Africa`
- `src/pages/en/software-development-east-africa.astro` — Primary keyword: `software development East Africa`
- `src/pages/en/website-development-east-africa.astro` — Primary keyword: `website developer East Africa`

**Francophone Africa service pages (FR):**
- `src/pages/fr/consultant-informatique-afrique.astro` — Primary keyword: `consultant informatique Afrique`
- `src/pages/fr/developpement-logiciel-afrique.astro` — Primary keyword: `développeur logiciel Afrique`
- `src/pages/fr/developpement-web-afrique.astro` — Primary keyword: `développeur web Afrique`

Each geo page includes:
- Benefit-led copy with Uganda/East Africa/Francophone Africa specific context
- ProfessionalService JSON-LD schema with scoped `areaServed` arrays
- ProofBlock with relevant case reference (Dynapharm Africa)
- FAQSection with 3 service×geo specific questions and FAQPage JSON-LD
- Cross-link box to related geo pages (Uganda ↔ East Africa ↔ Francophone Africa)
- CTASection with page-specific copy

**BaseLayout slugMap updated** with 9 new cross-language slug mappings so hreflang alternates resolve correctly:
- East Africa EN pages ↔ Francophone Africa FR pages (correct cross-language pairs)
- Uganda EN pages → Francophone Africa FR equivalents (closest available FR service match)

### Phase 6 (COMPLETED): Technical SEO

- `slugMap` in `BaseLayout.astro` updated with all new geo page cross-language mappings.
- All geo pages have unique meta titles, unique meta descriptions, and ProfessionalService schema with `areaServed` scoped to the correct geography — no keyword cannibalization with existing pages.

### Phase 7 (COMPLETED): TAYA Content — Uganda and East Africa Clusters

**6 new articles published:**

**Uganda content cluster (EN):**
- `src/pages/en/blog/software-development-cost-uganda.astro` — "How much does software development cost in Uganda?" (~2,000 words, pricing tables in UGX/USD, FAQPage schema)
- `src/pages/en/blog/evaluate-it-consultants-uganda.astro` — "How to evaluate IT consultants in Uganda — 7 questions" (~1,800 words)
- `src/pages/en/blog/custom-software-vs-off-shelf-uganda.astro` — "Custom software vs. off-the-shelf in Uganda" (~1,800 words, Uganda-specific decision framework)

**East Africa content cluster (EN):**
- `src/pages/en/blog/website-costs-east-africa.astro` — "What does a website cost in East Africa? 2025 pricing" (~1,600 words, per-country pricing tables)
- `src/pages/en/blog/erp-software-east-africa.astro` — "ERP software for East African businesses" (~2,000 words, covers SAP/Sage/Odoo/Longhorn)

**Francophone Africa content cluster (FR):**
- `src/pages/fr/blog/cout-site-web-afrique.astro` — "Combien coûte un site web en Afrique francophone?" (~1,500 words, FCFA pricing, vouvoiement)

All 6 articles include:
- BlogPosting + FAQPage JSON-LD schema
- FAQSection component with 3–4 questions
- Contextual internal links to geo landing pages
- CTASection at end
- Reading progress bar
- British spelling (EN articles)

**Blog listing pages updated:**
- `src/pages/en/blog.astro` — 5 new articles added with correct images and metadata
- `src/pages/fr/blog.astro` — 1 new FR article added

---

## Current build status

- **Build:** `npm run build` passes clean — 66 pages, 0 errors (2026-04-15, pass 2)
- **New pages added in pass 2:** 9 geo service pages + 6 TAYA articles = 15 new pages

---

## Remaining real-world dependencies

- GA4, Google Search Console, and Bing verification values still require production tokens in environment variables.
- Founder video production, real testimonial assets with individual names and photos, and a broader proof library still require off-repo inputs.
- Remaining TAYA content: East Africa cluster articles 3–5, Francophone Africa articles 2–4, and 2 case study deep-dives (Phase 7, files 02–04) can be built on the components and geo page architecture now in place.
- Phase 10 elite finish items (HowTo schema, SiteLinksSearchBox, social media amplification, measurement maturity framework) remain pending.

## Score assessment (post pass 2)

| Dimension | Post Pass 1 | Post Pass 2 |
|-----------|-------------|-------------|
| Technical SEO & discoverability | 7.0 | 8.0+ |
| Content SEO & TAYA | 6.5 | 7.5 |
| Brand positioning | 6.8 | 6.8 (unchanged) |
| Sales copywriting | 7.5 | 7.5 (unchanged) |
| Trust & social proof | 6.5 | 6.5 (needs real testimonial names/photos) |
| Client retention architecture | 7.0 | 7.0 (unchanged) |
| LLM/AI search readiness | 7.0 | 7.2 |
| **Overall estimate** | **~7.6** | **~8.0** |
