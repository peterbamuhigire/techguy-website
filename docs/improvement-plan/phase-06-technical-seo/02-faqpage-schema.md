# 02 — FAQPage Schema: The Highest-ROI AI Search Signal on the Site

## Skills Applied
- `seo` — `references/seo-reference.md` (FAQPage JSON-LD, AI search optimisation)

## Current State

No `FAQPage` schema exists anywhere on the site. No dedicated FAQ sections exist on service pages, the about page, or the contact page.

From the analysis: "No FAQPage schema. This is the single highest-ROI structured data type for AI search — GPT, Gemini, and Perplexity all use FAQ schema as a primary signal for synthesised answers."

## Current Score

**AI and LLM search optimisation: 4.5/10** (before Phase 6)

## Target State

`FAQPage` JSON-LD schema on five priority pages, each with 4-6 questions and complete, standalone answers. FAQ sections also rendered as visible HTML on each page (schema must match visible content — Google penalises hidden FAQ schema).

## Target Score

**AI and LLM search optimisation: 6.5/10** (+2.0)

## Why This Matters

When a potential client asks ChatGPT, Gemini, or Perplexity "how much does an IT consultant cost in Uganda?" or "what should I look for in a software developer in East Africa?", the AI searches for authoritative, structured answers. FAQPage schema marks each question-and-answer pair as a discrete, authoritative unit. Pages with FAQPage schema are significantly more likely to be cited in AI-generated answers than equivalent pages without it.

## Step-by-Step Instructions

### FAQPage Component

**File:** `src/components/FAQSection.astro` (new file)

```astro
---
interface FAQItem {
  question: string;
  answer: string;
}

interface Props {
  items: FAQItem[];
  heading?: string;
  lang?: 'en' | 'fr';
}

const {
  items,
  heading,
  lang = 'en',
} = Astro.props;

const defaultHeading = lang === 'fr' ? 'Questions fréquentes' : 'Frequently asked questions';
const displayHeading = heading ?? defaultHeading;

const faqSchema = {
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": items.map(item => ({
    "@type": "Question",
    "name": item.question,
    "acceptedAnswer": {
      "@type": "Answer",
      "text": item.answer
    }
  }))
};
---

<section class="py-16 md:py-20 bg-warm-cream">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
    <h2 class="text-2xl md:text-3xl font-bold text-navy-900 mb-10">{displayHeading}</h2>
    <div class="space-y-6" x-data="{ open: null }">
      {items.map((item, i) => (
        <div class="bg-white rounded-xl border border-navy-100 overflow-hidden">
          <button
            class="w-full text-left px-6 py-5 flex items-center justify-between gap-4 font-semibold text-navy-900 hover:text-gold-600 transition-colors"
            x-on:click={`open === ${i} ? open = null : open = ${i}`}
            aria-expanded={`open === ${i}`}
          >
            <span>{item.question}</span>
            <svg class="w-5 h-5 flex-shrink-0 text-gold-500 transition-transform" x-bind:class={`open === ${i} ? 'rotate-180' : ''`} fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
            </svg>
          </button>
          <div
            class="px-6 pb-5 text-navy-700 leading-relaxed text-sm"
            x-show={`open === ${i}`}
            x-transition
          >
            <Fragment set:html={item.answer} />
          </div>
        </div>
      ))}
    </div>
  </div>
  <script type="application/ld+json" set:html={JSON.stringify(faqSchema)} />
</section>
```

---

### Priority Page 1 — Homepage (`/en/index.astro`)

**Add below the services section, above the CTA section.**

```astro
import FAQSection from '@/components/FAQSection.astro';

const homepageFAQs = [
  {
    question: "What does an ICT consultant in Uganda actually do?",
    answer: "An ICT consultant assesses your organisation's technology situation — systems, infrastructure, costs, and risks — and produces a structured plan for improving it. This includes recommending systems and vendors, managing implementation, training staff, and providing ongoing strategic guidance. Unlike a vendor representative, an independent ICT consultant has no financial incentive to recommend any particular product."
  },
  {
    question: "Does Peter Bamuhigire work with organisations outside Uganda?",
    answer: "Yes. The practice has delivered engagements in Uganda, Kenya, Sierra Leone, Senegal, Guinea, Rwanda, and the United Kingdom. Engagements are conducted in English and French. Remote engagement is possible for advisory and strategy work; implementation work typically requires some on-site presence."
  },
  {
    question: "What is the difference between ICT consulting and software development?",
    answer: "ICT consulting focuses on strategy and systems: which technology your organisation needs, how it should be configured, and how to manage the transition. Software development is the building of custom applications when existing systems do not meet your requirements. Many engagements combine both: the consulting work identifies the requirement; the development work builds the solution."
  },
  {
    question: "How quickly can Peter respond to an enquiry?",
    answer: "Enquiries submitted via the contact form or WhatsApp (+256 784 464178) receive a response within 1 business day, usually sooner. Initial diagnostic calls are typically scheduled within 3-5 business days. Working hours: Monday to Friday, 08:00–17:00 EAT (East Africa Time, UTC+3)."
  }
];
```

