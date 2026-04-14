# 04 — Pricing Transparency Page: Full Brief for `/en/pricing/`

## Skills Applied
- `sales-copywriting` — `references/website-messaging-framework.md` (Section 9, Pricing)
- `cro-audit` — `references/heuristic-checklist.md` (Section 6, Pricing pages)
- `page-builder` — `references/page-patterns.md`
- `east-african-english` — formal register, British spelling

## Current State

No pricing page exists. No pricing information appears anywhere on the site beyond the CaseSnippet and FAQ section references added in earlier phases.

From the analysis: "No pricing transparency. Buyers who cannot get a sense of investment required will not enquire — they assume the worst. Pricing pages that provide ranges (not exact prices) reduce pre-enquiry anxiety and pre-qualify buyers before the diagnostic call."

## Target State

A new pricing page at `/en/pricing/` and `/fr/pricing/` that:
1. Explains the practice's fee philosophy (transparent, no hidden costs)
2. Presents the three project tiers (Foundation, Growth, Authority) with investment ranges
3. Presents the five retainer packages with monthly fees
4. Sets expectations for the diagnostic call and proposal process
5. Ends with a CTA to book the diagnostic call

## Step-by-Step Instructions

### Step 1 — Create the EN pricing page

**File to create:** `src/pages/en/pricing.astro`

**Meta title:**
```
Pricing — ICT Consulting & Software Development | Peter Bamuhigire, Kampala
```

**Meta description:**
```
Transparent pricing for ICT consulting, software development, website design, and ongoing support services. Investment ranges for Foundation, Growth, and Authority engagements — Uganda and East Africa.
```

**Full page content:**

