# Premium SEO Package

The default SEO package delivered on every premium engagement. SEO is not an add-on — it is built into the engagement from the strategy phase, not bolted on at launch.

Grounded in Schwartz (*Product-Led SEO*) for strategy, intent, and measurement; extends the repo's existing `seo/` and `seo-audit/` skills.

Companion files: `analytics-event-map.md` (in `seo/references/`), `page-conversion-checklist.md` and `authority-content-matrix.md` (in `page-builder/references/`), `website-messaging-framework.md` (in `sales-copywriting/references/`).

---

## 1. SEO principles

1. **Strategy, not tactics.** SEO built as a business function tied to revenue, not as a list of tasks tied to rankings.
2. **Users first, engines second.** The site is built for the reader. Search-engine optimisation happens in service of that, not against it.
3. **Rankings are a vanity metric.** Conversions, leads, pipeline, and revenue are the scoreboard.
4. **Intent beats volume.** A keyword with 40 right-fit searches per month beats one with 40,000 wrong-fit searches.
5. **Technical excellence is the floor, not the ceiling.** Crawlability, indexation, and speed are minimum bars, not differentiators.
6. **Content that nobody links to voluntarily does not rank sustainably.** Brands do not build links; they earn them.
7. **The website sells before humans do.** About 60% of the buying decision completes before the first human contact — the site must carry that weight.
8. **SEO compounds.** Payback is 6–24 months. If the client cannot tolerate that, they should buy paid traffic instead.

---

## 2. What the premium SEO package includes

Delivered as part of every Growth and Authority engagement; a lighter version delivered with Foundation.

### Foundational (all tiers)

- Keyword + intent map (target keywords, search intent, priority pages)
- Page metadata model (titles, meta descriptions, H1 hierarchy, canonical policy)
- On-page SEO for all money pages (title, description, header structure, internal links, image alt, schema)
- XML sitemap + robots.txt
- Basic schema: Organization, WebSite, BreadcrumbList
- Google Search Console + Bing Webmaster setup
- GA4 with SEO-relevant events
- Launch-day crawl and indexation audit
- 301 redirect map from the old site

### Growth tier (adds)

- Topical hub architecture for the top 3 service verticals
- Internal linking model designed around topical authority
- FAQ schema on service and support pages
- LocalBusiness + Review + Article schema where applicable
- Core Web Vitals hardening
- Pre-launch technical audit (crawl errors, indexation issues, redirect chains, broken links, image optimisation, JS-rendered content flagging)
- 60-day post-launch monitoring with two optimisation passes

### Authority tier (adds)

- Entity modelling and knowledge graph alignment
- Topical authority map for the firm's full category
- Authority asset production (1 cornerstone research or diagnostic piece)
- Programmatic content architecture where the offering supports it
- Structured data strategy across article, video, FAQ, HowTo, Person, Service
- Attribution model connecting organic to pipeline and revenue
- KPI dashboard
- 90-day post-launch monitoring with three optimisation passes

---

## 3. Keyword and intent map

Built in the strategy phase, before design or content.

### Process

1. **Start with personas, not a keyword tool.** Who is the reader? Where in the funnel? What language do they use?
2. **Interview real customers.** Three to five 30-minute calls. The language they use is the keyword list.
3. **Pull Search Console data from the current site** (if it exists). Real impressions beat estimator tools.
4. **Use keyword tools as sanity checks, not generators.** Ahrefs / SEMRush / Moz confirm volume, identify gaps.
5. **Validate addressable market.** For new sites with no data, use a tangential competitor's total organic traffic divided by page count to forecast.
6. **Map every target keyword to an intent + page.**

### Intent categories

| Intent | Reader state | Page type | CTA |
|---|---|---|---|
| Informational | "I want to understand X" | Blog, guide, resource hub | Subscribe, related content |
| Navigational | "I'm looking for {brand}" | Home, about, team | Self-qualify |
| Commercial investigation | "I'm comparing options" | Services, pricing, case studies, compare pages | Self-qualify, consult |
| Transactional | "I'm ready to act" | Pricing, booking, contact | Convert |
| Brand-related | "I know this firm" | Any | Varies by rung |

A page that mixes intents serves none well. Commit each page to a single intent.

### Deliverable format (spreadsheet or CSV)

