# Priority Roadmap — April 2026

Skills that flag each item are noted in brackets. Effort: S = small (hours to 1 day), M = medium (2-5 days), L = large (1-2 weeks).

---

## P0 — Critical: Fix This Week

*These items actively hurt trust, discoverability, or data integrity. Completing all P0 items is estimated to move the overall score from 6.6 to approximately 7.0/10.*

---

### P0-1: Connect GA4 and Google Search Console
**File:** `src/layouts/BaseLayout.astro:169-182`  
**Score impact:** Trust and measurement maturity: 4.5 → 6.5 (+2.0); Technical SEO: 6.5 → 7.0 (+0.5)  
**What to do:** Replace `G-XXXXXXXXXX` with the real GA4 Measurement ID from analytics.google.com. Replace `REPLACE_WITH_GSC_TOKEN` with the real Search Console HTML tag. Replace `REPLACE_WITH_BING_TOKEN` with the real Bing Webmaster meta tag.  
**Why it matters:** Without analytics, no measurement exists for any optimisation decision. Peter cannot know which pages drive enquiries, whether the bilingual strategy works, or whether blog traffic converts. Every other roadmap item depends on this data. \[`seo-audit`, `seo`\]  
**Effort: S** (30 minutes once GA4 and GSC properties are created)

---

### P0-2: Fix hreflang to target Francophone Africa, not France
**File:** `src/layouts/BaseLayout.astro:142`  
**Score impact:** Internationalisation: 7.5 → 8.0 (+0.5); Technical SEO: incremental gain  
**What to do:** Change `hreflang="fr-FR"` to `hreflang="fr"`.  
**Why it matters:** `fr-FR` signals to Google that the French content targets users in France. The site's strategy and MEMORY note explicitly targets Francophone Africa (DRC, Sénégal, Côte d'Ivoire, Cameroun). This one attribute change may improve ranking for Francophone African queries. \[`i18n`, `seo-audit`\]  
**Effort: S** (5 minutes)

---

### P0-3: Fix the newsletter form — it does not submit
**File:** `src/pages/en/blog.astro:275-276`  
**Score impact:** Trust and measurement maturity: +0.5; CRO and lead generation: +0.3  
**What to do:** The form uses `action="#"` and `@submit.prevent="submitted = true"`. No email is ever collected. Connect to a real email collection endpoint (Mailchimp, ConvertKit, or a PHP handler similar to the contact form).  
**Why it matters:** Any visitor who enters their email for the newsletter receives a false confirmation. This is a trust issue if discovered. \[`form-ux-design`, `cro-audit`\]  
**Effort: S** (2-3 hours to connect an ESP or build a PHP handler)

---

### P0-4: Create a 404 page
**File:** None — `src/pages/404.astro` does not exist; `dist/404.html` does not exist  
**Score impact:** Technical SEO: 6.5 → 7.0 (+0.5); Trust and measurement maturity: incremental  
**What to do:** Create `src/pages/404.astro` with the site's brand styling, a helpful message, links to the homepage and services, and a "contact us" CTA.  
**Why it matters:** Any broken link, mistyped URL, or removed page currently renders nothing (Astro default or server error). Broken links are not uncommon given the bilingual slug structure and the growing blog. \[`seo-audit`, `cro-audit`\]  
**Effort: S** (2 hours)

---

### P0-5: Block the API route from search engine crawling
**File:** `public/robots.txt`  
**Score impact:** Technical SEO: incremental (+0.2)  
**What to do:** Add `Disallow: /api/` to robots.txt.  
**Why it matters:** The CSRF token endpoint (`/api/csrf-token.php`) is currently crawlable. It returns JSON and should not be indexed. \[`seo-audit`\]  
**Effort: S** (5 minutes)

---

## P1 — High Value: This Month

*Items with clear ROI on conversion or SEO; implementable without a rebuild. Completing all P1 items after P0 is estimated to move the score from ~7.0 to approximately 7.5–8.0/10.*

---

### P1-1: Rewrite the homepage hero headline
**File:** `src/pages/en/index.astro:75-78` and equivalent in `src/pages/fr/index.astro`  
**Score impact:** Sales copywriting and CTA architecture: +0.7; Brand positioning: +0.5  
**What to do:** Replace "Building Technology Solutions Across Africa & Beyond" with a benefit-led, audience-qualifying headline that scores 12+/16 on the 4 U's. Options:
- "ICT consulting and custom software for East African businesses that need technology to actually work"
- "When your business operations depend on technology running correctly — across borders, in any language"
- "The IT consultant businesses in 10 African countries call when the problem is too complex for generalists"