```astro
<!-- In the page body, below the testimonials section: -->
<FAQSection items={homepageFAQs} heading="Common questions" />
```

---

### Priority Page 2 — Services page (`/en/services.astro`)

**Add at the bottom of the services page, above the CTA section.**

```javascript
const servicesFAQs = [
  {
    question: "How much does ICT consulting cost in Uganda?",
    answer: "ICT consulting fees in Uganda vary by scope and duration. A one-day systems audit and report typically ranges from UGX 800,000 to UGX 2,000,000 (approximately USD 200–550). A full ICT strategy engagement — including audit, roadmap, and 90-day follow-up — is scoped individually based on the organisation's size and complexity. A formal written quote is provided after the initial diagnostic call. There is no obligation to proceed."
  },
  {
    question: "What types of software can Peter build?",
    answer: "The practice builds web applications, ERP systems, SaaS platforms, mobile applications, and database-driven management systems. Three proprietary platforms have been built and are commercially available: Maduuka (business management for SMEs), Aqar (property management for Ugandan landlords), and Longhorn ERP (enterprise resource planning for distribution businesses). Custom software is built to specification for organisations whose requirements are not covered by existing platforms."
  },
  {
    question: "Does Peter build websites for businesses in Uganda?",
    answer: "Yes. Website development is a core service. Sites are built as high-performance static websites — they load in under 2 seconds on mobile networks — with Uganda-specific SEO, Google Search Console setup, and mobile-first responsive design included as standard. A simple 5-page business website starts from approximately UGX 3,000,000–5,000,000 (USD 800–1,400). A formal quote is provided within 24 hours of a briefing."
  },
  {
    question: "Can Peter work in French as well as English?",
    answer: "Yes. Peter Bamuhigire is bilingual in English and French. The practice delivers consulting, training, documentation, and software interfaces in both languages. This is particularly relevant for organisations operating across East African and West African francophone markets — engagements have been delivered in French in Senegal, Sierra Leone, and Guinea."
  },
  {
    question: "What industries does the practice serve?",
    answer: "The practice has delivered engagements across six sectors: pharmaceutical distribution, hospitality, property management, agricultural research, financial services, and NGO programme delivery. The common thread across all sectors is organisations that need technology to work reliably across African business environments — cross-border, multilingual, and under variable infrastructure conditions."
  }
];
```

---

### Priority Page 3 — IT Consulting Uganda page (`/en/it-consulting-uganda/`)

```javascript
const ugandaConsultingFAQs = [
  {
    question: "How much does an IT consultant cost in Uganda?",
    answer: "IT consulting fees in Uganda vary by scope. A single-day systems audit with a written report typically costs between UGX 800,000 and UGX 2,000,000 (approximately USD 200–550). A project-based engagement — for example, selecting and implementing an ERP system — is scoped individually. Monthly retainer arrangements are available for organisations that need ongoing ICT management support. A formal written quote is provided after the initial 30-minute diagnostic call, at no cost."
  },
  {
    question: "What should I look for when hiring an IT consultant in Kampala?",
    answer: "Look for three things: independence (no vendor affiliations or commissions), operational experience (has the consultant actually implemented systems, or only advised?), and sector experience relevant to your industry. Ask for a list of past clients and specific deliverables — not just a list of capabilities. A consultant who cannot give you specific examples from past engagements is a consultant who has not done the work."
  },
  {
    question: "How long does an ICT consulting engagement take?",
    answer: "A systems audit with a written report typically takes 3–5 business days of elapsed time. A full ICT strategy engagement — audit, roadmap, and implementation planning — typically takes 4–6 weeks. An ERP implementation project varies from 2 months (single-location, straightforward system) to 12 months or more (multi-country, complex data migration). All timelines are provided in the formal quote after the initial diagnostic."
  },
  {
    question: "Does Peter Bamuhigire work with NGOs and public sector organisations in Uganda?",
    answer: "Yes. Past engagements have included NGOs operating in Uganda and across the region, and institutional clients including BIRDC (Banana Industrial Research and Development Center). The methodology is the same as for private sector organisations — an honest audit of the current technology situation, followed by a prioritised improvement plan. Procurement requirements and reporting formats for NGO and public sector clients are accommodated."
  }
];
```

---

### Priority Page 4 — Website Development Uganda page (`/en/website-development-uganda/`)

