# SEO Skill — Static Website Factory

Historical detailed guidance preserved from the pre-standardized version of the skill.
Use `seo/SKILL.md` and the current SEO references first.

Implement comprehensive, production-grade search engine optimization across the entire site.

## Why This Matters

### Traditional SEO Foundation

Our Astro + Tailwind + Alpine stack already crushes Core Web Vitals:
- **95-100 Lighthouse scores** (typical WordPress: 60-80)
- **Zero render-blocking JavaScript** (typical WordPress: 3-8 blocking resources)
- **Self-hosted everything** (fonts, no external CDN requests)
- **Image optimization built-in** (WebP/AVIF, responsive srcsets, lazy loading)

This skill layers on the meta, schema, and content SEO that completes the picture. Combined, our sites have a massive competitive advantage in search rankings.

### AI Search Visibility (2026+)

**New Reality:** AI-powered search platforms (ChatGPT, Gemini, Perplexity, Claude) increasingly influence how users discover information. These platforms:
- Use Bing's search index (not Google's) for most AI platforms
- Rely on structured data and E-E-A-T signals to select sources
- Require clear, authoritative content to cite
- Reward multimodal content (text + images + video)

**Strategic Implication:** The same strong SEO fundamentals that rank well in Google now also increase your visibility in AI-generated answers. This skill implements both traditional SEO AND Generative Engine Optimization (GEO) signals.

**See:** `references/ai-seo-optimization.md` for AI platform specifics, `references/e-e-a-t-implementation.md` for credibility-building strategies.

---

## When This Runs

After page-builder, before deploy:

```
design-system → photo-manager → page-builder → [SEO] → deploy
```

The page-builder creates the HTML. This skill enriches it with metadata, structured data, and generates supporting files (sitemap config, robots.txt, audit report).

---

## Environment Variables (.env)

Create `.env` with credentials (gitignored):

```bash
# Google Analytics 4 (Partytown offloading)
PUBLIC_GA_MEASUREMENT_ID=G-XXXXXXXXXX

# Google Site Verification (auto meta tag injection)
PUBLIC_GOOGLE_SITE_VERIFICATION=abcd1234xyz5678

# IndexNow API Key (instant Bing/Yandex notification)
INDEXNOW_KEY=a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6
```

Add to `.gitignore`:
```
.env
.env.local
.env.*.local
```

---

## Analytics & Search Console Integration

### Google Analytics 4 via Partytown ⚡
- **Zero performance impact** — GA4 runs in Web Worker (separate thread)
- **Maintains 95-100 Lighthouse** — Script never blocks main thread
- **Production-only** — No tracking during development
- **Privacy-first** — `anonymize_ip: true` by default

**See:** `references/analytics-verification.md` for complete setup (Partytown, direct injection, Plausible/Fathom/Umami alternatives)

### Google Search Console Verification
- **HTML meta tag** (automatic from `PUBLIC_GOOGLE_SITE_VERIFICATION` env var)
- **HTML file upload** (manual backup method)
- Submits sitemap, monitors crawl errors, tracks search traffic

**See:** `references/analytics-verification.md` for step-by-step GSC setup

---

## Crawler Optimization

### Sitemap Auto-Pinging
Update `deploy.sh` to ping Google/Bing after every build → pages indexed within hours, not weeks.

### IndexNow for Instant Notification
Register with Bing/Yandex via IndexNow API → instant notification when pages change (vs. waiting for crawl).

### robots.txt Optimization
- Block `/_astro/` (hashed assets, regenerated each build)
- Block query parameters (avoid duplicate content)
- Slow-crawlers: 10s crawl delay (AhrefsBot, SemrushBot)

### Nginx X-Robots-Tag Headers
Server-level crawler directives for fine-grained control (archive old posts, block search pages, etc.)

### Post-Deploy Verification Script
`verify-deploy.sh` checks: robots.txt, sitemap, GSC tag, GA4 tag, Lighthouse score, Core Web Vitals.

**See:** `references/post-deploy-verification.md` for deploy.sh templates, IndexNow setup, and verify-deploy.sh script

---

## What Gets Generated

### Files Created During Build

#### Multi-Language Sitemaps
1. **sitemap-index.xml** — Master index pointing to all language sitemaps
2. **sitemap-en.xml** — All /en/ pages (English)
3. **sitemap-fr.xml** — All /fr/ pages (French)
4. **sitemap-sw.xml** — All /sw/ pages (Kiswahili)

**Note:** @astrojs/sitemap auto-generates per-language sitemaps. See Step 2 for serialization configuration.

