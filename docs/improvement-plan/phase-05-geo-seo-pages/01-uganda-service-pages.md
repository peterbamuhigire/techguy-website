# 01 — Uganda Service Pages: Three High-Intent Landing Pages

## Skills Applied
- `seo` — `references/seo-reference.md` (Geo-SEO, Title/Meta optimisation)
- `page-builder` — `references/page-patterns.md` (Service landing page template)
- `sales-copywriting` — `references/website-messaging-framework.md` (Sections 3, 6)
- `east-african-english` — formal register, British spelling

## Current State

No dedicated Uganda geo-targeting pages exist. The homepage (`/en/`) targets Uganda/Kampala in its meta title but competes with the same URL for both generic and geo-specific searches. There are no individual service + geography landing pages.

From the geo-seo-strategy.md: "No site with a dedicated geo-page architecture exists in the Uganda IT consultant space. First structured site targeting this keyword cluster wins."

## Current Score

**Technical SEO and discoverability: 7.0/10** (after Phase 1 baseline fixes)

## Target State

Three new Astro pages at:
- `src/pages/en/it-consulting-uganda.astro`
- `src/pages/en/software-development-uganda.astro`
- `src/pages/en/website-development-uganda.astro`

Each page is a standalone service landing page targeting one primary keyword cluster for Uganda.

## Target Score

**Technical SEO and discoverability: 8.0/10** (+1.0 — these three pages, combined with East Africa and FR pages, drive the full geo-SEO uplift)

## Why This Matters

A person in Kampala searching "IT consultant Uganda" does not find a page written specifically for them — they find a homepage written for a broad audience. Dedicated geo pages allow precise keyword targeting, specific areaServed schema, and copy that speaks directly to the Ugandan buyer's context (shilling pricing, Ugandan business environment, Ugandan regulatory landscape). They also allow Google to understand the site's topical and geographic authority with more precision.

## Step-by-Step Instructions

### Page 1 — `/en/it-consulting-uganda/`

**File to create:** `src/pages/en/it-consulting-uganda.astro`

**Primary keyword:** `IT consultant Uganda` / `ICT consultant Uganda`
**Secondary keywords:** `ICT consulting Kampala`, `technology consultant Uganda`, `IT consulting company Uganda`, `hire IT consultant Uganda`

**Meta title:**
```
IT Consultant Uganda — ICT Consulting & Technology Strategy | Peter Bamuhigire
```

**Meta description:**
```
Independent ICT consultant in Kampala, Uganda. IT strategy, ERP implementation, systems audit, and technology advisory for established Ugandan businesses and organisations. 15 years' experience across Uganda and East Africa.
```

**Page h1:**
```
ICT consulting for Ugandan businesses that need more than generic technology advice
```

**Sub-headline:**
```
Peter Bamuhigire is an independent ICT consultant based in Kampala. He works with established organisations — businesses, NGOs, and institutions — that need a technology adviser with no vendor affiliations, no standard script, and direct experience of how Ugandan business environments actually operate.
```

**Body copy (Section 1 — The Uganda ICT challenge):**
```html
<section class="py-16 md:py-24 bg-warm-white">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 prose prose-navy max-w-none">
    <h2>What Ugandan organisations need from an ICT consultant that most cannot provide</h2>
    <p>
      Most ICT advice available to Ugandan organisations arrives in one of two forms: a vendor representative recommending the vendor's own product, or a generalist consultant with a Western framework that does not account for the specific realities of operating in Uganda — unreliable power and internet infrastructure, a predominantly mobile-first workforce, multilingual operations, and the need for systems that non-technical staff can use without constant IT support.
    </p>
    <p>
      A third option exists: an independent ICT consultant who has worked inside Ugandan and East African organisations for 15 years, who has no vendor affiliations, and who designs solutions for the environment they will actually operate in — not the environment the software was designed for.
    </p>
    <h2>What an ICT consulting engagement looks like</h2>
    <p>
      Every engagement begins with an honest audit of your current technology situation: what is working, what is costing you more than it should, what risks are you carrying, and what is the gap between what your technology currently enables and what your business needs to do. That audit informs a prioritised plan — not a wish list, but a sequenced set of actions ordered by impact and feasibility.
    </p>
    <p>
      Past Uganda and East Africa engagements have covered: ERP selection and implementation, network infrastructure design, staff training and adoption programmes, ICT policy and governance documentation, and technology vendor evaluation and negotiation support.
    </p>
  </div>
</section>
```

