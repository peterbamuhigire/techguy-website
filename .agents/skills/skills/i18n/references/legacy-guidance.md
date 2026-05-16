# Internationalization (i18n) â€” Multi-Language Infrastructure

Historical detailed guidance preserved from the pre-standardized version of the skill.
Use `i18n/SKILL.md` and the current i18n references first.

Multi-language support is designed into projects from the start. This skill defines the technical and content architecture for supporting English (en), French (fr), and Kiswahili (sw) when those languages are enabled.

## Supported Languages and Characteristics

### English (en)
- **Default language** unless client specifies otherwise
- **URL path**: `/en/`
- **Standard**: British English (via language-standards skill)
- **Use cases**: International, East African markets
- **Character expansion**: Baseline (1.0x)

### French (fr)
- **URL path**: `/fr/`
- **Standard**: Formal francophone African (via language-standards skill)
- **Primary markets**: Francophone Africa, CÃ´te d'Ivoire, DRC, Cameroon, Senegal
- **Character expansion**: 1.2â€“1.4x (French typically 20â€“40% longer than English)
- **Text-overflow handling**: Design buttons and forms to accommodate longer text
- **Regional variants**: Use standard French (not QuÃ©bÃ©cois or Belgian variants) unless explicitly requested

### Kiswahili (sw)
- **URL path**: `/sw/`
- **Standard**: Standard Kiswahili with formal/respectful register (via language-standards skill)
- **Primary markets**: East Africa, Kenya, Tanzania, Uganda
- **Character expansion**: 1.1â€“1.3x (Kiswahili typically 10â€“30% longer than English)
- **Text-overflow handling**: Design containers to flex for expansion
- **Writing system**: Latin script (no special scripts), UTF-8 encoding

## Content Organization

### Directory Structure

```
docs/
â”œâ”€â”€ i18n-config.md              â† Language configuration
â”œâ”€â”€ en/
â”‚   â”œâ”€â”€ company-profile.md
â”‚   â”œâ”€â”€ services.md
â”‚   â”œâ”€â”€ pages.md
â”‚   â””â”€â”€ ... (all other content)
â”œâ”€â”€ fr/
â”‚   â”œâ”€â”€ company-profile.md
â”‚   â”œâ”€â”€ services.md
â”‚   â”œâ”€â”€ pages.md
â”‚   â””â”€â”€ ... (all other content)
â””â”€â”€ sw/
    â”œâ”€â”€ company-profile.md
    â”œâ”€â”€ services.md
    â”œâ”€â”€ pages.md
    â””â”€â”€ ... (all other content)
```

### Required File: docs/i18n-config.md

Every project must have `docs/i18n-config.md` defining:

```markdown
# Internationalization Configuration

## Enabled Languages
- en: English (enabled)
- fr: French (enabled)
- sw: Kiswahili (enabled)

## Default Language
en (fallback), but root `/` auto-detects browser language.

## Browser Language Detection (Required)

The root page (`src/pages/index.astro`) must detect the visitor's browser language and redirect:
- **French** (`navigator.language` starts with `fr`) â†’ `/fr/`
- **Everything else** â†’ `/en/`

This covers 75â€“90% of African visitors (Francophone and Anglophone Africa). No server-side detection needed â€” a small inline `<script>` in the root index page handles it. The `<noscript>` fallback redirects to `/en/`.

**Root page pattern:**
```html
<script is:inline>
  (function () {
    var lang = (navigator.language || navigator.userLanguage || 'en').toLowerCase();
    var dest = lang.startsWith('fr') ? '/fr/' : '/en/';
    window.location.replace(dest);
  })();
</script>
<noscript>
  <meta http-equiv="refresh" content="0;url=/en/" />