#### Other Files
5. **robots.txt** — Allow crawlers, block `/_astro/`, point to sitemap-index.xml
6. **public/[indexnow-key].txt** — IndexNow API verification file (if INDEXNOW_KEY set)
7. **seo-audit.md** — Human-readable SEO audit of implementation (covers all languages)
8. **verify-deploy.sh** — Post-deploy verification script (checks all language sitemaps, GSC, GA4, Lighthouse)

### Changes to Existing Files
1. **astro.config.mjs** — Add `@astrojs/sitemap` integration with serialization
2. **src/layouts/BaseLayout.astro** — Add `<head>` tags (meta, OG, canonical, JSON-LD)
3. **Each page in src/pages/** — Pass schema data to BaseLayout

### Nothing Deleted or Breaking
All changes are additive. If BaseLayout already exists, we enhance it. If astro.config has other integrations, we append sitemap.

---

## Inputs (Read These Files)

The skill reads from (in order) for EACH enabled language:

### Per-Language Content (docs/{lang}/)

1. **docs/{lang}/seo.md** (NEW — template provided)
   - site_url: `https://client-domain.com` (shared across languages)
   - Per-page title tags and meta descriptions (language-specific)
   - schema_type: (e.g., "LegalService", "MedicalBusiness", etc.)
   - geo-coordinates (if available)
   - google_site_verification code (optional)

2. **docs/{lang}/company-profile.md**
   - name, tagline, description (language-translated)
   - phone, email
   - address (street, city, region, country)
   - founded year
   - social links (Facebook, LinkedIn, Twitter, etc.)

3. **docs/{lang}/services.md** (if exists)
   - List of services with descriptions (language-translated)

4. **docs/{lang}/team.md** (if exists)
   - Team member names, roles, photos (some translated, some shared)

5. **docs/{lang}/faq.md** (if exists)
   - Questions and answers (language-translated)

6. **docs/{lang}/contact.md** (if exists)
   - Hours, address, contact info

### Shared Content (root docs/)

7. **docs/i18n-config.md**
   - Enabled languages (en, fr, sw)
   - Default language
   - Language-specific notes

### Generated Pages

8. **src/pages/[lang]/*.astro** (existing pages per language)
   - Extract page titles, descriptions, content
   - Hreflang tags point to all language versions
   - Open Graph locale tags for language-specific versions

---

## Implementation Steps

### Step 1: Add @astrojs/sitemap

Installs the Astro sitemap integration.

```bash
npx astro add sitemap -y
```

### Step 2: Update astro.config.mjs

Include sitemap serialization for multi-language (NEW):

```javascript
import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';
import sitemap from '@astrojs/sitemap';
import partytown from '@builder.io/partytown/astro';

export default defineConfig({
  site: 'https://client-domain.com',  // Read from docs/seo.md
  integrations: [
    tailwind(),
    partytown({
      config: {
        forward: ["dataLayer.push"],  // Forward GA4 dataLayer to Partytown
      },
    }),
    sitemap({
      changefreq: 'monthly',
      priority: 0.7,
      lastmod: new Date(),
      serialize(item) {
        // Root path (homepage) — highest priority
        if (item.url.endsWith('/') || item.url.endsWith('/en/') || item.url.endsWith('/fr/') || item.url.endsWith('/sw/')) {
          item.priority = 1.0;
          item.changefreq = 'weekly';
        }
        // Important pages
        else if (item.url.includes('/contact') || item.url.includes('/about') || item.url.includes('/services')) {
          item.priority = 0.8;
          item.changefreq = 'monthly';
        }
        // Blog/news articles (if exists)
        else if (item.url.includes('/blog') || item.url.includes('/news')) {
          item.priority = 0.6;
          item.changefreq = 'weekly';
        }
        // Everything else
        else {
          item.priority = 0.7;
          item.changefreq = 'monthly';
        }
        return item;
      },
    }),
  ],
});
```

**What This Does:**
- @astrojs/sitemap auto-detects language-based URLs (/en/, /fr/, /sw/)
- Generates separate sitemaps per language automatically
- Creates sitemap-index.xml referencing all language sitemaps
- Each language version gets appropriate priority/changefreq

Install Partytown:
```bash
npm install @builder.io/partytown
```

### Step 3: Generate public/robots.txt

Create `public/robots.txt` with multi-language sitemap reference (NEW):

```
User-agent: *
Allow: /

# Block hashed asset directory (regenerated each build)
Disallow: /_astro/

# Block query parameters (prevent duplicate content)
Disallow: /*?

# Point to multi-language sitemap index
Sitemap: https://client-domain.com/sitemap-index.xml

# Optional: Slow down aggressive crawlers
User-agent: AhrefsBot
User-agent: SemrushBot
Crawl-delay: 10

User-agent: MJ12bot
Crawl-delay: 5
```

**What This Does:**
- Sitemap-index.xml contains all language-specific sitemaps
- Crawlers automatically discover /en/, /fr/, /sw/ versions
- Query parameters blocked to prevent duplicates
- Aggressive bots rate-limited to preserve server resources

### Step 4: Update BaseLayout.astro Head

Add meta tags (title, description, canonical, OG), Google Search Console verification, GA4 via Partytown, and JSON-LD injection.

**Key changes:**
- Read `PUBLIC_GA_MEASUREMENT_ID` and `PUBLIC_GOOGLE_SITE_VERIFICATION` from `.env`
- Conditional GA4 script: only loads in production (`import.meta.env.PROD`)
- GA4 script runs via Partytown (`type="text/partytown"`) — zero main thread impact
- GSC verification meta tag auto-injected if `PUBLIC_GOOGLE_SITE_VERIFICATION` set
- **NEW:** Accept `lang` prop in BaseLayout interface
- **NEW:** Generate hreflang tags pointing to all language versions
- **NEW:** Set `og:locale` to language-specific value (en_GB, fr_FR, sw_KE)

**See:** `references/analytics-verification.md` for complete BaseLayout code with GA4 Partytown setup

**Hreflang Example (auto-generated in BaseLayout):**
```html
<link rel="alternate" hreflang="en" href="https://example.com/en/services" />
<link rel="alternate" hreflang="fr" href="https://example.com/fr/services-ou-equivalent-localise" />
<link rel="alternate" hreflang="sw" href="https://example.com/sw/huduma-au-slug-iliyotafsiriwa" />
<link rel="alternate" hreflang="x-default" href="https://example.com/en/services" />
```

If localized slugs differ, generate these links from the route-equivalence map rather than from a language-prefix swap.

**Open Graph Language Tags (auto-generated):**
```html
<meta property="og:locale" content="en_GB" />
<meta property="og:locale:alternate" content="fr_FR" />
<meta property="og:locale:alternate" content="sw_KE" />
```

### Step 5: Create Schema Utility

File: `src/utils/schema.ts` (or `.js`)

Generate JSON-LD structured data with these functions:
- `getOrganizationSchema()` — LocalBusiness/Organization on homepage
- `getWebSiteSchema()` — WebSite schema on homepage
- `getWebPageSchema()` — WebPage schema on all pages
- `getBreadcrumbSchema()` — BreadcrumbList for inner pages
- `getServiceSchema()` — Service schema for services page
- `getPersonSchema()` — Person schema for team members
- `getFAQSchema()` — FAQPage schema for FAQ section

**Complete functions and usage examples:** See SEO skill SKILL.md (original repo) or reference implementation

### Step 6: Apply Schema to Pages

Each page passes appropriate schema to BaseLayout:

```astro
---
// Example: src/pages/index.astro (Homepage)
import BaseLayout from '../layouts/BaseLayout.astro';
import {
  getOrganizationSchema,
  getWebSiteSchema,
  getWebPageSchema,
} from '../utils/schema';

const orgConfig = {
  siteURL: 'https://client-domain.com',
  name: 'Company Name',
  // ... rest of config from docs/company-profile.md
};

const schemas = [
  getOrganizationSchema(orgConfig),
  getWebSiteSchema(orgConfig.siteURL, orgConfig.name),
  getWebPageSchema(
    orgConfig.siteURL,
    'Homepage Title',
    'Homepage description',
    orgConfig.siteURL
  ),
];
---

<BaseLayout
  title="Homepage Title from docs/seo.md"
  description="Homepage description from docs/seo.md"
  schemaData={schemas}
>
  <!-- homepage content -->
</BaseLayout>
```

```astro
---
// Example: src/pages/services.astro (Inner Page)
import BaseLayout from '../layouts/BaseLayout.astro';
import {
  getWebPageSchema,
  getBreadcrumbSchema,
  getServiceSchema,
} from '../utils/schema';

const orgConfig = { /* from docs */ };
const services = [
  { name: 'Service 1', description: '...' },
  { name: 'Service 2', description: '...' },
];