**Services listed (use existing ServiceCard or simple list):**
- ICT Strategy Development — technology roadmap and prioritised action plan
- Systems Audit — independent assessment of your current technology costs and risks
- ERP Selection & Implementation — vendor-neutral advice and implementation management
- ICT Policy & Governance — documentation, procedures, and staff training frameworks
- Technology Vendor Evaluation — independent assessment before you sign a contract

**Proof element (use CaseSnippet component from Phase 4, file 05):**
```astro
<CaseSnippet
  label="Uganda & West Africa engagement"
  client="Dynapharm Africa"
  outcome="ERP systems unified across three countries. ICT governance framework built. Bilingual staff training programme delivered on schedule. Technology costs reduced through vendor renegotiation."
  sector="Pharmaceutical distribution — Uganda, Sierra Leone, Senegal"
/>
```

**CTA section:**
```
h2: Ready to start with an honest ICT audit?
sub: The first conversation is a 30-minute diagnostic — not a sales call. By the end of it, you will know whether this practice is the right fit, and Peter will know whether he can genuinely help.
CTA button: Book your ICT diagnostic call
Link: /en/contact/
```

**ProfessionalService schema for this page (in frontmatter):**
```javascript
const pageSchema = {
  "@context": "https://schema.org",
  "@type": "ProfessionalService",
  "name": "ICT Consulting Uganda — Peter Bamuhigire",
  "url": "https://techguypeter.com/en/it-consulting-uganda/",
  "description": "Independent ICT consulting in Kampala, Uganda. Technology strategy, ERP implementation, systems audit, and ICT governance for Ugandan organisations.",
  "areaServed": [
    { "@type": "City", "name": "Kampala", "containedInPlace": { "@type": "Country", "name": "Uganda" } },
    { "@type": "City", "name": "Entebbe", "containedInPlace": { "@type": "Country", "name": "Uganda" } },
    { "@type": "Country", "name": "Uganda" }
  ],
  "serviceType": ["ICT Consulting", "IT Strategy", "ERP Implementation", "Systems Audit"],
  "knowsLanguage": ["en", "fr"],
  "provider": {
    "@type": "Person",
    "name": "Peter Bamuhigire",
    "url": "https://techguypeter.com/en/about/"
  }
};
```

---

### Page 2 — `/en/software-development-uganda/`

**File to create:** `src/pages/en/software-development-uganda.astro`

**Primary keyword:** `software developer Uganda` / `software development Uganda`
**Secondary keywords:** `custom software Kampala`, `ERP developer Uganda`, `app developer Uganda`, `system developer Uganda`, `software development company Uganda`

**Meta title:**
```
Software Developer Uganda — Custom Software & ERP Systems | Peter Bamuhigire, Kampala
```

**Meta description:**
```
Custom software development in Uganda. Web applications, ERP systems, mobile apps, and SaaS platforms built for Ugandan business environments. Based in Kampala. 15 years' experience across Uganda and East Africa.
```

**Page h1:**
```
Custom software development in Uganda — built for the business environments here, not elsewhere
```

**Sub-headline:**
```
Off-the-shelf software is built for the average business in the market it was designed for. If your business operates in Uganda — with Ugandan connectivity, a Ugandan workforce, and Ugandan business processes — off-the-shelf software produces workarounds, not solutions. Peter Bamuhigire has spent 15 years building software that works in the actual environment it has to operate in.
```

