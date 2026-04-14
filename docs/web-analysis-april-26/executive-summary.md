# Executive Summary — April 2026

---

## Score at a Glance

| Dimension | Score |
|-----------|-------|
| Brand positioning and differentiation | 5.5/10 |
| Agency expert posture and messaging | 5.0/10 |
| Visual design and colour system | 7.5/10 |
| UI and UX | 7.0/10 |
| Sales copywriting and CTA architecture | 5.5/10 |
| Content quality and messaging | 6.5/10 |
| CRO and lead generation | 5.5/10 |
| Technical SEO | 6.5/10 |
| Content SEO and TAYA coverage | 7.0/10 |
| LLM / AI search optimisation | 5.5/10 |
| Internationalisation / multilingual execution | 7.5/10 |
| Trust and measurement maturity | 4.5/10 |
| Client retention architecture | 3.0/10 |
| **Overall** | **6.6/10** |

---

## Bottom Line

techguypeter.com is a well-built, visually coherent website that successfully communicates Peter's credentials — but it does not convert those credentials into a reason to hire him over anyone else, nor does it signal the kind of expert, authority relationship that justifies premium fees. The gap between what the site looks like (polished) and what it does commercially (broad, generic, order-taker) is the single biggest drag on both the score and on leads.

---

## What the Site Does Well

**1. Distinctive visual identity** (`global.css`, `tailwind.config.mjs`)  
Navy-900 with Playfair Display headings and a gold-accent system is unusual in the East African ICT sector, which defaults to blue/white SaaS templates. The geo-pattern texture, warm-white base, and GSAP fade-up animations make the site feel crafted rather than templated.

**2. Solid technical foundation**  
Astro static build, self-hosted fonts, lazy-loading on all non-hero images, skip-to-content link (`BaseLayout.astro:189`), BreadcrumbList schema on every page, hreflang with x-default, and a sitemap. This is a technically competent build that most competitors will not match.

**3. Real multilingual execution** (`BaseLayout.astro:141-143`)  
Hreflang is implemented correctly, x-default points to `/en/`, alternate slugs exist for key pages (e.g. `strategie-marketing-digital` ↔ `digital-marketing-strategy`), and the FR blog has 11 of 12 EN articles. This is genuine i18n, not an afterthought.

**4. Blog with Big 5 traction** (`src/pages/en/blog.astro`)  
The blog covers pricing ("What a Website Actually Costs in Uganda"), problems ("When things go wrong"), comparisons, and best-in-class content. The article "East African Websites Must Have a French Version" is a strong TAYA Pillar 3 (Comparisons) piece that also signals expertise in multilingual markets.

**5. Founder story with real timeline** (`src/pages/en/about.astro:13-50`)  
The career timeline from Infinity Computers (2008) through Dynapharm Sierra Leone (2010-2014), EFICON, Chwezi, and BIRDC (2024) is specific, verifiable, and geographically interesting. It answers "why should I trust this person?" better than most consulting websites.

---

## What Stops It Being World-Class

Gaps are rated by severity: **Critical** = materially hurts trust or discoverability now; **High** = meaningfully limits conversion or positioning; **Medium** = a visible gap at premium tier.

**1. No claimed category** — *Critical* (agency-positioning skill)  
The site does not name what kind of practice this is. "IT Consultant & Software Developer" is a job title, not a category. The agency-positioning skill requires a category name like "Authority ICT Systems for East African businesses" or "Custom software for African SMEs." Without a category, the site competes on price, availability, and résumé — a race to the bottom.

**2. Hero headline leads with scope, not transformation** — *High* (`src/pages/en/index.astro:75-79`)  
"Building Technology Solutions Across Africa & Beyond" describes what Peter does, not what the client gets. The 4 U's rating (useful, ultra-specific, urgent, unique) gives this headline scores of U:2, US:2, UR:1, UN:2 — well below the required 3/4 to ship. It fails to select the audience, state a benefit, or create urgency.

**3. Copy is features-first throughout** — *High* (sales-copywriting skill)  
Service descriptions on the homepage and services page list capabilities — "Custom software solutions... from web applications and mobile apps to full SaaS platforms" — without translating features to client outcomes. The sales-copywriting framework's "So what? Because..." chain is never applied. The reader cannot tell what their business will look like differently after hiring Peter.

**4. No CTA ladder** — *High* (sales-copywriting, cro-audit skills)  
Every CTA is either "Book a Consultation" (highest rung, conversion) or "Learn More" (lowest rung, explore). Rungs 2-4 of the five-rung ladder (Learn, Subscribe, Self-qualify) are absent. There is no lead magnet, no self-qualification flow, and no intermediate step for visitors who are interested but not yet ready to book.

