# 05 — Portfolio Case Snippets: The 3-Line Proof Block Component

## Skills Applied
- `sales-copywriting` — `references/website-messaging-framework.md` (Section 5, Proof Placement)
- `cro-audit` — `references/heuristic-checklist.md` (Section 4, Social Proof 4.7)
- `brand-storytelling` — `references/story-templates.md` (Case Study format)
- `east-african-english` — formal register, British spelling

## Current State

**File:** `src/pages/en/portfolio.astro`

The portfolio page lists products (Maduuka, Aqar, Longhorn ERP, Medic8, Academia Pro) with feature bullet points and technology tags. Each card has:
- A product image
- Tag badges (SaaS, Business Management, etc.)
- A short description
- Feature bullet points
- Technology stack tags

What is missing: proof. The cards describe what each product does, but not what it achieved for a client. No outcome metric appears beside any product. No client name appears in context.

From the analysis: "The portfolio page lists products and features but does not include outcome proof beside any entry. A reader can learn what Maduuka is but cannot learn whether any business measurably improved after using it."

## Current Score

**Trust and measurement maturity: 6.5/10**
**Content quality and messaging: 7.0/10**

## Target State

A reusable `CaseSnippet.astro` component — a compact 3-line proof block — that can sit below the description in any portfolio card, service section, or standalone. Four case excerpts written in full and implemented beside the appropriate portfolio entries.

## Target Score

**Trust and measurement maturity: 7.5/10** (+1.0 from Phase 4 baseline)
**Content quality and messaging: 7.5/10** (+0.5)

## Why This Matters

The portfolio page is visited by prospects who have already seen the homepage and the services page. They are in the evaluation stage. At this stage, the reader's internal question is not "what does this product do?" but "has this worked for an organisation like mine?" A case snippet answers that question in three lines without requiring the reader to click through to a separate case study page.

## Step-by-Step Instructions

### Step 1 — Build the CaseSnippet component

**File:** `src/components/CaseSnippet.astro` (new file)

```astro
---
interface Props {
  label?: string;          // e.g. "Client result" or "Recent engagement"
  client?: string;         // e.g. "Dynapharm Africa"
  outcome: string;         // The specific, measurable outcome
  sector?: string;         // e.g. "Pharmaceutical distribution, 3 countries"
  lang?: 'en' | 'fr';
}

const {
  label,
  client,
  outcome,
  sector,
  lang = 'en',
} = Astro.props;

const defaultLabel = lang === 'fr' ? 'Résultat client' : 'Client result';
const displayLabel = label ?? defaultLabel;
---

<div class="mt-4 pt-4 border-t border-navy-100">
  <p class="text-xs font-semibold text-gold-500 uppercase tracking-widest mb-1.5">{displayLabel}</p>
  {client && (
    <p class="text-xs font-medium text-navy-700 mb-1">{client}</p>
  )}
  <p class="text-sm text-navy-600 leading-relaxed italic">{outcome}</p>
  {sector && (
    <p class="text-xs text-navy-400 mt-1">{sector}</p>
  )}
</div>
```

### Step 2 — Write the four case excerpts

These are the four case excerpts to implement. Each follows the format: what the organisation was doing → what changed → one specific measurable outcome.

---

**Case Excerpt 1 — Longhorn ERP (Dynapharm Africa)**

```
label: "Client result"
client: "Dynapharm Africa"
outcome: "ERP systems in Sierra Leone, Senegal, and Uganda unified into one platform. Staff trained in French and English. Deployed on schedule across three countries."
sector: "Pharmaceutical distribution, West Africa"
```

FR equivalent:
```
label: "Résultat client"
client: "Dynapharm Africa"
outcome: "Systèmes ERP en Sierra Leone, Sénégal et Ouganda unifiés sur une seule plateforme. Personnel formé en français et en anglais. Déployé dans les délais sur trois pays."
sector: "Distribution pharmaceutique, Afrique de l'Ouest"
```

---

**Case Excerpt 2 — Aqar (Excelsis Garden Hotels)**

```
label: "Client result"
client: "Excelsis Garden Hotels"
outcome: "Property and facilities management consolidated from spreadsheets and WhatsApp coordination into a structured digital system. Maintenance tracking, tenant records, and financial reporting in one platform."
sector: "Hospitality and property management, Uganda"
```

FR equivalent:
```
label: "Résultat client"
client: "Excelsis Garden Hotels"
outcome: "Gestion des propriétés et des installations consolidée depuis des tableurs et une coordination WhatsApp vers un système numérique structuré. Suivi de la maintenance, registres des locataires et reporting financier sur une seule plateforme."
sector: "Hôtellerie et gestion immobilière, Ouganda"
```

---

**Case Excerpt 3 — ICT Management (BIRDC)**

```
label: "Current engagement"
client: "BIRDC — Banana Industrial Research and Development Center"
outcome: "Full ICT function managed: infrastructure, network administration, systems development, and strategic technology planning. Operational stability maintained while piloting AI-assisted workflows in 2024-2025."
sector: "Agricultural research institution, Uganda"
```

FR equivalent:
```
label: "Mission en cours"
client: "BIRDC — Centre de recherche et de développement industriel sur la banane"
outcome: "Fonction ICT complète gérée : infrastructure, administration réseau, développement de systèmes et planification technologique stratégique. Stabilité opérationnelle maintenue tout en pilotant des flux de travail assistés par IA en 2024-2025."
sector: "Institution de recherche agricole, Ouganda"
```

---

**Case Excerpt 4 — Business Consulting (EFICON / Multi-sector)**

```
label: "Consulting track record"
client: "Multiple organisations"
outcome: "ICT strategy, systems analysis, and technology roadmap delivery across pharmaceutical, hospitality, property, agriculture, and NGO sectors. Clients in Uganda, Kenya, Sierra Leone, Senegal, and Rwanda."
sector: "Cross-sector, East and West Africa"
```

