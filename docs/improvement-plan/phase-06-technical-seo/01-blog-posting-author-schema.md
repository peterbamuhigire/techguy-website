# 01 — BlogPosting Author Schema: E-E-A-T Signals for All 12 Blog Articles

## Skills Applied
- `seo` — `references/seo-reference.md` (Structured Data, E-E-A-T)

## Current State

**Location:** `src/pages/en/blog/*.astro`

All 12 blog articles already have `BlogPosting` JSON-LD schema. The existing schema includes:
- `@type: BlogPosting`
- `headline`
- `author` (name + URL only — no `@type: Person` with full detail)
- `datePublished` / `dateModified`
- `publisher` (Organisation, but missing `logo`)
- `description`
- `image`
- `inLanguage: en-GB` (correct)
- `mainEntityOfPage`

Missing from all 12 articles:
- `author.sameAs` — links to LinkedIn, GitHub — E-E-A-T signal
- `author.jobTitle` — "ICT Consultant & Software Developer"
- `author.knowsAbout` — array of topic expertise
- `publisher.logo` — required by Google for AMP and recommended for rich results
- `wordCount` — factual signal
- `articleSection` — category
- `keywords` — primary keyword targeting signal

## Target State

A standardised `BlogPosting` schema template applied consistently to all 12 articles. Author schema upgraded to include E-E-A-T signals.

## Why This Matters

Google's E-E-A-T (Experience, Expertise, Authoritativeness, Trustworthiness) guidelines require that author credentials be demonstrable — not just asserted. An author schema with `sameAs` linking to a real LinkedIn profile, a `jobTitle`, and `knowsAbout` topics tells Google the author has verifiable credentials in the subject matter of the article. This improves ranking for YMYL-adjacent content (technology advice, business consulting, software procurement) and signals trust to AI search systems that synthesise answers from authoritative sources.

## Step-by-Step Instructions

### Step 1 — Build the full author object (used in all articles)

This author object should be defined in a shared utility file so it does not have to be duplicated in each article:

**File to create:** `src/utils/author-schema.ts`

```typescript
export const authorSchema = {
  "@type": "Person",
  "name": "Peter Bamuhigire",
  "url": "https://techguypeter.com/en/about/",
  "image": "https://techguypeter.com/images/peter-headshot.jpg",
  "jobTitle": "ICT Consultant & Software Developer",
  "worksFor": {
    "@type": "Organization",
    "name": "Chwezi Core Systems",
    "url": "https://techguypeter.com"
  },
  "knowsAbout": [
    "ICT Consulting",
    "Software Development",
    "ERP Systems",
    "Website Development",
    "Business Technology Strategy",
    "East African Technology Markets",
    "Francophone African Business",
    "Property Management Technology",
    "Cross-border Technology Implementation"
  ],
  "sameAs": [
    "https://linkedin.com/in/peterbamuhigire",
    "https://github.com/peterbamuhigire",
    "https://twitter.com/peterbamu"
  ]
};

export const publisherSchema = {
  "@type": "Organization",
  "name": "Peter Bamuhigire — ICT Consulting & Software Development",
  "url": "https://techguypeter.com",
  "logo": {
    "@type": "ImageObject",
    "url": "https://techguypeter.com/og-image.jpg",
    "width": 1200,
    "height": 630
  }
};
```

### Step 2 — Build the full BlogPosting schema template

**Template to apply to every blog article:**

```typescript
import { authorSchema, publisherSchema } from '@/utils/author-schema';

const articleSchema = {
  "@context": "https://schema.org",
  "@type": "BlogPosting",
  "headline": title,
  "name": title,
  "description": description,
  "image": `${siteUrl}${heroImg.src}`,
  "author": authorSchema,
  "publisher": publisherSchema,
  "datePublished": date,
  "dateModified": date,
  "inLanguage": lang === 'en' ? "en-GB" : "fr",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": `${siteUrl}/${lang}/blog/${slug}/`
  },
  "articleSection": category,
  "keywords": primaryKeywords,   // define per-article — see Step 3
  "wordCount": wordCount,         // define per-article — see Step 3
  "url": `${siteUrl}/${lang}/blog/${slug}/`
};
```

