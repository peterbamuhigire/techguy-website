# 05 — Geo Schema and hreflang: ProfessionalService JSON-LD Per Page + hreflang Corrections

## Skills Applied
- `seo` — `references/seo-reference.md` (Structured Data, hreflang)
- `i18n` — `references/i18n-patterns.md` (hreflang implementation)

## Current State

**File:** `src/layouts/BaseLayout.astro`

Current hreflang at lines 141-143:
```html
<link rel="alternate" hreflang={lang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}/${lang}${currentPath || '/'}`} />
<link rel="alternate" hreflang={altLang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}${altUrl}`} />
<link rel="alternate" hreflang="x-default" href={`${siteUrl}/en${currentPath || '/'}`} />
```

**Problem 1:** `hreflang="fr-FR"` is wrong. The site targets Francophone Africa broadly — not France specifically. The correct tag is `hreflang="fr"` (language only, no country code). This was identified in Phase 1, file 02. Phase 1 fixes this in `BaseLayout.astro`. This file deals with the geo page-specific schema, not the BaseLayout fix.

**Problem 2:** The ProfessionalService schema in `BaseLayout.astro` uses a single `areaServed` list for all pages. The geo pages need page-specific `areaServed` declarations to give Google precise geographic signals.

**Problem 3:** The geo pages (new in Phase 5) need their own `hreflang` pairs pointing to correct EN ↔ FR equivalents, since the automatically generated hreflang from `BaseLayout.astro` will point to the wrong page (there is no exact mirror of `/en/it-consulting-uganda/` in FR, for example).

## Target State

Each of the nine geo pages has:
1. A page-specific `ProfessionalService` JSON-LD schema injected via `<script type="application/ld+json">`
2. Correct `hreflang` alternate links pointing to the correct language equivalent (not the wrong mirror)

## Step-by-Step Instructions

### Step 1 — BaseLayout hreflang fix (if not already done in Phase 1)

**File:** `src/layouts/BaseLayout.astro` — line 142

If Phase 1, file 02 has not been implemented yet, change:
```html
<link rel="alternate" hreflang={lang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}/${lang}${currentPath || '/'}`} />
<link rel="alternate" hreflang={altLang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}${altUrl}`} />
```

To:
```html
<link rel="alternate" hreflang={lang === 'en' ? 'en' : 'fr'} href={`${siteUrl}/${lang}${currentPath || '/'}`} />
<link rel="alternate" hreflang={altLang === 'en' ? 'en' : 'fr'} href={`${siteUrl}${altUrl}`} />
```

This is a prerequisite for all hreflang to function correctly.

### Step 2 — Pattern for page-specific schema injection

In each geo page Astro file, add the page-specific schema in the frontmatter and inject it via a `<script>` tag in the page body. The BaseLayout already injects the global ProfessionalService schema — the page-level schema is additive (Google handles multiple JSON-LD blocks per page correctly).

**Pattern (add to every geo page frontmatter):**
```astro
---
// ... other imports and props ...

const pageSchema = {
  "@context": "https://schema.org",
  "@type": "Service",
  // ... page-specific fields ...
};
---

<!-- In the page body, before </BaseLayout> -->
<script type="application/ld+json" set:html={JSON.stringify(pageSchema)} />
```

### Step 3 — Schema for each Uganda page

**`/en/it-consulting-uganda/`:**
```javascript
const pageSchema = {
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "ICT Consulting Uganda",
  "url": "https://techguypeter.com/en/it-consulting-uganda/",
  "description": "Independent ICT consulting in Kampala, Uganda. Technology strategy, ERP implementation, systems audit, and ICT governance for Ugandan organisations.",
  "provider": {
    "@type": "Person",
    "name": "Peter Bamuhigire",
    "url": "https://techguypeter.com/en/about/"
  },
  "areaServed": [
    {
      "@type": "City",
      "name": "Kampala",
      "containedInPlace": { "@type": "Country", "name": "Uganda" }
    },
    {
      "@type": "City",
      "name": "Entebbe",
      "containedInPlace": { "@type": "Country", "name": "Uganda" }
    },
    {
      "@type": "Country",
      "name": "Uganda"
    }
  ],
  "serviceType": "ICT Consulting",
  "hasOfferCatalog": {
    "@type": "OfferCatalog",
    "name": "ICT Consulting Services Uganda",
    "itemListElement": [
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "ICT Strategy Development" } },
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "Systems Audit" } },
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "ERP Implementation" } },
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "ICT Policy and Governance" } }
    ]
  }
};
```