**Body copy (Section 1 — Why Uganda-specific software development matters):**
```html
<section class="py-16 md:py-24 bg-warm-white">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 prose prose-navy max-w-none">
    <h2>The difference between software built for Uganda and software adapted for Uganda</h2>
    <p>
      A Ugandan property management system needs to handle payment in UGX, track tenants by their national ID format, and work on the mobile network infrastructure available in Kampala and secondary towns — not the 100Mbps fibre connections Western software assumes. A Ugandan POS system needs to handle load-shedding gracefully: offline mode, local data storage, sync when power and connectivity return.
    </p>
    <p>
      The three proprietary platforms built by this practice — Maduuka (business management), Aqar (property management), and Longhorn ERP — were designed from the ground up for this reality. They are not adapted Western products. They handle the Uganda-specific edge cases: mobile money integration, offline operation, UGX currency, Luganda and English interface options, and variable connectivity.
    </p>
    <h2>Custom development for organisations that need something built to their specifications</h2>
    <p>
      Where an existing platform does not cover the requirement, custom software is built from a specification derived from the organisation's actual processes — not a generalised template. Custom engagements have covered: ICT management systems for research institutions, staff management systems for hospitality groups operating across multiple Uganda locations, and data management platforms for NGOs operating in rural Uganda.
    </p>
  </div>
</section>
```

**Products section:** Reference Maduuka, Aqar, and Longhorn ERP by name with brief description and link to portfolio page.

**CTA section:**
```
h2: Describe your software requirement
sub: The first step is a 30-minute diagnostic to establish whether your requirement is better served by an existing platform or a custom build — and what a realistic budget looks like for each option.
CTA button: Start the conversation
Link: /en/contact/
```

**ProfessionalService schema for this page:**
```javascript
const pageSchema = {
  "@context": "https://schema.org",
  "@type": "ProfessionalService",
  "name": "Software Development Uganda — Peter Bamuhigire",
  "url": "https://techguypeter.com/en/software-development-uganda/",
  "description": "Custom software development in Kampala, Uganda. ERP systems, web applications, mobile apps, and SaaS platforms built for Ugandan business environments.",
  "areaServed": [
    { "@type": "City", "name": "Kampala", "containedInPlace": { "@type": "Country", "name": "Uganda" } },
    { "@type": "Country", "name": "Uganda" }
  ],
  "serviceType": ["Software Development", "ERP Systems", "Mobile App Development", "Web Application Development"],
  "knowsLanguage": ["en", "fr"],
  "provider": {
    "@type": "Person",
    "name": "Peter Bamuhigire",
    "url": "https://techguypeter.com/en/about/"
  }
};
```

---

### Page 3 — `/en/website-development-uganda/`

**File to create:** `src/pages/en/website-development-uganda.astro`

**Primary keyword:** `website developer Uganda` / `website designer Uganda`
**Secondary keywords:** `web design Uganda`, `web designer Kampala`, `website design services Uganda`, `professional website Uganda`, `how much does a website cost Uganda`

**Meta title:**
```
Website Developer Uganda — Professional Web Design Kampala | Peter Bamuhigire
```

**Meta description:**
```
Professional website design and development in Uganda. Fast-loading, mobile-first websites for Ugandan businesses. Based in Kampala. Formal quote within 24 hours.
```

**Page h1:**
```
Professional website design for Ugandan businesses — built fast, built to rank, built to last
```

**Sub-headline:**
```
A website for a Ugandan business must load quickly on mobile networks, rank well in Ugandan Google search results, and convert visitors into enquiries. Most websites built for Ugandan businesses fail at least one of these three. Peter Bamuhigire's web development practice builds sites that pass all three — because all three are built into the specification from the start.
```

**Body copy (Section 1 — What Ugandan businesses need from a website):**
```html
<section class="py-16 md:py-24 bg-warm-white">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 prose prose-navy max-w-none">
    <h2>Why most websites built for Ugandan businesses underperform</h2>
    <p>
      The typical Ugandan business website is built on a generic WordPress theme, loaded with plugins that slow it down, and optimised for nobody in particular. It loads slowly on the mobile networks most Ugandan users are on. It does not rank for the search terms potential clients are actually using. And it does not give the visitor a clear reason to make contact.
    </p>
    <p>
      The websites built by this practice are different in three specific ways: they are built as static sites (no database, no WordPress, no unnecessary scripts — they load in under a second on a 3G connection); they are built with Uganda-specific SEO from the start (not retrofitted); and they are designed with a single conversion goal in mind — getting the visitor to take the next step.
    </p>
    <h2>What a website development engagement includes</h2>
    <p>
      Every website engagement begins with a brief — your business, your audience, your goals, and your existing online presence. The brief informs the design, the copy structure, and the SEO architecture. Websites are delivered with: responsive mobile-first design, page load time under 2 seconds on mobile networks, Google Search Console connected and verified, basic on-page SEO in place, and a handover session explaining how to update content.
    </p>
    <p>
      Ongoing support packages are available for businesses that want monthly SEO, content updates, and performance monitoring after launch.
    </p>
  </div>
</section>
```

