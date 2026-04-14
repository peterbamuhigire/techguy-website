# 02 — FAQ Blocks for All Articles: Questions Written in Full

## Skills Applied
- `seo` — `references/seo-reference.md` (FAQPage JSON-LD, AI citation signals)
- `east-african-english` — formal register, British spelling

## Current State

Phase 6, file 02 built the `FAQSection` component and specified FAQ blocks for 5 priority pages (homepage, services, Uganda geo pages, contact). Phase 7 articles are specified to include FAQSection blocks. This file writes the specific question-and-answer content for the 5 highest-traffic existing articles that do not yet have FAQ blocks.

## Target State

Every article on the site has a `FAQSection` with 3-4 questions. This file provides the complete Q&A content for the 5 existing articles with the highest traffic potential.

## Why This Matters

The FAQPage JSON-LD schema marks each Q&A pair as a discrete, authoritative unit. AI systems use FAQ schema as a primary input for synthesising answers to user questions. An article about "ERP implementation mistakes" with a FAQ block containing "What are the most common ERP implementation mistakes in Africa?" will be cited by AI systems answering that question — even if the user did not search for that exact phrase.

---

## FAQ Block 1 — `choose-it-consultant` article

Add at the bottom of the article body, before the CTASection:

```astro
<FAQSection
  items={[
    {
      question: "How do I verify that an IT consultant's references are genuine?",
      answer: "Ask the consultant to provide the direct phone number or email address of the client contact — not a company email or general enquiries address. Call or email directly, introduce yourself as someone evaluating the consultant, and ask three questions: Did the project deliver what was promised? Was it completed on time and within budget? Would you hire this consultant again? A genuine reference will answer all three questions honestly. A planted or coached reference will give uniformly positive answers without hesitation or nuance."
    },
    {
      question: "What credentials should an IT consultant in East Africa have?",
      answer: "Relevant credentials include: ITIL Foundation (IT service management methodology), PMP or Google Project Management Certificate (project delivery), and vendor certifications in systems they recommend (e.g. AWS, Cisco CCNA, Microsoft). Academic credentials in IT or business are useful context. However, no credential substitutes for direct, demonstrable experience in the specific type of engagement you need — always ask for references from similar projects, not just a list of certificates."
    },
    {
      question: "How much should an IT consultant cost in Uganda?",
      answer: "Day rates for experienced IT consultants in Uganda range from UGX 400,000 to UGX 1,500,000 (approximately USD 110–410) depending on specialisation and experience. Project-based fees vary widely by scope. A basic systems audit with a written report typically costs UGX 800,000–2,000,000. A full ICT strategy engagement costs UGX 3,000,000–15,000,000. Rates significantly below these ranges typically indicate a junior consultant or one with limited relevant experience."
    },
    {
      question: "Should I hire a local IT consultant or an international firm for my Uganda or East Africa project?",
      answer: "A local consultant — one with direct operational experience in Uganda and East Africa — has significant advantages for most engagements: knowledge of local infrastructure conditions, understanding of local regulatory and business environments, ability to be on-site without international travel costs, and relationships with local vendors. International firms bring broader methodology and sometimes more senior resources, but at substantially higher costs and with less contextual knowledge. For most Ugandan and East African engagements, a locally-based consultant with regional experience will deliver better value than an international firm."
    }
  ]}
  heading="Common questions about hiring an IT consultant in East Africa"
/>
```

---

## FAQ Block 2 — `erp-implementation-mistakes` article

