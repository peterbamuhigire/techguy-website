# SEO Audit Checklist — Detailed Reference

Comprehensive per-check explanations for all 14 audit categories. Each check includes what to look for, why it matters, and how to fix common issues.

Source: *The SEO Book* (Tobias Ebner & Levin Granitza), *Content and Copywriting Secrets* (GoldInk Books), Google Search Central documentation.

---

## 1. Technical SEO

### Sitemap
- XML sitemap must list every indexable page
- Sitemap index used for multi-language sites (sitemap-en.xml, sitemap-fr.xml, sitemap-sw.xml)
- Submit sitemap to Google Search Console and Bing Webmaster Tools
- Sitemap referenced in robots.txt with full URL
- Sitemap auto-updates on each build (Astro @astrojs/sitemap handles this)

### Robots.txt
- Must allow all important pages
- Block admin, staging, and duplicate paths
- Block `/_astro/` hashed assets (regenerated each build, no SEO value)
- Block query parameters (`/*?`) to prevent duplicate content indexing
- Include `Sitemap:` directive with absolute URL
- Do not block CSS/JS files (Googlebot needs them for rendering)
- Rate-limit aggressive crawlers (AhrefsBot, SemrushBot: 10s crawl-delay)

### Canonical URLs
- Every page must have a self-referencing `<link rel="canonical">`
- Canonical URL must be absolute (include full domain)
- Avoid conflicting canonical signals (canonical vs sitemap vs hreflang)
- No duplicate content — if two pages have similar content, one must canonical to the other

### Hreflang
- Required for multi-language sites
- Must include `x-default` pointing to default language
- Reciprocal — if page A points to page B, page B must point to page A
- Use correct language-region codes (en-UG, fr-UG, sw)
- Every language version must hreflang to all other versions (including itself)

### Crawlability
- Google Bot must be able to access all important pages
- No broken internal links returning 404 (check with crawl tool)
- No redirect chains (max 1 redirect per URL; chains waste crawl budget)
- Clean URL structure: no query parameters, consistent trailing slashes
- Server returns proper HTTP status codes (200, 301, 404 — no soft 404s)

---

## 2. On-Page SEO

### Title Tags
- Include primary keyword near the beginning
- Keep under 60 characters (Google truncates at ~580px width)
- Make each title unique across the entire site
- Include brand name (usually at the end after pipe or dash)
- Front-load important keywords for maximum click-through
- **Red flag:** Multiple pages sharing the same title tag

### Meta Descriptions
- Include primary keyword and geo-target (city/country)
- Keep under 160 characters desktop, 113 characters mobile
- Include a call to action where natural ("Contact us", "Learn more")
- Make each description unique across the site
- Describe what the user will find — match the search intent
- **Red flag:** Missing or duplicate meta descriptions

### Heading Hierarchy
- One H1 per page — must contain primary keyword
- H2s for major sections — primary keyword in first H2
- H3s for subsections within H2s
- Never skip levels (H1 → H3 without H2)
- Use headings for structure, not styling
- **Red flag:** Multiple H1 tags or skipped heading levels

### Keyword Placement
- Primary keyword in first 50 words of body content (ideally 2-3 times naturally)
- Primary keyword in H1 and first H2
- Secondary keywords distributed naturally through body text
- Primary keyword restated in conclusion/final paragraph
- Keyword density under 1% of total word count (close to 2% = keyword stuffing)
- Internal links use keyword-rich anchor text

---

## 3. Content Quality

### Word Count Guidelines
| Page Type | Minimum Words | Ideal Range |
|-----------|--------------|-------------|
| Homepage | 500 | 500-1,000 |
| Service pages | 800 | 800-1,500 |
| About page | 500 | 500-1,000 |
| Contact page | 200 | 200-400 + form |
| Blog posts | 1,000 | 2,000-2,400 (peak ranking range) |

### E-E-A-T Signals
- **Experience**: Show work examples, case studies, portfolio, original photography
- **Expertise**: Credentials, certifications, team qualifications, years in business
- **Authoritativeness**: Industry associations, partnerships, media mentions, awards
- **Trustworthiness**: Physical address, registration details, testimonials, privacy policy

### Content Integrity
- No placeholder text ("Lorem ipsum", "[Write...]", "Coming soon")
- No duplicate content across pages (each page must offer unique value)
- No hidden text or invisible keywords (same colour as background = black hat)
- Content matches the search intent of targeted keywords
- Keyword density stays under 1% — never stuff keywords unnaturally

### Buyer Journey Coverage
- **Awareness content**: Educational articles, problem-focused posts (pain-point keywords)
- **Consideration content**: Comparisons, frameworks, advisory content (solution keywords)
- **Decision content**: Case studies, portfolio, methodology deep-dives (brand + review keywords)
- Only 5% of visitors are ready to buy — the other 95% need content that moves them through the journey

---

## 4. Structured Data

