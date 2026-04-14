# 04 — Internal Linking Architecture: 30+ Link Pairs Across the Geo Page Network

## Skills Applied
- `seo` — `references/seo-reference.md` (Internal linking, PageRank flow, topical authority)
- `page-builder` — `references/page-patterns.md` (Cross-link component)

## Current State

The current site has adequate internal links between main navigation pages but no structured internal linking architecture connecting the geo pages (which do not yet exist) to each other, to the homepage, to existing service pages, and to blog articles.

From the geo-seo-strategy.md: "Every Uganda page links to the corresponding East Africa page. Every East Africa page links back to the Uganda page as the home base. Every FR page links to the EN equivalent via hreflang AND a visible language-switch CTA."

## Target State

A fully specified internal linking map for the nine new geo pages plus updates to existing pages to link into the new geo architecture.

## Why This Matters

Internal links serve two purposes: they tell Google which pages are related to each other and what the hierarchy of authority is (PageRank flow), and they tell human visitors where to go next. A geo page with no internal links coming in from related pages will rank more slowly and convert fewer visitors than one that sits inside a properly structured link network.

## The Full Link Map

### Tier 1 — Links FROM the homepage

**File:** `src/pages/en/index.astro`

Add a "Serving clients across Africa" section below the services section (or integrate into the existing geographical reach section). This section should link to all six EN geo pages:

```html
<section class="py-12 bg-navy-900">
  <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
    <p class="text-center text-navy-400 text-xs uppercase tracking-widest mb-6">Dedicated service pages by location</p>
    <div class="grid grid-cols-2 md:grid-cols-3 gap-4 text-center">
      <a href="/en/it-consulting-uganda/" class="text-navy-300 hover:text-gold-400 text-sm transition-colors">IT Consulting Uganda</a>
      <a href="/en/software-development-uganda/" class="text-navy-300 hover:text-gold-400 text-sm transition-colors">Software Development Uganda</a>
      <a href="/en/website-development-uganda/" class="text-navy-300 hover:text-gold-400 text-sm transition-colors">Website Development Uganda</a>
      <a href="/en/it-consulting-east-africa/" class="text-navy-300 hover:text-gold-400 text-sm transition-colors">IT Consulting East Africa</a>
      <a href="/en/software-development-east-africa/" class="text-navy-300 hover:text-gold-400 text-sm transition-colors">Software Development East Africa</a>
      <a href="/en/website-development-east-africa/" class="text-navy-300 hover:text-gold-400 text-sm transition-colors">Website Development East Africa</a>
    </div>
  </div>
</section>
```

**File:** `src/pages/fr/index.astro`

Equivalent FR block linking to all three FR geo pages:
```html
<section class="py-12 bg-navy-900">
  <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
    <p class="text-center text-navy-400 text-xs uppercase tracking-widest mb-6">Pages de service par région</p>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 text-center">
      <a href="/fr/consultant-informatique-afrique/" class="text-navy-300 hover:text-gold-400 text-sm transition-colors">Consultant informatique Afrique</a>
      <a href="/fr/developpement-logiciel-afrique/" class="text-navy-300 hover:text-gold-400 text-sm transition-colors">Développement logiciel Afrique</a>
      <a href="/fr/developpement-web-afrique/" class="text-navy-300 hover:text-gold-400 text-sm transition-colors">Développement web Afrique</a>
    </div>
  </div>
</section>
```

### Tier 2 — Links FROM existing service pages

**File:** `src/pages/en/services.astro`

Add a "Service by location" contextual panel at the bottom of the ICT Consulting section:
```html
<div class="mt-6 pt-6 border-t border-navy-100">
  <p class="text-xs font-semibold text-navy-500 uppercase tracking-widest mb-3">ICT consulting by location</p>
  <div class="flex flex-wrap gap-3">
    <a href="/en/it-consulting-uganda/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">→ Uganda</a>
    <a href="/en/it-consulting-east-africa/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">→ East Africa</a>
  </div>
</div>
```

Add equivalent blocks to the Software Development and Website Design sections:

Software Development section:
```html
<div class="mt-6 pt-6 border-t border-navy-100">
  <p class="text-xs font-semibold text-navy-500 uppercase tracking-widest mb-3">Software development by location</p>
  <div class="flex flex-wrap gap-3">
    <a href="/en/software-development-uganda/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">→ Uganda</a>
    <a href="/en/software-development-east-africa/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">→ East Africa</a>
  </div>
</div>
```

Website Design section:
```html
<div class="mt-6 pt-6 border-t border-navy-100">
  <p class="text-xs font-semibold text-navy-500 uppercase tracking-widest mb-3">Website development by location</p>
  <div class="flex flex-wrap gap-3">
    <a href="/en/website-development-uganda/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">→ Uganda</a>
    <a href="/en/website-development-east-africa/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">→ East Africa</a>
  </div>
</div>
```

**File:** `src/pages/fr/services.astro`

Add equivalent FR location links to each relevant service section:
```html
<div class="mt-6 pt-6 border-t border-navy-100">
  <p class="text-xs font-semibold text-navy-500 uppercase tracking-widest mb-3">Par région</p>
  <div class="flex flex-wrap gap-3">
    <a href="/fr/consultant-informatique-afrique/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">→ Afrique francophone</a>
  </div>
</div>
```

### Tier 3 — Links BETWEEN geo pages (cross-service linking)

Each Uganda page links to the other two Uganda pages:

**`/en/it-consulting-uganda/`** must include:
```html
<div class="mt-8 border-t border-navy-100 pt-6">
  <p class="text-xs font-semibold text-navy-500 uppercase tracking-widest mb-3">Other services in Uganda</p>
  <div class="flex flex-wrap gap-4">
    <a href="/en/software-development-uganda/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">Software development Uganda →</a>
    <a href="/en/website-development-uganda/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">Website development Uganda →</a>
  </div>
</div>
```