```astro
---
import BaseLayout from '@/layouts/BaseLayout.astro';
import CTASection from '@/components/CTASection.astro';
import SectionHeading from '@/components/SectionHeading.astro';

const lang = 'en';
---

<BaseLayout
  title="Pricing — ICT Consulting & Software Development | Peter Bamuhigire, Kampala"
  description="Transparent pricing for ICT consulting, software development, website design, and ongoing support services. Investment ranges for Foundation, Growth, and Authority engagements."
  lang={lang}
  page="pricing"
>

  <!-- HERO -->
  <section class="bg-navy-900 geo-pattern pt-20 md:pt-24 pb-14 md:pb-20">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
      <h1 class="text-4xl md:text-5xl font-bold text-warm-white fade-up">
        Transparent pricing — no surprises
      </h1>
      <div class="mt-4 h-1 w-20 rounded-full bg-gold-400 mx-auto"></div>
      <p class="mt-6 text-lg text-navy-200 leading-relaxed fade-up max-w-2xl mx-auto">
        The ranges below are honest indicators of what different types of engagement typically cost. A specific fee is agreed in writing before any work begins. There are no hidden costs, no change-order surprises, and no billing for work that was not scoped.
      </p>
    </div>
  </section>

  <!-- FEE PHILOSOPHY -->
  <section class="py-12 bg-warm-cream">
    <div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="bg-white rounded-xl p-8 border border-navy-100 shadow-sm">
        <h2 class="text-xl font-bold text-navy-900 mb-4">How fees work</h2>
        <ul class="space-y-3 text-navy-700 text-sm leading-relaxed">
          <li class="flex items-start gap-3">
            <span class="text-gold-500 font-bold mt-0.5">1.</span>
            <span>The diagnostic call (30 minutes, free) establishes scope and confirms whether this practice is the right fit.</span>
          </li>
          <li class="flex items-start gap-3">
            <span class="text-gold-500 font-bold mt-0.5">2.</span>
            <span>A written proposal is provided within 5 business days. It specifies scope, deliverables, timeline, and fee.</span>
          </li>
          <li class="flex items-start gap-3">
            <span class="text-gold-500 font-bold mt-0.5">3.</span>
            <span>No work begins until the proposal is accepted in writing.</span>
          </li>
          <li class="flex items-start gap-3">
            <span class="text-gold-500 font-bold mt-0.5">4.</span>
            <span>Billing is milestone-based for project engagements, monthly in advance for retainers. No invoice is sent without a corresponding agreed deliverable.</span>
          </li>
          <li class="flex items-start gap-3">
            <span class="text-gold-500 font-bold mt-0.5">5.</span>
            <span>If scope changes, a written change request is produced before any additional work is started. No surprises.</span>
          </li>
        </ul>
      </div>
    </div>
  </section>

  <!-- PROJECT TIERS -->
  <section class="py-16 md:py-24 bg-warm-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <SectionHeading
        title="Project engagement tiers"
        subtitle="Three tiers indicate the typical scope, duration, and investment for different types of engagement."
      />

      <div class="grid md:grid-cols-3 gap-8 fade-up">

        <!-- Foundation -->
        <div class="bg-white rounded-2xl border border-navy-200 p-8 shadow-sm hover:shadow-md transition-shadow">
          <p class="text-xs font-semibold text-navy-400 uppercase tracking-widest mb-3">Tier 1</p>
          <h3 class="text-2xl font-bold text-navy-900 mb-2">Foundation</h3>
          <p class="text-navy-500 text-sm mb-6">Single deliverable. Clear scope. First engagement.</p>
          <div class="border-t border-navy-100 pt-6 mb-6">
            <p class="text-3xl font-bold text-navy-900">UGX 3M–15M</p>
            <p class="text-sm text-navy-400 mt-1">≈ USD 800–4,100</p>
          </div>
          <ul class="space-y-2 text-sm text-navy-700 mb-8">
            <li class="flex items-start gap-2"><span class="text-gold-500 mt-0.5">✓</span> Single deliverable</li>
            <li class="flex items-start gap-2"><span class="text-gold-500 mt-0.5">✓</span> Fixed price after diagnostic</li>
            <li class="flex items-start gap-2"><span class="text-gold-500 mt-0.5">✓</span> Up to 3 months' duration</li>
            <li class="flex items-start gap-2"><span class="text-gold-500 mt-0.5">✓</span> Written proposal before work starts</li>
          </ul>
          <p class="text-xs text-navy-400">Examples: systems audit, 5-page website, business plan, feasibility study</p>
        </div>

        <!-- Growth -->
        <div class="bg-navy-900 rounded-2xl border border-gold-400/20 p-8 shadow-lg relative">
          <div class="absolute -top-3 left-1/2 -translate-x-1/2">
            <span class="bg-gold-400 text-navy-900 text-xs font-bold px-3 py-1 rounded-full">Most common</span>
          </div>
          <p class="text-xs font-semibold text-navy-400 uppercase tracking-widest mb-3">Tier 2</p>
          <h3 class="text-2xl font-bold text-warm-white mb-2">Growth</h3>
          <p class="text-navy-400 text-sm mb-6">Multi-phase. Implementation, not just advice.</p>
          <div class="border-t border-navy-700 pt-6 mb-6">
            <p class="text-3xl font-bold text-warm-white">UGX 15M–80M</p>
            <p class="text-sm text-navy-400 mt-1">≈ USD 4,100–22,000</p>
          </div>
          <ul class="space-y-2 text-sm text-navy-300 mb-8">
            <li class="flex items-start gap-2"><span class="text-gold-400 mt-0.5">✓</span> Multiple deliverables in sequence</li>
            <li class="flex items-start gap-2"><span class="text-gold-400 mt-0.5">✓</span> Milestone-based billing</li>
            <li class="flex items-start gap-2"><span class="text-gold-400 mt-0.5">✓</span> 3–6 months' duration</li>
            <li class="flex items-start gap-2"><span class="text-gold-400 mt-0.5">✓</span> Often transitions to retainer</li>
          </ul>
          <p class="text-xs text-navy-500">Examples: ICT strategy + implementation, ERP deployment, website + 6-month SEO retainer</p>
        </div>

        <!-- Authority -->
        <div class="bg-white rounded-2xl border border-navy-200 p-8 shadow-sm hover:shadow-md transition-shadow">
          <p class="text-xs font-semibold text-navy-400 uppercase tracking-widest mb-3">Tier 3</p>
          <h3 class="text-2xl font-bold text-navy-900 mb-2">Authority</h3>
          <p class="text-navy-500 text-sm mb-6">Long-term. Strategic. Multi-country.</p>
          <div class="border-t border-navy-100 pt-6 mb-6">
            <p class="text-3xl font-bold text-navy-900">UGX 80M+</p>
            <p class="text-sm text-navy-400 mt-1">≈ USD 22,000+</p>
          </div>
          <ul class="space-y-2 text-sm text-navy-700 mb-8">
            <li class="flex items-start gap-2"><span class="text-gold-500 mt-0.5">✓</span> Long-term (6–24 months)</li>
            <li class="flex items-start gap-2"><span class="text-gold-500 mt-0.5">✓</span> Project + retainer combination</li>
            <li class="flex items-start gap-2"><span class="text-gold-500 mt-0.5">✓</span> Multi-country or enterprise scale</li>
            <li class="flex items-start gap-2"><span class="text-gold-500 mt-0.5">✓</span> Strategic leadership, not advisory</li>
          </ul>
          <p class="text-xs text-navy-400">Examples: multi-country digital transformation, enterprise ERP + ICT Manager retainer</p>
        </div>

      </div>
    </div>
  </section>

  <!-- RETAINER PACKAGES -->
  <section class="py-16 md:py-24 bg-warm-cream">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <SectionHeading
        title="Ongoing support packages"
        subtitle="Monthly arrangements for organisations that want a structured ongoing relationship after project completion."
      />

      <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6 fade-up">
        {[
          { name: 'Technology Care', range: 'UGX 600,000–1,200,000/month', desc: 'Ongoing maintenance, security updates, and priority support for systems built by this practice.' },
          { name: 'SEO Foundation', range: 'UGX 500,000–800,000/month', desc: 'Monthly on-page SEO, Search Console monitoring, and Google Business Profile posts.' },
          { name: 'Content Growth', range: 'UGX 1,500,000–2,500,000/month', desc: 'Two keyword-optimised blog articles per month — written, optimised, and published.' },
          { name: 'CRO Monitoring', range: 'UGX 700,000–1,000,000/month', desc: 'Monthly conversion rate audits, implementation changes, and quarterly A/B tests.' },
          { name: 'ICT Manager (Fractional)', range: 'UGX 2,500,000–5,000,000/month', desc: '8–16 hours per month of dedicated ICT management: strategy, vendors, training, board reporting.' },
        ].map(pkg => (
          <div class="bg-white rounded-xl p-6 border border-navy-100 shadow-sm fade-up">
            <h3 class="font-bold text-navy-900 text-lg mb-2">{pkg.name}</h3>
            <p class="text-navy-600 text-sm leading-relaxed mb-4">{pkg.desc}</p>
            <p class="text-gold-600 font-semibold text-sm">{pkg.range}</p>
          </div>
        ))}
      </div>

      <div class="mt-10 bg-navy-50 rounded-xl p-6 border border-navy-100 max-w-2xl fade-up">
        <p class="text-sm text-navy-700 leading-relaxed">
          <strong class="text-navy-900">Note on retainer pricing:</strong> The ranges above reflect the scope variation within each package. A specific monthly fee is agreed before the retainer begins — there are no variable charges within the agreed scope. If requirements change, a written adjustment is agreed before any additional work starts.
        </p>
      </div>
    </div>
  </section>

  <!-- PROOF STRIP -->
  <section class="py-10 bg-navy-900">
    <div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
      <p class="text-navy-300 text-sm leading-relaxed">
        Organisations from 10 African countries have trusted this practice over 15 years — pharmaceutical distribution, hospitality, agricultural research, financial services, and NGO programme delivery. The diagnostic call is free. The written proposal is provided within 5 business days.
      </p>
    </div>
  </section>

  <!-- CTA -->
  <CTASection
    title="Start with a free 30-minute diagnostic"
    subtitle="The first conversation establishes whether this practice is the right fit for your situation. If it is not, Peter will tell you — and where possible, refer you to a better option."
    ctaText="Book the diagnostic call"
    ctaHref="/en/contact/"
    lang={lang}
  />

</BaseLayout>
```