FR equivalent:
```
label: "Bilan conseil"
client: "Plusieurs organisations"
outcome: "Stratégie ICT, analyse des systèmes et feuille de route technologique dans les secteurs pharmaceutique, hôtelier, immobilier, agricole et ONG. Clients en Ouganda, Kenya, Sierra Leone, Sénégal et Rwanda."
sector: "Multisectoriel, Afrique de l'Est et de l'Ouest"
```

---

### Step 3 — Add case snippets to portfolio cards (EN)

**File:** `src/pages/en/portfolio.astro`

Import the component at the top of the frontmatter section:
```astro
import CaseSnippet from '@/components/CaseSnippet.astro';
```

**Longhorn ERP card:** Find the Longhorn ERP article card. After the description and bullet points, before the closing `</div>` of the card body, add:

```astro
<CaseSnippet
  label="Client result"
  client="Dynapharm Africa"
  outcome="ERP systems in Sierra Leone, Senegal, and Uganda unified into one platform. Staff trained in French and English. Deployed on schedule across three countries."
  sector="Pharmaceutical distribution, West Africa"
/>
```

**Aqar card:** Find the Aqar property management article card. After the description and bullet points, add:

```astro
<CaseSnippet
  label="Client result"
  client="Excelsis Garden Hotels"
  outcome="Property and facilities management consolidated from spreadsheets and WhatsApp coordination into a structured digital system. Maintenance tracking, tenant records, and financial reporting in one platform."
  sector="Hospitality and property management, Uganda"
/>
```

### Step 4 — Add case snippets to portfolio cards (FR)

**File:** `src/pages/fr/portfolio.astro`

Import the component and add the FR equivalent `CaseSnippet` calls to the same two cards:

**Longhorn ERP card:**
```astro
<CaseSnippet
  label="Résultat client"
  client="Dynapharm Africa"
  outcome="Systèmes ERP en Sierra Leone, Sénégal et Ouganda unifiés sur une seule plateforme. Personnel formé en français et en anglais. Déployé dans les délais sur trois pays."
  sector="Distribution pharmaceutique, Afrique de l'Ouest"
  lang="fr"
/>
```

**Aqar card:**
```astro
<CaseSnippet
  label="Résultat client"
  client="Excelsis Garden Hotels"
  outcome="Gestion des propriétés et des installations consolidée depuis des tableurs et une coordination WhatsApp vers un système numérique structuré. Suivi de la maintenance, registres des locataires et reporting financier sur une seule plateforme."
  sector="Hôtellerie et gestion immobilière, Ouganda"
  lang="fr"
/>
```

### Step 5 — Add case snippet to homepage ICT Consulting service card (EN)

**File:** `src/pages/en/index.astro` — find the ICT Consulting `ServiceCard` component or the featured service spotlight section.

If the homepage uses a `ServiceCard` component that does not accept a `children` slot, use the `CaseSnippet` inline in the section below the service card, immediately before the "View all services" link:

```astro
<CaseSnippet
  label="Recent engagement"
  client="Dynapharm Africa"
  outcome="ERP systems in Sierra Leone, Senegal, and Uganda unified into one platform. Staff trained in French and English. Deployed on schedule."
  sector="Pharmaceutical distribution, 3 countries"
/>
```

**FR equivalent in `src/pages/fr/index.astro`:**
```astro
<CaseSnippet
  label="Engagement récent"
  client="Dynapharm Africa"
  outcome="Systèmes ERP en Sierra Leone, Sénégal et Ouganda unifiés sur une seule plateforme. Personnel formé en français et en anglais. Déployé dans les délais."
  sector="Distribution pharmaceutique, 3 pays"
  lang="fr"
/>
```

### Step 6 — Template for future case excerpts

When new client results become available (from testimonial upgrade, Phase 4 file 01), use this template to write new case excerpts:

**Template:**
```
Organisation: [client name or sector if name not authorised]
Situation before: [what was not working or was absent]
What changed: [the specific deliverable]
Measurable outcome: [one number, one named geography, one time measure, or one process change]
Sector: [industry, country/region]
```

**Example application:**

Before:
```
Organisation: Pharmaceutical distribution company, West Africa
Situation before: Three-country ERP system with no integration — separate databases in Sierra Leone, Senegal, and Uganda
What changed: Longhorn ERP deployed and integrated across all three locations; bilingual (EN/FR) staff training delivered
Measurable outcome: Deployed on schedule; single integrated platform serving three countries; bilingual operations enabled
Sector: Pharmaceutical distribution, West Africa
```

Converts to CaseSnippet:
```
outcome: "ERP systems in Sierra Leone, Senegal, and Uganda unified into one platform. Bilingual staff training delivered on schedule."
```

The rule: one sentence per deliverable, maximum two sentences total, at least one specific named detail (country, number, language, named system).

## Acceptance Criteria

- [ ] `src/components/CaseSnippet.astro` created with `label`, `client`, `outcome`, `sector`, and `lang` props
- [ ] Component renders correctly without `client` or `sector` props (all optional except `outcome`)
- [ ] Component renders correctly in both `lang="en"` and `lang="fr"` modes
- [ ] Longhorn ERP portfolio card includes Dynapharm Africa case snippet (EN + FR)
- [ ] Aqar portfolio card includes Excelsis Garden Hotels case snippet (EN + FR)
- [ ] ICT Consulting section on homepage includes the Dynapharm case snippet (EN + FR)
- [ ] No case snippet attributes outcomes to named individuals without written consent
- [ ] All four case excerpts written and documented in this file for future implementation
- [ ] `npm run build` passes with no errors

## Effort

**S** — 3 hours
