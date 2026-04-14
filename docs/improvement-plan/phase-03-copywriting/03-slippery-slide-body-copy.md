# 03 — Apply Slippery-Slide Principle to Homepage Body Copy

## Skills Applied
- `sales-copywriting` — `references/website-messaging-framework.md` (Section 4, Sugarman's slippery slide)
- `east-african-english` — formal register, concrete language

## Current State

From the analysis: "The Sugarman slippery-slide principle requires the first sentence of each section to exist only to earn the second sentence. Current first sentences lead with brand claims rather than reader hooks."

Current section openers (identified from analysis):
- "Why Peter" section: *"A rare combination of deep technical capability and genuine business understanding, forged across Africa's most dynamic markets."* — leads with brand claim, not reader hook
- Products section: *"Proprietary SaaS platforms built to serve real business needs across Africa and beyond."* — feature-leading, not curiosity-leading
- Services intro: likely generic (uses i18n string)
- Testimonials section: unknown opener
- Final CTA: unknown opener

## Current Score

**Sales copywriting and CTA architecture: 5.5/10**
**Content quality and messaging: 6.5/10**

## Target State

Every section opener is rewritten so that the first sentence earns the second. No section opens with a brand claim, a feature statement, or a generic welcome. Every first sentence creates a micro-commitment to read further.

## Target Score

**Content quality and messaging: 7.2/10** (+0.7)

## Why This Matters

The slippery-slide principle (Sugarman) states: the first sentence's only job is to get the reader to read the second sentence. A section that opens with "We are experts in technology" has lost the skimmer immediately. A section that opens with "In 2010, Peter moved to Freetown to run IT for a pharmaceutical company across two countries — in French." earns the next sentence because the reader wants to know what happened.

## Step-by-Step Instructions

### Section 1 — Hero body copy

**File:** `src/pages/en/index.astro:81-83`

Handled in Phase 2, file 02. The new sub-headline already applies the slippery-slide principle by opening with specific numbers and client types rather than a capability claim.

### Section 2 — Stats strip label copy

**File:** `src/pages/en/index.astro`

The stats strip has 4 cards. The label text for each needs to be rewritten so that the number alone earns the label — and the label earns the next section.

Current labels (from i18n strings — the actual text may vary):
- 15+ → years of experience
- 10+ → countries
- 3 → products / platforms
- 6 → industries

**New stat labels (replace the i18n strings):**

These are the labels that appear below each number in the StatCard component. Find the i18n keys used (e.g. `t('stats.years', lang)`, `t('stats.countries', lang)`) and update the translations.

**File:** `src/utils/i18n.ts` or equivalent i18n file — find `stats.years`, `stats.countries`, `stats.products`, `stats.industries`.

New EN values:
```
stats.years: "years of technology engagements that had to work, in demanding African environments"
stats.countries: "African countries where Peter has delivered on the ground"
stats.products: "proprietary software platforms built from consulting experience"
stats.industries: "sectors served: pharmaceutical, hospitality, financial, property, NGO, government"
```

New FR values:
```
stats.years: "ans d'engagements technologiques qui devaient fonctionner, dans des environnements africains exigeants"
stats.countries: "pays africains où Peter a assuré des livraisons sur le terrain"
stats.products: "plateformes logicielles propriétaires issues de l'expérience conseil"
stats.industries: "secteurs servis : pharmaceutique, hôtellerie, finances, immobilier, ONG, gouvernement"
```

### Section 3 — Services section intro

**File:** `src/pages/en/index.astro` — the `subtitle` prop passed to the SectionHeading for the services section.

Find the i18n key for `section.services_intro` and update:

Current (likely): "Comprehensive ICT consulting and software development services" or similar.

**New EN opener for the services section subtitle:**
```
Most technology problems in Africa have the same root cause: the solution was designed for a different context. Here is what this practice does differently.
```

**New FR:**
```
La plupart des problèmes technologiques en Afrique ont la même cause profonde : la solution a été conçue pour un contexte différent. Voici comment ce cabinet aborde les choses différemment.
```

### Section 4 — "Why Peter" / About mini-section opener

**File:** `src/pages/en/index.astro` — find the "Why Peter" section. The analysis identifies line 319 as:
*"A rare combination of deep technical capability and genuine business understanding, forged across Africa's most dynamic markets."*

**Replace with:**
```
Most ICT consultants advise from a distance. Peter writes the code.
```

Then follow with the existing credential content. The short, direct opening earns the reader's attention for what comes after.

**FR equivalent:**
```
La plupart des consultants ICT conseillent à distance. Peter écrit le code.
```

### Section 5 — Products section opener

**File:** `src/pages/en/index.astro` — the `subtitle` prop for the Products section SectionHeading.

Current (approximate): "Proprietary SaaS platforms built to serve real business needs across Africa and beyond."

**New EN opener:**
```
After 15 years of consulting, Peter built the tools he wished had existed. Three proprietary platforms, each born from a real client problem in a real African context.
```

**New FR:**
```
Après 15 ans de conseil, Peter a construit les outils qu'il aurait souhaité avoir. Trois plateformes propriétaires, chacune née d'un vrai problème client dans un vrai contexte africain.
```

### Section 6 — Testimonials section opener

**File:** `src/pages/en/index.astro` — find the SectionHeading for the testimonials section.

Current (likely): "What clients say" or "Testimonials."

**New EN opener (title):**
```
What clients say after the project — not just at the start
```

**New EN opener (subtitle):**
```
These organisations came with technology problems that had resisted previous attempts. Here is what happened when Peter was brought in.
```

**New FR title:**
```
Ce que disent les clients après la mission — pas seulement au début
```

**New FR subtitle:**
```
Ces organisations avaient des problèmes technologiques qui avaient résisté à des tentatives précédentes. Voici ce qui s'est passé lorsque Peter a été sollicité.
```

### Section 7 — Final CTA section opener

**File:** `src/components/CTASection.astro` (or the equivalent final CTA section)

Find the heading and body copy of the final CTA section. Current (approximate): "Ready to work together?" or "Get Started Today."

**New EN CTA heading:**
```
If your organisation's technology challenge is serious, the next step is a diagnostic.
```

**New EN CTA body:**
```
A 30-minute call with Peter costs nothing. By the end of it, you will know whether the practice is the right fit, and Peter will know whether he can genuinely help. If not, he will say so.
```

**New FR CTA heading:**
```
Si le défi technologique de votre organisation est sérieux, la prochaine étape est un diagnostic.
```

**New FR CTA body:**
```
Un appel de 30 minutes avec Peter ne coûte rien. À la fin, vous saurez si le cabinet correspond à votre situation, et Peter saura s'il peut véritablement vous aider. Dans le cas contraire, il le dira.
```

## Acceptance Criteria

- [ ] "Why Peter" section no longer opens with "A rare combination of..."
- [ ] Services section intro opens with the new curiosity-hook sentence
- [ ] Products section opener references the 15-year consulting origin
- [ ] Testimonials section opener sets up the "problem that resisted previous attempts" frame
- [ ] Final CTA section opener uses "diagnostic" language, not "let's work together"
- [ ] All 7 sections have openers that earn the second sentence (test: read only the first sentence of each section — does it create a micro-commitment to read further?)
- [ ] FR equivalents match EN intent in natural francophone African register
- [ ] `npm run build` passes with no errors

## Effort

**S** — 4 hours (writing and implementing all 7 section rewrites)