const schemas = [
  getWebPageSchema(orgConfig.siteURL, 'Services', 'Our services...', `${orgConfig.siteURL}/services`),
  getBreadcrumbSchema(orgConfig.siteURL, 'Services', `${orgConfig.siteURL}/services`),
  ...services.map(s =>
    getServiceSchema(orgConfig.siteURL, s.name, s.description, orgConfig.country)
  ),
];
---

<BaseLayout
  title="Services Title from docs/seo.md"
  description="Services description from docs/seo.md"
  schemaData={schemas}
>
  <!-- services content -->
</BaseLayout>
```

### Step 7: Image Alt Text Audit

Every `<img>` or `<Image>` tag must have meaningful alt text:

- **Team photos**: `"{name}, {role} at {company}"`
- **Hero images**: Describe the scene, include company name if relevant
- **Service images**: `"{service name} — {brief description}"`
- **Decorative images**: Use empty alt: `alt=""`

Cross-reference with `_catalog.json` from photo-manager skill.

### Step 8: Generate SEO Audit Report

File: `seo-audit.md` in project root

```markdown
# SEO Audit — [CompanyName]
Generated: [Date]

## Technical SEO
- [x] Sitemap: /sitemap-index.xml (auto-generated by @astrojs/sitemap)
- [x] Robots.txt: /robots.txt (allows all crawlers)
- [x] Canonical URLs: every page
- [x] Core Web Vitals: 95+ Lighthouse
  - LCP: < 1.0s
  - FID: < 100ms
  - CLS: < 0.1