**`/en/software-development-uganda/`:**
```javascript
const pageSchema = {
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "Software Development Uganda",
  "url": "https://techguypeter.com/en/software-development-uganda/",
  "description": "Custom software development in Kampala, Uganda. ERP systems, web applications, mobile apps, and SaaS platforms built for Ugandan business environments.",
  "provider": {
    "@type": "Person",
    "name": "Peter Bamuhigire",
    "url": "https://techguypeter.com/en/about/"
  },
  "areaServed": [
    {
      "@type": "City",
      "name": "Kampala",
      "containedInPlace": { "@type": "Country", "name": "Uganda" }
    },
    { "@type": "Country", "name": "Uganda" }
  ],
  "serviceType": "Software Development",
  "hasOfferCatalog": {
    "@type": "OfferCatalog",
    "name": "Software Development Services Uganda",
    "itemListElement": [
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "Custom Software Development" } },
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "ERP Systems" } },
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "Mobile App Development" } },
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "Web Application Development" } }
    ]
  }
};
```

**`/en/website-development-uganda/`:**
```javascript
const pageSchema = {
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "Website Development Uganda",
  "url": "https://techguypeter.com/en/website-development-uganda/",
  "description": "Professional website design and development in Uganda. Fast-loading, mobile-first websites for Ugandan businesses. Based in Kampala.",
  "provider": {
    "@type": "Person",
    "name": "Peter Bamuhigire",
    "url": "https://techguypeter.com/en/about/"
  },
  "areaServed": [
    {
      "@type": "City",
      "name": "Kampala",
      "containedInPlace": { "@type": "Country", "name": "Uganda" }
    },
    { "@type": "Country", "name": "Uganda" }
  ],
  "serviceType": "Website Design and Development",
  "hasOfferCatalog": {
    "@type": "OfferCatalog",
    "name": "Website Development Services Uganda",
    "itemListElement": [
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "Website Design" } },
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "Web Development" } },
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "SEO" } },
      { "@type": "Offer", "itemOffered": { "@type": "Service", "name": "Google Business Profile Optimisation" } }
    ]
  }
};
```

### Step 4 — Schema for each East Africa page

**`/en/it-consulting-east-africa/`:**
```javascript
const pageSchema = {
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "ICT Consulting East Africa",
  "url": "https://techguypeter.com/en/it-consulting-east-africa/",
  "description": "Independent ICT consulting across East Africa. Technology strategy, ERP implementation, and systems advisory for organisations in Uganda, Kenya, Tanzania, Rwanda, and Ethiopia.",
  "provider": {
    "@type": "Person",
    "name": "Peter Bamuhigire",
    "url": "https://techguypeter.com/en/about/"
  },
  "areaServed": [
    { "@type": "Country", "name": "Uganda" },
    { "@type": "Country", "name": "Kenya" },
    { "@type": "Country", "name": "Tanzania" },
    { "@type": "Country", "name": "Rwanda" },
    { "@type": "Country", "name": "Ethiopia" },
    { "@type": "Country", "name": "Burundi" },
    { "@type": "Country", "name": "South Sudan" }
  ],
  "serviceType": "ICT Consulting"
};
```

Apply equivalent East Africa schema to `/en/software-development-east-africa/` and `/en/website-development-east-africa/` — same `areaServed` list, adjusted `name`, `url`, `description`, and `serviceType`.

### Step 5 — Schema for each Francophone Africa FR page

**`/fr/consultant-informatique-afrique/`:**
```javascript
const pageSchema = {
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "Consultant Informatique Afrique francophone — Peter Bamuhigire",
  "url": "https://techguypeter.com/fr/consultant-informatique-afrique/",
  "description": "Conseil ICT indépendant pour les entreprises d'Afrique francophone. Stratégie technologique, ERP, audit des systèmes.",
  "provider": {
    "@type": "Person",
    "name": "Peter Bamuhigire",
    "url": "https://techguypeter.com/fr/about/"
  },
  "areaServed": [
    { "@type": "Country", "name": "Sénégal" },
    { "@type": "Country", "name": "Côte d'Ivoire" },
    { "@type": "Country", "name": "Cameroun" },
    { "@type": "Country", "name": "République Démocratique du Congo" },
    { "@type": "Country", "name": "Mali" },
    { "@type": "Country", "name": "Togo" },
    { "@type": "Country", "name": "Bénin" },
    { "@type": "Country", "name": "Burkina Faso" },
    { "@type": "Country", "name": "Sierra Leone" },
    { "@type": "Country", "name": "Guinée" },
    { "@type": "Country", "name": "Rwanda" }
  ],
  "serviceType": "Conseil ICT",
  "inLanguage": "fr"
};
```

Apply equivalent Francophone Africa schema to `/fr/developpement-logiciel-afrique/` and `/fr/developpement-web-afrique/` — same `areaServed` list, adjusted `name`, `url`, `description`, and `serviceType`.

