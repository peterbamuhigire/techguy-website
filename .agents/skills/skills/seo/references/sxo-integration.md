# SXO Integration — Search Experience Optimization

Framework for fusing SEO + UX + CRO into a unified website strategy. Every page must satisfy search engines, users, AND conversion goals simultaneously.

Source: Zuzanna Kruger, "The Art of SXO" (2024).

---

## What Is SXO?

**SXO = SEO + CRO + UX Design** — an end-to-end approach treating the entire user journey from search query through conversion and loyalty.

| Discipline | Focus | Without It |
|-----------|-------|------------|
| **SEO** | Visibility in organic search | Great site nobody finds |
| **CRO** | Converting visitors to action | Traffic that never converts |
| **UX** | Positive browsing experience | Visitors who find you but leave frustrated |

**Core principle:** User-first approach. Everything should improve user experience, not game algorithms. User-first is more sustainable as algorithms evolve.

---

## The SXO Audit Checklist

Evaluate every website across these six dimensions:

### 1. Search Visibility
- [ ] Primary keyword in title tag (max 60 characters)
- [ ] Meta description includes keyword + CTA (max 150 characters)
- [ ] Hreflang tags for all language versions
- [ ] XML sitemap per language submitted to Search Console
- [ ] Schema markup on all pages (Organization, LocalBusiness, Article, BreadcrumbList)
- [ ] No orphan pages (every page linked from at least one other page)

### 2. Content Quality
- [ ] Content matches search intent for target keywords
- [ ] Short paragraphs, clear headings, bullet points for scannability
- [ ] Content fresher than 2 years (or evergreen and still accurate)
- [ ] Average time on page > 30 seconds (if under, rewrite or remove)
- [ ] Both logical (data, stats) AND emotional (stories, testimonials) appeals on every page

### 3. Technical Performance
- [ ] TTFB (Time to First Byte) under 200ms
- [ ] Full page load under 3 seconds
- [ ] Maximum 1 redirect per URL path
- [ ] All pages HTTPS
- [ ] Viewport meta tag present for mobile
- [ ] No 5xx server errors
- [ ] Images compressed, lazy-loaded, with descriptive filenames and alt text

### 4. Design & UX
- [ ] Responsive across all breakpoints (375px, 768px, 1280px+)
- [ ] Navigation clear, concise (1-2 word labels), grouped logically
- [ ] Breadcrumbs on all pages below homepage
- [ ] Consistent design system (colours, fonts, spacing, button styles)
- [ ] Minimum 16px body text, sufficient contrast (WCAG AA)
- [ ] No confusing navigation, small touch targets, or intrusive popups

### 5. Conversion Elements
- [ ] CTA on every page (concise, clear, relevant)
- [ ] Value proposition visible without scrolling
- [ ] Social proof distributed throughout (not just testimonials section)
- [ ] Lead capture forms: minimal fields, clear labels, inline validation
- [ ] Trust signals near conversion points (badges, reviews, security indicators)

### 6. International / Multilingual
- [ ] Hreflang tags correctly implemented for all language pairs
- [ ] Native-quality translations (not machine translation alone)
- [ ] Content-Language meta tag on every page
- [ ] Country-specific keyword research (terms differ: "shoes" US vs "trainers" UK)
- [ ] URL slugs localized for every enabled language, not copied from English by default
- [ ] Language switcher preserves the equivalent page through a route map, even when slugs differ
- [ ] Cultural adaptation: colour symbolism, imagery, date/currency formats
- [ ] Design accommodates text expansion (French ~30% longer)

---

## SXO Content Strategy

### Content by Decision Style

Every page must serve both types of decision-maker:

| Type | What They Need | How to Deliver |
|------|---------------|----------------|
| **Logical** | Facts, data, statistics, comparisons | Tables, metrics, case study results, feature lists |
| **Emotional** | Gut feeling, stories, visuals, trust | Testimonials, team photos, brand story, imagery |

**Rule:** Never build a page that only appeals to one type. Pair every statistic with a human story; pair every testimonial with a concrete result.

### Content Types by Funnel Stage

