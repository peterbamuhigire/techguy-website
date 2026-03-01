# Internationalization Configuration Template

**File location**: `docs/i18n-config.md` in your client project

Copy this template to your project's `docs/` directory and fill in your language settings.

## Enabled Languages

Specify which of the 3 supported languages are enabled for your website:

```
Supported languages:
- en: English
- fr: French
- sw: Kiswahili

Mark enabled languages with ✓
```

- ✓ en: English — enabled
- ✓ fr: French — enabled
- ✓ sw: Kiswahili — enabled

**To disable a language:** Remove it from this list. Only enabled languages will be built.

## Default Language

The language shown when users visit the root domain (`/`).

Default language: **en**

Options: `en`, `fr`, `sw`

**Note**: If the user's browser language matches one of your enabled languages, they may be automatically redirected to that language (language-switcher detects browser preference).

## URL Structure

All pages are served under language paths:

```
https://example.com/
    → redirects to https://example.com/en/ (default language)

https://example.com/en/about
https://example.com/fr/about
https://example.com/sw/about
```

A language switcher appears on every page, allowing visitors to change languages.

## Content Organization

### English (en)
- All content files in: `docs/en/`
- Required files:
  - `company-profile.md`
  - `services.md` (or equivalent)
  - `pages.md`
  - All other content pages

### French (fr)
- All content files in: `docs/fr/`
- Same file structure as `docs/en/`
- French must be formal francophone African standard (see language-standards skill)
- Must be reviewed by native French speaker from target market

### Kiswahili (sw)
- All content files in: `docs/sw/`
- Same file structure as `docs/en/`
- Kiswahili must use standard East African dialect (see language-standards skill)
- Must be reviewed by native Kiswahili speaker from East Africa

## Translation Status

Track which content is translated and ready for each language.

| Content File | English (en) | French (fr) | Kiswahili (sw) |
|--------------|--------------|------------|----------------|
| company-profile.md | ✓ Complete | ✓ Complete | ✓ Complete |
| services.md | ✓ Complete | ✓ Complete | ⚠ In progress |
| pages.md | ✓ Complete | ✓ Complete | ✓ Complete |
| team.md | ✓ Complete | ✓ Complete | ✗ Not started |
| testimonials.md | ✓ Complete | ✗ Not started | ✗ Not started |
| faq.md | ✓ Complete | ✓ Complete | ✓ Complete |

**Symbols:**
- ✓ Complete and reviewed
- ⚠ In progress
- ✗ Not started (will not be included in build)
- ⊘ Not applicable (e.g., content only needed in one language)

## Language-Specific Notes

### English Version
- **Default language** for this website
- Uses British English (colour, organisation, travelling, etc.)
- Tone: Formal, respectful, East African professional standard
- Target audience: International visitors, primary market

### French Version
- **Target countries**: Côte d'Ivoire, DRC, Cameroon, Senegal, Gabon, Congo
- **French standard**: Formal francophone African (not Québécois or Belgian variants)
- **Tone**: Professional, respectful, corporate
- **Pronouns**: Use "vous" (formal) throughout, not "tu"
- **Currency references**: Use regional currency (CFA franc, etc.) where relevant
- **In-country reviewer**: Assign a native francophone reviewer from target market
- **Review date**: [Date reviewer approved content]
- **Reviewer name**: [Name and country of reviewer]

### Kiswahili Version
- **Target countries**: Kenya, Tanzania, Uganda
- **Standard**: Standard East African Kiswahili (not regional dialects)
- **Register**: Formal/respectful business register throughout
- **Tone**: Professional, courteous, humble
- **Cultural notes**:
  - Emphasis on relationship and harmony
  - Avoid overly direct language
  - Use respectful address forms
- **In-country reviewer**: Assign a native Kiswahili speaker from East Africa
- **Review date**: [Date reviewer approved content]
- **Reviewer name**: [Name and country of reviewer]

## Content Gaps and Priorities