### Step 6 — hreflang for geo pages without exact mirrors

The Uganda and East Africa pages have no exact French equivalents, and the French geo pages have no exact English mirrors at the same URL path. Handle this as follows:

**Uganda EN pages → FR alternate:**
Point to the French homepage as the fallback alternate:
```html
<link rel="alternate" hreflang="fr" href="https://techguypeter.com/fr/" />
```

This is acceptable: pointing to the closest relevant FR page (the homepage) is better than pointing to a non-existent URL.

**East Africa EN pages → FR alternate:**
Point to the closest FR geo page:
- `/en/it-consulting-east-africa/` → `hreflang="fr"` → `/fr/consultant-informatique-afrique/`
- `/en/software-development-east-africa/` → `hreflang="fr"` → `/fr/developpement-logiciel-afrique/`
- `/en/website-development-east-africa/` → `hreflang="fr"` → `/fr/developpement-web-afrique/`

**FR geo pages → EN alternate:**
- `/fr/consultant-informatique-afrique/` → `hreflang="en"` → `/en/it-consulting-east-africa/`
- `/fr/developpement-logiciel-afrique/` → `hreflang="en"` → `/en/software-development-east-africa/`
- `/fr/developpement-web-afrique/` → `hreflang="en"` → `/en/website-development-east-africa/`

**Implementation:** Pass custom `hreflang` overrides as props to `BaseLayout.astro`. Add an optional `hreflangOverrides` prop:

**File:** `src/layouts/BaseLayout.astro` — frontmatter:
```typescript
interface Props {
  // ... existing props ...
  hreflangOverrides?: { lang: string; href: string }[];
}

const { hreflangOverrides, ...rest } = Astro.props;
```

In the `<head>`:
```astro
{hreflangOverrides ? (
  hreflangOverrides.map(h => (
    <link rel="alternate" hreflang={h.lang} href={h.href} />
  ))
) : (
  // ... existing hreflang logic ...
)}
<link rel="alternate" hreflang="x-default" href={`${siteUrl}/en${currentPath || '/'}`} />
```

Then in each geo page that needs non-standard hreflang:
```astro
<BaseLayout
  hreflangOverrides={[
    { lang: 'en', href: 'https://techguypeter.com/en/it-consulting-east-africa/' },
    { lang: 'fr', href: 'https://techguypeter.com/fr/consultant-informatique-afrique/' }
  ]}
  ...
>
```

### Step 7 — Validate schema with Google Rich Results Test

After implementation, validate each geo page's JSON-LD:
1. Go to [https://search.google.com/test/rich-results](https://search.google.com/test/rich-results)
2. Enter each geo page URL (after deployment)
3. Confirm: no errors, `Service` type detected, `areaServed` populated

Also validate hreflang using [https://www.hreflang.org/](https://www.hreflang.org/) or Google Search Console's International Targeting report.

## Complete Schema Coverage Summary

| Page | Schema type | areaServed scope |
|------|-------------|-----------------|
| `/en/it-consulting-uganda/` | Service | Uganda (Kampala, Entebbe, Country) |
| `/en/software-development-uganda/` | Service | Uganda (Kampala, Country) |
| `/en/website-development-uganda/` | Service | Uganda (Kampala, Country) |
| `/en/it-consulting-east-africa/` | Service | 7 EA countries |
| `/en/software-development-east-africa/` | Service | 7 EA countries |
| `/en/website-development-east-africa/` | Service | 7 EA countries |
| `/fr/consultant-informatique-afrique/` | Service | 11 Francophone African countries |
| `/fr/developpement-logiciel-afrique/` | Service | 11 Francophone African countries |
| `/fr/developpement-web-afrique/` | Service | 11 Francophone African countries |

## Acceptance Criteria

- [ ] All nine geo pages have `Service` JSON-LD schema injected via `<script type="application/ld+json">`
- [ ] Uganda pages have `areaServed` scoped to Uganda with Kampala as a named city
- [ ] East Africa pages have `areaServed` listing Uganda, Kenya, Tanzania, Rwanda, Ethiopia, Burundi, South Sudan
- [ ] FR pages have `areaServed` listing the 11 Francophone African countries
- [ ] `BaseLayout.astro` has `hreflangOverrides` prop to allow page-specific hreflang
- [ ] FR geo pages have `hreflang="en"` pointing to the correct EN East Africa equivalent
- [ ] East Africa EN pages have `hreflang="fr"` pointing to the correct FR geo page
- [ ] `hreflang="fr-FR"` does not appear anywhere on the site (changed to `hreflang="fr"`)
- [ ] Schema validated with Google Rich Results Test — no errors
- [ ] `npm run build` passes with no errors

## Effort

**S** — 2 hours
