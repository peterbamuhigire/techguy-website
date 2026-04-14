# Positioning and Messaging — April 2026

---

## 1. Agency Positioning Audit

**Section score: 4.0/10**

### 1.1 Does the Site Claim a Clear Category?

**Score: 2.0/10**

**Finding: No.** The site has no category name.

The agency-positioning skill defines a category as a named, ownable statement of what the practice is — not a job title. The agency narrative's recommended form is "Authority Website Systems for high-trust businesses." Applied to Peter's practice, this might be "Custom ICT Systems for African businesses that need technology to actually work" or "ICT strategy and custom software for pan-African enterprises."

Instead, the site opens with a job description: *"IT Consultant & Software Developer"* (site title, `BaseLayout.astro` via every page title). The services page title is *"IT Consulting & Software Development Services"* — a category of one only if you are the only person in East Africa offering those services, which Peter is not.

**Impact:** Without a category, the site cannot command premium positioning. Buyers who search "IT consultant Kampala" will compare Peter to a commodity market. Buyers who search for the specific outcome Peter delivers (e.g. "ERP integration for African pharma operations") cannot find him because no such category claim exists on the site.

**Fix:** Choose and state a category. One option: "ICT consulting and custom software for East and Francophone African businesses" — specific enough to own, broad enough to grow within. State it in the hero and in the meta description of every key page.

---

### 1.2 Expert Posture vs. Order-Taker Signals

**Finding: Mild order-taker posture.** The site positions Peter as available and capable, not as a diagnostician who controls the engagement.

**Order-taker signals found:**

- *"Available for new projects"* badge in the hero (`src/pages/en/index.astro:72`) — signals availability, which is correct for freelancer positioning but wrong for a premium consultant. The agency-positioning skill explicitly flags "available" language as reducing perceived selectivity.

- *"Whether you have a project in mind, need strategic guidance, or simply wish to explore possibilities — enquiries are always welcome."* (`src/pages/en/contact.astro:43-45`) — "enquiries are always welcome" is the opposite of the Doctor posture. A doctor does not welcome all enquiries; they screen, diagnose, and refer.

- Services are listed as a menu without qualifiers. The services page presents Software Development, ICT Consulting, Business Consulting, Property Management Technology, and Social Media as equal options. This signals "we do everything" rather than "we are the expert in a specific domain."

**Expert posture signals found (positives):**

- The process on the services page (Discovery → Analysis → Proposal → Implementation → Support) opens with "This is a conversation, not a sales pitch" (`src/pages/en/services.astro:21`) — this is a good Doctor signal.

- The about page timeline shows progression and intentionality rather than listing a menu of competences. The founding of Chwezi after consulting experience is a good "Selling the Shovel" narrative moment.

**Score: 5.0/10** — the site is not aggressively order-taker, but it lacks the confident expert signals that would justify premium fees.

---

### 1.3 Offer Ladder Visibility

**Score: 2.5/10**

**Finding: Not visible.** The site does not surface a tiered offer structure.

The agency-positioning skill's three-tier offer ladder (Foundation / Growth / Authority) is not implemented. The services page lists service types, not engagement tiers with starting prices, timelines, and scope definitions.

**What's missing:**
- No pricing visibility anywhere on the site
- No "starting from" or "typical engagement" language
- No distinction between project work and ongoing advisory
- No productised offers with named tiers

The blog article "What a Website Actually Costs in Uganda" (`/en/blog/website-costs-uganda/`) does address pricing for websites, which is correct TAYA Pillar 1 behaviour. But there is no equivalent transparency for ICT consulting, ERP implementation, or business planning — the higher-fee services.

**Fix:** Add a "How we engage" section to the services page that shows 2-3 engagement structures with indicative investment ranges. Even "ICT consulting engagements typically run 4-12 weeks at a project fee; ongoing advisory from $X/month" would differentiate from competitors who hide all pricing.

---

### 1.4 Founder Story Effectiveness

**Score: 6.5/10**

**Finding: Good raw material, under-deployed.**

The about page timeline is the site's strongest positioning asset. Six career entries spanning Kampala, Freetown, Dakar, and Kampala again — with named employers (Dynapharm, EFICON, BIRDC), real durations, and a stated philosophy shift. The Chwezi founding story is a classic "Selling the Shovel" moment: built products from problems encountered during consulting.

**What weakens it:**

1. The about page hero is titled *"Peter Bamuhigire's Story"* — this frames it as a biography rather than as a statement about what Peter's experience means *for the client*. The sales-copywriting skill's About page structure starts with "Who we serve" before "Why we exist."

2. The philosophy cards (Kaizen, Results, Ethics) are well-written but abstract. They describe how Peter works, not what the buyer will experience differently because of it. "Kaizen — Continuous Improvement" is a value; "your systems get better every quarter, not just at launch" is a promise.