- [x] Mobile-first responsive design

## Per-Page Meta Tags
| Page | Title (chars) | Meta Description (chars) | Status |
|------|---|---|---|
| / | "Homepage Title" (24) | "Homepage description..." (156) | ✅ |
| /about | "About CompanyName" (17) | "Learn about our team..." (158) | ✅ |
| /services | "Our Services" (12) | "Services offered..." (160) | ⚠️ (160 - at limit) |
| /contact | "Contact Us" (10) | "Get in touch..." (145) | ✅ |

## Structured Data (JSON-LD)
- [x] Organization/LocalBusiness schema on homepage
- [x] WebSite schema on homepage
- [x] WebPage schema on all pages
- [x] BreadcrumbList schema on inner pages (auto-generated)
- [x] Service schema on services page (3 services)
- [ ] FAQ schema (no FAQ section found)
- [ ] Person schema (no team page found)

## Images
- Total images: 12
- With descriptive alt text: 12 ✅
- Missing alt text: 0 ✅

## Open Graph / Social Sharing
- OG image: /og-image.png (1200x630px) ✅
- Twitter Card: configured ✅
- Facebook preview: ready ✅

## SEO Checklist
- [x] Site URL configured in astro.config.mjs
- [x] Sitemap generates at build time
- [ ] Google Search Console: [Not submitted — client action]
- [ ] Google Business Profile: [Not created — client action]
- [ ] Bing Webmaster Tools: [Not submitted — client action]
- [ ] Local directory listings: [Not submitted — client action]
- [ ] NAP consistency verified: [Awaiting client review]

## Recommendations
1. Add FAQ section to /contact page for "FAQPage" schema
2. Create /team page for "Person" schema (credibility boost)
3. Verify business address is accurate (used in LocalBusiness schema)
4. Request initial Google reviews once Business Profile is live
5. Monitor Core Web Vitals in Google Search Console monthly

