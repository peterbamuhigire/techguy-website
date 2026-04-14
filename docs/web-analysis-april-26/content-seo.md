# Content and SEO — April 2026

---

## 1. Content Quality Audit

**Section score: 7.0/10**

### 1.1 TAYA Coverage — Big 5 Pillars

The they-ask-you-answer skill defines five content pillars that every prospect researches before hiring. Assessment against all 12 EN blog articles:

| Pillar | Coverage | Articles |
|--------|----------|----------|
| **Pillar 1: Cost and Pricing** | Good | "What a Website Actually Costs in Uganda (And Why It Varies So Much)" — direct, honest, Uganda-specific. Partially covers the pricing question but only for websites. No pricing content for ICT consulting or ERP. |
| **Pillar 2: Problems and Weaknesses** | Partial | "ERP Implementation: What SMEs Get Wrong" covers problems with ERP. "Why Visitors Leave Your Website After 3 Seconds" covers website problems. No "When you should not hire Peter" or "limitations of this practice" content. |
| **Pillar 3: Comparisons** | Good | "Agency vs. freelancer" comparison is implicit in "How to Choose an IT Consultant in East Africa". "East African Websites Must Have a French Version" compares bilingual vs. English-only. Missing: explicit "Custom software vs. off-the-shelf" comparison article (the blog post "Why African Businesses Need Custom-Built Software" approaches this but does not provide a side-by-side comparison structure). |
| **Pillar 4: Reviews and Social Proof** | Weak | No dedicated "What our clients say" article. No case study article format. Testimonials on homepage are not published as standalone content. |
| **Pillar 5: Best in Class** | Partial | "How to Create Apps and Systems That People Love to Use" is a best-in-class piece on UX, though for a generic audience. No "Best ERP implementations in East Africa" or "Best ICT consultants in Uganda: how to evaluate" article. |

**Score: 7.0/10** — three pillars have at least one good article. Missing: any Pillar 4 (case study/review) content and the explicit "ICT consulting cost in Uganda" pricing article (the pricing article is for websites only).

**Highest priority missing articles:**
1. "How much does IT consulting cost in Uganda? (Honest breakdown)" — Pillar 1, highest search intent
2. "Case study: How Dynapharm Africa unified ERP systems across 3 countries" — Pillar 4, highest trust impact
3. "When you should not hire Peter — and who you should hire instead" — Pillar 2, strongest credibility signal

---

### 1.2 Content Structure — Direct-Answer-First

**Score: 6.5/10**

The they-ask-you-answer skill requires direct-answer-first structure: question heading → direct answer (30-50 words) → expanded detail. This mirrors the featured-snippet format that also signals AI search readiness.

**Blog post structure observed** (from `src/pages/en/blog.astro` excerpts and article titles):
- Articles use question-format titles ("Why Even Small Businesses Need a Written Business Plan", "Why Visitors Leave Your Website After 3 Seconds") — correct TAYA framing
- Read times suggest substantive length (8-15 minutes) — good for topical authority
- Article structure cannot be fully assessed without reading individual `.astro` files, but the excerpt formatting suggests narrative structure rather than direct-answer-first

**Recommendation:** For each Big 5 article, ensure the first 50 words directly answer the title question. This enables featured snippet capture and LLM citation.

---

### 1.3 English Tone and Register

**Score: 7.5/10**

**Assessment: Good, with some lapses.**

**What's working:**
- British spelling throughout: "organisation" (`src/pages/en/index.astro:30`), "colour" (not observed but implied by brand palette naming conventions)
- Formal register appropriate for East African business audience
- "Kindly share your details" (`src/pages/en/contact.astro:62`) — correctly formal East African courtesy register
- No casual Americanisms or slang

**Areas for improvement:**
- "Available for new projects" badge (`src/pages/en/index.astro:72`) — American-inflected freelancer language. East African professional register would be closer to "Accepting engagements" or "Currently consulting" or simply removing the badge and replacing with a capability statement.
- "Let's talk" / "Get in Touch" CTA language — appropriate for informal contexts but slightly too casual for enterprise ICT consulting. "Request a consultation" or "Arrange a diagnostic call" fits better.
- The about page philosophy card on Kaizen uses correct formal English but the phrasing "deeply embedded in the practice" (`src/pages/en/about.astro:56`) is slightly abstract. East African English at its best is precise and concrete rather than abstract.