Choose one and test it. Then update the FR equivalent.  
**Why it matters:** The hero headline is read by every visitor. The current headline fails all four 4 U's criteria. A rewrite has the highest single-page conversion impact of any copy change. \[`sales-copywriting`, `agency-positioning`\]  
**Effort: S** (1 day including FR translation)

---

### P1-2: Replace testimonial placeholders with real social proof
**File:** `src/pages/en/index.astro:390-440`  
**Score impact:** Trust and measurement maturity: +0.8; CRO and lead generation: +0.5  
**What to do:** For the Dynapharm Africa and Excelsis Garden Hotels testimonials — obtain individual contact names, real photographs, and at least one specific metric (number of staff trained, time to deployment, cost reduction, leads generated). Update the testimonial cards to show name, role, photo, and outcome.  
**Why it matters:** Anonymous testimonials with gradient-and-initials avatars score near-zero on the CRO trust-signal checklist (Fogg surface credibility). Named, photo-backed, outcome-specific testimonials score 4-5/5. This is a high-confidence, no-A/B-test-required improvement. \[`cro-audit`, `sales-copywriting`, `brand-alignment`\]  
**Effort: M** (getting real content takes time; implementation is 1 day)

---

### P1-3: Add BlogPosting + Author schema to every blog article
**Files:** All 12 files in `src/pages/en/blog/` and 11 in `src/pages/fr/blog/`  
**Score impact:** LLM / AI search optimisation: +0.8; Technical SEO: +0.3  
**What to do:** Add a `BlogPosting` JSON-LD block to each blog article template with: `headline`, `datePublished`, `dateModified`, `author` (Person with name, jobTitle, url, sameAs), `publisher` (Organisation), `description`.  
**Why it matters:** E-E-A-T signals on blog posts are required for AI search citation. Google's quality raters and LLMs use author schema to assess whether to trust informational content. Peter's certifications (CCNA, MCSA, AWS CCP, ITIL, PMP) are named in the about page but not in structured data. This is the primary LLM/AI search optimisation action. \[`seo`, `seo-audit`\]  
**Effort: M** (create a blog layout template with schema; apply to all articles)

---

### P1-4: Add FAQPage schema to contact, services, and key blog articles
**Files:** `src/pages/en/contact.astro`, `src/pages/en/services.astro`, and the 3 highest-traffic blog articles  
**Score impact:** LLM / AI search optimisation: +0.8; Content SEO: +0.3  
**What to do:** Identify the 5-7 questions a prospect would have at each page (e.g. "How long does an ICT consulting engagement take?", "Do you offer ongoing support after project completion?", "What does a typical engagement cost?"). Add these as visible Q&A sections AND as `FAQPage` JSON-LD.  
**Why it matters:** FAQ schema is the highest-ROI LLM/AI search signal. It provides structured direct-answer content that LLMs cite directly. For a consultant whose clients search "IT consultant Uganda FAQ" or ask ChatGPT "how much does IT consulting cost in Uganda", this is the bridge to AI-generated answers citing Peter's site. \[`seo`, `seo-audit`\]  
**Effort: M** (writing the Q&As is the slow part; implementation is straightforward)

---

### P1-5: Differentiate page-level keyword targets to eliminate cannibalisation
**Files:** `src/layouts/BaseLayout.astro` via page-level titles in each `.astro` file  
**Score impact:** Content SEO and TAYA coverage: +0.5; Technical SEO: +0.2  
**What to do:**
- Homepage: "IT Consultant Kampala Uganda — Peter Bamuhigire" (keep current)
- Services: "Software Development & ICT Consulting Uganda — Kampala" (differentiate from homepage)
- About: "About Peter Bamuhigire — ERP Specialist & IT Consultant, East Africa"
- Blog: "ICT Insights for African Businesses — Peter Bamuhigire"
- Contact: "Hire an IT Consultant in Kampala — Book a Consultation"

**Why it matters:** Three pages (homepage, services, about, contact) currently target nearly identical keywords. This creates cannibalisation — they compete with each other rather than capturing different queries. \[`seo-audit`\]  
**Effort: S** (title tag updates only; 2-3 hours)

---

