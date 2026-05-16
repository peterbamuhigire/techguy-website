---
name: seo
description: "Comprehensive search engine optimization for multi-language static sites and AI visibility. Implements meta tags, JSON-LD structured data, E-E-A-T schema markup, multi-language sitemap generation, hreflang tags, robots.txt, crawler optimization (IndexNow, sitemap pinging), Google Analytics 4 via Partytown, Google Search Console verification, canonical URLs, and language-specific Open Graph tags. Covers both traditional SEO and Generative Engine Optimization (GEO) for AI platforms. Supports 3 languages: English, French, Kiswahili. Reads from docs/{lang}/seo.md for per-page, per-language configuration. Generates language-specific sitemaps (sitemap-en.xml, sitemap-fr.xml, sitemap-sw.xml) and SEO audit report. Run after page-builder, before deploy."
---

# Seo
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- The task matches this domain: Comprehensive search engine optimization for multi-language static sites and AI visibility. Implements meta tags, JSON-LD structured data, E-E-A-T schema markup, multi-language sitemap generation, hreflang tags, robots.txt, crawler optimization (IndexNow, sitemap pinging), Google Analytics 4 via Partytown, Google Search Console verification, canonical URLs, and language-specific Open Graph tags. Covers both traditional SEO and Generative Engine Optimization (GEO) for AI platforms. Supports 3 languages: English, French, Kiswahili. Reads from docs/{lang}/seo.md for per-page, per-language configuration. Generates language-specific sitemaps (sitemap-en.xml, sitemap-fr.xml, sitemap-sw.xml) and SEO audit report. Run after page-builder, before deploy.
- The user needs an implementation-facing skill rather than a general discussion.
- The website content must work as a world-class marketing asset for the owner and as proof of premium website-development quality for the builder.

## Do not use when
- The prerequisite upstream context is missing and the task is not yet execution-ready.
- Another narrower skill is the clear better fit for the exact subtask.

## Required inputs
- Project context, current files, and any constraints that affect implementation.
- Upstream artifacts produced by earlier skills when this skill is part of a pipeline.

## Workflow
1. Read only the relevant project inputs and preserved guidance before acting.
2. Choose the smallest set of references needed for the current job.
3. Produce the implementation, configuration, or guidance this skill owns.
4. For premium or revenue-critical websites, align with `premium-website-product` so SEO is connected to buyer intent, authority content, conversion, launch distribution, and measurement.
5. Validate that the result stays compatible with the rest of the repository workflow.

## Quality standards
- Outputs must be implementation-ready and internally consistent.
- Preserve existing behavior unless the task explicitly requires a change.
- Avoid host-specific path assumptions so the skill remains portable.
- Every enabled language must have SEO slugs written in that language, based on that language's search intent and keyword vocabulary. English slugs are not acceptable defaults for French, Kiswahili, or any other non-English version.
- Canonical URLs, internal links, hreflang tags, Open Graph URLs, and sitemap alternates must all use the same localized route map so search engines see clean equivalent URLs per language.
- Every money page must have a search intent, proof burden, CTA, internal-link target, schema requirement, and analytics event; metadata alone is not acceptable SEO.

## Anti-patterns
- Do not hardcode `.Codex/skills` or another single install path.
- Do not skip validation against upstream or downstream dependencies.
- Do not generate generic output that ignores the actual project context.
- Do not publish translated pages at English slug paths for convenience. Localize the slug, then wire language switching and sitemap alternates to the correct equivalent URL.

## Outputs
- Implementation guidance, configuration, generated artifacts, or concrete follow-on steps.

## Mandatory deliverables (every project, every tier)

These artifacts MUST ship on every site this skill touches. They are the floor, not the ceiling.

### Schema.org JSON-LD — required set

Always emit on every relevant page (in addition to the foundational Organization, WebSite, BreadcrumbList):

