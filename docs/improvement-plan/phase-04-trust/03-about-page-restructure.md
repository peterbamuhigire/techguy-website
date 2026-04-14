# 03 — About Page Restructure: From Biography to Buyer-Facing Narrative

## Skills Applied
- `brand-storytelling` — `references/story-templates.md` (Epiphany Bridge, About page structure)
- `sales-copywriting` — `references/website-messaging-framework.md` (Section 8, About Page)
- `agency-positioning` — `references/positioning-language.md`
- `east-african-english` — formal register, British spelling

## Current State

**File:** `src/pages/en/about.astro`

Current h1: `"Peter Bamuhigire's Story"` — biography framing.

Current hero sub-paragraph opens with the technology gap in Africa, then pivots to Peter. This is better than many about pages, but the structure is still: "Here is what happened to Peter" rather than "Here is who Peter serves and why."

Current philosophy cards:
- **Kaizen — Continuous Improvement** — abstract, inward-facing
- **Results — Service With Impact** — partially client-facing but vague
- **Ethics — Integrity & Transparency** — abstract values statement

From the analysis: "The About page narrates Peter's history (biography framing) before establishing who it is for (buyer framing). Buyers do not read an about page to learn about the founder — they read it to confirm the founder can solve their problem."

## Current Score

**Trust and measurement maturity: 6.5/10**
**Content quality and messaging: 7.0/10**

## Target State

About page restructured using the Epiphany Bridge:
1. Who Peter serves (opens the page — buyer positioned as subject)
2. The problem Peter saw (the gap — establishes why this matters)
3. The journey (timeline — kept but reframed around client outcomes, not career biography)
4. Why this matters to the client (philosophy cards rewritten as client-facing promises)

## Target Score

**Trust and measurement maturity: 7.2/10** (+0.7)
**Content quality and messaging: 7.5/10** (+0.5)

## Why This Matters

The sales-copywriting framework states: "The About page is not about you. It is about why the visitor's problem is the reason you exist." A buyer from Abidjan or Nairobi reading this page needs to know within the first two sentences whether they are in the right place. A buyer who reads "Peter Bamuhigire's Story" as the opening has to decode whether Peter's story is relevant to them. A buyer who reads "If your organisation operates across multiple African countries and your technology is not keeping up — this practice was built for that specific situation" already knows the answer.

## Step-by-Step Instructions

### Step 1 — Rewrite the EN meta title and description

**File:** `src/pages/en/about.astro` — find the `BaseLayout` props.

Current title: `"About Peter Bamuhigire — IT Consultant in Kampala, Uganda"`

**New EN title:**
```
ICT Consulting for African Enterprises — About Peter Bamuhigire
```

**New EN description:**
```
Peter Bamuhigire has spent 15 years building technology systems for organisations operating across Africa's most complex environments — cross-border, bilingual, and resource-constrained. Based in Kampala; serving East and Francophone Africa.
```

### Step 2 — Rewrite the FR meta title and description

**File:** `src/pages/fr/about.astro`

**New FR title:**
```
Conseil ICT pour entreprises africaines — À propos de Peter Bamuhigire
```

**New FR description:**
```
Peter Bamuhigire a passé 15 ans à développer des systèmes technologiques pour des organisations opérant dans les environnements les plus complexes d'Afrique — transfrontaliers, bilingues et aux ressources limitées. Basé à Kampala, au service de l'Afrique de l'Est et francophone.
```

### Step 3 — Rewrite the EN hero h1

**File:** `src/pages/en/about.astro` — find the `<h1>` element in the hero section.

Current:
```astro
<h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-warm-white leading-tight">
  Peter Bamuhigire's Story
</h1>
```

**New EN h1:**
```astro
<h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-warm-white leading-tight">
  Built for organisations that need technology to work across Africa
</h1>
```

4 U's: Useful=3, Ultra-specific=3, Urgent=2, Unique=3 = **11/16** — acceptable for an About page where the goal is confirmation rather than acquisition.

### Step 4 — Rewrite the EN hero sub-paragraphs

**File:** `src/pages/en/about.astro` — find the two `<p>` elements in the hero section after the h1.

Current first paragraph (paraphrase): "Across Africa, there is a persistent gap between what businesses need from technology and what is available to them..."

Replace both paragraphs with:

```astro
<p class="mt-6 text-lg text-navy-200 leading-relaxed">
  If your organisation operates across multiple African countries, manages operations in more than one language, or needs technology that works reliably under conditions that off-the-shelf software was not built for — this practice was built for that exact situation.
</p>
<p class="mt-4 text-lg text-navy-200 leading-relaxed">
  Peter Bamuhigire has spent 15 years closing the gap between what enterprise technology promises and what actually works on the ground in East and Francophone Africa: unreliable connectivity, multilingual teams, mobile-first environments, and the need for systems that non-technical staff can use without constant support.
</p>
```

### Step 5 — Rewrite the FR hero h1 and sub-paragraphs

**File:** `src/pages/fr/about.astro`

**New FR h1:**
```astro
<h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-warm-white leading-tight">
  Conçu pour les organisations qui ont besoin que la technologie fonctionne en Afrique
</h1>
```

**New FR sub-paragraphs:**
```astro
<p class="mt-6 text-lg text-navy-200 leading-relaxed">
  Si votre organisation opère dans plusieurs pays africains, gère ses activités en plusieurs langues, ou a besoin d'une technologie qui fonctionne de manière fiable dans des conditions pour lesquelles les logiciels standard n'ont pas été conçus — ce cabinet a été créé précisément pour cette situation.
</p>
<p class="mt-4 text-lg text-navy-200 leading-relaxed">
  Peter Bamuhigire a passé 15 ans à combler le fossé entre ce que la technologie d'entreprise promet et ce qui fonctionne réellement sur le terrain en Afrique de l'Est et en Afrique francophone : connectivité instable, équipes multilingues, environnements mobile-first, et systèmes que le personnel non technique peut utiliser sans assistance constante.
</p>
```

### Step 6 — Rewrite the timeline section heading

**File:** `src/pages/en/about.astro` — find the `<SectionHeading>` component in the Career Journey section.

Current:
```astro
<SectionHeading
  title="Career Journey"
  subtitle="From Kampala to Freetown to Dakar and back — building technology solutions across the continent."
/>
```

**New EN:**
```astro
<SectionHeading
  title="How this practice was built"
  subtitle="Every engagement produced a lesson. Every lesson shaped the practice. The timeline below is a record of where those lessons came from."
/>
```

**New FR (in `src/pages/fr/about.astro`):**
```astro
<SectionHeading
  title="Comment ce cabinet a été construit"
  subtitle="Chaque mission a produit une leçon. Chaque leçon a façonné le cabinet. La chronologie ci-dessous retrace l'origine de ces apprentissages."
/>
```

### Step 7 — Reframe the timeline entry descriptions (EN)

**File:** `src/pages/en/about.astro` — find the `timelineEntries` array at the top of the frontmatter.

The existing descriptions are good but biography-framed. Rewrite the `description` field for each entry to foreground the client-relevant lesson:

**Entry 1 — 2008, Infinity Computers:**
```
"Founded on one observation that has never changed: the gap between what businesses need from technology and what they actually receive. From the first client engagement, the question driving every project was not 'what can we build?' but 'what does this business actually need to function better?'"
```

**Entry 2 — 2010-2014, Dynapharm Sierra Leone:**
```
"Four years managing technology across a multilingual pharmaceutical distribution business in West Africa. The lesson from Freetown: technology only works when the people using it can use it confidently. Everything since has been built on that principle — technical capability is not enough; usability and adoption are the measure."
```

**Entry 3 — 2014-2016, EFICON Consult:**
```
"Cross-sector consulting across multiple industries confirmed what Freetown had shown: every organisation has the same core problem — technology that was designed for a different market, operated by people who were not consulted in the design. The conviction that grew from this period: the right technology practice would build tools from the ground up for African business realities."
```

**Entry 4 — 2016-present, Chwezi:**
```
"Launched an independent consultancy and product development practice. Built Maduuka, Aqar, Longhorn ERP, and Medic8 directly from problems encountered in the field. These are not adapted Western products — they were designed from scratch for the environments in which they operate: Ugandan property management, East African healthcare, cross-border distribution. Rebranded to Chwezi Core Systems in 2025."
```

**Entry 5 — 2019-2022, Dynapharm Africa (Regional):**
```
"Expanded responsibilities across three countries — Senegal, Sierra Leone, and Guinea — confirmed the practice's core competency: technology that works bilingually, across borders, in environments where Western enterprise software frequently fails. The ERP unification across francophone and anglophone West Africa became the proof of concept for the cross-border methodology now applied to all multi-country engagements."
```