| Stage | Content Type | Keyword Focus | Goal |
|-------|-------------|---------------|------|
| **Awareness** (TOFU) | Blog posts, guides, FAQs | Pain-point keywords | Help understand the problem |
| **Consideration** (MOFU) | Comparisons, case studies, methodology | Solution keywords | Position as knowledgeable guide |
| **Decision** (BOFU) | Service pages, pricing, testimonials | Brand + review keywords | Prove capability, build confidence |

**95% of visitors are NOT ready to buy.** A website with only decision-stage content ignores 95% of its potential audience.

### High-Converting Keyword Selection

| Signal | Why It Converts |
|--------|----------------|
| **Long-tail** (3-4+ words) | Specific intent, less competition |
| **High-intent** ("buy," "hire," "book," "get quote") | User ready to act |
| **Low-competition** | Easier to rank, faster ROI |
| **Question-based** ("how to," "what is," "best way to") | Maps to featured snippets |

---

## SXO Design Rules

### Navigation (10 Rules)
1. Clear, concise labels (1-2 words: Home, About, Services, Blog, Contact)
2. Group similar items together
3. Drop-down menus: max 2 levels, sparingly used
4. Breadcrumbs on every page (Home > Category > Page)
5. Search bar prominent with autocomplete (for content-heavy sites)
6. Mobile: responsive, easy tap targets (min 44×44px)
7. Test on different devices before launch
8. Track analytics: clicks per menu item, time on page
9. Avoid jargon, small click targets, hidden info
10. Validate with real users

### Visual Design for SXO
- **Simplicity** — liberal whitespace; less is more
- **Consistency** — same colours, fonts, styles across all pages
- **Clarity** — headings break text; jargon-free language
- **User focus** — larger fonts for older audiences; bolder colours for younger

### Forms for SXO
- Clear, concise field labels
- Logical field order matching mental model
- Easy-to-find submit button (primary CTA styling)
- Inline validation with specific error messages
- Minimal fields (every extra field reduces completion by ~10%)

---

## SXO Measurement

### Key Metrics

| Metric | Target | What It Means |
|--------|--------|--------------|
| **Conversion rate** | Industry-dependent; track improvement over time | Visitors taking desired action |
| **Bounce rate** | Under 60% for content pages; under 40% for landing pages | Single-page exits |
| **Time on page** | Over 30 seconds (under = rewrite or remove) | Content engagement |
| **Organic traffic** | Month-over-month growth | Search visibility improving |
| **Pages per session** | 2+ average | Users exploring beyond entry page |

### Content Health Signals

| Signal | Action |
|--------|--------|
| Average time on page < 30 seconds | Rewrite or remove the content |
| Declining pageviews over 3 months | Update content with fresh information |
| High bounce rate (> 70%) | Improve above-fold content and internal linking |
| Content older than 2 years | Audit for accuracy; refresh or mark as archived |

---

## SXO and Multilingual Websites

Our websites serve 3 languages (en, fr, sw). SXO integration points:

### Per-Language Requirements
- Keyword research per language (don't just translate English keywords)
- URL slug research per language; each translated page and article needs the target language's natural search phrase in the slug
- Content intent may differ by language market (French-speaking Africa has different search patterns)
- Each language version needs its own sitemap
- hreflang implementation must be bidirectional and complete
- Sitemap alternates, canonical URLs, language switcher links, and internal links must all use the same route-equivalence map
- Local hosting or CDN with regional edge nodes for speed

### Cultural SXO Considerations
- Colour symbolism varies (red = danger in West, prosperity in China)
- Image relevance: use photos that reflect the target audience's context
- Date and currency formats must match locale
- Formality level in CTA copy differs by culture (French is more formal than English)
- Design for variable Internet speeds in target regions

---

## Demand Generation Through SXO

### Long Landing Page Framework (for service pages)
1. Keyword-optimised headline (H1 with primary keyword)
2. Clear value proposition in first paragraph
3. Strong CTA above the fold
4. Supporting images/video
5. Full SEO optimisation (title, meta, headers, schema)
6. Testimonials and social proof mid-page
7. Mobile-responsive layout
8. Secondary CTA or lead capture form
9. FAQ section targeting long-tail keywords

### Blog Content for Demand Generation
- Target long-tail question keywords ("How to choose an ERP for manufacturing in Uganda")
- Answer the question directly in first 40-60 words (featured snippet format)
- Expand with detail, examples, and expertise
- Internal link to relevant service pages (awareness → consideration)
- Promote through social and email channels