1. **LocalBusiness** (or the most specific subtype: `MedicalBusiness`, `MedicalOrganization`, `Hospital`, `Dentist`, `Restaurant`, `Store`, `LegalService`, etc.) — with `address`, `geo`, `areaServed`, `telephone`, `openingHoursSpecification`, `sameAs` profiles, and `aggregateRating` when authentic reviews exist.
2. **Product** — for every distinct sellable offering (SaaS plan, package, physical good). Pair with **`Offer`** (price, priceCurrency, availability, url) and **`AggregateOffer`** when multiple price points exist.
3. **Service** — for every service line. Include `serviceType`, `provider`, `areaServed`, `hasOfferCatalog` enumerating the sub-services with their `Offer`s.
4. **FAQPage** — on the FAQ page AND inline on every service/feature/pricing page that legitimately answers questions. Minimum 5 Q&A entries per FAQ block.
5. **SoftwareApplication / MobileApplication / WebApplication** — for any software product, with `applicationCategory`, `operatingSystem`, `offers`, `featureList`.
6. **Article / NewsArticle / BlogPosting** — on every editorial page, with `author` (Person with `sameAs`), `publisher` (Organization with `logo`), `datePublished`, `dateModified`, `image`.
7. **Person** — for every named author/founder/expert, with `jobTitle`, `worksFor`, `sameAs` (LinkedIn, scholar, professional registries), `knowsAbout`, `alumniOf` where appropriate.
8. **Review / AggregateRating** — when authentic reviews exist (never synthesised).
9. **Industry-specific subtypes** when the business fits: `Hospital`, `MedicalClinic`, `Pharmacy`, `Dentist`, `LegalService`, `FinancialService`, `EducationalOrganization`, `LodgingBusiness`, `TouristAttraction`, etc. Pick the narrowest type that fits.

Validate the resulting JSON-LD with the Schema.org validator and Google's Rich Results Test before sign-off.

### AI / LLM crawler entry files — required

Generate at the site root:

1. **`/llms.txt`** — Markdown file (~2–4 KB) following the [llmstxt.org](https://llmstxt.org) spec: H1 site name, blockquote summary, then linked sections (Docs, Products, Services, Policies, Contact). Optimised for LLMs to ground answers without crawling JS.
2. **`/llms-full.txt`** — Concatenated full-text of the most important pages (home, about, services/features, pricing, FAQ, contact, key blog cornerstones), 20–60 KB. Plain prose, no nav chrome, includes structured fact blocks (NAP, hours, prices, supported regions).
3. **`/robots.txt`** — Allow GPTBot, ChatGPT-User, Google-Extended, ClaudeBot, anthropic-ai, PerplexityBot, CCBot, Bingbot, Googlebot. Reference all language sitemaps and the index sitemap. Do NOT block AI crawlers unless the client has explicitly opted out in writing.
4. **`/.well-known/security.txt`** when the project handles user data.

The `llms.txt` and `llms-full.txt` files must be regenerated on every content change — wire them into the build, not produced once by hand.

### Other required artifacts

- Per-language XML sitemaps + sitemap-index.xml, ping submitted via IndexNow on deploy.
- Canonical URLs and `hreflang` (including `x-default`) on every page.
- OpenGraph + Twitter card metadata, language-localised, with a real OG image (not a placeholder).
- Favicons: 16, 32, 180 (apple-touch), 192, 512.
- Per-page metadata authored in the project language, never machine-translated from English.

## References
- `references/premium-seo-package.md` — the default SEO package delivered on every Growth/Authority engagement. Strategy-first SEO, intent map, metadata, schema, internal linking, GEO/AI visibility, local SEO, measurement.
- `../premium-commercial-writing/references/seo-ai-search-writing.md` — use when SEO/GEO work needs stronger content structure, answer blocks, entity clarity, E-E-A-T notes, and AI-citable facts before implementation.
- `../premium-commercial-writing/references/blog-and-authority-writing.md` — use when SEO depends on articles, pillar pages, clusters, or sales-enablement content rather than metadata alone.
- `../premium-website-product/references/premium-website-market-asset-gate.md` - use when SEO must support premium website positioning, content authority, launch distribution, and agency proof.
- `references/analytics-event-map.md` — minimum instrumentation for every site: event taxonomy, conversion goals, UTM convention, attribution model, consent, pre-launch checklist.
- `references/seo-topic-and-intent-map.md` — align search intent with page roles, proof burdens, CTA posture.
- `references/conversion-intent-and-launch-seo.md` — use when SEO work must support content clusters, launch windows, conversion-aware metadata, or state changes between prelaunch, open, and closed offers.
- `references/legacy-guidance.md` — preserved detailed instructions from the previous skill version.
- `references/llms-txt-and-ai-crawlers.md` — exact format and templates for `llms.txt`, `llms-full.txt`, AI-crawler robots rules, and per-page AI-citability hooks.
- `references/required-schema-catalog.md` — concrete JSON-LD templates for every mandatory schema above (LocalBusiness/MedicalBusiness, Product, Service, FAQPage, SoftwareApplication, Article, Person), with multi-language examples.
- Read only the specific files under `references/` that match the current task instead of loading the whole directory.
- This skill has no bundled scripts by default; keep execution focused on the documented workflow and any existing project files.

## Notes
- Treat this `SKILL.md` as the portable execution layer for both Codex and Codex.
- Preserve existing project behavior unless the current task explicitly requires a change.

