# 03 — Advanced Schema: HowTo, ItemList, and SiteLinksSearchBox

## Skills Applied
- `seo` — `references/seo-reference.md` (Advanced Structured Data)

## Current State

The site has: ProfessionalService schema (BaseLayout), BlogPosting schema (all articles), FAQPage schema (Phase 6), Service schema (Phase 5 geo pages), Person schema (Phase 8 about page). This phase adds the remaining high-value schema types.

## Target State

Three additional schema types implemented:
1. **HowTo schema** — on the "how to choose an IT consultant" article and similar how-to articles
2. **ItemList schema** — on the blog index page and the portfolio page
3. **SiteLinksSearchBox schema** — in BaseLayout for branded searches

## Step-by-Step Instructions

### Schema 1 — HowTo JSON-LD for how-to articles

**Apply to:** `src/pages/en/blog/choose-it-consultant.astro` and `src/pages/en/blog/evaluate-it-consultants-uganda.astro` (Phase 7)

**Template:**
```javascript
const howToSchema = {
  "@context": "https://schema.org",
  "@type": "HowTo",
  "name": "How to Evaluate IT Consultants in Uganda",
  "description": "A step-by-step process for evaluating and selecting an IT consultant in Uganda and East Africa.",
  "totalTime": "PT30M",
  "estimatedCost": {
    "@type": "MonetaryAmount",
    "currency": "USD",
    "value": "0"
  },
  "tool": [
    { "@type": "HowToTool", "name": "LinkedIn (for verifying consultant profiles)" },
    { "@type": "HowToTool", "name": "Reference check questions (provided in this article)" }
  ],
  "step": [
    {
      "@type": "HowToStep",
      "name": "Define your technology requirement",
      "text": "Before evaluating consultants, document what you need: the problem you are solving, the type of system or advice required, and the measurable outcome you expect. A consultant who is not given a clear brief cannot give you a useful assessment."
    },
    {
      "@type": "HowToStep",
      "name": "Identify 3 candidates",
      "text": "Source candidates from: referrals from organisations similar to yours, LinkedIn search for ICT consultants in Uganda or East Africa, and professional associations such as the Uganda ICT Association. Do not evaluate fewer than 3."
    },
    {
      "@type": "HowToStep",
      "name": "Check independence",
      "text": "Ask directly: do you have vendor affiliations or receive commissions for recommending specific products? A consultant who cannot answer this question directly has something to obscure."
    },
    {
      "@type": "HowToStep",
      "name": "Request sector-specific references",
      "text": "Ask for two references from clients in your sector or with a similar type of engagement. Request direct contact details. Call or email the references and ask: Did the project deliver what was promised? Was it on time and budget? Would you hire this consultant again?"
    },
    {
      "@type": "HowToStep",
      "name": "Evaluate the proposal",
      "text": "A good proposal names: specific deliverables, milestone billing structure, scope of what is and is not included, total cost including post-delivery support, and what happens if scope changes."
    },
    {
      "@type": "HowToStep",
      "name": "Confirm the engagement in writing",
      "text": "Do not begin any work without a signed agreement that specifies scope, timeline, fee, and change-order process. Verbal agreements are not enforceable in Uganda's ICT engagement context."
    }
  ],
  "author": {
    "@type": "Person",
    "name": "Peter Bamuhigire",
    "url": "https://techguypeter.com/en/about/"
  }
};
```

Add this schema as a second `<script type="application/ld+json">` block on the relevant articles, alongside the `BlogPosting` schema.

---

### Schema 2 — ItemList JSON-LD for the blog index page

**File:** `src/pages/en/blog.astro`

```javascript
const blogListSchema = {
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": "Technology and Business Articles — Peter Bamuhigire",
  "description": "Articles on ICT consulting, software development, website design, and business technology strategy for organisations in Uganda and across Africa.",
  "url": "https://techguypeter.com/en/blog/",
  "numberOfItems": 12,
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "url": "https://techguypeter.com/en/blog/choose-it-consultant/",
      "name": "How to Choose an IT Consultant in East Africa"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "url": "https://techguypeter.com/en/blog/erp-implementation-mistakes/",
      "name": "ERP Implementation Mistakes in Africa — and How to Avoid Them"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "url": "https://techguypeter.com/en/blog/custom-software-africa/",
      "name": "Custom Software Development in Africa — When to Build and When to Buy"
    },
    {
      "@type": "ListItem",
      "position": 4,
      "url": "https://techguypeter.com/en/blog/website-costs-uganda/",
      "name": "What a Website Costs in Uganda — An Honest Breakdown"
    },
    {
      "@type": "ListItem",
      "position": 5,
      "url": "https://techguypeter.com/en/blog/why-visitors-leave-website-3-seconds/",
      "name": "Why Visitors Leave Your Website in 3 Seconds"
    },
    {
      "@type": "ListItem",
      "position": 6,
      "url": "https://techguypeter.com/en/blog/ai-in-enterprise-software/",
      "name": "AI in Enterprise Software — What It Means for African Businesses"
    },
    {
      "@type": "ListItem",
      "position": 7,
      "url": "https://techguypeter.com/en/blog/business-must-go-digital/",
      "name": "Why Your Business Must Go Digital — and Where to Start"
    },
    {
      "@type": "ListItem",
      "position": 8,
      "url": "https://techguypeter.com/en/blog/east-african-websites-need-french-version/",
      "name": "Why East African Websites Need a French Version"
    },
    {
      "@type": "ListItem",
      "position": 9,
      "url": "https://techguypeter.com/en/blog/how-to-create-apps-people-love/",
      "name": "How to Create Apps That People Actually Use"
    },
    {
      "@type": "ListItem",
      "position": 10,
      "url": "https://techguypeter.com/en/blog/why-small-businesses-need-written-business-plan/",
      "name": "Why Every Small Business Needs a Written Business Plan"
    },
    {
      "@type": "ListItem",
      "position": 11,
      "url": "https://techguypeter.com/en/blog/bankable-agricultural-business-plans-coffee-fish-goats-uganda/",
      "name": "Bankable Business Plans for Ugandan Agriculture"
    },
    {
      "@type": "ListItem",
      "position": 12,
      "url": "https://techguypeter.com/en/blog/uganda-copyright-chip-music-law/",
      "name": "Uganda Copyright Law and the Digital Economy"
    }
  ]
};
```