### P1-6: Add a mid-funnel CTA — the "30-minute ICT diagnostic"
**Files:** `src/pages/en/services.astro`, `src/pages/en/index.astro`  
**Score impact:** CRO and lead generation: +0.6; Sales copywriting and CTA architecture: +0.4  
**What to do:** Create a self-qualifying intermediate offer: "Not sure what you need? Book a free 30-minute ICT diagnostic call. We will review your current systems and tell you honestly what would help most." Link this to the contact form with a pre-selected service option.  
**Why it matters:** The CTA ladder currently has only rung 1 (Explore) and rung 5 (Convert). Rung 4 (Self-qualify) is missing. This means prospects who are interested but uncertain default to "Book a Consultation" — which has high commitment friction — or leave. A diagnostic call offer reduces friction and filters serious prospects before a full consultation. \[`sales-copywriting`, `cro-audit`, `agency-positioning`\]  
**Effort: M** (1-2 days — new section on services and homepage)

---

### P1-7: Add "Ongoing support" section to the services page
**File:** `src/pages/en/services.astro` and FR equivalent  
**Score impact:** Client retention architecture: 3.0 → 4.5 (+1.5); Agency expert posture: +0.3  
**What to do:** After the 5-service listing, add a section titled "Ongoing Advisory & Support" that describes what post-project relationships look like: monthly system health checks, quarterly ICT strategy reviews, ERP support retainers. Mention indicative pricing if comfortable, or at minimum state "ongoing engagements from [X] per month."  
**Why it matters:** The agency-client-retention skill identifies the absence of any post-engagement model as a critical commercial gap. Enterprise buyers want to know what the relationship looks like in year 2. Adding this section signals that Peter is a long-term partner, not a one-project freelancer. \[`agency-client-retention`, `agency-positioning`\]  
**Effort: M** (1 day — writing + implementation)

---

## P2 — Medium Term: Next 4 Weeks

*Items that meaningfully advance the site toward premium positioning and world-class content coverage. Completing P2 after P0+P1 is estimated to move the score from ~8.0 to approximately 8.0–8.5/10.*

---

### P2-1: Publish "How much does IT consulting cost in Uganda?" (TAYA Pillar 1)
**Score impact:** Content SEO and TAYA coverage: +0.5; Content quality and messaging: +0.3
**What to do:** Write and publish a full-length (2000+ words) article on ICT consulting pricing in Uganda and East Africa. Include real ranges for different engagement types (hourly advisory, project work, retainers), explain what drives cost variation, and reference Peter's own engagement model.  
**Why it matters:** This is the most-searched question in the category that is not yet answered on the site. Publishing it builds trust, drives qualified organic traffic, and creates the primary Assignment Selling asset. \[`they-ask-you-answer`, `seo`\]  
**Effort: M** (2-3 days writing + FR translation)

---

### P2-2: Publish at least one case study as a standalone article (TAYA Pillar 4)
**Score impact:** Content SEO and TAYA coverage: +0.5; Trust and measurement maturity: +0.5; CRO: +0.4
**What to do:** Write a case study article on the Dynapharm Africa ERP engagement (or Excelsis Garden Hotels, or another named client). Structure: Before state → Challenge → Approach → Outcome (with specific metrics). Get client permission and ideally a photo and quote.  
**Why it matters:** Pillar 4 (Reviews/Social Proof) is the weakest-covered TAYA pillar. A case study article is the highest-trust content type for an ICT consultant's buyer journey. \[`they-ask-you-answer`, `sales-copywriting`\]  
**Effort: L** (getting client approval and gathering metrics takes time)

---

### P2-3: Rewrite services page headlines to benefit-led
**Score impact:** Sales copywriting and CTA architecture: +0.5; Content quality and messaging: +0.3
**File:** `src/pages/en/services.astro`  
**What to do:** Each service section currently has a capability headline ("Software Development", "ICT Consulting & Strategy"). These should become benefit-led: "Software that works the way your business actually works", "ICT strategy that reduces the cost of technology failure", "Property management systems built for African landlords".  
**Why it matters:** Capability headlines describe what Peter offers. Benefit headlines describe what the client gets. The sales-copywriting framework's Features/Benefits Grid requires every feature to be expressed as a benefit before it ships. \[`sales-copywriting`\]  
**Effort: M** (1-2 days — requires buy-in on messaging direction)

---

### P2-4: Add a positioning statement to the homepage below the hero
**Score impact:** Brand positioning and differentiation: +0.5; Agency expert posture: +0.4
**File:** `src/pages/en/index.astro` — after hero section  
**What to do:** Add a 2-3 sentence "Who this is for" qualifier immediately below the hero. Example: "Peter works with organisations that need technology to work reliably across difficult conditions — multiple countries, multiple languages, staff with varying technical literacy. Not for startups wanting a minimum viable product. Not for organisations that want someone to just follow instructions. For businesses that need a genuine technology partner who understands how Africa works."  
**Why it matters:** The agency-positioning skill requires an explicit audience qualifier early in the page. This repels wrong-fit enquiries and attracts right-fit clients. \[`agency-positioning`, `sales-copywriting`\]  
**Effort: S** (copy + implementation in 1 day)

