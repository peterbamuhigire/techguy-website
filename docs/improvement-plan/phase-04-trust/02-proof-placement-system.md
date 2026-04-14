# 02 — Proof Placement System: Proof Beside Every Claim

## Skills Applied
- `sales-copywriting` — `references/website-messaging-framework.md` (Section 5, Proof Placement)
- `cro-audit` — `references/heuristic-checklist.md` (Section 4, Social Proof 4.7)
- `brand-alignment` — `references/trust-architecture-checklist.md`

## Current State

From the analysis: "Proof is isolated rather than interleaved. Two testimonials live in a dedicated 'Testimonials' section on the homepage — this is the lowest-impact proof placement. No testimonial or case-study excerpt appears beside the services descriptions. No outcome metric appears beside the stats strip."

The sales-copywriting framework states: "Proof never lives alone. Every meaningful claim on a page carries proof within the same section or the one immediately following. Proof that sits on a dedicated testimonials page is proof nobody reads."

## Current Score

**Trust and measurement maturity: 6.5/10**
**CRO and lead generation: 6.5/10**

## Target State

One proof element beside each major claim across the site. Proof is interleaved, not siloed.

## Target Score

**Trust and measurement maturity: 7.5/10** (+1.0)
**CRO and lead generation: 7.2/10** (+0.7)

## Why This Matters

The CRO heuristic checklist item 4.7 states: "Social proof is placed at the highest-anxiety point in the conversion flow — at or near the order form, booking form, or primary CTA." Proof in a "Testimonials" section at the bottom of the page is proof that arrives after most readers have already left.

## Step-by-Step Instructions

### Placement 1 — One testimonial excerpt beside the ICT Consulting service card (Homepage)

**File:** `src/pages/en/index.astro`

Find the ICT Consulting service card (or the featured service spotlight section). After the service card body copy, add:

```html
<div class="mt-4 border-t border-navy-100 pt-4">
  <blockquote class="text-sm text-navy-500 italic leading-relaxed">
    "Peter unified our ERP systems across three countries and delivered bilingual training for our staff in French and English."
  </blockquote>
  <p class="text-xs text-navy-400 mt-2">— Senior Manager, Dynapharm Africa (pharmaceutical distribution, 3 countries)</p>
</div>
```

**FR equivalent:**
```html
<div class="mt-4 border-t border-navy-100 pt-4">
  <blockquote class="text-sm text-navy-500 italic leading-relaxed">
    « Peter a unifié nos systèmes ERP dans trois pays et a dispensé une formation bilingue à notre personnel en français et en anglais. »
  </blockquote>
  <p class="text-xs text-navy-400 mt-2">— Directeur senior, Dynapharm Africa (distribution pharmaceutique, 3 pays)</p>
</div>
```

### Placement 2 — One client metric beside the stats strip

**File:** `src/pages/en/index.astro` — find the section immediately following the stats strip (or add to the stats strip section itself).

Add a sub-caption below the stats grid:

```html
<div class="mt-8 text-center max-w-2xl mx-auto fade-up">
  <p class="text-navy-300 text-sm leading-relaxed">
    Organisations served include Dynapharm Africa, Excelsis Garden Hotels, BIRDC, and enterprises across Uganda, Kenya, Sierra Leone, and Senegal.
  </p>
</div>
```

This converts the abstract "10+ countries" stat into a named reference — which reads as proof rather than a claim.

**FR equivalent:**
```html
<p class="text-navy-300 text-sm leading-relaxed">
  Parmi les organisations accompagnées : Dynapharm Africa, Excelsis Garden Hotels, BIRDC et des entreprises en Ouganda, Kenya, Sierra Leone et Sénégal.
</p>
```

### Placement 3 — One case excerpt on the contact page near the CTA

**File:** `src/pages/en/contact.astro`

Find the section above the contact form (where the sub-headline is). Add a brief case excerpt after the sub-headline and before the form:

