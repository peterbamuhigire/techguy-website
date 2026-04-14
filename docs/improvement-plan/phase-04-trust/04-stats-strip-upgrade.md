# 04 — Stats Strip Upgrade: Context Labels and Named-Reference Sub-Caption

## Skills Applied
- `sales-copywriting` — `references/website-messaging-framework.md` (Section 5, Proof Placement)
- `cro-audit` — `references/heuristic-checklist.md` (Section 4, Social Proof 4.7)
- `east-african-english` — formal register, British spelling

## Current State

**File:** `src/pages/en/index.astro` — lines 155-165 (the stats strip section)

**File:** `src/utils/i18n.ts` — lines 30-33 (EN labels), lines 89-92 (FR labels)

**File:** `src/components/StatCard.astro`

Current stats strip:
```
15+  Years Experience
10+  Countries Served
3    SaaS Products Built
6    Industries Served
```

The GSAP counter animation is present (`.counter` class with `data-target` attribute). This must be preserved.

From the analysis: "The stats strip uses round numbers without context. '10 countries' is a claim, not proof. Named references beside abstract numbers convert claims into evidence."

The stats strip sits on `bg-navy-800`, has `py-12 md:py-16` padding, and uses a 4-column grid layout. The `StatCard` component renders the number in `text-gold-400`, the label in `text-navy-200`.

## Current Score

**Trust and measurement maturity: 6.5/10**
**CRO and lead generation: 6.5/10**

## Target State

Two changes:
1. Stats labels upgraded to include context (what the number actually means for the client)
2. A named-reference sub-caption added below the stats grid — converts abstract numbers into named proof

GSAP counter animation preserved exactly as-is.

## Target Score

**Trust and measurement maturity: 7.0/10** (+0.5)

## Why This Matters

"15 Years Experience" tells the reader Peter has been doing this a long time. "15 years · building systems that still run" tells them something about quality. "10 Countries Served" is a number. "Organisations in 10 African countries" followed by named organisations is proof. The CRO checklist item 4.7 is clear: proof at the point of highest anxiety. The stats strip appears immediately after the hero — it is the highest-anxiety point on the page.

## Step-by-Step Instructions

### Step 1 — Upgrade the EN stats labels

**File:** `src/utils/i18n.ts`

Find lines 30-33:
```typescript
'stats.years': 'Years Experience',
'stats.countries': 'Countries Served',
'stats.products': 'SaaS Products Built',
'stats.industries': 'Industries Served',
```

Replace with:
```typescript
'stats.years': 'Years in Practice',
'stats.countries': 'African Countries',
'stats.products': 'Proprietary Platforms',
'stats.industries': 'Sectors Served',
```

**Rationale for each change:**
- "Years Experience" → "Years in Practice" — signals an active professional practice, not just accumulated time
- "Countries Served" → "African Countries" — adds geographic specificity; removes the implied question "which countries?"
- "SaaS Products Built" → "Proprietary Platforms" — more precise; "proprietary" signals ownership and differentiation
- "Industries Served" → "Sectors Served" — preferred register for B2B professional services in East Africa

### Step 2 — Upgrade the FR stats labels

**File:** `src/utils/i18n.ts`

Find lines 89-92:
```typescript
'stats.years': 'Années d\'Expérience',
'stats.countries': 'Pays Servis',
'stats.products': 'Produits SaaS',
'stats.industries': 'Industries Servies',
```

Replace with:
```typescript
'stats.years': 'Ans d\'exercice',
'stats.countries': 'Pays africains',
'stats.products': 'Plateformes propriétaires',
'stats.industries': 'Secteurs couverts',
```

### Step 3 — Add a context sub-caption below the stats grid (EN)

**File:** `src/pages/en/index.astro` — find the stats section:

```astro
<section class="bg-navy-800 py-12 md:py-16">
  <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="grid grid-cols-2 md:grid-cols-4 gap-8 md:gap-12 fade-up">
      <StatCard number="15" label={t('stats.years', lang)} />
      <StatCard number="10" label={t('stats.countries', lang)} />
      <StatCard number="3" label={t('stats.products', lang)} suffix="" />
      <StatCard number="6" label={t('stats.industries', lang)} />
    </div>
  </div>
</section>
```

