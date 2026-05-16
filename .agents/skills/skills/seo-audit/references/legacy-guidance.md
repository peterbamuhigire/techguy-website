# SEO Audit Skill — Static Website Factory

Run a comprehensive SEO audit across the entire site, scoring 14 categories and producing a prioritised action plan.

## When to Use

- After initial site build (post-deploy) to verify SEO implementation
- On demand when the client asks "how is my SEO?"
- Before a major content update to establish a baseline
- Periodically (quarterly) to catch regressions

## Prerequisites

- Site must be built (`npm run build` completed, `dist/` exists)
- `docs/seo.md` should exist (but audit works without it)
- Existing SEO skill should have run (meta tags, structured data in place)

## Audit Categories (14 Total)

Each category is scored 0-10. Overall score is weighted average.

| # | Category | Weight | What It Checks |
|---|----------|--------|----------------|
| 1 | Technical SEO | 12% | Sitemap, robots.txt, canonical URLs, hreflang, crawlability, crawl errors |
| 2 | On-Page SEO | 12% | Title tags, meta descriptions, heading hierarchy, keyword placement |
| 3 | Content Quality | 10% | Unique content, word count, keyword density, E-E-A-T signals, buyer journey coverage |
| 4 | Structured Data | 8% | JSON-LD schemas (Organization, Service, FAQ, HowTo, BreadcrumbList), Rich Snippet readiness |
| 5 | Pagespeed & Performance | 10% | Page weight, image compression, minification, caching, font loading, CLS, LCP, FID |
| 6 | Mobile Usability | 8% | Viewport meta, touch targets, responsive images, no horizontal scroll |
| 7 | Local SEO | 8% | NAP consistency, Google Business Profile, geo meta tags, citations, reviews, local landing pages |
| 8 | Internal Linking | 5% | Navigation structure, orphan pages, link depth, anchor text quality |
| 9 | Security & Trust | 5% | HTTPS references, mixed content, external link safety, privacy policy |
| 10 | Accessibility | 5% | Alt text, aria labels, heading order, skip links, focus styles, contrast |
| 11 | Competitive Positioning | 5% | Keyword targeting, title uniqueness, geo-targeting, service coverage |
| 12 | Voice Search Readiness | 4% | FAQ pages, conversational keywords, featured snippet targeting, reading level |
| 13 | Off-Page Signals | 4% | Backlink profile quality, social presence, directory listings, brand mentions |
| 14 | SEO Measurement | 4% | Analytics setup, conversion tracking, rank monitoring, KPI framework |

---

## How to Run the Audit

### Step 1: Build the Site

```bash
npm run build
```

Ensure `dist/` is fresh and complete.

### Step 2: Collect Data

For each HTML page in `dist/`:

**Technical SEO checks:**
- [ ] `sitemap-index.xml` exists and lists all pages
- [ ] `robots.txt` exists with Sitemap directive
- [ ] Every page has `<link rel="canonical">` tag
- [ ] Hreflang tags present for all enabled languages
- [ ] No duplicate content (no pages with identical titles/descriptions)
- [ ] Clean URL structure (no query params, trailing slashes consistent)

**On-Page SEO checks:**
- [ ] Every page has a unique `<title>` tag (under 60 characters ideal)
- [ ] Every page has a unique `<meta name="description">` (under 160 characters)
- [ ] Title contains primary keyword for the page
- [ ] Description contains primary keyword and geo-target
- [ ] One `<h1>` per page that matches the page topic
- [ ] Heading hierarchy is sequential (h1 > h2 > h3, no skips)
- [ ] Primary keyword appears in first 100 words of body content

**Content Quality checks:**
- [ ] Each page has minimum word count (homepage 500+, services 800+, about 500+, contact 200+)
- [ ] No placeholder text ("Lorem ipsum", "[Write...]", "Coming soon" as main content)
- [ ] E-E-A-T signals present (author info, company details, credentials)
- [ ] Content addresses user search intent for target keywords
- [ ] Keyword density under 1% (close to 2% = keyword stuffing)
- [ ] Primary keyword appears within first 50 words of body content
- [ ] Buyer journey coverage: awareness, consideration, and decision content present
- [ ] No duplicate content across pages (unique titles, descriptions, body text)