3. The testimonials on the homepage (`src/pages/en/index.astro:390-440`) both reference the about-page's key employers (Dynapharm, Excelsis) but appear without individual names or photographs. This breaks the social proof chain that the about-page narrative builds.

The content exists, it just does not carry its weight commercially.

---

### 1.5 Specific Copy Examples

**Score: 4.0/10** — page-level headlines consistently underperform; article-level copy is stronger.

**Hero headline** (`src/pages/en/index.astro:75-78`):
> "Building Technology Solutions Across Africa & Beyond"

4 U's rating: Useful=2 (no explicit benefit stated), Ultra-specific=1 (no number, no client type, no outcome), Urgent=1 (no reason to act now), Unique=2 (every IT firm says this). Total: 6/16. Minimum to ship: 12/16. **This headline should be rewritten.**

**Services intro** (`src/pages/en/index.astro:175` via `t('section.services_intro', lang)`):  
Not visible in the reviewed code (i18n string), but the service cards describe capabilities not outcomes: *"Custom software solutions — from web applications and mobile apps to full SaaS platforms — built to solve the specific challenges your business faces"* (`src/pages/en/index.astro:21-23`). The phrase "built to solve the specific challenges your business faces" gestures at outcomes but does not name one. The sales-copywriting "So what? Because..." chain would require at least two more iterations.

**Contact page hero** (`src/pages/en/contact.astro:40-45`):
> "Get in Touch"

This is the weakest headline on the site. It is generic, command-without-benefit, and fails all four U's. A contact page headline should qualify and encourage: "Tell us about your technology challenge" or "Book a 30-minute diagnostic" — both tell the reader what they are doing and why it matters.

---

## 2. Sales Copywriting Audit

**Section score: 4.5/10**

### 2.1 Headline Analysis (4 U's)

**Score: 4.5/10**

| Page | Headline | U | US | UR | UN | Total | Verdict |
|------|----------|---|----|----|----|-------|---------|
| Homepage | "Building Technology Solutions Across Africa & Beyond" | 2 | 1 | 1 | 2 | 6/16 | Fail — rewrite |
| Services | "IT Consulting & Software Development Services" | 2 | 1 | 1 | 1 | 5/16 | Fail — rewrite |
| About | "Peter Bamuhigire's Story" | 1 | 2 | 1 | 1 | 5/16 | Fail — rewrite |
| Contact | "Get in Touch" | 1 | 1 | 1 | 1 | 4/16 | Fail — rewrite |
| Blog | "Tech Insights for African Businesses" | 2 | 2 | 1 | 2 | 7/16 | Marginal — improve |

The blog article headlines fare better: *"What a Website Actually Costs in Uganda (And Why It Varies So Much)"* scores approximately 12/16 (useful, specific, useful to act, somewhat unique). Article-level copy is consistently stronger than page-level copy — likely because articles were written with a specific question in mind, which naturally generates more focused headlines.

**The 8-headline-type distribution:**  
Most page headlines are Type 1 (Direct, capability-stating). Zero testimonial headlines. Zero how-to page headlines. Zero question headlines on service or about pages. The most underused type for this practice is Type 4 (How-to): *"How to choose an IT consultant in East Africa"* already exists as a blog post, but the services page does not use this approach.

---

### 2.2 CTA Ladder Analysis

**Score: 4.0/10**

**Finding: Two rungs only — lowest and highest.**

The CTA ladder has five rungs: Explore, Learn, Subscribe, Self-qualify, Convert.

| Rung | Status | Evidence |
|------|--------|----------|
| Explore | Present | "View our portfolio", "Learn more" links on service cards |
| Learn | Absent | No downloadable resource, no guide, no video |
| Subscribe | Partially present | Newsletter form on blog page only — not promoted elsewhere |
| Self-qualify | Absent | No "See if we're right for you" quiz or questionnaire |
| Convert | Present | "Book a Consultation" CTA throughout |

The gap is rungs 2-4. A visitor who finds the site from a Google search on "ERP implementation Africa" arrives at a blog post, finds no subscriber magnet there, has no intermediate offer to consider, and either books a consultation immediately (low probability without more trust building) or leaves. The TAYA skill's Assignment Selling model requires content assets at each rung — Peter has the content but no mechanism to capture leads around it.

**CTA copy failures:**
- "Book a Consultation" — verb is correct, but "consultation" is vague. Better: "Book a 30-minute ICT diagnostic" or "Tell us about your technology challenge"
- "Get in Touch" (contact hero, header CTA variant) — no verb-specificity, no reward named
- "Subscribe" (newsletter button) — weakest possible verb; should be "Send me tech insights" or "Get the monthly brief"

**CTA design:**  
The amber-accent (`#C75B12`) CTAs against navy-900 backgrounds achieve good contrast. On warm-white background pages, the amber button remains visually distinct. CTA placement is correct (above fold in hero, in footer, at end of sections). No sticky mobile CTA.