</noscript>
```

Do NOT use a server-side redirect (`.htaccess` or Nginx rewrite) for the root â€” it bypasses detection. The web server must serve the generated Astro root page at `/` and let that page handle browser-language detection. Server routing may still handle `/en/`, `/fr/`, and `/sw/` normally.

### Zero-Flash Redirect (MANDATORY â€” Hard Rule)

The visitor must NEVER see a "Redirecting to /en" flash, a blank page, or any visible redirect artefact when landing on the root URL. The redirect must be instant and invisible:

| âŒ Don't use | âœ… Use instead | Why |
|---|---|---|
| `Astro.redirect('/en/')` | `<script is:inline>` | Shows "Redirecting to /en" text; generates slow meta-refresh |
| `<meta http-equiv="refresh">` as primary | `window.location.replace()` | Perceptible delay; visible in status bar |
| Any body content on root page | Empty `<body>` + `<noscript>` only | Content flashes before redirect fires |
| `window.location.href = ...` | `window.location.replace(...)` | `replace()` doesn't break the back button |

- **`is:inline`** tells Astro to emit the script exactly as written â€” no bundling, no defer, no async; it runs before the browser paints anything
- **`<noscript>` fallback**: the `content="0"` meta refresh fires only when JavaScript is disabled â€” it is never the primary mechanism
- **Test**: open the root URL in an incognito window and confirm zero flicker, zero text, zero intermediate state before the language page loads

### French Browser Detection (Required)

`navigator.language` returns a BCP-47 tag. French speakers across Francophone Africa use many locale variants â€” `fr`, `fr-FR`, `fr-BE`, `fr-CD`, `fr-CI`, `fr-CM`, `fr-SN`, `fr-RW`, and more. Using `startsWith('fr')` catches every variant in a single check, so DRC, CÃ´te d'Ivoire, Cameroon, Senegal, and Rwanda visitors are all served the French site automatically with no user action required.

**Canonical `src/pages/index.astro` template** â€” copy this verbatim into any EN+FR Astro project:

```astro
---
// src/pages/index.astro
// Root language-detection page â€” detects browser language, sends to /fr/ or /en/
// No body content: prevents any flash before redirect fires
---
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="robots" content="noindex" />
    <script is:inline>
      (function () {
        var lang = (navigator.language || navigator.userLanguage || 'en').toLowerCase();
        // startsWith('fr') catches fr, fr-FR, fr-BE, fr-CD, fr-CI, fr-CM, fr-SN, fr-RW â€¦
        var dest = lang.startsWith('fr') ? '/fr/' : '/en/';
        window.location.replace(dest);
      })();
    </script>
    <noscript>
      <meta http-equiv="refresh" content="0;url=/en/" />
    </noscript>
  </head>
  <body></body>
</html>
```

Key points:
- `<body>` is intentionally empty â€” nothing to render, nothing to flash
- `noindex` prevents search engines from indexing the redirect page itself
- The IIFE (`(function(){â€¦})()`) runs synchronously before first paint
- `window.location.replace()` is used (not `href =`) so the back button works correctly

## URL Structure
- Root domain (/) â†’ browser language detection â†’ /en/ or /fr/
- All pages served under language path: /en/, /fr/, /sw/
- Language switcher appears on all pages

## Translation Status
| File | en | fr | sw |
|------|----|----|-----|
| company-profile.md | âœ“ | âœ“ | âœ“ |
| services.md | âœ“ | âœ“ | âœ“ |
| pages.md | âœ“ | âœ“ | âœ“ |

## Language-Specific Notes
- French content reviewed by francophone reviewer
- Kiswahili content reviewed by native speaker from East Africa
```

## URL Routing

### Path-Based Structure
- **Root domain**: `https://example.com/` â†’ redirects to `https://example.com/en/` (or configured default)
- **English**: `https://example.com/en/`
- **French**: `https://example.com/fr/`
- **Kiswahili**: `https://example.com/sw/`

### Dynamic Routes in Astro

```
src/pages/[lang]/
â”œâ”€â”€ index.astro
â”œâ”€â”€ about.astro
â”œâ”€â”€ services.astro
â””â”€â”€ [slug].astro
```

Each page receives `lang` parameter from URL:
```astro
---
export function getStaticPaths() {
  return [
    { params: { lang: 'en' } },
    { params: { lang: 'fr' } },
    { params: { lang: 'sw' } },
  ];
}

const { lang } = Astro.params;
// Load content from docs/{lang}/
---
```

## Language Utility Functions

### Required: src/utils/i18n.ts

```typescript
export const defaultLang = 'en';
export const languages = ['en', 'fr', 'sw'] as const;
export type Language = typeof languages[number];

export function isValidLang(lang: string): lang is Language {
  return languages.includes(lang as Language);
}

export function getI18nPath(lang: Language, path: string): string {
  return `/${lang}${path}`;
}

export function getHrefLangPath(lang: Language, currentPath: string): string {
  const cleanPath = currentPath.replace(/^\/[a-z]{2}/, '');
  return getI18nPath(lang, cleanPath);
}

export const languageLabels: Record<Language, string> = {
  en: 'English',
  fr: 'FranÃ§ais',
  sw: 'Kiswahili',
};
```

## Language Switcher Component

### Required: src/components/LanguageSwitcher.astro

Displays on every page, allowing users to switch languages. Uses flag emojis for visual language indication:

```astro
---
import type { Language } from '../utils/i18n';

interface Props {
  currentLang: Language;
  currentPath: string;
}

const { currentLang, currentPath } = Astro.props;

const languages = [
  { code: 'en' as Language, label: 'English', flag: 'ðŸ‡¬ðŸ‡§' },  // British flag
  { code: 'fr' as Language, label: 'FranÃ§ais', flag: 'ðŸ‡«ðŸ‡·' },  // French flag
  { code: 'sw' as Language, label: 'Kiswahili', flag: 'ðŸ‡ªðŸ‡¦' },  // East Africa flag
];

const getLanguagePath = (lang: Language) => {
  const cleanPath = currentPath.replace(/^\/[a-z]{2}/, '') || '/';
  return `/${lang}${cleanPath}`;
};
---

<nav aria-label="Language selection" class="language-switcher">
  {languages.map(lang => (
    <a
      href={getLanguagePath(lang.code)}
      aria-current={currentLang === lang.code ? 'page' : undefined}
      aria-label={lang.label}
      title={lang.label}
      class={`lang-button ${currentLang === lang.code ? 'active' : ''}`}
    >
      <span class="flag">{lang.flag}</span>
      <span class="label">{lang.label}</span>
    </a>
  ))}
</nav>

<style>
  .language-switcher {
    display: flex;
    gap: 0.5rem;
    align-items: center;
  }

  .lang-button {
    display: flex;
    align-items: center;
    gap: 0.25rem;
    padding: 0.5rem 0.75rem;
    border-radius: 0.375rem;
    text-decoration: none;
    color: inherit;
    font-size: 0.875rem;
    transition: all 0.2s ease;
    border: 1px solid transparent;
  }

  .lang-button:hover {
    background-color: rgba(0, 0, 0, 0.05);
    border-color: rgba(0, 0, 0, 0.1);
  }

  .lang-button.active {
    background-color: var(--color-primary);
    color: white;
    font-weight: 600;
    border-color: var(--color-primary);
  }

  .flag {
    font-size: 1.25rem;
    line-height: 1;
  }

  @media (max-width: 640px) {
    .label {
      display: none;  /* Show only flags on mobile */
    }

    .lang-button {
      padding: 0.375rem 0.5rem;
    }
  }
</style>
```

**Design Notes:**
- Uses flag emojis: ðŸ‡¬ðŸ‡§ (British), ðŸ‡«ðŸ‡· (French), ðŸ‡ªðŸ‡¦ (East Africa)
- Label text hidden on mobile (<640px), only flags shown
- Active language highlighted with primary color and bold text
- Smooth hover transitions for interactivity
- Maintains language when navigating (e.g., /en/about â†’ /fr/about preserves current page)

### Language Switcher Linking Rules

**Critical rule: language switchers must never blindly swap the language prefix.**

**SEO slug rule:** this applies to every language the website supports, not only French. Each translated page or article must use a slug written for that language and its search intent. English slugs are not acceptable defaults for non-English routes unless the phrase is a proper noun, brand, acronym, or established local search term.

Blindly replacing `/en/` with `/fr/` in the URL will produce a 404 whenever the page slug differs between languages (e.g. `/en/blog/east-african-websites-need-french-version/` â‰  `/fr/blog/sites-web-africains-version-anglaise/`). This is a broken experience.

**The rule:**

Every language switcher link must resolve to one of these â€” in order of preference:

1. **Exact known equivalent URL** â€” explicitly provided by the page author via an `altUrl` prop on `BaseLayout`.
2. **SlugMap lookup** â€” for pages with known different slugs (stored in a `slugMap` in `BaseLayout`/`Header`), translate the current slug to the correct alternate-language slug.
3. **Same path, swapped prefix** â€” only when the page slug is identical in both languages (e.g. `/en/about/` â†’ `/fr/about/`).
4. **Alternate-language home** â€” fall back to `/{altLang}/` when none of the above resolves safely (e.g. unknown dynamic routes, external links, 404 scenarios).

For new implementations, prefer a single route-equivalence map keyed by logical page ID, with one localized slug per enabled language. Use that same map for the language switcher, canonical URL generation, hreflang links, sitemap alternate links, and internal link helpers.

**Implementation pattern (BaseLayout.astro):**

```astro
interface Props {
  lang: Lang;
  altUrl?: string;  // Explicit cross-language URL â€” use for blog posts and any page with different slugs
  // ... other props
}

const { lang, altUrl: altUrlProp } = Astro.props;
const altLang = lang === 'en' ? 'fr' : 'en';
const currentPath = Astro.url.pathname.replace(`/${lang}`, '');
const slugMap: Record<string, string> = {
  'digital-marketing-strategy': 'strategie-marketing-digital',
  // ... add all pages with different slugs per language
};
const currentSlug = currentPath.replace(/^\//, '').replace(/\/$/, '');
// Rule: explicit altUrl > slugMap > same-path swap > fallback home
const altUrl = altUrlProp
  ?? (slugMap[currentSlug] ? `/${altLang}/${slugMap[currentSlug]}/` : `/${altLang}${currentPath || '/'}`);
```

**Usage on pages with different slugs per language:**

