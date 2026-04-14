# 02 — Ongoing Support Section: Addition to services.astro

## Skills Applied
- `sales-copywriting` — `references/website-messaging-framework.md`
- `page-builder` — `references/page-patterns.md`
- `east-african-english` — formal register, British spelling

## Current State

**File:** `src/pages/en/services.astro`

The services page lists five service areas. There is no section addressing ongoing support, retainers, or what happens after a project is complete.

## Target State

A new section at the bottom of the services page (before the final CTA) titled "Ongoing support" that introduces the retainer model, names the five packages, and links to the pricing page.

## Step-by-Step Instructions

### Step 1 — Add the "Ongoing Support" section to EN services page

**File:** `src/pages/en/services.astro` — find the section before `<CTASection>` at the bottom of the page. Insert before it:

```astro
<!-- ═══════════════════════════════════════════════════════
     ONGOING SUPPORT
     ═══════════════════════════════════════════════════════ -->
<section class="py-16 md:py-24 bg-navy-900">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="max-w-3xl fade-up">
      <p class="text-gold-400 text-sm font-semibold uppercase tracking-widest mb-3">After the project</p>
      <h2 class="text-3xl md:text-4xl font-bold text-warm-white leading-tight mb-6">
        Most technology engagements end with a deliverable. These do not.
      </h2>
      <p class="text-navy-200 leading-relaxed mb-6">
        A system that is built and left degrades. A website that is launched and forgotten stops ranking. An ICT strategy that is written and filed produces no improvement. The practices most likely to compound over time are the ones with a structured ongoing relationship — not a one-off engagement.
      </p>
      <p class="text-navy-200 leading-relaxed mb-10">
        Five ongoing support arrangements are available, each designed for a specific type of continuing need:
      </p>
    </div>

    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6 fade-up">
      {[
        {
          name: 'Technology Care',
          description: 'Ongoing maintenance, security updates, and priority support for systems this practice has built or implemented.',
          from: 'UGX 600,000/month',
        },
        {
          name: 'SEO Foundation',
          description: 'Monthly on-page SEO, Search Console monitoring, and Google Business Profile management for websites built by this practice.',
          from: 'UGX 500,000/month',
        },
        {
          name: 'Content Growth',
          description: 'Two keyword-optimised blog articles per month, written, published, and reported on by this practice.',
          from: 'UGX 1,500,000/month',
        },
        {
          name: 'CRO Monitoring',
          description: 'Monthly conversion rate audits, implementation changes, and quarterly A/B tests for established websites.',
          from: 'UGX 700,000/month',
        },
        {
          name: 'ICT Manager (Fractional)',
          description: '8–16 hours per month of dedicated ICT management: strategy, vendor oversight, staff training, and board-level reporting.',
          from: 'UGX 2,500,000/month',
        },
      ].map((pkg) => (
        <div class="bg-navy-800 rounded-xl p-6 border border-navy-700 hover:border-gold-400/30 transition-colors fade-up">
          <h3 class="font-bold text-warm-white text-lg mb-2">{pkg.name}</h3>
          <p class="text-navy-300 text-sm leading-relaxed mb-4">{pkg.description}</p>
          <p class="text-gold-400 text-sm font-semibold">From {pkg.from}</p>
        </div>
      ))}
    </div>

    <div class="mt-10 fade-up">
      <a
        href="/en/pricing/"
        class="inline-flex items-center gap-2 bg-gold-400 text-navy-900 font-bold px-6 py-3 rounded-lg hover:bg-gold-300 transition-colors"
      >
        View full package details and pricing
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
        </svg>
      </a>
    </div>
  </div>
</section>
```

### Step 2 — Add the FR equivalent to the FR services page

**File:** `src/pages/fr/services.astro` — find the equivalent position and insert:

```astro
<section class="py-16 md:py-24 bg-navy-900">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="max-w-3xl fade-up">
      <p class="text-gold-400 text-sm font-semibold uppercase tracking-widest mb-3">Après la mission</p>
      <h2 class="text-3xl md:text-4xl font-bold text-warm-white leading-tight mb-6">
        La plupart des missions technologiques se terminent avec un livrable. Pas celles-ci.
      </h2>
      <p class="text-navy-200 leading-relaxed mb-6">
        Un système construit puis abandonné se dégrade. Un site web lancé sans suivi cesse de se positionner. Une stratégie ICT rédigée et classée ne produit aucune amélioration. Les pratiques les plus susceptibles de produire des résultats durables sont celles qui s'appuient sur une relation continue structurée — pas sur une mission ponctuelle.
      </p>
      <p class="text-navy-200 leading-relaxed mb-10">
        Cinq formules de support continu sont disponibles, chacune conçue pour un type de besoin spécifique :
      </p>
    </div>

    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6 fade-up">
      {[
        {
          name: 'Maintenance Technologique',
          description: 'Maintenance continue, mises à jour de sécurité et support prioritaire pour les systèmes développés ou implémentés par ce cabinet.',
          from: 'À partir de 600 000 UGX/mois',
        },
        {
          name: 'SEO de Base',
          description: 'Référencement mensuel on-page, suivi de la Search Console et gestion de la fiche Google Business Profile pour les sites développés par ce cabinet.',
          from: 'À partir de 500 000 UGX/mois',
        },
        {
          name: 'Croissance par le Contenu',
          description: 'Deux articles de blog optimisés par mois, rédigés, publiés et suivis par ce cabinet.',
          from: 'À partir de 1 500 000 UGX/mois',
        },
        {
          name: 'Suivi CRO',
          description: "Audits mensuels du taux de conversion, modifications d'implémentation et tests A/B trimestriels pour les sites établis.",
          from: 'À partir de 700 000 UGX/mois',
        },
        {
          name: 'Directeur ICT (Fractionnel)',
          description: '8 à 16 heures par mois de direction ICT dédiée : stratégie, supervision des fournisseurs, formation du personnel et reporting au conseil.',
          from: 'À partir de 2 500 000 UGX/mois',
        },
      ].map((pkg) => (
        <div class="bg-navy-800 rounded-xl p-6 border border-navy-700 hover:border-gold-400/30 transition-colors fade-up">
          <h3 class="font-bold text-warm-white text-lg mb-2">{pkg.name}</h3>
          <p class="text-navy-300 text-sm leading-relaxed mb-4">{pkg.description}</p>
          <p class="text-gold-400 text-sm font-semibold">{pkg.from}</p>
        </div>
      ))}
    </div>

    <div class="mt-10 fade-up">
      <a
        href="/fr/pricing/"
        class="inline-flex items-center gap-2 bg-gold-400 text-navy-900 font-bold px-6 py-3 rounded-lg hover:bg-gold-300 transition-colors"
      >
        Voir les détails et tarifs complets
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
        </svg>
      </a>
    </div>
  </div>
</section>
```

## Acceptance Criteria

- [ ] "Ongoing Support" section added to EN services page before the CTASection
- [ ] FR equivalent section added to FR services page
- [ ] All 5 packages named with brief descriptions and "from" pricing
- [ ] Section links to `/en/pricing/` (EN) and `/fr/pricing/` (FR) — these pages are built in Phase 9, file 04
- [ ] Section uses `bg-navy-900` dark background to contrast visually with the preceding service sections
- [ ] Mobile layout: single column at 375px, 2-column at 768px, 3-column at 1280px
- [ ] `npm run build` passes with no errors

## Effort

**S** — 2 hours
