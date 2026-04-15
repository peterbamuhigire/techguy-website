# Improvement Plan Implementation Log

Date: 2026-04-15

This log records the concrete implementation work completed in the website codebase against the improvement plan in `docs/improvement-plan/`.

## Phase 1: Foundation and Measurement

- Replaced placeholder analytics and verification handling with environment-driven support in `src/layouts/BaseLayout.astro`.
- Corrected `hreflang` handling from `fr-FR` to `fr` in the base layout and `astro.config.mjs`.
- Added `Disallow: /api/` to [public/robots.txt](/C:/wamp64/www/techguy-website/public/robots.txt).
- Added [src/pages/404.astro](/C:/wamp64/www/techguy-website/src/pages/404.astro).
- Implemented working newsletter capture endpoint in [public/api/newsletter.php](/C:/wamp64/www/techguy-website/public/api/newsletter.php) and wired shared newsletter submission handling through the base layout.

## Phase 2: Positioning

- Established the category claim, hero language, and expert posture in [src/data/site.ts](/C:/wamp64/www/techguy-website/src/data/site.ts).
- Rewrote the English and French homepages to position the practice around authority websites, software systems, and strategic ICT delivery.
- Removed weak availability language from the primary homepage messaging.

## Phase 3: Sales Copywriting

- Built a clearer CTA ladder across homepage, pricing, services, and contact.
- Rewrote the English contact page as a diagnostic-led qualification flow.
- Added pricing transparency and offer architecture in [src/pages/en/pricing.astro](/C:/wamp64/www/techguy-website/src/pages/en/pricing.astro) and [src/pages/fr/tarifs.astro](/C:/wamp64/www/techguy-website/src/pages/fr/tarifs.astro).
- Added reusable copy-driven components for offers, FAQs, proof blocks, author boxes, and quick answers.

## Phase 4: Trust

- Reworked the English About page to be buyer-facing rather than CV-led.
- Added reusable testimonial and proof components.
- Integrated proof-oriented sections into the homepage and services page.

## Phase 5: Geo and Service Expansion

- Added bilingual pricing routes and corrected alternate-language mapping for those routes.
- Strengthened multilingual signals and category-level localisation in homepage messaging.

## Phase 6: Technical SEO and Structured Data

- Expanded sitewide schema coverage in `BaseLayout` with ProfessionalService, WebSite, Person, and Breadcrumb schema.
- Added FAQ schema support through the shared FAQ component.
- Added article metadata support through the base layout for blog articles.

## Phase 7: TAYA Content

- Strengthened the blog/article conversion path with newsletter capture and clearer CTA architecture.
- Preserved the existing article library while introducing reusable authority-content components for future article rollouts.

## Phase 8: AI Search

- Added `QuickAnswer` and `AuthorBox` components for AI-readable article structure and E-E-A-T reinforcement.
- Updated the flagship AI article to use article metadata and direct-answer formatting.
- Added event tracking hooks for newsletter signups, CTA clicks, form starts, form submit attempts, scroll depth, and time-on-page.

## Phase 9: Retention and Offers

- Added explicit retainer architecture to the homepage and services page.
- Added qualification scoring cues and stronger fit language on the contact page.
- Added project tiers and ongoing-support visibility to pricing and homepage flows.

## Phase 10: Elite Finish

- Added documentation-friendly structures for proof, offers, FAQs, and authority content.
- Installed a code-level measurement foundation that supports ongoing optimisation.

## Remaining real-world dependencies

- GA4, Google Search Console, and Bing verification values still require production tokens in environment variables.
- Founder video production, real testimonial assets, and a broader proof library still require off-repo inputs.
- A fuller geo-page and content-cluster rollout can now be built on the shared components and positioning system added in this pass.