```astro
<FAQSection
  items={[
    {
      question: "What is the most common reason ERP implementations fail in Africa?",
      answer: "The most common cause of ERP failure in Africa is not technology — it is process. Organisations select and implement an ERP system before their own business processes are documented and standardised. The ERP then automates the inconsistencies rather than resolving them. The result is a system that staff adapt around rather than adopt. Before selecting any ERP, document your actual workflows — not the workflows you wish you had — and build the system specification from those."
    },
    {
      question: "How long does ERP implementation take for a Ugandan business?",
      answer: "A single-location Ugandan business implementing a standard ERP for the first time should plan for 3–6 months from project start to full operational go-live. This includes: initial setup and data migration (4–6 weeks), staff training and parallel running (4–8 weeks), and a go-live stabilisation period (4–6 weeks). Multi-location or cross-border implementations take longer — typically 6–18 months depending on complexity. Timelines shorter than 3 months for a full ERP implementation should be treated with scepticism."
    },
    {
      question: "What does ERP implementation typically cost in Uganda?",
      answer: "ERP implementation costs in Uganda depend heavily on the system and scope. A small business ERP (e.g. Maduuka, Longhorn ERP, or a basic QuickBooks implementation) typically costs UGX 5,000,000–20,000,000 (USD 1,400–5,500) for configuration, data migration, and training. A larger enterprise ERP (SAP, Oracle, or Microsoft Dynamics) for a medium-to-large organisation starts at USD 30,000 and can exceed USD 200,000 for multi-location deployments. The software licensing cost is often less than the implementation cost — always request a breakdown of both."
    },
    {
      question: "How do I ensure my staff actually use the ERP after implementation?",
      answer: "Staff adoption is determined almost entirely by two factors: whether the system was designed around their actual workflows (not around the system's default structure), and whether the training was role-specific and in a language the staff speak confidently. Adoption programmes that train all staff at once on the full system consistently underperform; those that train staff on only the modules they will use, in their working language, with follow-up support for the first 30 days of live operation, consistently outperform. Budget for adoption — it is not optional, and it is not covered by the implementation quote."
    }
  ]}
  heading="Frequently asked questions about ERP implementation in Africa"
/>
```

---

## FAQ Block 3 — `custom-software-africa` article

```astro
<FAQSection
  items={[
    {
      question: "How do I know if I need custom software or if an existing system will work?",
      answer: "Start with this test: identify three existing systems that might meet your requirements and score each against your specific needs. If the best available system covers less than 80% of your requirements without workarounds, custom development is likely the right choice. If a system covers 90%+ of your requirements and the workarounds for the remaining 10% are low-cost, buy rather than build. The key variable is the total cost of workarounds over five years — which buyers almost never calculate when evaluating off-the-shelf software."
    },
    {
      question: "How much does custom software cost to maintain after it is built?",
      answer: "Custom software maintenance costs vary by complexity, but a reasonable budget for an actively used system is 15–20% of the original build cost per year. This covers: bug fixes, security updates, small enhancements, and compatibility updates as the technology stack evolves. Systems with no maintenance budget will degrade over time — they will not fail immediately, but they will become progressively harder to update and extend. Budget for maintenance from the start, not as an afterthought."
    },
    {
      question: "Who owns the source code when custom software is built?",
      answer: "In a well-structured custom development contract, the client owns the source code upon full payment. This means: you have the right to the code, to modify it, to give it to another developer to continue, and to deploy it on any server. Some developers retain code ownership and license the software to you — this creates dependency on the original developer. Before signing any development contract, confirm in writing that full source code ownership transfers to you at the end of the engagement."
    }
  ]}
  heading="Common questions about custom software development in Africa"
/>
```

---

## FAQ Block 4 — `business-must-go-digital` article