---

### 2.3 Proof Placement

**Score: 4.5/10**

**Finding: Proof is isolated rather than interleaved.**

The sales-copywriting framework requires proof to sit beside the claim it supports, not on a dedicated testimonials section. Current state:

- Two testimonials live in a dedicated "Testimonials" section on the homepage — this is the lowest-impact proof placement
- No testimonial or case-study excerpt appears beside the services descriptions
- No outcome metric appears beside the stats strip (15 years, 10 countries, 3 products, 6 industries)
- The portfolio page (not reviewed in full) presumably shows work, but no case study excerpt or named metric appears on the homepage or services page to validate the capability claims

**What's needed:** One specific testimonial excerpt (name, outcome, metric) adjacent to each main service category. The Dynapharm testimonial ("unified our ERP systems, trained our staff in both French and English") is suitable for the ICT consulting section but needs: (1) an individual name, (2) one measurable outcome (time to deployment, cost saved, number of staff trained).

---

### 2.4 Proof Placement — Testimonial Quality Gap

**Score: 3.0/10**

`src/pages/en/index.astro:399-440`:
```
"Dynapharm Africa" — initials "DA" — no photo — no individual name
"Excelsis Garden Hotels" — initials "EG" — no photo — no individual name
```

Fogg's surface credibility model and the sales-copywriting skill both flag anonymous testimonials as trust-neutral at best, trust-negative at worst. The gradient-and-initials avatar treatment looks like a designed placeholder, not a real person.

---

### 2.5 Slippery-Slide Logic

**Score: 5.0/10**

The Sugarman slippery-slide principle requires the first sentence of each section to exist only to earn the second sentence. Current first sentences on the homepage:

- Services section lead: (uses i18n string, not visible — assume generic)
- "Why Peter" section: *"A rare combination of deep technical capability and genuine business understanding, forged across Africa's most dynamic markets."* (`src/pages/en/index.astro:319`) — this is a good opening but leads with brand claim rather than reader hook
- Products section lead: *"Proprietary SaaS platforms built to serve real business needs across Africa and beyond."* — feature-leading, not curiosity-leading

**Better slippery-slide openers** would be:
- "Most ICT consultants advise from a distance. Peter writes the code."
- "In 2010, Peter moved to Freetown to run IT for a pharmaceutical company. He has not worked from one country since."
- "The hardest thing to find in Africa is technology that was built for Africa."

These earn the second sentence. The current copy does not.

---

## 3. Client Retention Architecture Audit

**Section score: 3.0/10**

### 3.1 Does the Site Signal a Long-Term Relationship Model?

**Score: 2.0/10**

**Finding: No.** The site is entirely project-transaction oriented.

The agency-client-retention skill's Land-Deliver-Retain model requires that the "Retain" phase is visible on the website — because enterprise buyers want to know what the relationship looks like after the project closes. A CTO reviewing Peter's site before recommending him to their board cannot see:

- Whether Peter offers ongoing support contracts
- Whether there is a monthly reporting or review cadence
- What the relationship looks like in month 3 or year 2
- Whether there is a maintenance or retainer offering

The process section on the services page (`src/pages/en/services.astro:18-43`) shows 5 steps ending with "Support" — but "Support" is described as generic ongoing availability, not a productised retain phase.

---

### 3.2 Is There a Retainer or Post-Launch Journey Visible?

**Score: 1.5/10**

**Finding: Absent.** The word "retainer" does not appear on the site. The word "monthly" appears only in footer contact hours and in blog post publication dates.

The agency-client-retention skill's Rule of Five Ones (5 clients × minimum retainer = MRR base) cannot be executed if the site never introduces the concept of a recurring relationship.

**What a minimal intervention would look like:**

A paragraph on the services page and the contact page:
> "Many clients continue working with Peter after the initial engagement — on a monthly advisory retainer, system maintenance, or quarterly ICT strategy review. If that is of interest, mention it when you book."

This single addition changes how enterprise buyers evaluate the offer. It signals that Peter builds long-term relationships, not delivery-and-disappear projects.

---

### 3.3 What Evidence Is Shown of Ongoing Value Delivery?

**Score: 4.0/10**

The blog is the only visible evidence of ongoing value. The Kaizen philosophy card on the about page gestures at continuous improvement. The BIRDC role (ongoing since 2022) demonstrates the ability to sustain a long-term institutional relationship — but this is positioned as employment, not as a model for how client relationships work.

**Structural opportunity:** The blog posts on ERP implementation and digital transformation ("Why Your Business Must Go Digital Today", "ERP Implementation: What SMEs Get Wrong") demonstrate ongoing expertise that would be valuable to a retained client — but the site makes no connection between the blog and a client retention model. There is no "this is what you get every month as a retained client" framing.

The absence of any retention model on the site is the single biggest commercial gap identified by the new skills.
