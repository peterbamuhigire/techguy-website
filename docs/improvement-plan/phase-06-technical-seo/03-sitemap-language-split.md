# 03 — Sitemap Language Split: Fix `fr-FR` Locale in astro.config.mjs

## Skills Applied
- `seo` — `references/seo-reference.md` (Sitemap, hreflang, i18n)
- `i18n` — `references/i18n-patterns.md`

## Current State

**File:** `astro.config.mjs`

Current sitemap configuration:
```javascript
sitemap({
  filter: (page) => page !== 'https://techguypeter.com/',
  i18n: {
    defaultLocale: 'en',
    locales: {
      en: 'en-GB',
      fr: 'fr-FR',
    },
  },
}),
```

**Problem 1:** `fr: 'fr-FR'` maps the French locale to France-specific hreflang. The correct value for a site targeting Francophone Africa broadly is `fr: 'fr'` — language only, no country code.

**Problem 2:** The sitemap filter `(page) => page !== 'https://techguypeter.com/'` correctly removes the root redirect page but may not exclude other utility pages (privacy policy, form intake pages) that should be noindexed.

**Problem 3:** The Astro i18n config also uses `'fr-FR'` in the locales section — this must match the corrected sitemap config.

**File:** `src/layouts/BaseLayout.astro` — line 141:
```html
<link rel="alternate" hreflang={lang === 'en' ? 'en-GB' : 'fr-FR'} href={...} />
```

This must also be changed to `'fr'`.

## Target State

All hreflang and sitemap locale references for French use `'fr'` (not `'fr-FR'`). Sitemap excludes non-indexable utility pages. Sitemap output verified.

## Why This Matters

`hreflang="fr-FR"` tells Google the page is targeted at French-speaking users in France specifically. The site targets Francophone Africa — Côte d'Ivoire, Sénégal, RDC, Cameroun, Mali, Togo, Bénin, and others. Using `fr-FR` means French African users are not served the correct language-targeted content by Google. Using `hreflang="fr"` targets all French-speaking users regardless of country — which is correct for this site.

## Step-by-Step Instructions

### Step 1 — Fix `astro.config.mjs`

**File:** `astro.config.mjs`

Find:
```javascript
sitemap({
  filter: (page) => page !== 'https://techguypeter.com/',
  i18n: {
    defaultLocale: 'en',
    locales: {
      en: 'en-GB',
      fr: 'fr-FR',
    },
  },
}),
```

Replace with:
```javascript
sitemap({
  filter: (page) => {
    // Exclude root redirect
    if (page === 'https://techguypeter.com/') return false;
    // Exclude utility pages that should not be indexed
    if (page.includes('/privacy-policy')) return false;
    if (page.includes('/business-plan-intake')) return false;
    if (page.includes('/social-media-intake')) return false;
    return true;
  },
  i18n: {
    defaultLocale: 'en',
    locales: {
      en: 'en',
      fr: 'fr',
    },
  },
}),
```

**Note on `en-GB` vs `en`:** The sitemap `i18n.locales` value controls what appears in the sitemap's `xhtml:link` hreflang attributes. Using `en` instead of `en-GB` is acceptable — the Astro sitemap plugin will output `hreflang="en"` which targets all English speakers globally. If targeting specifically British-spelling English is important (it is lower priority), you can keep `en: 'en-GB'` here but must be consistent with BaseLayout.

For this site: use `en: 'en'` and `fr: 'fr'` in both the sitemap config and BaseLayout for consistency. Do not mix `en-GB` in one place and `en` in another — that creates conflicting signals.

### Step 2 — Fix BaseLayout.astro hreflang

**File:** `src/layouts/BaseLayout.astro` — lines 141-143

Find:
```html
<link rel="alternate" hreflang={lang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}/${lang}${currentPath || '/'}`} />
<link rel="alternate" hreflang={altLang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}${altUrl}`} />
<link rel="alternate" hreflang="x-default" href={`${siteUrl}/en${currentPath || '/'}`} />
```