### Step 3 — Per-article keyword and word count assignments

Add these variables to each article's frontmatter:

| Article slug | `primaryKeywords` | Estimated `wordCount` |
|---|---|---|
| `choose-it-consultant` | `["IT consultant Uganda", "ICT consultant East Africa", "choose IT consultant", "technology consultant"]` | 2200 |
| `custom-software-africa` | `["custom software Africa", "software development Africa", "bespoke software Uganda"]` | 1800 |
| `erp-implementation-mistakes` | `["ERP implementation", "ERP mistakes Africa", "ERP Uganda", "enterprise software Africa"]` | 2000 |
| `website-costs-uganda` | `["website cost Uganda", "website price Uganda", "web design Uganda cost"]` | 1600 |
| `why-visitors-leave-website-3-seconds` | `["website bounce rate", "website speed Uganda", "slow website Africa"]` | 1400 |
| `business-must-go-digital` | `["digital transformation Uganda", "business digitisation Africa", "ICT strategy Uganda"]` | 1500 |
| `why-small-businesses-need-written-business-plan` | `["business plan Uganda", "business planning Africa", "SME Uganda business plan"]` | 1800 |
| `how-to-create-apps-people-love` | `["app development Africa", "mobile app Uganda", "user-friendly apps Africa"]` | 2000 |
| `east-african-websites-need-french-version` | `["bilingual website Africa", "French website Africa", "French English website"]` | 1600 |
| `bankable-agricultural-business-plans-coffee-fish-goats-uganda` | `["agricultural business plan Uganda", "farm business plan Uganda", "agribusiness Uganda"]` | 2200 |
| `uganda-copyright-chip-music-law` | `["Uganda copyright law", "IP law Uganda", "music copyright Uganda"]` | 1800 |
| `ai-in-enterprise-software` | `["AI enterprise software Africa", "AI consulting Africa", "artificial intelligence Uganda"]` | 2000 |

### Step 4 — Apply the updated schema to all 12 EN articles

**For each file in `src/pages/en/blog/`:**

1. Add the import at the top of the frontmatter:
```astro
import { authorSchema, publisherSchema } from '@/utils/author-schema';
```

2. Replace the existing `articleSchema` const with the template from Step 2, adding `primaryKeywords` and `wordCount` from the Step 3 table.

3. Confirm the `<script type="application/ld+json" set:html={JSON.stringify(articleSchema)} />` tag is present in the page body (it already exists in the checked article — confirm for all 12).

### Step 5 — Apply equivalent schema to FR blog articles

**Location:** `src/pages/fr/blog/*.astro` (if FR blog articles exist)

If FR blog articles exist, apply the same author schema template. Change `inLanguage` to `"fr"`. The `authorSchema` is shared — it uses the same LinkedIn, GitHub, and profile URL, which is correct (the author is the same person).

If FR blog articles do not yet exist, document this for Phase 7.

### Step 6 — Add `<link rel="author">` to BaseLayout

**File:** `src/layouts/BaseLayout.astro` — find the `<head>` section.

Add after the existing meta tags:
```html
<link rel="author" href="https://techguypeter.com/en/about/" />
```

This is a simple HTML signal that tells crawlers who the site author is — supported by Google and used by some LLMs as an authorship signal.

## Acceptance Criteria

- [ ] `src/utils/author-schema.ts` created with full `authorSchema` and `publisherSchema` exports
- [ ] All 12 EN blog articles import and use the shared `authorSchema`
- [ ] All 12 EN blog articles have `articleSection` (category) in their schema
- [ ] All 12 EN blog articles have `keywords` array in their schema
- [ ] All 12 EN blog articles have `wordCount` (estimated) in their schema
- [ ] `publisher.logo` appears in all 12 articles' `BlogPosting` schema
- [ ] `author.sameAs` includes LinkedIn and GitHub URLs in all 12 articles
- [ ] `<link rel="author">` added to BaseLayout head
- [ ] `npm run build` passes with no errors

## Effort

**S** — 2 hours