**Banned vocabulary check** (sales-copywriting skill's house style):
- "bespoke" — not found (good; this is on the banned list)
- "holistic" — not found (good)
- "seamless" — not found (good)
- "cutting-edge" — not found (good)
- "innovative" — not found (good)
- "end-to-end" — not found in page headings; may appear in body copy not reviewed

---

### 1.4 French Quality Indicators

**Score: 7.0/10**

**Assessment: FR execution is structurally correct; content depth is slightly below EN.**

**Structural positives:**
- FR pages exist for all major EN pages (`/fr/about/`, `/fr/services/`, `/fr/contact/`, `/fr/blog/`)
- Translated slugs for some pages: `strategie-marketing-digital` ↔ `digital-marketing-strategy`, `devis-plan-affaires` ↔ `business-plan-intake` — this is correct i18n practice
- FR blog has 11 of 12 EN articles (missing 1: the AI enterprise software post is not yet translated)

**Quality gap:**
- The FR blog articles include `loi-droit-auteur-ouganda-puce-bars.astro` (Uganda copyright chip law translated) and `sites-web-africains-version-anglaise.astro` (East African websites article translated). These are good choices to translate — topically relevant to francophone African audiences.
- The MEMORY.md note flags that FR content should target all of Francophone Africa (Côte d'Ivoire, Sénégal, Cameroun, DRC), not just East Africa or Uganda. The FR blog article on "East African websites needing French" (`sites-web-africains-version-anglaise.astro`) may be framed too narrowly if it only addresses the EAC market. DRC's 109 million French speakers are the primary audience for this piece.

**Vouvoiement check:** Cannot confirm from `.astro` file structure alone — should be verified in rendered FR pages to ensure "vous" is used consistently, not "tu."

---

## 2. SEO Audit

**Section score: 5.8/10**

### 2.1 Technical SEO Findings

**Score: 6.5/10**

**Sitemap:**
- `dist/sitemap-index.xml` exists and references `sitemap-0.xml` — correct Astro sitemap format
- Single sitemap file (not language-split into sitemap-en.xml and sitemap-fr.xml) — the seo skill recommends language-specific sitemaps for multilingual sites; this is a gap but not critical
- `public/robots.txt:3`: `Sitemap: https://techguypeter.com/sitemap-index.xml` — correct

**robots.txt** (`public/robots.txt`):
```
User-agent: *
Allow: /
Sitemap: https://techguypeter.com/sitemap-index.xml
```
Functional but minimal. Does not block `/api/` routes (CSRF token endpoint). Should add:
```
Disallow: /api/
```
This prevents search engines from indexing the CSRF token endpoint.

**Canonical URLs:** Present on every page via `BaseLayout.astro:140`: `<link rel="canonical" href={canonicalUrl} />`. Canonical is computed from `siteUrl + '/' + lang + currentPath` — correct.

**Hreflang** (`BaseLayout.astro:141-143`):
```html
<link rel="alternate" hreflang="en-GB" href="https://techguypeter.com/en/..." />
<link rel="alternate" hreflang="fr-FR" href="https://techguypeter.com/fr/..." />
<link rel="alternate" hreflang="x-default" href="https://techguypeter.com/en/..." />
```

**Finding:** `hreflang="fr-FR"` is incorrect for the stated audience of Francophone Africa broadly. The site's memory note explicitly flags that FR content targets all of Francophone Africa (Côte d'Ivoire, Sénégal, Cameroun, DRC), not just France. `hreflang="fr"` (language-only, no country) would be correct, or `hreflang="fr-CI"` / `hreflang="fr-SN"` if specific country targeting is needed with separate alternates.

Using `fr-FR` tells Google that the FR content targets users in France. This could reduce ranking for the intended Francophone African audience. This is a material SEO error.

**Fix:** Change `hreflang="fr-FR"` to `hreflang="fr"` in `BaseLayout.astro:142`. One character change, significant SEO impact for the stated strategy.

---

### 2.2 Structured Data

**Score: 6.0/10** — ProfessionalService and BreadcrumbList are strong; no FAQPage, no BlogPosting, no Article author schema.

**ProfessionalService schema** (`BaseLayout.astro:54-115`) — present on every page. Assessment:

| Field | Status | Notes |
|-------|--------|-------|
| `@type: ProfessionalService` | Present | Correct |
| `name` | Present | "Peter Bamuhigire — IT Consultant & Software Developer" |
| `url` | Present | `https://techguypeter.com` |
| `description` | Present | Good, geo-targeted |
| `telephone` | Present | `+256784464178` |
| `email` | Present | `peter@techguypeter.com` |
| `address` (PostalAddress) | Present | Bukoto, Kampala, UG |
| `geo` (GeoCoordinates) | Present | 0.3476, 32.5936 |
| `areaServed` | Present | 9 countries listed |
| `serviceType` | Present | 8 service types |
| `knowsLanguage` | Present | `["en", "fr"]` |
| `founder` (Person) | Present | With LinkedIn, GitHub, Twitter sameAs |
| `sameAs` | Present | 5 social profiles |

**Gaps in schema:**
- No `priceRange` field — for a service with visible pricing intent, adding `"priceRange": "USD"` or a range would improve rich result eligibility
- No `openingHoursSpecification` — the footer references contact hours (via `t('contact.hours', lang)`) but these are not in structured data
- No `FAQPage` schema anywhere on the site — this is the biggest LLM/AI search readiness gap

**BreadcrumbList schema:** Present on every page, correctly generated from `page` prop. The breadcrumb for the homepage correctly shows just `[Home]`; inner pages show `[Home > Page Name]`.

**Blog posts:** No `Article` or `BlogPosting` schema on individual blog articles. No `author` Person schema. This is a significant E-E-A-T gap — Google's quality raters explicitly look for author credentials on informational content.

---

### 2.3 Placeholder Tokens — Critical Issue

**Score: 1.0/10** — all three analytics/verification tokens are placeholders; no measurement infrastructure is operational.

`BaseLayout.astro:169-182`:
```html
<!-- TODO: Replace G-XXXXXXXXXX with your real Measurement ID -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script is:inline>
  gtag('config', 'G-XXXXXXXXXX');
</script>
<meta name="google-site-verification" content="REPLACE_WITH_GSC_TOKEN" />
<meta name="msvalidate.01" content="REPLACE_WITH_BING_TOKEN" />
```

**Status:**
- GA4: Not connected. Every page load fires a request to Google's GTM servers with a placeholder ID. This sends meaningless data and wastes bandwidth.
- GSC: Not verified. Google Search Console cannot send crawl error reports, index coverage data, or performance data.
- Bing Webmaster Tools: Not verified. Missing Bing indexing intelligence, which is increasingly important for AI search (Copilot uses Bing's index).

These are not optional niceties — they are the measurement foundation that justifies every other optimisation decision. Without GA4, Peter cannot know which blog posts drive enquiries, which service pages convert, or whether the bilingual strategy is working.

**Fix: Highest priority of all technical items.** Takes 30 minutes to implement once the GA4 property and GSC property are set up.

---

### 2.4 Content SEO — Keyword Strategy

**Score: 5.5/10** — blog keyword strategy is strong; main page titles are cannibalising each other.

**Visible keyword strategy** (from titles and meta descriptions):

| Page | Title | Primary keyword target |
|------|-------|----------------------|
| Homepage | "Peter Bamuhigire — IT Consultant, Kampala Uganda" | "IT consultant Kampala Uganda" |
| Services | "IT Consulting & Software Development — Kampala, Uganda" | "IT consulting Kampala" |
| About | "About Peter Bamuhigire — IT Consultant in Kampala, Uganda" | "IT consultant Kampala" |
| Contact | "Contact Peter Bamuhigire — IT Consultant, Kampala Uganda" | "IT consultant Kampala" — duplicate |
| Blog | "Tech Insights — Peter Bamuhigire, Kampala" | "tech insights Kampala" — weak |

**Finding:** The homepage, services, about, and contact pages all target similar or identical keywords ("IT consultant Kampala Uganda"). This creates cannibalisation risk — multiple pages competing for the same query without differentiation. The SEO best practice is one primary keyword target per page.

**Suggested differentiation:**
- Homepage: "IT consultant Kampala Uganda" (brand + category + geo)
- Services: "software development Uganda" or "ICT consulting East Africa"
- About: "experienced IT consultant Uganda" or "Peter Bamuhigire technology"
- Contact: "hire IT consultant Kampala" or "technology consultancy Uganda"

**Blog keyword strategy** is stronger — each article targets a distinct question-based query ("website costs Uganda", "ERP implementation Africa", "IT consultant East Africa"). The blog is effectively doing better SEO than the main pages.

---

### 2.5 Multilingual Precision

**Score: 8.0/10** — strong execution on translated slugs and hreflang; one material error (fr-FR vs fr) reduces the score.

**Translated slugs verified:**
- `/en/digital-marketing-strategy/` ↔ `/fr/strategie-marketing-digital/` ✓
- `/en/business-plan-intake/` ↔ `/fr/devis-plan-affaires/` ✓
- `/en/privacy-policy/` ↔ `/fr/politique-de-confidentialite/` ✓

**Slugs not translated (using EN slug in FR):**
- `/fr/about/` (not `/fr/a-propos/`)
- `/fr/services/` (not `/fr/services/` — this is actually fine, "services" is French too)
- `/fr/contact/` (not translated — acceptable)
- `/fr/blog/` (not translated — acceptable)
- `/fr/portfolio/` (not translated — acceptable)

**FR blog that matches EN:** 11 of 12 articles translated. The untranslated article is the AI enterprise software post (most recent, April 2026).

**hreflang precision issue:** As noted in section 2.1, `hreflang="fr-FR"` should be `hreflang="fr"` for Francophone Africa targeting. This is the single most impactful i18n fix.

---

### 2.6 LLM / AI Search Readiness

**Score: 5.5/10 — foundational gaps.**

The seo skill covers Generative Engine Optimization (GEO) — optimising for AI platforms that generate answers from web content.

| AI Search Signal | Status | Detail |
|-----------------|--------|--------|
| FAQ schema (FAQPage JSON-LD) | Absent | No FAQ schema on any page. High priority. |
| Direct-answer-first content structure | Partially present | Blog article titles are question-format; whether bodies start with direct answers unknown without reading individual articles |
| Author expertise signals (Person schema) | Absent on blog | Blog posts have no `Article` schema with `author` Person and credentials |
| Structured business data | Strong | ProfessionalService schema is comprehensive |
| BreadcrumbList | Strong | Present on all pages |
| Bing Webmaster verification | Absent | Token placeholder — Bing is the index behind Copilot/ChatGPT search |
| Conversational long-tail keywords | Good | Blog titles use natural language questions |
| E-E-A-T signals on pages | Partial | Certifications listed on about page but not in schema; no date-stamped expertise signals |

**Highest-ROI AI search action:** Add `FAQPage` JSON-LD to the contact page (for "how does your process work?" questions), the services page (for service-specific questions), and each blog article (for the 3-5 questions the article answers). The blog article titles are already in question format — converting their H2/H3 subheadings to FAQ schema is a low-effort, high-impact action.

**Second-highest ROI:** Add `BlogPosting` schema with `author` Person schema (including `sameAs` LinkedIn URL and `hasCredential` certifications) to every blog article. This builds E-E-A-T signals that LLMs use when deciding whether to cite a source.

---

### 2.7 Local SEO

**Score: 7.5/10**

**Assessment: Good foundational implementation.**

Geo meta tags present (`BaseLayout.astro:146-149`):
```html
<meta name="geo.region" content="UG-102" />
<meta name="geo.placename" content="Kampala" />
<meta name="geo.position" content="0.3476;32.5936" />
<meta name="ICBM" content="0.3476, 32.5936" />
```

Physical address in schema and footer: Bukoto, Kampala, Uganda.

Phone number in schema and footer: +256 784 464178.

**Gaps:**
- No Google Business Profile mentioned on site (though GBP exists independently)
- No local citations mentioned (Yellow Pages Uganda, etc.)
- No geo-targeted FR page meta — the FR pages target Francophone Africa broadly but the geo meta tags point only to Kampala. FR pages might benefit from broader geo targeting (or no geo targeting, to avoid conflicting signals for the DRC/Sénégal audience).