Columns: keyword, monthly volume (Search Console + tool estimate), intent category, target page URL, priority tier (1–3), current position, target position, content type, internal linking anchors, measurement goal.

### Non-brand vs brand ratio

Track this as the single most useful SEO health metric:

- New site: expect 85/15 brand-to-non-brand
- 12-month target: 50/50
- 24-month target: 25/75 (inverted)

---

## 4. Page metadata model

### Titles

- 55–60 characters.
- Keyword front-loaded where natural.
- Format: `Primary phrase | Qualifier — Firm`.
- Unique per page. Never auto-generated from H1 verbatim for cornerstone pages — use the hand-written version.

### Meta descriptions

- 150–158 characters.
- Written to sell the click, not stuff keywords.
- Include the primary keyword once, naturally.
- End with a soft CTA ("Book a diagnostic" / "See the approach").

### H1 → H6 hierarchy

- One H1 per page.
- H2 for major sections, H3 for sub-sections. Do not skip levels.
- H2s carry secondary keywords naturally. Never force.
- H4–H6 used sparingly for specific content types (tables, FAQs, long case studies).

### Canonical policy

- Every page has a self-referencing canonical tag by default.
- Cross-canonicalise when duplicate or near-duplicate content exists.
- Never canonicalise to a non-existent page. Never canonicalise to a redirect.
- Verify Google-accepted canonicals quarterly in Search Console.

### OG + Twitter cards

Every page carries:

- `og:title`, `og:description`, `og:image` (1200×630 PNG/JPG), `og:url`, `og:type`
- `twitter:card = summary_large_image`
- `twitter:title`, `twitter:description`, `twitter:image`

OG images are mandatory on every page. HD variants preferred. Default fallback is the firm-level OG image.

---

## 5. Internal linking plan

Internal linking is the lever that distributes authority. Most sites leak it.

### Model: point-to-point, not hub-and-spoke

Every page links to 3–6 related pages, chosen by relevance. Related modules on long-form content rotate by recency or relevance, not just popularity (popularity-only orphans the long tail).

### Specific rules

- Every service page links to at least 2 related case studies and 1 related article.
- Every case study links to the associated service and 2 related case studies.
- Every article links to at least 2 other articles and 1 money page.
- Every pillar page links to all its cluster articles; every cluster links back to its pillar.
- Breadcrumbs on every page except the home.
- HTML sitemap for sites with over 50 pages.
- Avoid orphan pages. Run the post-launch crawl to flag any.

### Topical hub structure (Growth and Authority tiers)

For each of the top 3 service verticals:

- **Pillar page:** comprehensive, ~1,500–3,000 words, targets the head-term intent
- **Cluster pages:** 5–15 supporting articles, each targeting a specific long-tail intent
- **Bi-directional linking:** pillar links to all clusters; every cluster links to the pillar plus 2–4 siblings
- **Shared anchor text vocabulary:** consistent, not spammy exact-match

---

## 6. Schema / structured data

### Required on every site

- `Organization` (firm-level, in sitewide JSON-LD) with logo, name, url, sameAs (social profiles), contactPoint
- `WebSite` with `potentialAction` (search action)
- `BreadcrumbList` on every page

### Required by page type

- Home: `Organization` + `WebSite`
- About: `Organization` + `Person` (principals, with sameAs for social profiles)
- Services: `Service` + `Offer` (optional)
- Case study: `Article` + `Review` (client testimonial)
- Blog: `Article` with author, datePublished, dateModified
- FAQ page or section: `FAQPage` with proper `mainEntity` nesting
- Testimonials section: `Review` nested in `Organization` or `Service`
- Location / contact (LocalBusiness-eligible firms): `LocalBusiness` with geo coordinates, opening hours, postal address
- Events: `Event`
- How-tos or process pages: `HowTo`
- Video embeds: `VideoObject` with uploadDate, thumbnailUrl, duration

### Schema governance

- Validate every page's schema in the Rich Results Test before launch.
- Never mark up content that does not exist on the page.
- Never mark up false reviews or fabricated ratings.
- Monitor schema errors weekly in Search Console for 90 days post-launch.

---

## 7. Local SEO (where relevant)

For firms with a physical presence serving a geographic market.

### Foundation

- `LocalBusiness` schema on home and location pages
- NAP (Name, Address, Phone) consistent across site, Google Business Profile, directories
- Google Business Profile claimed, verified, fully populated
- Bing Places, Apple Business Connect claimed where relevant