### Required Schemas
| Schema Type | Where | Required Fields |
|-------------|-------|----------------|
| Organization / ProfessionalService | Homepage | name, url, logo, address, telephone, areaServed |
| WebSite | Homepage | name, url, potentialAction (SearchAction) |
| WebPage | All pages | name, description, url, dateModified |
| BreadcrumbList | Inner pages | itemListElement with position, name, item URL |
| Service | Service pages | name, description, provider, areaServed, serviceType |
| Person | Team pages | name, jobTitle, image, description, sameAs |
| FAQPage | FAQ sections | mainEntity with Question + acceptedAnswer |
| HowTo | Instructional content | name, step with HowToStep elements |

### Rich Snippet Readiness
- All structured data must match visible page content (no cloaking)
- No fake reviews or self-ratings in structured data (Google penalty)
- Use most specific schema type (e.g., `LegalService` not `LocalBusiness` for law firms)
- Validate all schemas: no missing required fields, no trailing commas, valid JSON-LD syntax
- Author/Person schema with credentials on blog posts
- Review schema only with genuine, verifiable reviews

### Featured Snippet Targeting
- Use question as H2 heading (match common search queries exactly)
- Answer directly in first paragraph after H2 (40-60 words, standalone)
- Follow with expanded detail in subsequent paragraphs
- Use structured formats: numbered lists, tables, definition paragraphs
- Target "what is", "how to", "why does" question patterns

---

## 5. Pagespeed & Performance

### Page Weight
- Total page weight under 500KB (excluding lazy-loaded images)
- Individual images: under 200KB for content, under 100KB for thumbnails
- Total transferred size (including lazy images): under 2MB per page

### Image Optimisation
- All images compressed (JPEG quality 70-85%, or WebP/AVIF)
- All `<img>` tags include explicit `width` and `height` (prevents CLS)
- Hero/above-fold images: `loading="eager"` and `fetchpriority="high"`
- All other images: `loading="lazy"`
- Responsive `srcset` and `sizes` attributes for different viewports
- Never upscale images beyond their natural dimensions

### CSS/JS Optimisation
- No render-blocking external scripts in `<head>`
- CSS inlined for critical above-fold styles (or single small external sheet)
- JavaScript deferred or loaded via Web Worker (Partytown for GA4)
- HTML, CSS, and JS minified in production builds
- Unused CSS removed (tree-shaking via Tailwind purge)

### Server-Side Performance
- GZIP or Brotli compression enabled on server
- Browser caching headers: static assets 1 year, HTML no-cache with ETag
- HTTP/2 enabled for multiplexed requests
- No redirect chains (each redirect costs 100-300ms)

### Font Loading
- Fonts self-hosted (no external CDN requests)
- `font-display: swap` to prevent invisible text during load
- Font files preloaded with `<link rel="preload" as="font">`
- Maximum 2-3 font families loaded per page

### Core Web Vitals Targets
| Metric | Good | Needs Improvement | Poor |
|--------|------|-------------------|------|
| LCP (Largest Contentful Paint) | < 2.5s | 2.5-4.0s | > 4.0s |
| FID (First Input Delay) | < 100ms | 100-300ms | > 300ms |
| CLS (Cumulative Layout Shift) | < 0.1 | 0.1-0.25 | > 0.25 |

**Target for our sites: LCP < 1.0s, FID < 50ms, CLS < 0.05** (Astro static sites should exceed "Good" thresholds easily).

---

## 6. Mobile Usability

- `<meta name="viewport" content="width=device-width, initial-scale=1">` on every page
- All touch targets >= 44x44px with adequate spacing
- No horizontal overflow at 375px viewport width
- Images use responsive `srcset`/`sizes` for mobile viewports
- Text readable without zooming: minimum 16px body font
- Mobile navigation functional (hamburger menu works, no broken dropdowns)
- Page loads under 3 seconds on 3G mobile connection
- "Thumb-friendliness": buttons and links within comfortable thumb reach zones

---

## 7. Local SEO

### NAP Consistency
- Name, Address, Phone must be identical everywhere:
  - Website header/footer
  - Contact page
  - Structured data (JSON-LD)
  - Google Business Profile
  - Social media profiles
  - Online directory listings