Replace with:
```astro
<section class="bg-navy-800 py-12 md:py-16">
  <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="grid grid-cols-2 md:grid-cols-4 gap-8 md:gap-12 fade-up">
      <StatCard number="15" label={t('stats.years', lang)} />
      <StatCard number="10" label={t('stats.countries', lang)} />
      <StatCard number="3" label={t('stats.products', lang)} suffix="" />
      <StatCard number="6" label={t('stats.industries', lang)} />
    </div>
    <div class="mt-8 text-center max-w-2xl mx-auto fade-up">
      <p class="text-navy-300 text-sm leading-relaxed">
        Organisations served include Dynapharm Africa, Excelsis Garden Hotels, BIRDC, and enterprises across Uganda, Kenya, Sierra Leone, and Senegal.
      </p>
    </div>
  </div>
</section>
```

**Note:** Only include organisation names for which public reference permission has been confirmed. If any listed name is uncertain, replace with a sector descriptor: e.g. "a leading Ugandan agricultural research institution" instead of "BIRDC".

### Step 4 — Add the FR equivalent sub-caption

**File:** `src/pages/fr/index.astro` — find the equivalent stats section and make the same structural change.

FR sub-caption:
```astro
<div class="mt-8 text-center max-w-2xl mx-auto fade-up">
  <p class="text-navy-300 text-sm leading-relaxed">
    Parmi les organisations accompagnées : Dynapharm Africa, Excelsis Garden Hotels, BIRDC et des entreprises en Ouganda, Kenya, Sierra Leone et Sénégal.
  </p>
</div>
```

### Step 5 — Verify GSAP animation is unaffected

The GSAP counter animation targets elements with the `.counter` class and reads from `data-target`. The `StatCard.astro` component renders:
```html
<span class="counter" data-target="15">15</span>+
```

The changes in Steps 1-4 do not touch `StatCard.astro` or any JS. The animation will continue to function identically after this change. No action required — just confirm by running `npm run build` and checking the dev server.

### Step 6 — Optional: Add a context qualifier to the "3" stat

The current "3 Proprietary Platforms" stat is correct but could benefit from a tooltip or a small sub-text that names the platforms. If the design permits, add a `title` attribute to the counter span for accessible hover tooltip:

**File:** `src/components/StatCard.astro` — this change is optional and requires adding a `context` prop:

```astro
---
interface Props {
  number: string;
  label: string;
  suffix?: string;
  context?: string;
}

const { number, label, suffix = '+', context } = Astro.props;
const numericValue = parseInt(number);
---

<div class="text-center">
  <div class="text-4xl md:text-5xl font-bold text-gold-400 font-heading">
    <span class="counter" data-target={numericValue.toString()}>{numericValue}</span>{suffix}
  </div>
  <p class="mt-2 text-sm text-navy-200 font-medium">{label}</p>
  {context && (
    <p class="mt-1 text-xs text-navy-400 leading-tight">{context}</p>
  )}
</div>
```

Then in `index.astro`, pass context to the products stat:
```astro
<StatCard number="3" label={t('stats.products', lang)} suffix="" context="Maduuka · Aqar · Longhorn ERP" />
```

**This step is optional.** Only implement if the visual design allows the additional text without crowding the stat grid at mobile widths (375px). If in doubt, skip it and rely on the sub-caption in Step 3 instead.

## Acceptance Criteria

- [ ] EN stats labels updated: "Years in Practice", "African Countries", "Proprietary Platforms", "Sectors Served"
- [ ] FR stats labels updated: "Ans d'exercice", "Pays africains", "Plateformes propriétaires", "Secteurs couverts"
- [ ] Named-reference sub-caption appears below the stats grid on the EN homepage
- [ ] FR equivalent sub-caption appears below the stats grid on the FR homepage
- [ ] GSAP counter animation still fires correctly on page load (test in browser)
- [ ] Sub-caption only names organisations for which public reference permission has been confirmed
- [ ] Layout does not break at 375px mobile width (sub-caption wraps gracefully)
- [ ] `npm run build` passes with no errors

## Effort

**S** — 2 hours