**Entry 6 — 2022-present, BIRDC:**
```
"Managing the complete ICT function at the Banana Industrial Research and Development Center — infrastructure, systems development, network administration, and strategic planning — while maintaining the private consulting and product practice. The dual role keeps the practice connected to daily operational realities, not just advisory engagements."
```

### Step 8 — Rewrite the philosophy section heading

**File:** `src/pages/en/about.astro` — find the `<SectionHeading>` in the philosophy section.

Current:
```astro
<SectionHeading
  title="Philosophy"
  subtitle="Three principles that guide every engagement."
/>
```

**New EN:**
```astro
<SectionHeading
  title="What working with this practice means for your organisation"
  subtitle="Three commitments — not values statements. Each one has a practical consequence for how your engagement will run."
/>
```

**New FR (`src/pages/fr/about.astro`):**
```astro
<SectionHeading
  title="Ce que travailler avec ce cabinet signifie pour votre organisation"
  subtitle="Trois engagements — pas des déclarations de valeurs. Chacun a une conséquence pratique sur le déroulement de votre mission."
/>
```

### Step 9 — Rewrite the three philosophy cards (EN)

**File:** `src/pages/en/about.astro` — find the `philosophyCards` array in the frontmatter.

Replace the three entries with:

```javascript
const philosophyCards = [
  {
    icon: 'kaizen',
    title: 'You will never receive the same solution twice',
    description: 'Every engagement starts with a diagnostic, not a proposal. The practice does not have a default stack or a preferred vendor — it has a structured method for identifying what your organisation specifically needs and recommending the most appropriate solution for that situation. Continuous improvement is not a values statement; it is the practice's method for staying genuinely useful to clients in markets that change rapidly.',
  },
  {
    icon: 'results',
    title: 'The measure of success is whether your business runs differently',
    description: 'Technology projects that deliver on time and on budget but do not change how the business operates have failed. Every engagement is framed around a specific operational outcome: what will your staff do differently, what decisions will be better informed, what costs will be reduced, what previously impossible operations will become routine. If those outcomes cannot be defined before the engagement starts, the engagement should not start.',
  },
  {
    icon: 'ethics',
    title: 'If this practice is not the right fit, you will be told',
    description: 'Some engagements are not a good match — the requirement falls outside the practice\'s competency, the budget does not align with the scope, or a different approach would serve the client better. In those cases, the answer is a clear explanation of why and, where possible, a referral to a better option. This has sustained client relationships across 10 countries over 15 years — and it is the only practice that does.',
  },
];
```

### Step 10 — Rewrite the three philosophy cards (FR)

**File:** `src/pages/fr/about.astro` — find the `philosophyCards` array.

Replace with:

```javascript
const philosophyCards = [
  {
    icon: 'kaizen',
    title: 'Vous ne recevrez jamais deux fois la même solution',
    description: 'Chaque mission commence par un diagnostic, pas par une proposition commerciale. Le cabinet n\'a pas de stack technologique par défaut ni de fournisseur préféré — il dispose d\'une méthode structurée pour identifier ce dont votre organisation a spécifiquement besoin et recommander la solution la plus adaptée à cette situation. L\'amélioration continue n\'est pas une déclaration de valeurs ; c\'est la méthode du cabinet pour rester véritablement utile aux clients dans des marchés en évolution rapide.',
  },
  {
    icon: 'results',
    title: 'La mesure du succès : votre activité fonctionne-t-elle différemment ?',
    description: 'Les projets technologiques livrés dans les délais et le budget, mais qui ne changent pas le fonctionnement de l\'entreprise, ont échoué. Chaque mission est structurée autour d\'un résultat opérationnel précis : que fera votre personnel différemment, quelles décisions seront mieux informées, quels coûts seront réduits, quelles opérations auparavant impossibles deviendront routinières ? Si ces résultats ne peuvent pas être définis avant le début de la mission, la mission ne doit pas commencer.',
  },
  {
    icon: 'ethics',
    title: 'Si ce cabinet n\'est pas le bon choix, vous en serez informé',
    description: 'Certaines missions ne correspondent pas — l\'exigence dépasse les compétences du cabinet, le budget n\'est pas aligné sur la portée, ou une autre approche servirait mieux le client. Dans ces cas, la réponse est une explication claire des raisons et, si possible, une référence vers une meilleure option. C\'est cette pratique qui a permis de maintenir des relations clients sur 10 pays pendant 15 ans — et c\'est la seule pratique qui le permette.',
  },
];
```