---

### P2-5: Add language-split sitemaps
**Score impact:** Internationalisation: +0.3; Technical SEO: +0.2
**What to do:** Configure Astro's sitemap plugin (or a custom sitemap generator) to produce `sitemap-en.xml` and `sitemap-fr.xml` in addition to (or instead of) the single `sitemap-0.xml`. Update `sitemap-index.xml` to reference both.  
**Why it matters:** Language-split sitemaps help Google's multilingual crawl system process EN and FR pages separately, improving index coverage for both languages. \[`seo`, `i18n`\]  
**Effort: M** (3-4 hours — Astro sitemap configuration)

---

### P2-6: Fix footer navy-300 text contrast
**Score impact:** Visual design and colour system: 7.5 → 8.0 (+0.5); UI and UX: +0.2
**File:** `src/components/Footer.astro:47, 72, 87`  
**What to do:** Change footer secondary text from `text-navy-300` to `text-navy-200` for body text on navy-900 backgrounds, or darken the background for those sections.  
**Why it matters:** `navy-300` on `navy-900` fails WCAG AA for normal text (estimated ~3.5:1 vs. required 4.5:1). This is an accessibility compliance issue. \[`color-selection`, `seo-audit`\]  
**Effort: S** (30 minutes — CSS class update)

---

### P2-7: Remove or fix the "Available for new projects" badge
**Score impact:** Agency expert posture and messaging: +0.4; Brand positioning: +0.3
**File:** `src/pages/en/index.astro:70-73`  
**What to do:** Replace with a positioning qualifier. Option A: Remove entirely and let the headline carry the weight. Option B: Replace with: "Currently accepting engagements in East and Francophone Africa." Option C: Replace with a credibility signal: "15+ years. 10+ countries. 3 proprietary platforms."  
**Why it matters:** "Available" signals freelancer-mode rather than expert-in-demand. For premium positioning, the signal should be selectivity, not availability. \[`agency-positioning`\]  
**Effort: S** (1 hour)

---

## P3 — Aspirational: 8.5+/10 Territory

*Items that push the site from strong to world-class. Each requires significant commitment. Completing P3 after P0+P1+P2 is estimated to move the score from ~8.5 to approximately 8.5–9.0/10.*

---

### P3-1: Publish an 80% video on the homepage
**Score impact:** Trust and measurement maturity: +0.8; CRO and lead generation: +0.6; Agency expert posture: +0.5
**What to do:** Record a 5-7 minute video — Peter on camera — that answers "Is this the right IT consultant for my organisation?" Explain the type of clients served, the engagement model, what makes the practice different, and what to expect. Embed on the homepage hero alongside (not replacing) the photo.  
**Why it matters:** The they-ask-you-answer Selling 7 framework identifies the 80% video as the highest-trust content element. It pre-sells qualified prospects before the discovery call, dramatically reducing calls from wrong-fit enquiries. \[`they-ask-you-answer`\]  
**Effort: L** (requires filming, editing, YouTube upload, site integration)

---

### P3-2: Establish a named offer architecture with stated fees
**Score impact:** Brand positioning and differentiation: +0.8; Agency expert posture: +0.7; CRO: +0.5; Content SEO (TAYA Pillar 1): +0.3
**What to do:** Define 2-3 named engagement tiers (e.g. "ICT Diagnostic — $1,200", "Technology Project — from $8,000", "Strategic Advisory — from $2,000/month"). Publish a "How we work" page or section with these tiers and what is included in each.  
**Why it matters:** The agency-positioning skill requires a named offer ladder with a stated floor. Publishing pricing (even as ranges) is the CarMax Effect in action — it builds trust, attracts serious prospects, and repels price shoppers who would waste discovery-call time. \[`agency-positioning`, `they-ask-you-answer`\]  
**Effort: L** (positioning decision first, then implementation)

---