Replace with:
```html
<link rel="alternate" hreflang={lang === 'en' ? 'en' : 'fr'} href={`${siteUrl}/${lang}${currentPath || '/'}`} />
<link rel="alternate" hreflang={altLang === 'en' ? 'en' : 'fr'} href={`${siteUrl}${altUrl}`} />
<link rel="alternate" hreflang="x-default" href={`${siteUrl}/en${currentPath || '/'}`} />
```

**Note:** This change was also specified in Phase 1, file 02. If Phase 1 has already been implemented, this step is a verification check only.

### Step 3 — Verify sitemap output

After running `npm run build`, check the sitemap output:

```bash
npm run build
cat dist/sitemap-0.xml | head -80
```

Confirm:
- `hreflang="fr"` appears (not `fr-FR`)
- `hreflang="en"` appears (not `en-GB` unless that was kept intentionally)
- Utility pages (`/privacy-policy`, `/business-plan-intake`, `/social-media-intake`) do NOT appear in the sitemap
- All 9 new geo pages appear in the sitemap after Phase 5 is complete

### Step 4 — Check sitemap in Google Search Console

After deployment:
1. Go to Google Search Console → Sitemaps
2. Submit: `https://techguypeter.com/sitemap-index.xml`
3. Confirm sitemap is fetched without errors
4. Check "Coverage" report — confirm no "Submitted URL not found" errors

### Step 5 — Add noindex to utility pages

**File:** `src/pages/en/privacy-policy.astro`

If not already present, add `noindex` to the BaseLayout props:
```astro
<BaseLayout
  title="Privacy Policy — Peter Bamuhigire"
  description="..."
  lang={lang}
  page="privacy-policy"
  noindex={true}
>
```

**File:** `src/pages/en/business-plan-intake.astro` — add `noindex={true}`
**File:** `src/pages/en/social-media-intake.astro` — add `noindex={true}`

This requires that `BaseLayout.astro` supports a `noindex` prop. Check if it exists:

**File:** `src/layouts/BaseLayout.astro` — frontmatter:
```typescript
interface Props {
  // ... existing props ...
  noindex?: boolean;
}
const { noindex = false, ...rest } = Astro.props;
```

In the `<head>`:
```html
{noindex && <meta name="robots" content="noindex, nofollow" />}
```

If `BaseLayout.astro` already has `noindex` support from Phase 1, skip the component change and only add the prop to the three pages.

## Sitemap Coverage Verification Checklist

After `npm run build`, verify these URLs appear in `dist/sitemap-0.xml`:

**Must appear:**
- `https://techguypeter.com/en/`
- `https://techguypeter.com/fr/`
- `https://techguypeter.com/en/about/`
- `https://techguypeter.com/fr/about/`
- `https://techguypeter.com/en/services/`
- `https://techguypeter.com/en/contact/`
- `https://techguypeter.com/en/portfolio/`
- `https://techguypeter.com/en/blog/` (+ all 12 articles)
- All 9 new geo pages (after Phase 5)

**Must NOT appear:**
- `https://techguypeter.com/` (root redirect)
- `https://techguypeter.com/en/privacy-policy/`
- `https://techguypeter.com/en/business-plan-intake/`
- `https://techguypeter.com/en/social-media-intake/`

## Acceptance Criteria

- [ ] `astro.config.mjs` sitemap config uses `fr: 'fr'` (not `fr-FR`)
- [ ] `astro.config.mjs` sitemap filter excludes privacy policy and intake pages
- [ ] `BaseLayout.astro` hreflang tags use `'fr'` (not `'fr-FR'`)
- [ ] `npm run build` produces `dist/sitemap-0.xml` with correct `hreflang="fr"` tags
- [ ] Utility pages are excluded from the sitemap
- [ ] `noindex` meta tag added to utility pages
- [ ] Sitemap submitted to Google Search Console and returns no errors
- [ ] `npm run build` passes with no errors

## Effort

**S** — 1 hour