**Structured Data checks:**
- [ ] Organization/ProfessionalService schema on homepage
- [ ] Service schemas on service pages
- [ ] BreadcrumbList schema on all pages
- [ ] FAQPage schema on FAQ sections
- [ ] HowTo schema on instructional content (if applicable)
- [ ] All schemas validate (no missing required fields)
- [ ] areaServed and serviceType populated
- [ ] Logo, address, contact info in Organization schema
- [ ] Rich Snippet eligibility: structured data matches visible page content (no cloaking)
- [ ] Author/Person schema with credentials on blog posts and team pages

**Pagespeed & Performance checks:**
- [ ] Total page weight under 500KB (excluding lazy images)
- [ ] All images use `<img>` with width/height (no CLS)
- [ ] Hero images use `loading="eager"`, rest use `loading="lazy"`
- [ ] No render-blocking external scripts
- [ ] Fonts preloaded or self-hosted with `font-display: swap`
- [ ] CSS inlined or minimal external sheets
- [ ] Images compressed (JPEG quality 70-85%, WebP/AVIF where supported)
- [ ] GZIP or Brotli compression enabled on server
- [ ] Browser caching headers set (static assets: 1 year, HTML: no-cache)
- [ ] No redirect chains (max 1 redirect per URL)
- [ ] HTML/CSS/JS minified in production build

**Mobile Usability checks:**
- [ ] `<meta name="viewport">` present on every page
- [ ] All touch targets >= 44x44px
- [ ] No horizontal overflow at 375px viewport
- [ ] Images use responsive srcset/sizes
- [ ] Text readable without zooming (min 16px body)
- [ ] Mobile navigation functional (hamburger menu works)

**Local SEO checks:**
- [ ] Business name, address, country in structured data
- [ ] Geo meta tags (geo.region, geo.placename, ICBM)
- [ ] Target location appears in titles and descriptions
- [ ] Contact page has full address and phone
- [ ] Google Business Profile set up and linked (if applicable)
- [ ] NAP (Name, Address, Phone) consistent across all pages and structured data
- [ ] Local citations in relevant directories (Yellow Pages, industry-specific)
- [ ] Reviews/ratings strategy documented or linked
- [ ] Location-specific landing pages for each area served (if multi-location)

**Internal Linking checks:**
- [ ] Every page reachable within 3 clicks from homepage
- [ ] No orphan pages (every page linked from at least one other)
- [ ] Navigation includes all key pages
- [ ] CTAs link to relevant internal pages
- [ ] Footer includes key page links

**Security & Trust checks:**
- [ ] All internal URLs use relative paths or HTTPS
- [ ] No mixed content (HTTP resources on HTTPS page)
- [ ] External links use `rel="noopener"` on target="_blank"
- [ ] No links to suspicious/broken external domains

**Accessibility checks:**
- [ ] All `<img>` tags have `alt` attributes
- [ ] Icon-only buttons have `aria-label`
- [ ] Skip-to-content link present
- [ ] Focus styles visible on interactive elements
- [ ] Colour contrast meets WCAG 2.1 AA (4.5:1 body, 3:1 large)
- [ ] Language attribute on `<html>` tag

**Competitive Positioning checks:**
- [ ] Target keywords covered across page titles
- [ ] Geo-targeting (city, country, region) in meta tags
- [ ] Service types match what users search for
- [ ] Unique value proposition visible above the fold
- [ ] Competitor keywords not missing from coverage