### Phase 1 (Live Now)
- [ ] English version complete and live
- [ ] French version complete and live
- [ ] Kiswahili version complete and live

### Phase 2 (Planned)
- [ ] Blog posts translated (if applicable)
- [ ] Case studies translated (if applicable)
- [ ] Video subtitles added for all languages

### Phase 3 (Future)
- [ ] Additional language support (if approved)
- [ ] Regional variants (e.g., French for Côte d'Ivoire vs. Cameroon)

## Technical Configuration

### Language Codes
- English: `en`
- French: `fr`
- Kiswahili: `sw`

### Open Graph Locales
- English: `en_GB` (or `en_US` if preferred)
- French: `fr_FR` (francophone standard)
- Kiswahili: `sw_KE` or `sw_TZ` (East African)

### Search Console Considerations
- **Each language version** has its own Google Search Console property
- Submit language-specific sitemaps separately
- Monitor keyword performance by language
- Track user behavior by language

### Analytics
- Set up custom dimension in Google Analytics for language
- Track bounce rate, conversion rate by language
- Monitor most common paths per language
- Identify language-specific content gaps or opportunities

## Design Notes

### Text Expansion Factors
French and Kiswahili content will be longer than English. Design accommodates:
- French: 20–40% longer than English
- Kiswahili: 10–30% longer than English

All buttons, form labels, and CTAs tested with longer text.

### No Right-to-Left Support
All 3 languages use left-to-right (LTR) layout. If RTL languages added in future, separate technical implementation required.

## SEO Configuration

### Hreflang Tags
Automatically generated for all pages in all languages. Example:
```html
<link rel="alternate" hreflang="en" href="https://example.com/en/about" />
<link rel="alternate" hreflang="fr" href="https://example.com/fr/about" />
<link rel="alternate" hreflang="sw" href="https://example.com/sw/about" />
<link rel="alternate" hreflang="x-default" href="https://example.com/en/about" />
```

### Sitemaps
Three sitemaps generated:
- `sitemap-en.xml` — all English pages
- `sitemap-fr.xml` — all French pages
- `sitemap-sw.xml` — all Kiswahili pages
- `sitemap-index.xml` — master index

Submit all to Google Search Console.

## Language-Specific Keywords

Research keywords specific to each language and market.

### English Keywords
- Primary search engine: Google (global)
- Focus: International audience, East African professionals
- [List your target keywords here]

### French Keywords
- Primary search engines: Google, some Bing usage in DRC
- Focus: Francophone African professionals, B2B in Côte d'Ivoire, Cameroon, Senegal
- [List your target French keywords here]

### Kiswahili Keywords
- Primary search engine: Google
- Focus: East African professionals, local market penetration
- [List your target Kiswahili keywords here]

## Maintenance Checklist

### Monthly
- [ ] Review translation status table
- [ ] Check for new untranslated content
- [ ] Monitor analytics by language
- [ ] Check for any language-specific errors

### Quarterly
- [ ] Get feedback from in-country reviewers
- [ ] Update any outdated language-specific content
- [ ] Review search rankings by language
- [ ] Test language switcher on real devices

### Annually
- [ ] Complete translation status audit
- [ ] Review SEO performance by market
- [ ] Assess conversion rates by language
- [ ] Plan for new languages or markets (if applicable)

## Questions and Support

### When Adding a New Content Page
1. Write in English first (`docs/en/`)
2. Translate to French and Kiswahili
3. Have translations reviewed by native speakers
4. Update this i18n-config.md file
5. Run website build

### If a Language Is Incomplete
- Incomplete languages won't be built
- Update this file to reflect "Not started" status
- Pages will only appear in complete languages

### For Future Multi-Language Expansion
Contact your developer. The website-skills library supports 3 languages (en, fr, sw). Adding new languages requires:
- Language-standards skill update
- Template files for new language
- New Astro routes
- SEO configuration changes
- In-country reviewers for new language