### On-page

- City/region named in the H1 or H2 of the home page
- Dedicated location pages for multi-location firms (one page per location, unique content, not templated fill-in)
- Opening hours on every relevant page (structured + visible)
- Embedded map on the contact page
- Directions/parking information where relevant

### Off-page

- 5–10 priority directory listings (industry-specific + general)
- Review acquisition: system for requesting reviews from satisfied clients
- Local backlinks through community involvement, sponsorships, press

---

## 8. AI visibility and answer engines (GEO)

Search is fragmenting across Google, Bing, LLM-based answer engines (Perplexity, ChatGPT, Claude), and AI Overviews. Product-Led SEO (2021) predates this; the practices below extend its principles for a 2026 landscape.

### Principles

1. **Answer engines cite specific, structured, verifiable content.** Stats, data, named experts, numbered lists.
2. **Entity authority matters more than keyword density.** Be a named, recognisable thing in your category.
3. **Citation-worthiness > rankability.** Content that answers a question directly and attributes its claims clearly is more likely to be cited.
4. **Humans and LLMs both prefer the same things:** clear structure, specific data, named sources.

### Practices

- **Write definitively.** "Premium websites for high-trust firms start at $12,000" beats "premium websites can cost anywhere from..."
- **Cite primary sources.** Link to research, data, named experts — with dates.
- **Use stable heading structures.** H2 questions, H3 specific answers. LLMs parse this pattern reliably.
- **Publish original research.** A single piece of primary data (survey, benchmark, case-study aggregation) outperforms 50 derivative pieces.
- **Build an entity footprint.** Wikipedia-adjacent citations, Crunchbase, LinkedIn, industry associations — all feed entity recognition.
- **Use FAQ schema for anticipated questions.** Makes content eligible for AI Overview and PAA surfacing.
- **Use `Article` schema with author `Person` markup.** Attribution is entity-rich.
- **Run periodic LLM citation audits.** Query the top answer engines for your target questions; see whether the firm is cited, and where.

### AI bot policy

- Default: allow reputable AI crawlers (GPTBot, Google-Extended, ClaudeBot, PerplexityBot). Disallow scrapers with no citation practice.
- Robots.txt documented with reasoning. Reviewed quarterly.
- `llms.txt` published where the firm is willing to signal permitted AI use.

---

## 9. Technical SEO baseline

### Crawlability and indexation (non-negotiable)

- Every intended page returns 200 and is indexable.
- Every non-intended page (admin, staging, drafts) returns proper blockers.
- Robots.txt valid and up to date.
- XML sitemap submitted to Search Console and Bing.
- Canonical signals consistent across internal links, sitemap, and tag.
- Multilingual slugs localized per enabled language, with sitemap alternates, hreflang, language switcher links, and internal links generated from the same route-equivalence map.
- No duplicate content issues (cross-canonical where needed).

### Crawl budget awareness

- Low-value pages no-indexed or robots-blocked (filtered archives, thin tag pages, search result pages).
- JS-rendered critical content flagged and resolved — Google's rendering lag costs crawl budget.

### Core Web Vitals targets

- **LCP ≤ 2.5s** on 3G (mobile-first).
- **INP ≤ 200ms** (replaces FID from 2024).
- **CLS ≤ 0.1.**
- Measured in Search Console's CWV report, not lab tools alone.

### Redirects

- 301, not 302, for permanent moves.
- No redirect chains (A → B → C is A → C).
- 301 map preserved in perpetuity on domain migrations.
- Redirect audit on every launch and quarterly thereafter.

### Mobile-first

- Responsive design, not separate mobile site.
- Mobile crawler sees the same content as desktop.
- Tap targets, font sizes, viewport meta tag correct.

### Security

- HTTPS everywhere with HSTS.
- No mixed content.
- Certificate expiration monitoring in place.

---

## 10. SEO measurement

### The three-level SEO funnel (Schwartz)

1. **Impressions** — the site is on the field, eligible for the query. Leading indicator for new sites.
2. **Clicks** — a function of impressions × CTR. Work on titles/descriptions once impressions exist.
3. **Conversions** — the scoreboard. Everything else is context.

### KPIs by stakeholder

