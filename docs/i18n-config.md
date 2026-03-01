# Internationalization Configuration

## Enabled Languages

```
Supported languages:
- en: English
- fr: French
```

- ✓ en: English — enabled
- ✓ fr: French — enabled

**Note:** Kiswahili (sw) is not enabled for this site. Peter operates professionally in English and French, and the primary markets are English-speaking East Africa and francophone West Africa.

## Default Language

Default language: **en**

## URL Structure

```
https://techguypeter.com/
    → redirects to https://techguypeter.com/en/ (default language)

https://techguypeter.com/en/about
https://techguypeter.com/fr/about
```

A language switcher appears on every page, allowing visitors to change between English and French.

## Content Organization

### English (en)
- All content files in: `docs/en/`
- Required files:
  - `company-profile.md`
  - `pages.md`
  - `style-brief.md`
  - `services.md`
  - `team-profiles.md`
  - `contact.md`
  - `testimonials.md`
  - `portfolio.md`
  - `faq.md`
  - `about-story.md`
  - `gallery.md`

### French (fr)
- All content files in: `docs/fr/`
- Same file structure as `docs/en/`
- French must be formal francophone African standard (vouvoiement throughout)
- Must be reviewed by native French speaker from target market
- Target countries: Senegal, DRC, Cameroon, Côte d'Ivoire, Guinea

## Translation Status

| Content File | English (en) | French (fr) |
|--------------|--------------|-------------|
| company-profile.md | ✓ Complete | ✓ Complete — needs native review |
| pages.md | ✓ Complete | ✓ Complete — needs native review |
| style-brief.md | ✓ Complete | ⊘ Not applicable |
| services.md | ✓ Complete | ✓ Complete — needs native review |
| team-profiles.md | ✓ Complete | ✓ Complete — needs native review |
| contact.md | ✓ Complete | ✓ Complete — needs native review |
| testimonials.md | ✓ Complete | ✓ Complete — needs native review |
| portfolio.md | ✓ Complete | ✓ Complete — needs native review |
| faq.md | ✓ Complete | ✓ Complete — needs native review |
| about-story.md | ✓ Complete | ✓ Complete — needs native review |
| gallery.md | ✓ Complete | ⊘ Not applicable |

**Symbols:**
- ✓ Complete and reviewed
- ⚠ In progress
- ✗ Not started (will not be included in build)
- ⊘ Not applicable (e.g., style-brief and gallery are language-independent)

## Language-Specific Notes

### English Version
- **Default language** for this website
- Uses British English (colour, organisation, travelling, etc.)
- Tone: Formal, respectful, East African professional standard
- Target audience: International visitors, East African market, English-speaking clients worldwide

### French Version
- **Target countries**: Senegal, DRC, Cameroon, Côte d'Ivoire, Guinea, Congo
- **French standard**: Formal francophone African (not Québécois or Belgian variants)
- **Tone**: Professional, respectful, corporate
- **Pronouns**: Use "vous" (formal) throughout, not "tu"
- **Context**: Peter has direct experience working in francophone environments (Dakar, Senegal; Guinea)
- **In-country reviewer**: [Assign native francophone reviewer from target market]
- **Review date**: [Date reviewer approved content]
- **Reviewer name**: [Name and country of reviewer]

## Content Gaps and Priorities

### Phase 1 (Current)
- [x] English version complete
- [x] French version — translation complete
- [ ] French version — native speaker review needed

### Phase 2 (Post-Launch)
- [ ] Blog posts translated to French
- [ ] Additional case studies in French for francophone market

## Technical Configuration

### Language Codes
- English: `en`
- French: `fr`

### Open Graph Locales
- English: `en_GB`
- French: `fr_FR`

### Hreflang Tags
Automatically generated for all pages in both languages:
```html
<link rel="alternate" hreflang="en" href="https://techguypeter.com/en/about" />
<link rel="alternate" hreflang="fr" href="https://techguypeter.com/fr/about" />
<link rel="alternate" hreflang="x-default" href="https://techguypeter.com/en/about" />
```

### Sitemaps
Two sitemaps generated:
- `sitemap-en.xml` — all English pages
- `sitemap-fr.xml` — all French pages
- `sitemap-index.xml` — master index

## Design Notes

### Text Expansion
French content will be 20–40% longer than English. All designs must accommodate longer text without breaking layouts — buttons, headings, navigation labels, and form fields.

### No Right-to-Left Support
Both languages use left-to-right (LTR) layout.