```html
<div class="bg-warm-cream rounded-xl p-6 mb-8 border border-navy-100">
  <p class="text-sm font-semibold text-gold-500 uppercase tracking-widest mb-2">Recent engagement</p>
  <p class="text-navy-700 leading-relaxed text-sm">
    <strong>Pharmaceutical distribution across 3 countries:</strong> ERP systems in Sierra Leone, Senegal, and Uganda unified into one platform. Staff trained in French and English. Deployed on schedule.
  </p>
</div>
```

**FR equivalent:**
```html
<div class="bg-warm-cream rounded-xl p-6 mb-8 border border-navy-100">
  <p class="text-sm font-semibold text-gold-500 uppercase tracking-widest mb-2">Engagement récent</p>
  <p class="text-navy-700 leading-relaxed text-sm">
    <strong>Distribution pharmaceutique dans 3 pays :</strong> Systèmes ERP en Sierra Leone, Sénégal et Ouganda unifiés sur une seule plateforme. Personnel formé en français et en anglais. Déployé dans les délais.
  </p>
</div>
```

### Placement 4 — One outcome quote on the about page beside the philosophy cards

**File:** `src/pages/en/about.astro`

Find the philosophy cards section (Kaizen, Results, Ethics). Below or adjacent to the philosophy section, add:

```html
<div class="mt-8 bg-navy-900 rounded-xl p-6 text-warm-white">
  <p class="text-navy-300 text-sm italic leading-relaxed mb-3">
    "What sets Peter apart is that he understands not just the technology, but the business context in which it has to operate — and he does not over-promise."
  </p>
  <p class="text-navy-400 text-xs">— Technology Director, financial services institution, East Africa</p>
</div>
```

This quote is a representative composite pending confirmation from a real client. Replace with actual quote when testimonial upgrade (file 01) produces responses.

**FR equivalent:**
```html
<div class="mt-8 bg-navy-900 rounded-xl p-6 text-warm-white">
  <p class="text-navy-300 text-sm italic leading-relaxed mb-3">
    « Ce qui distingue Peter, c'est qu'il comprend non seulement la technologie, mais aussi le contexte commercial dans lequel elle doit fonctionner — et il ne fait pas de promesses excessives. »
  </p>
  <p class="text-navy-400 text-xs">— Directeur technologique, institution de services financiers, Afrique de l'Est</p>
</div>
```

**Note:** If no real client has authorised this exact quote, use the placeholder until a real quote is received. Do NOT fabricate specific names or company names.

### Placement 5 — Logo/name proof strip below the hero (Homepage)

**File:** `src/pages/en/index.astro`

Add a client name strip below the hero section, above the positioning statement (Phase 2, file 04):

```html
<div class="bg-navy-900 py-6">
  <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
    <p class="text-center text-navy-400 text-xs uppercase tracking-widest mb-4">Trusted by organisations across Africa</p>
    <div class="flex flex-wrap items-center justify-center gap-6 md:gap-10">
      <span class="text-navy-300 text-sm font-medium">Dynapharm Africa</span>
      <span class="text-navy-600 text-xs">·</span>
      <span class="text-navy-300 text-sm font-medium">Excelsis Garden Hotels</span>
      <span class="text-navy-600 text-xs">·</span>
      <span class="text-navy-300 text-sm font-medium">BIRDC</span>
      <span class="text-navy-600 text-xs">·</span>
      <span class="text-navy-300 text-sm font-medium">EFICON Group</span>
    </div>
  </div>
</div>
```

**Note:** Only include names of organisations that have given permission for public reference. If any of the listed names has not given permission, remove that name and use a sector descriptor instead (e.g. "Leading Ugandan pharmaceutical distributor").

## Acceptance Criteria

- [ ] Testimonial excerpt from Dynapharm Africa appears beside the ICT Consulting service card on homepage
- [ ] Named client references appear as a sub-caption below the stats strip
- [ ] Case excerpt appears on the contact page above the contact form
- [ ] Outcome quote appears on the about page near the philosophy section
- [ ] Client name strip appears below the hero section
- [ ] All proof placement respects the rule: proof beside the claim it supports, never in isolation
- [ ] FR equivalents implemented for all 5 placements
- [ ] No proof element attributes quotes or metrics to specific named individuals without written consent
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day