- Use consistent formatting (don't abbreviate "Street" on one page and spell it out on another)

### Geo Meta Tags
- `geo.region` — ISO 3166-2 code (e.g., UG-102 for Kampala)
- `geo.placename` — City name
- `geo.position` — Latitude;Longitude
- `ICBM` — Latitude, Longitude

### Target Keywords with Location
- Include city + country in page titles: "Website Design in Kampala, Uganda"
- Include region in descriptions: "serving East Africa"
- Use local language variants: "website designers Uganda" not just "website designers"

### Google Business Profile
- Profile claimed, verified, and complete (all fields filled)
- Categories selected (primary + secondary)
- Photos uploaded (office, team, work samples — minimum 10)
- Posts published regularly (weekly updates ideal)
- Reviews actively requested and responded to

### Local Landing Pages
- Dedicated page for each city/region served (if multi-location)
- Each page has unique content (not just city name swapped)
- Local testimonials and case studies with client locations mentioned
- Location-specific structured data (GeoCoordinates, areaServed)

---

## 8. Internal Linking

- Every page reachable within 3 clicks from homepage
- No orphan pages (every page linked from at least one other page)
- Navigation includes all key pages (4-6 items maximum)
- CTAs link to relevant internal pages (not just contact)
- Footer includes links to all important pages
- Anchor text is descriptive and keyword-rich (not "click here")
- Related content cross-linked (service pages ↔ case studies ↔ blog posts)

---

## 9. Security & Trust

- All internal URLs use relative paths or HTTPS (no HTTP links)
- No mixed content (HTTP resources loaded on HTTPS pages)
- External links use `rel="noopener"` on `target="_blank"` links
- No links to suspicious, broken, or spammy external domains
- Privacy policy page exists and is linked from footer
- Terms of use page exists (legal protection + trust signal)
- Contact form uses HTTPS (encrypted submission)
- No exposed credentials, API keys, or sensitive data in page source

---

## 10. Accessibility

- All `<img>` tags have meaningful `alt` attributes (decorative images: `alt=""`)
- Icon-only buttons have `aria-label` describing the action
- Skip-to-content link present as first focusable element
- Focus styles visible on all interactive elements (buttons, links, inputs)
- Colour contrast meets WCAG 2.1 AA: 4.5:1 for body text, 3:1 for large text
- `lang` attribute on `<html>` tag matches page language
- Form inputs have associated `<label>` elements
- No content conveyed by colour alone (use icons/text alongside)

---

## 11. Competitive Positioning

- Target keywords covered across page titles (no gaps in service coverage)
- Geo-targeting (city, country, region) in meta tags and content
- Service types match what users actually search for (validated with keyword research)
- Unique value proposition visible above the fold on homepage
- Competitor keywords not missing from coverage
- Long-tail keywords targeted (70% of searches use long-tail; easier to rank)

---

## 12. Voice Search Readiness

### FAQ Structure
- FAQ page exists with natural-language questions as headings
- Questions match how people speak ("How much does a website cost in Uganda?" not "Website pricing")
- Answers are concise: 30-50 words for snippet capture, then expanded detail below
- FAQ schema markup implemented for all Q&A pairs

### Content Optimisation for Voice
- Content reads naturally aloud (no awkward keyword insertions)
- Reading level at 8th-9th grade: simple vocabulary, short sentences (check with readability tool)
- Long-tail conversational keywords targeted (5+ words, question format)
- "Near me" and location-based queries addressed in content
- Featured snippet format: question H2 → direct answer (40-60 words) → expanded detail

### Mobile-Voice Connection
- Site fully mobile-optimised (voice searches are predominantly mobile)
- Page loads under 3 seconds (voice search results load ~50% faster than average)
- Local content optimised for "near me" voice queries
- Google Business Profile complete (voice assistants pull from GMB for local results)

---

## 13. Off-Page Signals

### Social Media Presence
- Social media profiles exist on relevant platforms (LinkedIn, Facebook, Instagram)
- Profiles link back to website with consistent NAP
- Website links to social profiles (footer or contact page)
- OG tags generate attractive social media previews when shared

### Directory Listings
- Google Business Profile claimed and verified
- Bing Places listing created
- Listed in relevant industry directories (Clutch, GoodFirms, local directories)
- Yellow Pages and local business directories (Uganda Business Directory, etc.)
- NAP consistent across all directory listings

### Black Hat Detection
Scan for potentially harmful SEO signals that could trigger penalties:
- **Keyword stuffing**: No page with keyword density > 2%
- **Hidden text**: No text same colour as background, no CSS `display:none` with keyword content
- **Cloaking**: Content shown to users matches content shown to crawlers
- **Doorway pages**: No thin pages created solely for ranking with redirects elsewhere
- **Link schemes**: No paid links, link farms, or private blog network (PBN) links
- **Structured data abuse**: All rich snippet data matches actual visible page content
- **Blog comment spam**: No outbound links in comments pointing to unrelated sites

### Brand Presence
- Brand name returns results when searched in Google
- Company appears in Google Knowledge Graph (or has potential to)
- Domain authority building through quality content and natural backlinks

---

## 14. SEO Measurement

### Analytics Setup
- Google Analytics 4 (GA4) tracking code installed and verified working
- GA4 running via Partytown Web Worker (zero main thread impact)
- Google Search Console connected and sitemap submitted
- Bing Webmaster Tools set up (critical — powers most AI search platforms)

### Conversion Tracking
- Conversion goals defined and configured in GA4:
  - Contact form submissions
  - Phone number clicks (`tel:` links)
  - Email address clicks (`mailto:` links)
  - CTA button clicks
- Conversion rate baseline established for future comparison

### Ranking Monitoring
- Core Web Vitals baselines recorded (LCP, FID, CLS)
- Organic traffic baseline recorded for month-over-month comparison
- Key page rankings tracked for target keywords
- Brand vs non-brand search query split documented

### KPI Readiness
- See `references/seo-measurement-guide.md` for the complete KPI framework