Add new articles to this list as they are published (Phase 7 articles + Phase 10 onwards).

---

### Schema 3 — ItemList for the portfolio page

**File:** `src/pages/en/portfolio.astro`

```javascript
const portfolioListSchema = {
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": "Software Development Portfolio — Peter Bamuhigire",
  "description": "Custom software, ERP systems, and web applications developed for organisations across Uganda, East Africa, and internationally.",
  "url": "https://techguypeter.com/en/portfolio/",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Maduuka — Business Management Platform",
      "url": "https://techguypeter.com/en/portfolio/",
      "description": "Multi-tenant SaaS business management platform for African SMEs. POS, inventory, accounting, and payroll."
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Aqar — Property Management Platform",
      "url": "https://techguypeter.com/en/portfolio/",
      "description": "Property management system for Ugandan and East African landlords. Tenant management, rent tracking, maintenance."
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Longhorn ERP — Enterprise Resource Planning",
      "url": "https://techguypeter.com/en/portfolio/",
      "description": "ERP system for pharmaceutical distribution and multi-country operations. Deployed across West Africa."
    },
    {
      "@type": "ListItem",
      "position": 4,
      "name": "Medic8 — Healthcare Management",
      "url": "https://techguypeter.com/en/portfolio/",
      "description": "Healthcare management system for East African clinics and hospitals."
    },
    {
      "@type": "ListItem",
      "position": 5,
      "name": "Academia Pro — Education Management",
      "url": "https://techguypeter.com/en/portfolio/",
      "description": "School and education management platform for East African institutions."
    }
  ]
};
```

---

### Schema 4 — SiteLinksSearchBox (for branded searches)

**File:** `src/layouts/BaseLayout.astro` — add to the existing schema blocks

```javascript
const siteLinksSearchBoxSchema = {
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "Peter Bamuhigire — ICT Consulting & Software Development",
  "url": "https://techguypeter.com",
  "potentialAction": {
    "@type": "SearchAction",
    "target": {
      "@type": "EntryPoint",
      "urlTemplate": "https://techguypeter.com/en/blog/?q={search_term_string}"
    },
    "query-input": "required name=search_term_string"
  }
};
```

**Note:** This schema works only if the blog page has a functional search field. If the blog does not have search functionality, omit this schema — Google penalises `SearchAction` schema on sites without a working search.

If the blog search form is added (it is not currently present but is a reasonable future addition), add a basic Alpine.js search filter to the blog index page that filters articles client-side by title keyword.

---

## Implementation Summary

| Schema | Page | Mechanism |
|--------|------|-----------|
| `HowTo` | `choose-it-consultant.astro`, `evaluate-it-consultants-uganda.astro` | Second `<script type="application/ld+json">` block |
| `ItemList` (blog) | `blog.astro` | `<script type="application/ld+json">` |
| `ItemList` (portfolio) | `portfolio.astro` | `<script type="application/ld+json">` |
| `WebSite` / SearchBox | `BaseLayout.astro` | Global schema block |

## Acceptance Criteria

- [ ] `HowTo` schema added to `choose-it-consultant.astro` with all 6 steps
- [ ] `HowTo` schema added to `evaluate-it-consultants-uganda.astro` (Phase 7) on creation
- [ ] `ItemList` schema added to `blog.astro` with all 12 current articles listed
- [ ] `ItemList` schema added to `portfolio.astro` with all 5 flagship products
- [ ] `WebSite`/SearchBox schema added to BaseLayout (only if blog search is functional)
- [ ] All new schemas validated with Google Rich Results Test — no errors
- [ ] `ItemList` on blog.astro updated when new Phase 7 articles are published
- [ ] `npm run build` passes with no errors

## Effort

**S** — 2 hours