### Step 2 — Create the FR pricing page

**File to create:** `src/pages/fr/pricing.astro`

The FR pricing page follows the same structure. Key FR translations:

- H1: `"Tarification transparente — sans surprises"`
- Section: "Comment fonctionnent les honoraires" (How fees work)
- Tier 1: `"Fondation"` — UGX 3M–15M
- Tier 2: `"Croissance"` — UGX 15M–80M — "Le plus courant" badge
- Tier 3: `"Autorité"` — UGX 80M+
- Retainer section: "Formules de support continu"
- CTA: `"Réserver l'appel diagnostic"` → `/fr/contact/`
- Fee philosophy note: same 5 points, translated

Pricing figures remain in UGX with USD equivalents. For Francophone Africa buyers, also include FCFA equivalents (approximate, based on 1 USD ≈ 600 FCFA):
- UGX 3M–15M ≈ FCFA 1,800,000–9,000,000

## Acceptance Criteria

- [ ] `src/pages/en/pricing.astro` created and builds without errors
- [ ] `src/pages/fr/pricing.astro` created and builds without errors
- [ ] EN pricing page includes: fee philosophy, three project tiers with ranges, five retainer packages with ranges, proof strip, CTA
- [ ] FR pricing page mirrors EN structure with correct French copy
- [ ] FR pricing page includes FCFA approximate equivalents for Francophone Africa buyers
- [ ] Growth tier visually differentiated as "Most common" (navy-900 background, gold badge)
- [ ] Links from services page "Ongoing Support" section (Phase 9, file 02) resolve correctly to this page
- [ ] Navigation updated to include "Pricing" link (or accessible from footer)
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day (new page EN + FR + navigation update)