## Performance Summary
- Lighthouse SEO Score: 100/100
- Mobile Usability: Passes
- Core Web Vitals Status: All Green
- Crawlability: Perfect
```

---

## Validation Rules

1. **Title tags:** 50-60 characters max. Primary keyword at the beginning, not the end. Flag any exceeding 60.
2. **Meta descriptions:** 150-155 characters. Write in two parts: first 120 chars compelling for mobile, full 155 for desktop. Include CTA.
3. **One H1 per page.** H1 must contain primary keyword and closely match the `<title>` tag.
4. **Heading hierarchy:** No skipped levels (no H1 → H3). H2/H3 should contain secondary/related keywords naturally.
5. **First 20 words:** Primary keyword must appear within the first sentence or first 20 words of body copy.
6. **URL slugs:** Short, keyword-included, hyphens only, no stop words, lowercase. Match the page title. On multilingual sites, every enabled language must get its own localized slug based on that language's search terms; do not reuse English slugs by default.
7. **Internal links:** Every page reachable within 2 clicks from homepage. 2-5 internal links per page body with keyword-rich anchor text (never "click here").
8. **Outbound links:** 1-2 links to authoritative external sources per page where relevant.
9. **Alt text:** Every image has meaningful alt text (not empty unless decorative). Primary keyword in at least one image ALT per page.
10. **Image filenames:** Descriptive, keyword-rich filenames before upload (`banana-research-lab.jpg` not `IMG_4523.jpg`).
11. **Canonical URLs:** Every page has a canonical (Astro does this by default).
12. **JSON-LD validity:** No trailing commas, proper escaping, valid syntax.
13. **No duplicate titles/descriptions:** Every page must be unique.
14. **Schema types accuracy:** Use most specific type (e.g., `LegalService` not `LocalBusiness` for law firms).
15. **Content length:** Pages must meet minimum word counts (see `references/on-page-content-seo.md`). Thin pages (<300 words) flagged.

**Full on-page checklist:** See `references/on-page-content-seo.md` for the complete per-page audit.

---

## Custom 404 Page (MANDATORY)

Every site MUST have a branded 404 page. Create `src/pages/404.astro`:

- Use the site's BaseLayout and Header/Footer (consistent design)
- Clear message: "Page not found" (not just "404")
- Link back to homepage
- Links to 3-5 popular pages (services, about, contact)
- Optional: search box or sitemap link
- Ensure the server returns HTTP 404 status code (Astro does this automatically for `404.astro`)

**Why:** Users follow broken links or mistype URLs. A helpful 404 page guides them back instead of losing them. Google explicitly recommends custom 404 pages that help users find what they need.

---

## Anchor Text Rules

Internal and external links MUST use descriptive anchor text:

- **Never** use "click here", "read more", "this page", or bare URLs as anchor text
- **Do** use text that describes the destination: "our property management features" not "click here to see features"
- Keep anchor text concise (a few words or short phrase, never a full paragraph)
- Internal links should use keyword-relevant text naturally (not stuffed)
- If an image is used as a link, the `alt` attribute serves as the anchor text — make it descriptive

**Why:** Descriptive anchor text helps both users and search engines understand what the linked page is about. Google uses anchor text as a ranking signal.

---

## Post-Launch Checklist (Output to docs/SEO-NEXT-STEPS.md)

```markdown
# Post-Launch SEO Checklist

## Immediate (Deploy Day)
- [ ] Run `./verify-deploy.sh` (checks robots.txt, sitemap, GA4, GSC, Lighthouse)
- [ ] Confirm GA4 tracking active: Open site in browser → DevTools → Application → Cookies → check for _ga, _gid
- [ ] Verify robots.txt blocks /_astro/ (prevents crawling hashed assets)
- [ ] Check IndexNow key file: Visit `https://yoursite.com/[key].txt` → should return key

## Week 1
- [ ] **Google Search Console:**
  - [ ] Submit sitemap: https://search.google.com/search-console
  - [ ] Verify ownership (meta tag or HTML file)
  - [ ] Request indexing for homepage + key pages
  - [ ] Check Coverage report for crawl errors
- [ ] **Google Business Profile:**
  - [ ] Set up: https://business.google.com
  - [ ] Fill all fields: name, address, phone, hours, categories
  - [ ] Upload 10+ photos
  - [ ] Ensure NAP consistency (exact match with website)
- [ ] **Google Analytics 4:**
  - [ ] Dashboard shows real users (Realtime report)
  - [ ] Verify anonymize_ip = true (privacy setting)

## Week 2
- [ ] Submit sitemap to Bing Webmaster Tools: https://www.bing.com/webmasters
- [ ] Verify IndexNow working (Bing/Yandex receive instant notifications)
- [ ] Submit to local directories (Yellow Pages, industry-specific)
- [ ] Verify NAP consistency across all listings

## Month 1
- [ ] Monitor GSC Coverage report for crawl errors
- [ ] Request initial Google reviews
- [ ] Monitor Core Web Vitals weekly: GSC → Experience → Core Web Vitals
- [ ] Check GA4 goal conversions (contact form, etc.)