**Pricing transparency section:**
```html
<section class="py-12 bg-warm-cream">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
    <h2 class="text-2xl font-bold text-navy-900 mb-6">What a website costs in Uganda</h2>
    <p class="text-navy-700 leading-relaxed mb-4">
      Website costs in Uganda vary by scope. A simple 5-page business website starts from UGX 3,000,000–5,000,000 (approximately USD 800–1,400) for design, development, and basic SEO. A complex site with e-commerce, booking systems, or a custom web application is scoped individually after a brief consultation.
    </p>
    <p class="text-navy-700 leading-relaxed">
      A formal written quote is provided within 24 hours of the initial briefing. There is no obligation to proceed.
    </p>
  </div>
</section>
```

**CTA section:**
```
h2: Get a quote for your Uganda website
sub: Describe your business and what you need from a website. A written quote arrives within 24 hours.
CTA button: Request a website quote
Link: /en/contact/
```

**ProfessionalService schema for this page:**
```javascript
const pageSchema = {
  "@context": "https://schema.org",
  "@type": "ProfessionalService",
  "name": "Website Development Uganda — Peter Bamuhigire",
  "url": "https://techguypeter.com/en/website-development-uganda/",
  "description": "Professional website design and development in Uganda. Fast-loading, mobile-first websites for Ugandan businesses. Based in Kampala.",
  "areaServed": [
    { "@type": "City", "name": "Kampala", "containedInPlace": { "@type": "Country", "name": "Uganda" } },
    { "@type": "Country", "name": "Uganda" }
  ],
  "serviceType": ["Website Design", "Web Development", "SEO", "Mobile Website Development"],
  "knowsLanguage": ["en", "fr"],
  "provider": {
    "@type": "Person",
    "name": "Peter Bamuhigire",
    "url": "https://techguypeter.com/en/about/"
  }
};
```

---

## Page Template Structure (apply to all three pages)

All three Uganda pages follow this section order:

1. Hero — dark (`bg-navy-900 geo-pattern`) — h1 + sub-headline
2. Body copy — `bg-warm-white` — prose, h2 sections, benefit-led
3. Services/Products grid — if applicable
4. Proof element — CaseSnippet component or testimonial excerpt
5. FAQ block — 3 questions specific to the service × Uganda (see Phase 6, file 02 for FAQPage schema)
6. Cross-link to East Africa equivalent page — `"This practice also works with organisations across East Africa →"`
7. CTA section — CTASection component

## Internal Links to Add (see Phase 5, file 04 for full architecture)

Each Uganda page must include:
- Link to the East Africa equivalent page
- Link to the homepage
- Link to the contact page
- Link to the relevant blog articles (to be added when Phase 7 blog articles are published)

## Acceptance Criteria

- [ ] `src/pages/en/it-consulting-uganda.astro` created and builds without errors
- [ ] `src/pages/en/software-development-uganda.astro` created and builds without errors
- [ ] `src/pages/en/website-development-uganda.astro` created and builds without errors
- [ ] All three pages have unique meta titles targeting the primary Uganda keyword
- [ ] All three pages have unique meta descriptions (not shared with any other page)
- [ ] All three pages have ProfessionalService schema with `areaServed` scoped to Uganda
- [ ] All three pages link to the corresponding East Africa page
- [ ] All three pages link back to the homepage and contact page
- [ ] All three pages use the benefit-led copy posture (client outcome first)
- [ ] Website development page includes Uganda pricing transparency section
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day (3 pages)
