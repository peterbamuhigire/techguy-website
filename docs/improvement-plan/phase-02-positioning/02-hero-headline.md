# 02 — Rewrite the Homepage Hero Headline

## Skills Applied
- `sales-copywriting` — `references/headline-mastery.md`, `references/website-messaging-framework.md`
- `agency-positioning` — `references/positioning-language.md`
- `east-african-english` — formal register, British spelling

## Current State

**File:** `src/pages/en/index.astro:75-78`
```html
<h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-warm-white leading-tight">
  Building Technology Solutions
  <span class="text-gold-400"> Across Africa</span>
  & Beyond
</h1>
```

Current headline: **"Building Technology Solutions Across Africa & Beyond"**

4 U's analysis:
- **Useful (2/4):** A benefit is vaguely implied but not stated. What does the reader *get*?
- **Ultra-specific (1/4):** No number, no client type, no geography beyond "Africa."
- **Urgent (1/4):** No reason to read this now vs. tomorrow.
- **Unique (2/4):** Every technology firm in Africa uses scope-based language like this.

**Total: 6/16. Minimum to ship: 12/16. Must be rewritten.**

## Current Score

**Sales copywriting and CTA architecture: 5.5/10**
**Brand positioning and differentiation: 5.5/10**

## Target State

A headline that scores 12+/16 on the 4 U's, selects the right audience, names a benefit or transformation, and can support the category claim established in file 01.

## Target Score

**Sales copywriting and CTA architecture: 6.5/10** (partial improvement — full improvement requires Phase 3)
**Brand positioning and differentiation: 6.8/10**

## Why This Matters

The headline is read by every visitor. It is the highest-traffic sentence on the site. The sales-copywriting skill states: "Eight of ten readers read only the headline (Ogilvy). Invest there." A rewrite here has more impact per hour of work than any other single copy change.

## Step-by-Step Instructions

### Step 1 — Choose the headline

Four options are scored below. Option C is the recommendation.

**Option A:**
"ICT consulting and custom software for East African businesses that need technology to actually work"

4 U's:
- Useful: 3 (benefit implied: technology that "actually works" vs. the implied alternative)
- Ultra-specific: 3 (East African businesses; ICT consulting; custom software)
- Urgent: 2 (no urgency trigger)
- Unique: 3 (the phrase "actually work" is a pointed contrast; no competitor uses this)
Total: **11/16** — marginal pass

**Option B:**
"When your operations run across 3 countries and 2 languages, you need an IT consultant who has done it before"