```javascript
const ugandaWebFAQs = [
  {
    question: "How much does a website cost in Uganda?",
    answer: "A professional 5-page business website in Uganda typically costs between UGX 3,000,000 and UGX 5,000,000 (approximately USD 800–1,400) for design, development, and basic SEO. More complex sites — with e-commerce, booking systems, or custom web applications — are scoped individually. A formal written quote is provided within 24 hours of a briefing, at no charge."
  },
  {
    question: "How long does it take to build a website in Uganda?",
    answer: "A standard 5-page business website is typically delivered within 2–3 weeks of the brief being confirmed and content being provided. Larger sites take longer; complex web applications are scoped individually. The timeline is confirmed in the formal quote."
  },
  {
    question: "Will my website rank in Google in Uganda?",
    answer: "Every website delivered by this practice includes basic on-page SEO, Google Search Console setup and verification, and a Google Business Profile optimisation brief. These are included as standard — not as optional add-ons. Whether a website ranks for competitive terms depends on the specific keywords, the competition in that space, and the ongoing SEO work done after launch. A realistic assessment of your specific ranking opportunity is provided as part of the briefing."
  },
  {
    question: "Can I update my website content myself after it is built?",
    answer: "Yes. Every website is delivered with a handover session that covers how to update text content, replace images, and add new pages if needed. For organisations that prefer not to manage updates themselves, monthly content management retainers are available."
  },
  {
    question: "Do you build websites in WordPress for Uganda?",
    answer: "The preferred approach is static site development — no WordPress, no database, no unnecessary plugins. Static sites load 3–5x faster than equivalent WordPress sites on Ugandan mobile networks, are more secure (no database to attack), and are significantly cheaper to host. For organisations that require a content management system for frequent updates by non-technical staff, a headless CMS approach is recommended over WordPress. WordPress is only used when there is a specific, compelling requirement that cannot be met another way."
  }
];
```

---

### Priority Page 5 — Contact page (`/en/contact.astro`)

**Add above the contact form.**

```javascript
const contactFAQs = [
  {
    question: "What happens after I submit the contact form?",
    answer: "You receive an acknowledgement within 1 business day (usually sooner). Peter will review your message and either respond directly with information or schedule a 30-minute diagnostic call. The diagnostic call is free — it is not a sales call. By the end of it, you will know whether this practice is the right fit for your situation."
  },
  {
    question: "Is the initial consultation free?",
    answer: "Yes. The first 30-minute diagnostic call is free of charge. The purpose of the call is to understand your situation, establish whether there is a genuine fit, and tell you honestly what the engagement would involve. If the fit is not right, Peter will say so — and where possible, will refer you to a more appropriate option."
  },
  {
    question: "Can I contact Peter directly on WhatsApp?",
    answer: "Yes. WhatsApp is the preferred channel for urgent matters: +256 784 464178. Working hours are Monday to Friday, 08:00–17:00 EAT (East Africa Time, UTC+3). For detailed project briefs, the contact form is more appropriate — it allows you to include all relevant context and attach documents if needed."
  }
];
```

---

### FR Equivalents

For each FR page equivalent, translate the FAQs into French using formal francophone African register (vouvoiement throughout). The key pages for FR FAQPage schema are:

- `/fr/index.astro` — translate `homepageFAQs`
- `/fr/consultant-informatique-afrique/` — translate `ugandaConsultingFAQs` with Francophone Africa context (replace Uganda-specific references with Francophone Africa references)
- `/fr/contact.astro` — translate `contactFAQs`

**Sample FR translation for contact FAQ 1:**

```javascript
{
  question: "Que se passe-t-il après l'envoi du formulaire de contact ?",
  answer: "Vous recevez un accusé de réception dans un délai d'un jour ouvrable (généralement plus tôt). Peter examinera votre message et répondra directement avec des informations ou planifiera un appel diagnostic de 30 minutes. L'appel diagnostic est gratuit — ce n'est pas une démarche commerciale. À l'issue de cet échange, vous saurez si ce cabinet correspond à votre situation."
}
```

## Acceptance Criteria

- [ ] `src/components/FAQSection.astro` created with Alpine.js accordion, JSON-LD injection, and `lang` prop
- [ ] Homepage includes FAQ section with 4 questions (EN and FR)
- [ ] Services page includes FAQ section with 5 questions (EN)
- [ ] IT Consulting Uganda page includes FAQ section with 4 questions
- [ ] Website Development Uganda page includes FAQ section with 5 questions
- [ ] Contact page includes FAQ section with 3 questions (EN and FR)
- [ ] All FAQ answers are standalone and complete (no answer requires reading another answer to make sense)
- [ ] FAQPage schema validated in Google Rich Results Test — all pages show FAQPage entity detected
- [ ] FAQ sections are visible in the rendered HTML (not hidden) — schema matches visible content
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day (writing all Q&As in full + implementation)