## Ongoing (Monthly)
- [ ] Monitor search traffic: GSC → Overview → Top queries
- [ ] Post updates to Google Business Profile
- [ ] Review GA4 user behavior (pages, events, conversions)
- [ ] Request new reviews from satisfied clients
- [ ] Monitor Lighthouse score: Run PageSpeed Insights monthly
```

**Reference:** See `references/post-deploy-verification.md` for:
- deploy.sh with sitemap pinging (Google/Bing auto-notification)
- IndexNow setup (Bing/Yandex instant notification)
- verify-deploy.sh script for automated post-deploy checks
- robots.txt optimization (blocks `/_astro/`, query params)
- Nginx X-Robots-Tag headers
- Monitoring checklist and red flags

---

## Output Summary

After running this skill, the project has:

✅ **robots.txt** — Allows crawlers, points to sitemap
✅ **Sitemap auto-generated** — By @astrojs/sitemap plugin
✅ **Meta tags on every page** — Title, description, canonical, OG
✅ **JSON-LD structured data** — Organization, WebSite, WebPage, BreadcrumbList, Services, People, FAQ
✅ **BaseLayout enhanced** — Supports schema injection
✅ **SEO audit report** — What was implemented, what needs manual action
✅ **Post-launch checklist** — Google Business Profile setup, directory submissions, monitoring

**Result:** A site that's technically perfect for search engines, ready for the client's ongoing SEO efforts (Google Business Profile, directory listings, reviews, content updates).

---

## Reference Files

Detailed guides for SEO and AI visibility:

### On-Page Content SEO
- **`references/on-page-content-seo.md`** — URL slug optimisation, keyword placement rules (first 20 words, H1, H2/H3), internal linking strategy (hierarchical linking, keyword-rich anchors), outbound links, content length guidelines, meta description two-part structure, image SEO (filenames, captions), per-page audit checklist

### Core SEO Implementation
- **`references/seo-content-writing.md`** — Keyword density rules (<1%), keyword placement, search intent types, featured snippet optimization, voice search, long-tail strategy, on-page SEO checklist, buyer-journey content alignment
- **`references/analytics-verification.md`** — GA4 via Partytown setup, Google Search Console verification methods (meta tag + HTML file), privacy-friendly alternatives (Plausible, Umami, Fathom), troubleshooting
- **`references/post-deploy-verification.md`** — Sitemap auto-pinging, IndexNow instant notification setup, robots.txt optimization, Nginx X-Robots-Tag headers, verify-deploy.sh script, monitoring checklist
- **`references/webmaster-tools-setup.md`** — Complete step-by-step setup for Google Search Console, Google Business Profile, Google Analytics 4, Bing Webmaster Tools, IndexNow, Bing Places, rank tracking tools; security and privacy best practices; measurement framework; troubleshooting common issues

### AI Search Optimization (2026)
- **`references/ai-seo-optimization.md`** — Comprehensive guide to AI search platforms (ChatGPT, Gemini, Perplexity, Claude), Generative Engine Optimization (GEO), Bing optimization (powers most AI platforms), multimodal content strategy, AI-specific metrics and tracking, content strategy for AI-first search, topic clustering for AI discovery
- **`references/e-e-a-t-implementation.md`** — Experience, Expertise, Authoritativeness, Trustworthiness implementation by industry; detailed schema markup; author credentialing; transparency signals; E-E-A-T audit checklist; common mistakes to avoid

**Read these for:** Building AI visibility alongside traditional SEO rankings.

### SXO — Search Experience Optimization
- **`references/sxo-integration.md`** — Fuses SEO + UX + CRO into a unified strategy; SXO audit checklist (6 dimensions: visibility, content, performance, design, conversion, international); content by decision style (logical vs emotional); demand generation through long landing pages and TOFU blog content; multilingual SXO rules for our 3-language sites; SXO measurement metrics and content health signals

**Read this for:** Ensuring every page satisfies search engines, users, AND conversion goals simultaneously.

### Content-Driven Traffic Growth (Fishbein)
- **`references/content-growth-tactics.md`** — Intent-based keyword targeting (4-stage framework: awareness → learning → comparative → buying); content cluster / topical authority model with example cluster structure; long-tail keyword strategy (segment by audience, geographic modifiers, buyer-intent signals); distribution channels that amplify SEO (Quora, SlideShare 50M+ visitors, YouTube 2nd largest search engine); internal linking rules for cluster-to-money-page funnels; the 20/80 create-vs-distribute rule

**Read this for:** Building organic traffic through topical authority rather than individual page optimisation; using platform distribution channels as SEO multipliers.

## External Resources

- [Google Search Central](https://developers.google.com/search)
- [Google Analytics 4 Documentation](https://support.google.com/analytics)
- [Partytown Documentation](https://partytown.builder.io/)
- [JSON-LD Schema.org](https://schema.org/)
- [@astrojs/sitemap](https://docs.astro.build/en/guides/integrations-guide/sitemap/)
- [Core Web Vitals guide](https://web.dev/vitals/)
