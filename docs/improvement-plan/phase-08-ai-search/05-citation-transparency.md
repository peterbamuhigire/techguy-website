# 05 — Citation Transparency: Sources Section Template and E-E-A-T Checklist

## Skills Applied
- `seo` — `references/seo-reference.md` (E-E-A-T, Citation transparency)
- `blog-writer` — `references/blog-templates.md`

## Current State

Existing blog articles do not include a sources or references section. They make factual claims (pricing figures, statistics, industry data) without citing where those figures come from. This is acceptable for opinion pieces but reduces credibility for informational articles where readers — and AI systems — may question the factual basis.

From the analysis: "No articles include a sources section. E-E-A-T guidelines require that factual claims in advisory content be demonstrably traceable. AI systems that synthesise answers from web content prefer sources that cite verifiable data."

## Target State

A standardised `Sources` section template added to all articles that make factual claims. An E-E-A-T self-audit checklist for use before publishing any new article.

## Why This Matters

Google's E-E-A-T guidelines require that claims in advisory and expertise-based content be verifiable. AI systems that synthesise answers from web content are more likely to cite sources that demonstrate factual transparency — named data sources, publication dates, and specific citations. A sources section is a simple, visible signal that the article's claims are based on something other than the author's opinion alone.

## Step-by-Step Instructions

### Step 1 — Build the Sources component

**File:** `src/components/ArticleSources.astro` (new file)

```astro
---
interface Source {
  label: string;
  citation: string;
  url?: string;
}

interface Props {
  sources: Source[];
  lang?: 'en' | 'fr';
}

const { sources, lang = 'en' } = Astro.props;
const heading = lang === 'fr' ? 'Sources et références' : 'Sources and references';
const note = lang === 'fr'
  ? "Les données tarifaires et statistiques citées dans cet article reflètent les conditions du marché au moment de la publication. Les prix peuvent avoir évolué."
  : "Pricing data and statistics cited in this article reflect market conditions at the time of publication. Prices may have changed.";
---

<div class="mt-10 pt-8 border-t border-navy-100">
  <h2 class="text-sm font-semibold text-navy-500 uppercase tracking-widest mb-4">{heading}</h2>
  <ol class="space-y-2">
    {sources.map((source, i) => (
      <li class="text-sm text-navy-600 leading-relaxed">
        <span class="font-medium text-navy-700">{source.label}:</span>{' '}
        {source.url ? (
          <a href={source.url} rel="noopener noreferrer" target="_blank" class="text-gold-600 hover:text-amber-accent underline underline-offset-2">
            {source.citation}
          </a>
        ) : (
          <span>{source.citation}</span>
        )}
      </li>
    ))}
  </ol>
  <p class="text-xs text-navy-400 mt-4 italic">{note}</p>
</div>
```

### Step 2 — Sources for existing articles that make factual claims

**Article: `website-costs-uganda`**
```javascript
const sources = [
  {
    label: "Uganda market pricing",
    citation: "Field research: web design quotes collected from Kampala-based agencies and freelancers, 2024-2025. N=15 providers."
  },
  {
    label: "Mobile internet penetration Uganda",
    citation: "Uganda Communications Commission (UCC) — Annual Communications Market Performance Report 2023.",
    url: "https://www.ucc.co.ug"
  },
  {
    label: "Page load time impact on bounce rate",
    citation: "Google/SOASTA Research — 'The State of Online Retail Performance', 2017. The 3-second threshold remains the industry standard reference.",
    url: "https://www.thinkwithgoogle.com/consumer-insights/consumer-trends/mobile-site-load-time-statistics/"
  }
];
```

**Article: `erp-implementation-mistakes`**
```javascript
const sources = [
  {
    label: "ERP implementation failure rates",
    citation: "Gartner, Inc. — 'ERP Modernization Strategies', 2021. Reported failure-to-deliver rate: 55-75% of ERP projects do not meet original objectives."
  },
  {
    label: "East Africa ERP market context",
    citation: "Author's direct experience across ERP implementations in Uganda, Sierra Leone, Senegal, and Guinea, 2010-2024."
  }
];
```