### P3-3: Build a retainer offering and promote it
**Score impact:** Client retention architecture: 4.5 → 7.0 (+2.5); Agency expert posture: +0.5; CRO: +0.3
**What to do:** Create a "Monthly ICT Advisory" retainer product page with defined deliverables (monthly system review, incident support, quarterly strategy session), a starting price, and a clear CTA to book. Add "Ongoing Advisory" to the main navigation.  
**Why it matters:** The agency-client-retention skill's Rule of Five Ones makes the case that 5 retained clients at $1,500/month ($7,500 MRR) creates financial stability that enables taking on better projects. Without a visible retainer offer, no retained relationships can be sold from the site. \[`agency-client-retention`\]  
**Effort: L** (requires productising the offer before building the page)

---

### P3-4: Implement structured answer blocks across all blog articles
**Score impact:** LLM / AI search optimisation: 5.5 → 8.0 (+2.5); Content SEO: +0.5
**What to do:** For each of the 12 EN blog articles, add a "Quick Answer" block at the top — a 30-50 word direct answer to the title question, formatted as a blockquote or highlight box — and ensure H2/H3 subheadings are structured as questions with answer paragraphs. Add FAQPage JSON-LD for the 5 main Q&As in each article.  
**Why it matters:** AI search (Perplexity, ChatGPT with search, Gemini) citations favour structured direct-answer content. This is the highest-ROI LLM optimisation sequence and would push the AI search readiness score from 5.5 to 8.0+. \[`seo`, `they-ask-you-answer`\]  
**Effort: L** (12 articles × 2-3 hours = 24-36 hours total)

---

### P3-5: Build a TAYA pillar 4 library — reviews and case studies
**Score impact:** Content SEO and TAYA coverage: +0.8; Trust and measurement maturity: +0.7; CRO: +0.5; Brand positioning: +0.4
**What to do:** Create a "Results" or "Case Studies" section (or page) with 4-6 named case studies following the 7-part format: client, challenge, approach, what we did, outcome (with metrics), quote, photograph. Publish each as a standalone blog post and link from the services page.  
**Why it matters:** Case studies are the highest-converting content type for ICT consulting. They answer "Does it work?" at scroll depth 2-3, exactly where the buyer is most skeptical. Without them, the site relies entirely on two anonymous testimonials. \[`they-ask-you-answer`, `sales-copywriting`, `agency-positioning`\]  
**Effort: L** (client relationship management + writing + implementation)

---

## Implementation Order Summary

| Priority | Item | Effort | Skill(s) | Week |
|----------|------|--------|---------|------|
| P0-1 | Connect GA4 + GSC + Bing | S | seo-audit | Now |
| P0-2 | Fix hreflang fr-FR → fr | S | i18n, seo-audit | Now |
| P0-3 | Fix newsletter form submission | S | form-ux-design | Now |
| P0-4 | Create 404 page | S | seo-audit | Now |
| P0-5 | Block /api/ in robots.txt | S | seo-audit | Now |
| P1-1 | Rewrite homepage hero headline | S | sales-copywriting | Week 1 |
| P1-5 | Differentiate page keyword targets | S | seo-audit | Week 1 |
| P2-6 | Fix footer contrast | S | color-selection | Week 1 |
| P2-7 | Remove "Available" badge | S | agency-positioning | Week 1 |
| P1-2 | Get real testimonials (name + photo + metric) | M | cro-audit | Week 2 |
| P1-3 | Add BlogPosting + Author schema | M | seo | Week 2 |
| P1-4 | Add FAQPage schema to key pages | M | seo | Week 2 |
| P1-6 | Add mid-funnel diagnostic CTA | M | sales-copywriting | Week 3 |
| P1-7 | Add "Ongoing Support" section to services | M | agency-client-retention | Week 3 |
| P2-4 | Add positioning qualifier below hero | S | agency-positioning | Week 3 |
| P2-1 | Publish ICT consulting cost article | M | they-ask-you-answer | Week 4 |
| P2-3 | Rewrite services page to benefit-led | M | sales-copywriting | Week 4 |
| P2-5 | Language-split sitemaps | M | seo, i18n | Week 4 |
| P2-2 | Publish first case study article | L | they-ask-you-answer | Month 2 |
| P3-1 | 80% video | L | they-ask-you-answer | Month 3 |
| P3-2 | Named offer architecture + pricing | L | agency-positioning | Month 3 |
| P3-3 | Retainer offer page | L | agency-client-retention | Month 4 |
| P3-4 | Structured answer blocks across blog | L | seo, they-ask-you-answer | Month 4–5 |
| P3-5 | Full case study library | L | they-ask-you-answer | Month 5–6 |

**Projected score after P0 + P1:** 7.5–8.0/10  
**Projected score after P2:** 8.0–8.5/10  
**Projected score after P3:** 8.5–9.0/10