```astro
<FAQSection
  items={[
    {
      question: "What does 'going digital' actually mean for a Ugandan business?",
      answer: "For most Ugandan businesses, 'going digital' means three concrete changes: (1) replacing manual and paper-based processes with digital systems — invoicing, inventory, customer records; (2) establishing a professional online presence — website, Google Business Profile, LinkedIn; and (3) using digital channels for customer communication and marketing. These three changes are independent — a business can do them in any order, starting with whichever produces the fastest value. They do not require replacing everything at once."
    },
    {
      question: "What is the minimum digital investment a Ugandan business should make?",
      answer: "The minimum effective digital presence for a Ugandan business is: a professional website (not a Facebook page — Facebook pages cannot be found via Google search for most queries), a verified Google Business Profile (free, takes 1–2 weeks to verify), and a WhatsApp Business account (free, provides basic CRM functionality). Together, these three investments cost under UGX 5,000,000 for the website and nothing for the other two — and they establish the baseline from which everything else follows."
    },
    {
      question: "How long before a website starts producing leads for a Ugandan business?",
      answer: "A newly launched website with basic SEO typically takes 3–6 months to begin appearing in relevant Google search results. This is a Google timeline, not a developer timeline — Google takes time to crawl, index, and rank new content. In the first 3 months, leads from the website will be primarily from direct navigation (people who were told about the site) and social media referrals. Organic search leads begin at months 3–6 and grow from there. A Google Business Profile typically begins producing local search visibility within 30–60 days of verification."
    }
  ]}
  heading="Questions about digital transformation for Ugandan businesses"
/>
```

---

## FAQ Block 5 — `why-visitors-leave-website-3-seconds` article

```astro
<FAQSection
  items={[
    {
      question: "How fast should a website load in Uganda?",
      answer: "A website should load in under 3 seconds on a 3G mobile connection — the most common connection type used by Ugandan internet users. Under 2 seconds is better. Over 5 seconds loses more than half of visitors before the page is visible. Test your site's load speed at PageSpeed Insights (pagespeed.web.dev) — enter your URL and check the 'Mobile' score. A score below 70 indicates a site that will lose a significant proportion of its Ugandan visitors before they see the first screen."
    },
    {
      question: "What causes websites to load slowly in Uganda?",
      answer: "The most common causes of slow-loading websites in Uganda are: unoptimised images (the single largest contributor — a 3MB hero image that has not been compressed can take 15+ seconds to load on 3G); too many WordPress plugins (each plugin adds HTTP requests and JavaScript); uncompressed JavaScript and CSS files; and no content delivery network (CDN). All four of these are avoidable — they are the result of building a site without optimising it for the connection speeds of the intended audience."
    },
    {
      question: "How do I test my website's speed on a Ugandan mobile connection?",
      answer: "Use Google's PageSpeed Insights (pagespeed.web.dev) — it simulates mobile network conditions and provides a score from 0–100 with specific recommendations. A score of 90+ is excellent; 70–89 is acceptable; below 70 means significant improvement is needed. For a more realistic Ugandan-condition test, use WebPageTest.org and select a test location in Nairobi (the nearest available) with a 3G network throttle. The result will be close to what a Ugandan user on a standard mobile data connection actually experiences."
    }
  ]}
  heading="Questions about website speed and performance in Uganda"
/>
```

---

## Implementation Instructions

For each of the five articles:

1. Import `FAQSection` at the top of the Astro frontmatter:
```astro
import FAQSection from '@/components/FAQSection.astro';
```

2. Place the `<FAQSection>` call in the article body, after the main body content and before the final `<CTASection>`.

3. The `FAQSection` component (built in Phase 6, file 02) handles both the visible accordion UI and the `FAQPage` JSON-LD schema injection automatically.

## Acceptance Criteria

- [ ] FAQ blocks added to `choose-it-consultant` article (4 questions)
- [ ] FAQ blocks added to `erp-implementation-mistakes` article (4 questions)
- [ ] FAQ blocks added to `custom-software-africa` article (3 questions)
- [ ] FAQ blocks added to `business-must-go-digital` article (3 questions)
- [ ] FAQ blocks added to `why-visitors-leave-website-3-seconds` article (3 questions)
- [ ] All FAQ answers are standalone and complete without requiring the rest of the article
- [ ] All FAQ answers include specific numbers, prices (in UGX and USD where applicable), and named tools
- [ ] FAQPage schema validated in Google Rich Results Test for all 5 articles
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day (Q&A content already written above; implementation and validation)