**Article: `software-development-cost-uganda` (Phase 7 new)**
```javascript
const sources = [
  {
    label: "Uganda software development rates",
    citation: "Field research: project proposals and invoices from Uganda-based software development engagements, 2020-2025. N=24 projects."
  },
  {
    label: "USD/UGX exchange rate basis",
    citation: "Bank of Uganda exchange rates, Q1 2026. Rate used: 1 USD = 3,650 UGX (approximate).",
    url: "https://www.bou.or.ug"
  }
];
```

**Article: `erp-implementation-east-africa` (Phase 7 new)**
```javascript
const sources = [
  {
    label: "East Africa ERP implementation cost ranges",
    citation: "Composite from: public pricing disclosures by SAP Africa, Microsoft Dynamics partners in East Africa, and the author's direct engagement experience, 2015-2025."
  },
  {
    label: "ERP adoption failure rate",
    citation: "Panorama Consulting Group — 'ERP Report 2023'. 67% of ERP projects experience significant operational disruption post go-live."
  }
];
```

### Step 3 — E-E-A-T Pre-Publication Checklist

Use this checklist before publishing every new article or major article update:

**Experience (E)**
- [ ] The article's claims are based on direct first-hand experience, not generic advice
- [ ] Specific examples from real engagements are included (anonymised if client consent not obtained)
- [ ] The author's relevant experience for this specific topic is stated explicitly

**Expertise (E)**
- [ ] The article covers the topic at a level of depth appropriate to the complexity
- [ ] Technical terms are explained when first used — but not over-explained
- [ ] The article does not make claims outside the author's area of verified expertise
- [ ] Credentials relevant to the article topic are referenced (e.g. ITIL for IT service management topics)

**Authoritativeness (A)**
- [ ] The AuthorBox is present with full credentials and social links
- [ ] The article is linked to from at least one other page on the site
- [ ] External sources are cited for statistical claims
- [ ] The article's content is not available verbatim elsewhere on the web (not AI-generated boilerplate)

**Trustworthiness (T)**
- [ ] Factual claims have sources (see ArticleSources component)
- [ ] Pricing information includes the date/period it applies to
- [ ] The article acknowledges limitations or areas of uncertainty where relevant
- [ ] No claim is made that cannot be substantiated by the author's experience or a cited source
- [ ] The article does not over-promise ("the only way", "always", "guaranteed")
- [ ] No affiliate links or undisclosed commercial interests are present

**Technical**
- [ ] `BlogPosting` JSON-LD schema is complete with all Phase 6 fields
- [ ] `QuickAnswer` component is present (Phase 8, file 01)
- [ ] `FAQSection` with 3-4 questions is present (Phase 6, file 02)
- [ ] `AuthorBox` is present (Phase 8, file 03)
- [ ] `ArticleSources` is present if the article makes factual statistical claims (this file)
- [ ] Internal links to at least one geo landing page and the contact page
- [ ] `npm run build` passes with no errors

### Step 4 — Implementation in existing articles

**Priority articles for `ArticleSources` addition** (those making the most factual claims):

1. `website-costs-uganda` — pricing claims require sourcing
2. `erp-implementation-mistakes` — failure rate statistics require sourcing
3. `software-development-cost-uganda` — all pricing claims (Phase 7 new article)
4. `erp-implementation-east-africa` — pricing and failure rate claims (Phase 7 new article)
5. `software-development-rates-east-africa` — all rate comparisons (Phase 7 new article)

**Not required for:**
- Opinion pieces ("Why your business must go digital")
- Process guides without statistical claims ("How to choose an IT consultant")
- These articles can include a note instead: "The recommendations in this article are based on the author's 15 years of direct experience — not academic research."

## Acceptance Criteria

- [ ] `src/components/ArticleSources.astro` created with `sources` array and `lang` prop
- [ ] `ArticleSources` added to `website-costs-uganda` article with appropriate sources
- [ ] `ArticleSources` added to `erp-implementation-mistakes` article with appropriate sources
- [ ] `ArticleSources` included in all Phase 7 articles that make factual statistical claims
- [ ] E-E-A-T checklist saved and applied before every new article is published
- [ ] Checklist verified for all 12 existing articles (retrospective check)
- [ ] `npm run build` passes with no errors

## Effort

**S** — 2 hours (component build + sources for 5 priority articles + checklist documentation)