**`/en/software-development-uganda/`** must include:
```html
<div class="mt-8 border-t border-navy-100 pt-6">
  <p class="text-xs font-semibold text-navy-500 uppercase tracking-widest mb-3">Other services in Uganda</p>
  <div class="flex flex-wrap gap-4">
    <a href="/en/it-consulting-uganda/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">IT consulting Uganda →</a>
    <a href="/en/website-development-uganda/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">Website development Uganda →</a>
  </div>
</div>
```

**`/en/website-development-uganda/`** must include:
```html
<div class="mt-8 border-t border-navy-100 pt-6">
  <p class="text-xs font-semibold text-navy-500 uppercase tracking-widest mb-3">Other services in Uganda</p>
  <div class="flex flex-wrap gap-4">
    <a href="/en/it-consulting-uganda/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">IT consulting Uganda →</a>
    <a href="/en/software-development-uganda/" class="text-sm text-gold-600 hover:text-amber-accent font-medium">Software development Uganda →</a>
  </div>
</div>
```

Apply the same pattern for East Africa pages (cross-linking the three EA pages to each other) and for the FR pages (cross-linking the three FR pages to each other).

### Tier 4 — Links FROM blog articles to geo pages

When Phase 7 blog articles are published, each article must link to the most relevant geo page. The assignments are:

| Blog article | Links to |
|---|---|
| "How much does software development cost in Uganda?" | `/en/software-development-uganda/` |
| "Best software developers in Uganda: How to evaluate them" | `/en/software-development-uganda/` |
| "When to hire a website developer vs. build it yourself in Uganda" | `/en/website-development-uganda/` |
| "How to choose an IT consultant in Kampala" | `/en/it-consulting-uganda/` |
| "What a website actually costs in Uganda" | `/en/website-development-uganda/` |
| "Software development rates across East Africa" | `/en/software-development-east-africa/` |
| "ERP implementation in East Africa: What to expect" | `/en/it-consulting-east-africa/` |
| "How to find a reliable IT consultant in East Africa" | `/en/it-consulting-east-africa/` |
| "Combien coûte le développement web en Afrique francophone?" | `/fr/developpement-web-afrique/` |
| "Comment choisir un développeur logiciel en Afrique" | `/fr/developpement-logiciel-afrique/` |
| "Développement sur mesure vs logiciel standard" | `/fr/developpement-logiciel-afrique/` |
| "Quand faire appel à un consultant informatique?" | `/fr/consultant-informatique-afrique/` |

### Tier 5 — Links FROM geo pages to the contact and portfolio pages

Every geo page must include at minimum:
- Link to `/en/contact/` (or `/fr/contact/`) — primary CTA
- Link to `/en/portfolio/` (or `/fr/portfolio/`) — proof link

These are handled by the `CTASection` component and the CaseSnippet component, but confirm both links exist in each completed page.

### Tier 6 — Footer geo links (optional, low priority)

If the site footer includes a "Services" or "Sitemap" link list, consider adding the three Uganda geo pages as a sub-list under the Services footer section. This provides site-wide link equity to the Uganda pages — which are the highest-priority geo pages. East Africa and FR pages can be added later.

```html
<!-- Footer services list — add Uganda geo pages as contextual links -->
<li><a href="/en/it-consulting-uganda/">IT Consulting Uganda</a></li>
<li><a href="/en/software-development-uganda/">Software Development Uganda</a></li>
<li><a href="/en/website-development-uganda/">Website Development Uganda</a></li>
```

## Complete Link Count Audit

| Source page | Destination pages (new geo links) | Count |
|---|---|---|
| EN homepage | 6 EN geo pages | 6 |
| FR homepage | 3 FR geo pages | 3 |
| `/en/services/` | 6 location sub-links | 6 |
| `/fr/services/` | 3 location sub-links | 3 |
| `/en/it-consulting-uganda/` | EA equivalent + 2 other Uganda pages | 3 |
| `/en/software-development-uganda/` | EA equivalent + 2 other Uganda pages | 3 |
| `/en/website-development-uganda/` | EA equivalent + 2 other Uganda pages | 3 |
| `/en/it-consulting-east-africa/` | Uganda equivalent + 2 other EA pages | 3 |
| `/en/software-development-east-africa/` | Uganda equivalent + 2 other EA pages | 3 |
| `/en/website-development-east-africa/` | Uganda equivalent + 2 other EA pages | 3 |
| `/fr/consultant-informatique-afrique/` | EN equivalent + 2 other FR pages | 3 |
| `/fr/developpement-logiciel-afrique/` | EN equivalent + 2 other FR pages | 3 |
| `/fr/developpement-web-afrique/` | EN equivalent + 2 other FR pages | 3 |
| **Total** | | **42 link pairs** |

## Acceptance Criteria

- [ ] Homepage (EN) links to all six EN geo pages
- [ ] Homepage (FR) links to all three FR geo pages
- [ ] `/en/services/` includes location sub-links for ICT Consulting, Software Development, and Website Design sections
- [ ] `/fr/services/` includes location sub-link for all three FR service areas
- [ ] Each Uganda page links to its EA equivalent and to the other two Uganda pages
- [ ] Each East Africa page links to its Uganda equivalent and to the other two EA pages
- [ ] Each FR page links to its EN equivalent and to the other two FR pages
- [ ] All cross-links use descriptive anchor text (not "click here" or "learn more")
- [ ] Blog article link assignments documented for implementation during Phase 7
- [ ] `npm run build` passes with no errors after all link additions

## Effort

**S** — 2 hours (link wiring across all pages)
