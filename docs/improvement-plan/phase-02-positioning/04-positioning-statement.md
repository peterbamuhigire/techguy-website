# 04 — Write and Deploy the "Who This Is For" Positioning Statement

## Skills Applied
- `agency-positioning` — `references/agency-narrative.md`, `references/qualification-guide.md`
- `sales-copywriting` — `references/website-messaging-framework.md` (Section 6, objection map)
- `east-african-english` — formal register, concrete language, British spelling

## Current State

**File:** `src/pages/en/index.astro` — below the hero section, no qualifying statement exists.

The analysis notes: "There is no explicit audience qualifier on any page." The CRO skill's objection map requires that "Is this for me?" is answered at scroll screen 1. Currently, no page on the site tells the reader specifically who Peter serves and who he does not serve.

The closest thing to a qualifier is the hero sub-headline ("15+ years of software development, ICT consulting, and business advisory across 10+ African countries") — but this describes Peter's experience, not who his ideal client is.

## Current Score

**Brand positioning and differentiation: 5.5/10**
**CRO and lead generation: 5.5/10**

## Target State

A 3-sentence "Who this is for" block placed directly below the hero section on the homepage. It names: (1) the client type, (2) the problem Peter solves, (3) who Peter is NOT for.

This block appears between the hero section and the stats strip on the homepage. It is a brief interstitial — not a full section, just a qualifying statement that anchors the reader before they scroll into the services content.

## Target Score

**Brand positioning and differentiation: 6.8/10** (+1.3)
**Agency expert posture and messaging: 6.5/10** (+1.5)
**CRO and lead generation: 5.8/10** (+0.3)

## Why This Matters

The agency-positioning skill's qualification guide states that the ideal buyer is: "an established organisation where technology failure is not an option, operating across multiple countries or languages, with a technology challenge too complex for a generalist." Without a qualifier on the site, Peter attracts wrong-fit enquiries (startups wanting a minimum viable product on a minimal budget) and potentially loses right-fit enquiries who cannot tell whether their situation matches.

The qualifier also signals selectivity — a core component of expert posture. An expert who works with everyone is not an expert; an expert who works with a specific type of client in a specific situation is a specialist.

## Step-by-Step Instructions

### Step 1 — Write the positioning statement

**English version:**

```
Peter works with established organisations that need technology to function reliably across Africa's most demanding conditions — multiple countries, multiple languages, ERP systems where downtime is not an option.

This practice is not suited to startups seeking a minimum viable product or to organisations whose primary buying criterion is the lowest possible fee.

If your organisation has outgrown the technology solutions that served it at an earlier stage, and you need a practitioner who understands the specific challenges of operating across East and Francophone Africa, this is the right place to start.
```

**French version:**

```
Peter accompagne des organisations établies qui ont besoin que la technologie fonctionne de manière fiable dans les conditions les plus exigeantes d'Afrique — plusieurs pays, plusieurs langues, des systèmes ERP où toute interruption est inacceptable.

Ce cabinet ne convient pas aux startups en quête d'un produit minimum viable, ni aux organisations dont le critère d'achat principal est le tarif le plus bas.

Si votre organisation a dépassé les solutions technologiques qui lui convenaient à un stade antérieur, et que vous avez besoin d'un praticien qui comprend les défis spécifiques de l'Afrique de l'Est et de l'Afrique francophone, vous êtes au bon endroit.
```

### Step 2 — Create the Astro component for the positioning statement

**File:** `src/components/PositioningStatement.astro` (new file)

```astro
---
interface Props {
  lang: 'en' | 'fr';
}
const { lang } = Astro.props;

const content = {
  en: {
    p1: "Peter works with established organisations that need technology to function reliably across Africa's most demanding conditions — multiple countries, multiple languages, ERP systems where downtime is not an option.",
    p2: "This practice is not suited to startups seeking a minimum viable product or to organisations whose primary buying criterion is the lowest possible fee.",
    p3: "If your organisation has outgrown the technology solutions that served it at an earlier stage, and you need a practitioner who understands the specific challenges of operating across East and Francophone Africa, this is the right place to start."
  },
  fr: {
    p1: "Peter accompagne des organisations établies qui ont besoin que la technologie fonctionne de manière fiable dans les conditions les plus exigeantes d'Afrique — plusieurs pays, plusieurs langues, des systèmes ERP où toute interruption est inacceptable.",
    p2: "Ce cabinet ne convient pas aux startups en quête d'un produit minimum viable, ni aux organisations dont le critère d'achat principal est le tarif le plus bas.",
    p3: "Si votre organisation a dépassé les solutions technologiques qui lui convenaient à un stade antérieur, et que vous avez besoin d'un praticien qui comprend les défis spécifiques de l'Afrique de l'Est et de l'Afrique francophone, vous êtes au bon endroit."
  }
};

const c = content[lang];
---

<section class="bg-warm-cream py-12 md:py-16 border-y border-navy-100">
  <div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
    <p class="text-lg text-navy-700 leading-relaxed mb-4">{c.p1}</p>
    <p class="text-base text-navy-500 leading-relaxed mb-4 italic">{c.p2}</p>
    <p class="text-lg text-navy-700 leading-relaxed">{c.p3}</p>
  </div>
</section>
```

### Step 3 — Insert the component into the EN homepage

**File:** `src/pages/en/index.astro`

Add the import at the top of the file (in the frontmatter, with other imports):
```astro
import PositioningStatement from '@/components/PositioningStatement.astro';
```

Find the stats strip section (the section with `bg-navy-800` containing the StatCard components). Insert the `PositioningStatement` component between the hero section and the stats strip:

```astro
<!-- PositioningStatement goes here, between hero and stats -->
<PositioningStatement lang="en" />

<!-- ==============================
     STATS STRIP
     ============================== -->
<section class="bg-navy-800 py-12 md:py-16">
```

### Step 4 — Insert the component into the FR homepage

**File:** `src/pages/fr/index.astro`

Same pattern:
```astro
import PositioningStatement from '@/components/PositioningStatement.astro';
```

Insert between hero and stats strip:
```astro
<PositioningStatement lang="fr" />
```

### Step 5 — Verify rendering

Run `npm run dev`. Check:
- The positioning statement appears between the hero and the stats strip on both `/en/` and `/fr/`
- The warm-cream background distinguishes it from the navy hero and navy stats strip
- Text is legible at both desktop and mobile widths
- The italic middle paragraph (the "not for") reads as a visual qualifier, not a rejection

## Acceptance Criteria

- [ ] `PositioningStatement.astro` component exists in `src/components/`
- [ ] Component renders EN text on `/en/` and FR text on `/fr/`
- [ ] Component is placed between the hero section and the stats strip on both pages
- [ ] The "not for" sentence is present (this is the critical qualifier — do not soften it)
- [ ] French text uses formal register and vouvoiement (no "tu")
- [ ] Component is responsive: readable at 375px mobile
- [ ] `npm run build` passes with no errors

## Effort

**S** — 2 hours (writing, component creation, integration)