| Stakeholder | KPI |
|---|---|
| Agency-side execution | Indexed pages, crawl errors, CWV scores, schema validity |
| Agency-side performance | Impressions, clicks, CTR, average position on target keywords |
| Client-side commercial | Organic sessions → leads, lead quality, pipeline influence, revenue attributed |

### Tools

- **Primary:** Google Search Console, Bing Webmaster, GA4.
- **Supplementary:** Ahrefs or SEMRush or Moz (one, not all), Screaming Frog (crawl audits), Crazy Egg or HotJar (post-launch behaviour).
- **For Authority tier:** attribution platform (Dreamdata, HockeyStack, or custom).

### Reporting rhythm

- Weekly agency-internal: Search Console anomalies, coverage issues, CWV regressions.
- Monthly client-facing: pulled from `project-log/monthly/YYYY-MM.md` via the `monthly-report` skill. Organic sessions, target-keyword position, lead volume, conversion rate, MoM deltas with commentary.
- Quarterly client-facing strategy: trajectory review, priorities for next quarter.

### Anti-patterns

- **Never tie variable compensation to SEO KPIs.** Every scheme Schwartz has seen produced bad incentives (keyword stuffing, link buying, thin content production).
- **Never report rankings without conversions.** A top-3 position on a low-intent term is a vanity trophy.
- **Never forecast via keyword-volume × CTR × click-curve tables.** They are fiction. Forecast via competitor traffic benchmarks and tangential comparables.

---

## 11. Authority and links

Schwartz's doctrine: brands do not build links; they earn them. Link-building tactics are high-risk, low-return, and often penalised.

### What the agency does

- **Earn links through publishable content.** Original research, benchmarks, case studies, opinion that journalists and peers cite.
- **Press-led link acquisition.** The Singapore bathroom-survey type of low-cost research project that travels.
- **Community and partnerships.** Speaking, sponsorships, industry associations — the links follow the presence.
- **Digital PR.** Thoughtful pitches to trade publications, not mass outreach.

### What the agency does not do

- Mass outreach link-building.
- Guest-post spam.
- Paid links that violate guidelines.
- Link exchanges, PBNs, or any manufactured network.

### Link hygiene

- Quarterly disavow audit — identify and disavow toxic inbound links.
- Monitor referring domains in Search Console + Ahrefs.
- Flag negative SEO attempts immediately.

---

## 12. When not to invest in SEO

Schwartz is explicit: not every business justifies SEO investment. The agency sells SEO inside the Growth and Authority tiers; for some buyers, it is the wrong investment.

### Skip or defer when

- The runway is under 12 months. SEO compounds; paid ads buy time.
- The market is hyper-local and small (a single neighbourhood dentist with a one-mile radius).
- The offer is one-time and niche (single-product, single-sale businesses).
- The client cannot tolerate investment with 6–24 month payback.

### Substitute with

- Paid search + social + retargeting — immediate.
- Local Services Ads for local businesses.
- Direct outbound + partnerships — faster for B2B with small TAM.
- Content marketing without SEO pretensions (if the client just wants thought leadership).

---

## 13. Post-launch SEO operations (retainer territory)

The project delivers the system. The retainer runs it.

Monthly minimum (retainer):

- Search Console coverage review
- Keyword movement review on top 20 target terms
- New content opportunities from Search Console queries showing impressions but low CTR
- Internal linking additions from new content to existing money pages
- 1–3 content publishes per month (from the editorial calendar)
- CWV monitoring and fixes
- Link-hygiene and referring-domain review

Quarterly:

- Topical authority review (coverage gaps, new clusters)
- Schema audit
- Technical audit (crawl, indexation, redirects)
- Strategic re-prioritisation with client

---

## 14. Source anchors

Practices in this file trace to:

- **Eli Schwartz, *Product-Led SEO* (2021):** strategy-first framing, rankings-as-vanity, product-led architecture, intent over volume, three-level funnel, brand-vs-non-brand ratio, addressable-market forecasting, point-to-point internal linking.
- **Existing repo skills:** `seo/`, `seo-audit/`, `blog-writer/`, `blog-idea-generator/`.
- **2024–2026 practice (not book-sourced):** GEO / AI visibility, `llms.txt`, INP replacing FID, entity-driven content.

When the book and current practice disagree, prefer current practice and update this file with a dated note.