**Voice Search Readiness checks:**
- [ ] FAQ page exists with natural-language questions as H2/H3 headings
- [ ] Answers are concise (30-50 words for snippet capture) before expanded detail
- [ ] Conversational long-tail keywords targeted (5+ words, question format)
- [ ] Content reads naturally aloud (no keyword stuffing, natural sentence flow)
- [ ] Reading level at 8th-9th grade (simple vocabulary, short sentences)
- [ ] Featured snippet format used: question heading → direct answer → expanded detail
- [ ] "Near me" and location-based content optimised for local voice queries

**Off-Page Signals checks:**
- [ ] Social media profiles exist and link back to website
- [ ] Business listed in relevant online directories
- [ ] Google Business Profile claimed and complete
- [ ] Bing Places listing created
- [ ] No toxic backlinks pointing to site (check for spam, PBNs, link farms)
- [ ] Brand name searchable in Google (Knowledge Graph presence or potential)
- [ ] No black hat signals: no hidden text, no keyword stuffing, no cloaking, no doorway pages

**SEO Measurement checks:**
- [ ] Google Analytics (GA4) tracking code installed and verified
- [ ] Google Search Console connected and sitemap submitted
- [ ] Bing Webmaster Tools set up (critical for AI search visibility)
- [ ] Conversion goals defined (contact form, phone call, email click)
- [ ] Core Web Vitals monitored (LCP, FID, CLS baselines established)
- [ ] Organic traffic baseline recorded for month-over-month comparison

### Step 3: Score Each Category

Score 0-10 per category:
- **10**: Perfect — all checks pass, best practices exceeded
- **8-9**: Strong — minor improvements possible
- **6-7**: Adequate — some gaps, no critical issues
- **4-5**: Needs work — notable gaps affecting visibility
- **2-3**: Weak — significant issues
- **0-1**: Critical — category largely missing

### Step 4: Generate Report

Output a structured audit report:

```markdown
# SEO Audit Report — [Site Name]
Date: [YYYY-MM-DD]
Site URL: [URL]
Pages audited: [count]

## Overall Score: [XX]/100

## Category Scores

| Category | Score | Status |
|----------|-------|--------|
| Technical SEO | X/10 | [pass/warn/fail] |
| On-Page SEO | X/10 | [pass/warn/fail] |
| ... | ... | ... |

## Critical Issues (Fix Immediately)
1. [Issue + how to fix]

## High Priority (Fix This Week)
1. [Issue + how to fix]

## Medium Priority (Fix This Month)
1. [Issue + how to fix]

## Low Priority (Nice to Have)
1. [Issue + how to fix]

## What's Working Well
- [Positive findings]
```

### Step 5: Save Report

Save to `docs/seo-audit-[YYYY-MM-DD].md` in the project root docs directory.

---

## Scoring Thresholds

| Overall Score | Rating | Action |
|---------------|--------|--------|
| 90-100 | Excellent | Monitor quarterly |
| 75-89 | Good | Address high-priority items |
| 60-74 | Fair | Prioritise fixes before promotion |
| 40-59 | Poor | Significant work needed |
| 0-39 | Critical | SEO fundamentally incomplete |

---

## References

- `references/audit-checklist.md` — Detailed per-check explanations, pagespeed deep-dive, voice search readiness, off-page assessment, black hat detection, structured data completeness
- `references/keyword-research.md` — Keyword categories, long-tail strategy, voice search patterns, keyword-to-intent mapping
- `references/local-seo-guide.md` — Local SEO best practices, Google Business Profile optimisation, citation building, review strategy, local landing pages
- `references/seo-measurement-guide.md` — KPI framework, traffic analysis, bounce rate benchmarks, conversion tracking, ranking visibility, off-page metrics (DA, PA, TrustFlow), brand search monitoring

## Relationship to Other Skills

- **seo** skill implements the SEO — this skill audits the result
- Run **seo** first to build the SEO layer, then run **seo-audit** to verify
- Findings from audit should feed back into seo skill configuration
- **blog-writer** content strategy affects Content Quality and Voice Search scores
- **brand-alignment** messaging consistency affects Competitive Positioning score