```astro
// EN page
<BaseLayout lang="en" altUrl="/fr/blog/slug-in-french/" ...>

// FR page
<BaseLayout lang="fr" altUrl="/en/blog/slug-in-english/" ...>
```

**Forward `altUrl` from BaseLayout to Header:**

```astro
// BaseLayout passes resolved altUrl to Header
<Header lang={lang} altUrl={altUrl} />

// Header.astro accepts it and uses it directly instead of recomputing
interface Props {
  lang: Lang;
  altUrl: string;  // always resolved by BaseLayout â€” never recompute in Header
}
```

**Every blog article MUST set `altUrl`.** Blog slugs almost always differ between languages. If the translated article has not been published yet, set `altUrl="/{altLang}/"` to point to the home page rather than a 404.

## SEO Implementation for Multi-Language

### Hreflang Tags

Every page must include hreflang links pointing to all language versions. Implement in `BaseLayout.astro`:

```astro
---
import { languages, getHrefLangPath } from '../utils/i18n';

interface Props {
  lang: 'en' | 'fr' | 'sw';
  title: string;
  currentPath: string;
}

const { lang, title, currentPath } = Astro.props;
---

<html lang={lang}>
<head>
  <!-- Hreflang tags for all language versions -->
  {languages.map(langCode => (
    <link
      rel="alternate"
      hreflang={langCode}
      href={`https://example.com${getHrefLangPath(langCode, currentPath)}`}
    />
  ))}
  <!-- x-default points to English version -->
  <link
    rel="alternate"
    hreflang="x-default"
    href={`https://example.com/en${currentPath.replace(/^\/[a-z]{2}/, '')}`}
  />
</head>
```

### Language-Specific Sitemaps

Three sitemaps generated during build:
- `sitemap-en.xml` â€” all /en/ pages
- `sitemap-fr.xml` â€” all /fr/ pages
- `sitemap-sw.xml` â€” all /sw/ pages
- `sitemap-index.xml` â€” references all three (submitted to Google Search Console)

### Open Graph Locale Tags

Add to meta tags in `BaseLayout.astro`:

```astro
<meta property="og:locale" content={langToOpenGraphLocale(lang)} />
<meta property="og:locale:alternate" content={langToOpenGraphLocale('en')} />
<meta property="og:locale:alternate" content={langToOpenGraphLocale('fr')} />
<meta property="og:locale:alternate" content={langToOpenGraphLocale('sw')} />
```

Where locale mapping is:
- `en` â†’ `en_US` or `en_GB` (client preference)
- `fr` â†’ `fr_FR` (francophone standard)
- `sw` â†’ `sw_KE` or `sw_TZ` (East African standard)

## Text Expansion and Design Flexibility

### Language-Specific Text Expansion Factors

Design for these expansion ranges:

| Language | Typical Range | Practical Design Factor |
|----------|---------------|------------------------|
| English | 1.0x (baseline) | 1.0x |
| French | 1.2â€“1.4x | Design for 1.3x |
| Kiswahili | 1.1â€“1.3x | Design for 1.2x |

**Implementation:**
- Use flexible containers (min-width, max-width, not fixed widths)
- Test all UI elements (buttons, form labels, CTAs) with longer text
- Avoid text in images; use CSS overlays instead
- Design with generous padding/margin
- Use CSS `text-overflow: ellipsis` as fallback for critical spaces

### Design Testing Checklist

```
â–¡ Navigation items fit on one line (or wrap gracefully)
â–¡ Button labels don't truncate
â–¡ Form labels don't overlap input fields
â–¡ Hero headlines don't overflow or become illegible
â–¡ Card content doesn't break layout
â–¡ Footer text aligns properly
```

## Right-to-Left (RTL) Support

**Current scope**: Not yet implemented (all 3 languages use LTR).

**Future consideration**: If Arabic or Hebrew support is added, implement:
- CSS `direction: rtl` and `text-align: right`
- Flip margins: `margin-left` becomes `margin-right`
- Mirror icons and directional images
- Test form layouts for RTL flow

## When This Skill Applies

- **First step** in website-builder orchestration (before design-system)
- **Reading** `docs/i18n-config.md` to detect enabled languages
- **Generating** dynamic [lang] routes in page-builder
- **Creating** language-specific content paths
- **Implementing** language switcher and i18n utilities
- **Configuring** hreflang tags and sitemaps in seo skill
- **Setting up** root domain redirect in deploy skill

## Integration with Other Skills

- **language-standards**: Enforces tone, spelling, grammar per language
- **website-builder**: Orchestrates build for each enabled language
- **page-builder**: Generates [lang] dynamic routes, loads language-specific content
- **seo**: Implements hreflang, locale tags, language-specific sitemaps
- **deploy**: Configures language routing rules and preserves the generated Astro root page so browser-language detection can run at `/`