### Step 11 — Add an outcome quote below the philosophy section

**File:** `src/pages/en/about.astro` — find the closing `</section>` tag of the philosophy section. Insert before the `</section>` tag:

```astro
<!-- Outcome quote — replace placeholder with real quote when testimonial upgrade (Phase 4, file 01) delivers -->
<div class="mt-12 max-w-3xl mx-auto fade-up">
  <div class="bg-navy-900 rounded-2xl p-8 text-center">
    <svg class="w-10 h-10 text-gold-400/30 mx-auto mb-4" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
      <path d="M14.017 21v-7.391c0-5.704 3.731-9.57 8.983-10.609l.995 2.151c-2.432.917-3.995 3.638-3.995 5.849h4v10h-9.983zm-14.017 0v-7.391c0-5.704 3.748-9.57 9-10.609l.996 2.151c-2.433.917-3.996 3.638-3.996 5.849h3.983v10h-9.983z"/>
    </svg>
    <blockquote class="text-navy-200 text-lg italic leading-relaxed mb-5">
      "What sets Peter apart is that he understands not just the technology, but the business context in which it has to operate — and he does not over-promise."
    </blockquote>
    <p class="text-navy-400 text-sm">— Technology Director, financial services institution, East Africa</p>
    <p class="text-navy-600 text-xs mt-1">Composite representative quote — to be replaced with authorised testimonial</p>
  </div>
</div>
```

**FR equivalent (`src/pages/fr/about.astro`):**
```astro
<div class="mt-12 max-w-3xl mx-auto fade-up">
  <div class="bg-navy-900 rounded-2xl p-8 text-center">
    <svg class="w-10 h-10 text-gold-400/30 mx-auto mb-4" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
      <path d="M14.017 21v-7.391c0-5.704 3.731-9.57 8.983-10.609l.995 2.151c-2.432.917-3.995 3.638-3.995 5.849h4v10h-9.983zm-14.017 0v-7.391c0-5.704 3.748-9.57 9-10.609l.996 2.151c-2.433.917-3.996 3.638-3.996 5.849h3.983v10h-9.983z"/>
    </svg>
    <blockquote class="text-navy-200 text-lg italic leading-relaxed mb-5">
      « Ce qui distingue Peter, c'est qu'il comprend non seulement la technologie, mais aussi le contexte commercial dans lequel elle doit fonctionner — et il ne fait pas de promesses excessives. »
    </blockquote>
    <p class="text-navy-400 text-sm">— Directeur technologique, institution de services financiers, Afrique de l'Est</p>
    <p class="text-navy-600 text-xs mt-1">Citation composite représentative — à remplacer par un témoignage autorisé</p>
  </div>
</div>
```

**Note:** This quote is a composite representative placeholder. It must be replaced with an authorised testimonial when responses from the testimonial upgrade process (Phase 4, file 01) arrive. Do not attribute this quote to any named individual until written consent is obtained.

## Acceptance Criteria

- [ ] EN h1 changed from "Peter Bamuhigire's Story" to "Built for organisations that need technology to work across Africa"
- [ ] FR h1 changed to "Conçu pour les organisations qui ont besoin que la technologie fonctionne en Afrique"
- [ ] Hero sub-paragraphs open with buyer framing ("If your organisation...") not biography framing
- [ ] Timeline section heading changed to "How this practice was built" (EN) / "Comment ce cabinet a été construit" (FR)
- [ ] Timeline entry descriptions rewritten to foreground the client-relevant lesson from each period
- [ ] Philosophy section heading changed to client-facing commitment framing
- [ ] All three philosophy cards rewritten as client-facing promises, not inward-facing values statements
- [ ] Outcome quote block added below philosophy section on both EN and FR pages
- [ ] Quote carries the composite/placeholder disclaimer until replaced with real authorised testimonial
- [ ] EN meta title: "ICT Consulting for African Enterprises — About Peter Bamuhigire"
- [ ] FR meta title: "Conseil ICT pour entreprises africaines — À propos de Peter Bamuhigire"
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day (rewrites across EN + FR, plus implementation)