**5. Testimonials lack the proof formula** — *High* (`src/pages/en/index.astro:390-440`)  
Both testimonials are company names without individual names or photos. They are narrative without numbers ("unified our ERP systems" — how many systems? what time saved? what cost reduction?). Fogg's surface credibility model demands specific-outcome testimonials with names and faces; anonymous, round-number-free testimonials read as fabricated.

**6. No retainer or ongoing relationship model** — *High* (agency-client-retention skill)  
The site has no signal that Peter works with clients beyond a project. No maintenance plans, no monthly reporting offer, no quarterly strategy framework, no "what happens after launch." For a consultant whose value compounds over time (ERP support, ICT strategy evolution, product roadmaps), this is a significant commercial omission.

**7. Analytics not connected** — *Critical* (`BaseLayout.astro:169-176`)  
GA4 measurement ID is `G-XXXXXXXXXX`. GSC token is `REPLACE_WITH_GSC_TOKEN`. No conversion events can be tracked. This means no knowledge of what pages drive enquiries, where visitors drop, or whether the bilingual strategy is working.

---

## What the New Skills Reveal

**agency-positioning** reveals: The site has no positioning architecture. There is no category claim, no explicit niche statement, no offer floor stated anywhere, and no "who this is not for" signal. The services page lists everything Peter can do — "software development, ICT consulting, business consulting, property management technology, social media" — which is the textbook "we can do anything" anti-pattern that the skill explicitly flags. This prevents premium pricing because there is no category to be premium *within*.

**agency-client-retention** reveals: The site is built entirely around project acquisition, with zero signals of a Land-Deliver-Retain model. There is no retainer offer, no post-launch review cadence mentioned, no "what working with Peter looks like in month 6" content. For a consultant with 15+ years of client relationships across Africa, this is a missed opportunity — and it signals to sophisticated buyers that the relationship ends at delivery.

**sales-copywriting** reveals: The messaging framework's objection map identifies where each buyer objection should be handled. "What is this?" is answered adequately. "Is this for me?" is poorly answered — there is no explicit audience qualifier on any page. "Can I trust you?" relies on testimonials that lack the specific-outcome + name + photo formula. "What exactly do I get?" is answered at feature level, never at outcome level. The slippery-slide principle (first sentence exists only to earn the second) is absent — body paragraphs open with brand-led statements rather than curiosity hooks.

---

## Critical Judgment

This site was built by someone who understood design and technical SEO. The bilingual execution, the schema implementation, and the visual system are genuinely above average for the East African market. The fundamental failure is commercial, not technical: the site was written from Peter's perspective (here is what I have done, here are my services) rather than from the buyer's perspective (here is what changes in your business when you work with me). The result is a site that impresses on first glance but does not pull the reader toward a decision. A senior ICT director at a Kampala bank, browsing during lunch, would see impressive credentials but would not feel distinctly pulled to book — because nothing on the page tells them specifically that *their* problem is one Peter solves better than anyone else.

---

## What Would Move the Score Fastest

Ordered by estimated impact on leads and positioning. Score impact is estimated gain across the affected dimensions.

1. **Connect GA4 and GSC** (S, 2 hours) — *+0.8 on Trust and measurement maturity* — Replace the three placeholder tokens in `BaseLayout.astro`. This is blocking all measurement and should have been done at launch.

2. **Rewrite the hero headline** (S, 1 day) — *+0.7 on Sales copywriting, +0.5 on Brand positioning* — Write a benefit-led, audience-qualifying headline that passes 3/4 on the 4 U's. Target: "ICT consulting and custom software for businesses that need technology to actually work — across Africa." Or sharper: "Stop explaining to generic consultants how Africa works."

3. **Add photo + outcome metrics to testimonials** (S–M, 3 days) — *+0.8 on Trust and measurement maturity, +0.5 on CRO* — Get individual names, photographs, and one specific metric from Dynapharm Africa and Excelsis Garden Hotels.

4. **Create a 404 page** (S, 2 hours) — *+0.3 on Technical SEO* — No 404 page exists. Add `src/pages/404.astro`.

5. **Add a mid-funnel CTA: the free diagnostic** (M, 1 week) — *+0.6 on CRO, +0.4 on Sales copywriting* — Create a "30-minute ICT health check" offer that fills the missing rungs of the CTA ladder.

6. **Add a "Ongoing Support" section to services** (M, 1 week) — *+1.5 on Client retention architecture* — Signal that post-launch relationships exist: monthly ICT support retainer, quarterly strategy review. Even a short section changes how enterprise buyers evaluate the offer.

7. **Add FAQ schema to blog posts** (M, 3 days) — *+0.8 on LLM / AI search optimisation* — Convert the question-headed sections in existing articles to FAQPage JSON-LD. This is the highest-ROI LLM/AI search optimisation move given the existing content structure.