4 U's:
- Useful: 3 (implied benefit: relevant cross-border experience)
- Ultra-specific: 4 (3 countries, 2 languages — specific identifiers)
- Urgent: 3 (the qualifier "who has done it before" implies the risk of hiring one who hasn't)
- Unique: 4 (no other IT consultant in the region is making this specific claim)
Total: **14/16** — strong pass

**Option C (RECOMMENDED):**
"The ICT consultant East and Francophone African enterprises call when the technology challenge is too complex for generalists"

4 U's:
- Useful: 3 (benefit: expertise for complex challenges)
- Ultra-specific: 4 (East and Francophone Africa; enterprises; named contrast: "generalists")
- Urgent: 3 (implicit: if you're facing a complex challenge, the clock is ticking)
- Unique: 4 (no other consultant is making a bilingual pan-African expert-posture claim)
Total: **14/16** — strong pass

**Option D (French sub-headline, to pair with any of A-C):**
"Conseil informatique et logiciels sur mesure pour les entreprises africaines — depuis 15 ans."

Scored separately for use as a bilingual sub-element.

**Recommendation: Option C.** It directly invokes the expert posture (the agency-positioning skill's Doctor framework), qualifies the audience (enterprises, not startups), and makes the pan-African bilingual experience central. Option B is strong but slightly less expert-postured (it leads with a client situation rather than Peter's diagnostic authority).

### Step 2 — Update the EN homepage h1

**File:** `src/pages/en/index.astro:75-78`

Replace:
```html
<h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-warm-white leading-tight">
  Building Technology Solutions
  <span class="text-gold-400"> Across Africa</span>
  & Beyond
</h1>
```

With:
```html
<h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-warm-white leading-tight">
  The ICT consultant East and
  <span class="text-gold-400"> Francophone African</span>
  enterprises call when the technology challenge is too complex for generalists
</h1>
```

**Note on line wrapping:** At large viewport (lg) this headline is long. Test at `text-3xl md:text-4xl lg:text-5xl` if it overflows. The gold highlight on "Francophone African" keeps the category claim visually anchored.

### Step 3 — Update the EN homepage sub-headline

**File:** `src/pages/en/index.astro:81-83`

Current:
```html
<p class="mt-6 text-lg md:text-xl text-navy-200 max-w-xl leading-relaxed">
  15+ years of software development, ICT consulting, and business advisory across 10+ African countries. Practical solutions that deliver real business results.
</p>
```

Replace with:
```html
<p class="mt-6 text-lg md:text-xl text-navy-200 max-w-xl leading-relaxed">
  15 years. 10+ countries. Bilingual in English and French. Peter Bamuhigire works with established organisations — pharmaceutical distributors, banks, hotel groups, government institutions — that need technology to work reliably, across borders, first time.
</p>
```

This sub-headline: names 15 years (specific), names the bilingual capability (category differentiator), names actual client types (qualifies the audience), and states the core promise (works reliably, across borders, first time).

### Step 4 — Update the FR homepage h1

**File:** `src/pages/fr/index.astro`

Find the h1 element in the hero section. Replace its content with:
```html
<h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-warm-white leading-tight">
  Le consultant ICT que les entreprises
  <span class="text-gold-400"> d'Afrique francophone</span>
  sollicitent lorsque le défi technologique dépasse les généralistes
</h1>
```

### Step 5 — Update the FR homepage sub-headline

**File:** `src/pages/fr/index.astro`

Replace the FR sub-headline with:
```html
<p class="mt-6 text-lg md:text-xl text-navy-200 max-w-xl leading-relaxed">
  15 ans d'expérience. Plus de 10 pays. Bilingue anglais-français. Peter Bamuhigire accompagne des organisations établies — distributeurs pharmaceutiques, banques, groupes hôteliers, institutions publiques — qui exigent que la technologie fonctionne de manière fiable, sans frontières, dès le premier déploiement.
</p>
```

### Step 6 — Update page meta titles and descriptions

**File:** `src/pages/en/index.astro` — find the BaseLayout `title` and `description` props in the frontmatter or component call.

Current title (approximate): `"Peter Bamuhigire — IT Consultant, Kampala Uganda"`

New title: `"Peter Bamuhigire — ICT Consultant & Software Developer, East Africa"`

New description: `"ICT consulting and custom software for East and Francophone African enterprises. Based in Kampala, Uganda. 15+ years, 10+ countries, bilingual English-French. Book a diagnostic call."`

**File:** `src/pages/fr/index.astro`

New FR title: `"Peter Bamuhigire — Consultant Informatique & Développeur Logiciel, Afrique"`

New FR description: `"Conseil informatique et développement logiciel sur mesure pour les entreprises en Afrique francophone et de l'Est. Basé à Kampala, Ouganda. 15+ ans d'expérience, bilingue. Réservez un appel diagnostic."`

### Step 7 — Verify mobile rendering

Run `npm run dev` and test the h1 at 375px viewport width. If the headline wraps to more than 4 lines on mobile, add `text-3xl` as the base class (before `md:text-4xl`):

```html
<h1 class="text-3xl md:text-4xl lg:text-5xl font-bold text-warm-white leading-tight">
```

Ensure the primary CTA button remains visible above the fold on mobile.

## Acceptance Criteria

- [ ] EN h1 reads: "The ICT consultant East and Francophone African enterprises call when the technology challenge is too complex for generalists"
- [ ] FR h1 reads the approved French version
- [ ] EN sub-headline names client types, years, countries, and bilingual capability
- [ ] FR sub-headline is natural francophone African register (formal, vouvoiement, not France-specific)
- [ ] 4 U's score for EN h1 is 12+/16 (verify manually against the scoring rubric)
- [ ] Meta title and description updated for EN and FR index pages
- [ ] At 375px mobile viewport, h1 is visible and primary CTA remains above fold
- [ ] `npm run build` passes with no errors

## Effort

**S** — 3 hours (writing options, selecting, implementing, verifying mobile)
