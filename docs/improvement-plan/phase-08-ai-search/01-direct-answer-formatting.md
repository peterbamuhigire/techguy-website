# 01 — Direct Answer Formatting: QuickAnswer Component and Article Openers

## Skills Applied
- `seo` — `references/seo-reference.md` (AI search, Featured snippets, Direct answers)
- `blog-writer` — `references/blog-templates.md`

## Current State

Existing blog articles open with narrative context — scene-setting, problem framing, or a contrarian hook. This is good for human reading engagement but suboptimal for AI citation. AI systems that synthesise answers from web content prefer: a direct answer to the implied question in the first 100 words, followed by explanatory content.

From the analysis: "No article opens with a direct-answer format. AI systems that cite web content prefer opening paragraphs that directly answer the implied question — not narrative hooks that delay the answer."

## Target State

A reusable `QuickAnswer` component that sits at the top of every article, below the hero and before the opening paragraph. The QuickAnswer provides a 2-4 sentence direct answer to the article's primary question. This element serves two purposes: AI systems index and cite it as the authoritative answer to the question, and human readers get immediate value before deciding whether to read further.

## Why This Matters

When a user asks ChatGPT or Perplexity "how much does software development cost in Uganda?", the AI synthesises an answer from multiple sources. Sources that clearly state the answer to that specific question in the opening of the relevant article are more likely to be cited. Sources that open with a narrative hook before reaching the answer are more likely to be skipped in favour of a source that states the answer directly.

The QuickAnswer is not a replacement for the narrative article — it is an addition. Human readers can skip it; AI systems use it.

## Step-by-Step Instructions

### Step 1 — Build the QuickAnswer component

**File:** `src/components/QuickAnswer.astro` (new file)

```astro
---
interface Props {
  question: string;
  answer: string;
  lang?: 'en' | 'fr';
}

const { question, answer, lang = 'en' } = Astro.props;
const label = lang === 'fr' ? 'Réponse rapide' : 'Quick answer';
---

<div class="bg-navy-50 border border-navy-200 rounded-xl p-6 mb-8">
  <p class="text-xs font-semibold text-navy-400 uppercase tracking-widest mb-2">{label}</p>
  <p class="text-sm font-semibold text-navy-800 mb-2">{question}</p>
  <p class="text-navy-700 leading-relaxed">{answer}</p>
</div>
```

### Step 2 — Per-article QuickAnswer content

Write the QuickAnswer for each article — the `question` is the article's primary search query, the `answer` is the direct 2-4 sentence response.

---

**Article: `choose-it-consultant`**
```astro
<QuickAnswer
  question="How do you choose an IT consultant in East Africa?"
  answer="Evaluate an IT consultant on three criteria: independence (no vendor commissions or affiliations), operational experience (has the consultant implemented systems, not just advised?), and sector-specific references you can contact directly. Ask for two past clients in your sector and call them. A consultant who cannot provide references from clients similar to your organisation is a consultant you should not hire."
/>
```

---

**Article: `custom-software-africa`**
```astro
<QuickAnswer
  question="Is custom software development the right choice for an African business?"
  answer="Custom software is the right choice when: no existing system covers more than 85% of your specific requirements; the cost of workarounds for the remaining 15% exceeds the cost of building; or your business requires integration with local payment systems (mobile money), offline capability, or multilingual interfaces that standard systems do not support. Off-the-shelf software is better when a system exists that closely matches your processes and the total cost of ownership over five years is lower than custom development."
/>
```

---

**Article: `erp-implementation-mistakes`**
```astro
<QuickAnswer
  question="Why do ERP implementations fail in Africa?"
  answer="ERP implementations in Africa fail most commonly for three reasons: inadequate needs assessment (the system is selected before the business processes are documented); insufficient staff training and adoption planning (the system is technically deployed but not adopted); and vendor abandonment after go-live (the vendor's interest ends when the implementation payment is received). The technology itself is rarely the primary cause of failure."
/>
```

---

**Article: `website-costs-uganda`**
```astro
<QuickAnswer
  question="How much does a website cost in Uganda?"
  answer="A professional 5-page business website in Uganda typically costs between UGX 3,000,000 and UGX 5,000,000 (approximately USD 800–1,400) for design, development, hosting setup, and basic SEO. Prices below UGX 1,500,000 typically indicate a templated site with minimal customisation. Prices above UGX 8,000,000 for a simple site indicate either a complex custom build or an overpriced proposal — verify what is included before accepting."
/>
```

---

**Article: `software-development-cost-uganda`** (Phase 7 new article)
```astro
<QuickAnswer
  question="How much does software development cost in Uganda?"
  answer="Software development costs in Uganda vary significantly by project type. A simple business website costs UGX 2,000,000–5,000,000 (USD 550–1,400). A custom web application runs UGX 8,000,000–40,000,000 (USD 2,200–11,000). A full ERP system costs UGX 30,000,000–200,000,000 or more (USD 8,000–55,000). These ranges reflect the Kampala market in 2025–2026 and assume professional delivery with documentation and training included."
/>
```

---

**Article: `erp-implementation-east-africa`** (Phase 7 new article)
```astro
<QuickAnswer
  question="How much does ERP implementation cost in East Africa?"
  answer="ERP implementation costs in East Africa range from USD 5,000–25,000 for a simple, single-location SME implementation to USD 100,000–500,000 or more for a multi-country enterprise deployment. The most common budget underestimation covers: staff training and adoption, data migration, and post-implementation support. Budget 30-40% above the quoted software and implementation cost for these hidden costs."
/>
```

---

**FR Article: `cout-developpement-web-afrique-francophone`** (Phase 7 new article)
```astro
<QuickAnswer
  question="Combien coûte le développement web en Afrique francophone ?"
  answer="Un site web vitrine professionnel en Afrique francophone coûte généralement entre 500 000 et 1 500 000 FCFA (850 à 2 500 USD) pour la conception, le développement et le référencement de base. Un site avec système de gestion de contenu se situe entre 1 000 000 et 3 000 000 FCFA. Les prix en dessous de 200 000 FCFA indiquent généralement un modèle sans personnalisation significative — vérifiez ce qui est inclus avant d'accepter."
  lang="fr"
/>
```

### Step 3 — Implementation in existing articles

**For each existing EN article in `src/pages/en/blog/`:**

1. Import the component:
```astro
import QuickAnswer from '@/components/QuickAnswer.astro';
```

2. Place the QuickAnswer immediately after the article hero section and before the first body paragraph. In the existing article template, this is after the `<h1>` and metadata line but before the first `<p>` of body copy.

3. The `question` should match the article's primary keyword phrased as a question.
4. The `answer` should be 2-4 sentences, factually complete, and standalone.

### Step 4 — Add QuickAnswer to all Phase 7 new articles

Every new article created in Phase 7 should include a QuickAnswer from the moment of creation — not retrofitted later.

## Acceptance Criteria

- [ ] `src/components/QuickAnswer.astro` created with `question`, `answer`, and `lang` props
- [ ] QuickAnswer added to all 12 existing EN blog articles
- [ ] QuickAnswer added to all Phase 7 new articles (EN and FR) at time of creation
- [ ] QuickAnswer content for all 12 existing articles written in full (not placeholder)
- [ ] FR QuickAnswer uses `lang="fr"` and displays "Réponse rapide" label
- [ ] Component renders with appropriate styling (navy-50 background, clear visual separation)
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day (write 12+ QuickAnswer content blocks + build component + implementation)
