# 02 — Fix hreflang to Target Francophone Africa, Not France

## Skills Applied
- `i18n` — hreflang language-region code standards
- `seo-audit` — `references/audit-checklist.md` section 1 (Hreflang)

## Current State

`src/layouts/BaseLayout.astro:141–143`:

```html
<link rel="alternate" hreflang={lang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}/${lang}${currentPath || '/'}`} />
<link rel="alternate" hreflang={altLang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}${altUrl}`} />
<link rel="alternate" hreflang="x-default" href={`${siteUrl}/en${currentPath || '/'}`} />
```

The ternary expression `lang === 'en' ? 'en-GB' : 'fr-FR'` means that when `lang` is `'fr'`, the hreflang value becomes `'fr-FR'`. This tells Google that the French content targets users specifically in **France**.

The MEMORY.md note for this project explicitly states: "FR content/SEO must target all of Francophone Africa, not just East Africa or Uganda. Examples: Côte d'Ivoire, Sénégal, Cameroun, DRC." Using `fr-FR` directly conflicts with this strategic intent.

## Current Score

Internationalisation / multilingual execution: **7.5/10**
Technical SEO: **6.5/10**

## Target State

- `hreflang="fr"` (language-only, no country) is used for all French pages
- `hreflang="en-GB"` remains for English pages (correct — British English targeting East Africa)
- The fix applies to both the self-referencing hreflang and the alternate language hreflang on every page

## Target Score

Internationalisation / multilingual execution: **8.0/10**

## Why This Matters

The `seo-audit` skill's checklist requires: "Use correct language-region codes (en-UG, fr-UG, sw)." More precisely, the guidance states that language-only codes (without a country suffix) should be used when content targets all speakers of a language globally or across multiple countries. `fr-FR` instructs Google to preferentially serve the French content to users in France. The target Francophone African audience (DRC: 109 million French speakers; Sénégal; Côte d'Ivoire; Cameroun; Bénin; Burkina Faso) will receive less favourable treatment. Changing to `hreflang="fr"` removes this geographic restriction and allows Google to serve the French content to any French speaker worldwide — the intended behaviour.

The `seo-audit` checklist also requires: "Every language version must hreflang to all other versions (including itself)." This reciprocal relationship is already satisfied (both `en` and `fr` alternate tags are present on every page). The only change required is the country suffix on the `fr` code.

## Step-by-Step Instructions

### Step 1: Locate the Expression

Open `src/layouts/BaseLayout.astro`. Navigate to approximately line 141 (may vary slightly). Find the block:

```astro
<link rel="alternate" hreflang={lang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}/${lang}${currentPath || '/'}`} />
<link rel="alternate" hreflang={altLang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}${altUrl}`} />
```

### Step 2: Apply the Fix

Change both ternary expressions. The `'fr-FR'` value on the right-hand side of each ternary must become `'fr'`:

**Before:**
```astro
<link rel="alternate" hreflang={lang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}/${lang}${currentPath || '/'}`} />
<link rel="alternate" hreflang={altLang === 'en' ? 'en-GB' : 'fr-FR'} href={`${siteUrl}${altUrl}`} />
<link rel="alternate" hreflang="x-default" href={`${siteUrl}/en${currentPath || '/'}`} />
```

**After:**
```astro
<link rel="alternate" hreflang={lang === 'en' ? 'en-GB' : 'fr'} href={`${siteUrl}/${lang}${currentPath || '/'}`} />
<link rel="alternate" hreflang={altLang === 'en' ? 'en-GB' : 'fr'} href={`${siteUrl}${altUrl}`} />
<link rel="alternate" hreflang="x-default" href={`${siteUrl}/en${currentPath || '/'}`} />
```

This is a two-character change per line: `'fr-FR'` → `'fr'` (two instances).

### Step 3: Also check og:locale

While in `BaseLayout.astro`, check line 157 (approximate):

```astro
<meta property="og:locale" content={lang === 'en' ? 'en_GB' : 'fr_FR'} />
```

The `og:locale` value `fr_FR` affects how Facebook and other social platforms categorise the page. For the same Francophone Africa targeting rationale, consider changing this to `fr_FR` → `fr_001` (International French) or simply keeping `fr_FR` for Open Graph, which is a separate signal from hreflang and has less impact on search. Decision: **leave `og:locale` as `fr_FR`** — Open Graph targeting for social sharing to French-speaking Facebook users in West Africa is not harmed by `fr_FR` here, as Facebook does not geo-restrict content visibility by this tag the way Google restricts search serving by hreflang.

### Step 4: Build and Verify

```bash
npm run build
```

In the built output (`dist/`), open any French page HTML (e.g., `dist/fr/index.html`) and search for `hreflang`. Confirm:

```html
<link rel="alternate" hreflang="fr" href="https://techguypeter.com/fr/" />
<link rel="alternate" hreflang="en-GB" href="https://techguypeter.com/en/" />
<link rel="alternate" hreflang="x-default" href="https://techguypeter.com/en/" />
```

No `fr-FR` should appear.

### Step 5: Validate with Google's Rich Results Test

After deploying to production, use Google Search Console's URL Inspection tool on a French page. Under "Page indexing" → "Alternates" — the French page should appear with `hreflang: fr`, not `hreflang: fr-FR`.

Alternatively, use the [hreflang validation tool at hreflang.org](https://www.hreflang.org/checker/) to verify the tag structure across the homepage.

## Acceptance Criteria

- [ ] `hreflang="fr-FR"` does not appear in any built HTML file
- [ ] `hreflang="fr"` appears on all French pages (self-referencing) and on all English pages (alternate reference)
- [ ] `hreflang="en-GB"` appears on all English pages (self-referencing) and on all French pages (alternate reference)
- [ ] `hreflang="x-default"` points to the English version on all pages
- [ ] `npm run build` completes without errors
- [ ] Verified in GSC URL Inspection tool within 7 days of deployment

## Effort

**S — 15 minutes** (two-character change, two occurrences; build and verify 10 minutes)
