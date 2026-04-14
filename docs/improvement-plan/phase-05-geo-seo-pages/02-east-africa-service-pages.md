# 02 — East Africa Service Pages: Three Regional Landing Pages

## Skills Applied
- `seo` — `references/seo-reference.md` (Geo-SEO, Regional targeting)
- `page-builder` — `references/page-patterns.md` (Service landing page template)
- `sales-copywriting` — `references/website-messaging-framework.md` (Sections 3, 6)
- `east-african-english` — formal register, British spelling

## Current State

No East Africa regional service pages exist. The homepage mentions "10+ countries" in its stats strip but has no pages that speak specifically to buyers in Kenya, Tanzania, Rwanda, Ethiopia, or the broader East African Community.

From the geo-seo-strategy.md: "East Africa pages capture regional buyers and build topical authority across EAC markets. Lower competition than Uganda-specific terms but significant volume — especially from Kenya."

## Current Score

**Technical SEO and discoverability: 7.0/10** (after Phase 1 baseline fixes)

## Target State

Three new Astro pages at:
- `src/pages/en/it-consulting-east-africa.astro`
- `src/pages/en/software-development-east-africa.astro`
- `src/pages/en/website-development-east-africa.astro`

## Why This Matters

The East Africa pages serve two functions simultaneously: they capture search traffic from the regional market (Kenya, Tanzania, Rwanda, Ethiopia, Burundi), and they signal to Google that the site has genuine authority across the EAC, not just Uganda. This topical authority strengthens the Uganda pages' ranking signals as well.

## Step-by-Step Instructions

### Page 1 — `/en/it-consulting-east-africa/`

**File to create:** `src/pages/en/it-consulting-east-africa.astro`

**Primary keyword:** `IT consultant East Africa` / `ICT consultant East Africa`
**Secondary keywords:** `technology consultant East Africa`, `IT consulting services Kenya`, `ICT consulting East Africa`, `IT strategy East Africa`

**Meta title:**
```
IT Consultant East Africa — ICT Consulting & Technology Strategy | Peter Bamuhigire
```

**Meta description:**
```
Independent ICT consulting across East Africa. Technology strategy, ERP implementation, and systems advisory for organisations in Uganda, Kenya, Tanzania, Rwanda, and Ethiopia. Bilingual in English and French. Based in Kampala.
```

**Page h1:**
```
ICT consulting for organisations operating across East Africa's most demanding business environments
```

**Sub-headline:**
```
Most East African organisations get their technology advice from vendors selling a product or from consultants with frameworks designed for different markets. Peter Bamuhigire offers a third option: independent ICT consulting built around 15 years of working inside East and West African organisations — and no incentive to recommend any particular solution.
```

**Body copy (Section 1 — The East Africa context):**
```html
<section class="py-16 md:py-24 bg-warm-white">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 prose prose-navy max-w-none">
    <h2>Why East African organisations need different ICT advice</h2>
    <p>
      East African business environments share a set of technology challenges that Western consulting frameworks do not adequately address: multi-country operations managed across EAC borders with different regulatory environments; multilingual workforces requiring systems that work in English, Swahili, French, and sometimes Kinyarwanda or Amharic; connectivity conditions that vary from fibre in Nairobi CBD to 2G in secondary towns; and the constant tension between enterprise-grade technology and the staffing resources available to operate and maintain it.
    </p>
    <p>
      The ICT consulting practice here was built inside this environment — not designed for it in theory. The methodology for technology strategy, systems audit, and implementation management was developed through 15 years of engagements across Uganda, Kenya, Sierra Leone, Senegal, and Rwanda.
    </p>
    <h2>Cross-border ICT engagements</h2>
    <p>
      Engagements that span multiple East African countries require specific competencies that generalist ICT consultants rarely have: experience navigating different national regulatory frameworks for data and technology, the ability to manage staff training and system adoption across multiple office locations, and direct experience of the infrastructure differences between markets in the region. These are not theoretical competencies — they are the product of running ICT operations across three countries simultaneously at Dynapharm Africa.
    </p>
    <p>
      The practice works with organisations based in any East African country and with organisations headquartered outside the region that need an East Africa technology partner with direct operational experience.
    </p>
  </div>
</section>
```

**Countries covered:** Uganda, Kenya, Tanzania, Rwanda, Ethiopia, Burundi, South Sudan — listed visually as a simple grid or tag list.

**Proof element:**
```astro
<CaseSnippet
  label="Cross-border engagement"
  client="Dynapharm Africa"
  outcome="ICT operations managed across Sierra Leone, Senegal, and Uganda simultaneously. ERP unified. Bilingual staff training delivered across francophone and anglophone offices."
  sector="Pharmaceutical distribution, multi-country"
/>
```

**Cross-link block:**
```html
<div class="bg-navy-50 rounded-xl p-6 border border-navy-100">
  <p class="text-sm font-semibold text-navy-900">Based in Uganda?</p>
  <p class="text-sm text-navy-600 mt-1">This practice is headquartered in Kampala, Uganda. See the dedicated Uganda ICT consulting page for Uganda-specific context, pricing, and case references.</p>
  <a href="/en/it-consulting-uganda/" class="inline-flex items-center text-sm font-semibold text-gold-600 hover:text-amber-accent mt-3 gap-1.5">
    ICT consulting Uganda →
  </a>
</div>
```

**CTA section:**
```
h2: Start with a diagnostic
sub: The first conversation is a 30-minute diagnostic — not a sales call. Peter will tell you honestly whether this practice is the right fit for your East Africa technology challenge.
CTA button: Book an ICT diagnostic call
Link: /en/contact/
```

---

### Page 2 — `/en/software-development-east-africa/`

**File to create:** `src/pages/en/software-development-east-africa.astro`

**Primary keyword:** `software developer East Africa` / `software development East Africa`
**Secondary keywords:** `custom software development Kenya`, `ERP implementation East Africa`, `app developer East Africa`, `software company East Africa`

**Meta title:**
```
Software Developer East Africa — Custom Software & ERP Systems | Peter Bamuhigire
```

**Meta description:**
```
Custom software development across East Africa. Web applications, ERP systems, mobile apps, and SaaS platforms built for East African business environments. Bilingual in English and French. Based in Kampala, Uganda.
```

**Page h1:**
```
Software built for East African businesses — not adapted from somewhere else
```

**Sub-headline:**
```
The East African market has specific software requirements that off-the-shelf products rarely meet: mobile-first architecture, offline capability, multi-currency support across EAC markets, and multilingual interfaces. The platforms built by this practice were designed for these requirements from the ground up — not retrofitted to them.
```

**Body copy:**
```html
<section class="py-16 md:py-24 bg-warm-white">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 prose prose-navy max-w-none">
    <h2>What makes East Africa-specific software development different</h2>
    <p>
      Software for East African businesses must work on the infrastructure that exists in the region, not the infrastructure that exists in the markets where most enterprise software is built. A Kenyan SME using a business management platform needs it to work on a Safaricom data connection — not a 100Mbps fibre line. A Tanzanian property manager needs rent collected via M-Pesa, not SWIFT. A Rwandan NGO needs reports in both English and Kinyarwanda.
    </p>
    <p>
      The three proprietary platforms built by this practice — Maduuka (business management), Aqar (property management), and Longhorn ERP (enterprise resource planning) — handle these requirements natively. They are not adapted Western products. They were built from first principles for the East African environment.
    </p>
    <h2>Custom development for organisations with requirements not covered by existing platforms</h2>
    <p>
      Custom development engagements have been delivered for organisations in Uganda, Kenya, and Sierra Leone, covering: staff management and payroll systems for hospitality groups operating across multiple countries, data management and reporting platforms for research institutions, and logistics tracking systems for distribution companies operating across East African borders.
    </p>
    <p>
      All custom development uses modern web technologies (PHP, MySQL, Python, or JavaScript as appropriate to the requirement), is documented for handover, and is delivered with a training programme for the end users.
    </p>
  </div>
</section>
```

**Products section:** Maduuka, Aqar, Longhorn ERP with brief descriptions and links to `/en/portfolio/`.

**Cross-link block:**
```html
<div class="bg-navy-50 rounded-xl p-6 border border-navy-100">
  <p class="text-sm font-semibold text-navy-900">Uganda-based organisation?</p>
  <p class="text-sm text-navy-600 mt-1">See the dedicated Uganda software development page for Uganda-specific context, UGX pricing guidance, and case references.</p>
  <a href="/en/software-development-uganda/" class="inline-flex items-center text-sm font-semibold text-gold-600 hover:text-amber-accent mt-3 gap-1.5">
    Software development Uganda →
  </a>
</div>
```

**CTA:**
```
h2: Describe your requirement
sub: The first step is a 30-minute diagnostic to establish whether your requirement is better served by an existing platform or a custom build — and what a realistic budget and timeline look like.
CTA button: Start the conversation
Link: /en/contact/
```

---

### Page 3 — `/en/website-development-east-africa/`

**File to create:** `src/pages/en/website-development-east-africa.astro`

**Primary keyword:** `website developer East Africa` / `web design East Africa`
**Secondary keywords:** `web designer Kenya`, `website development Tanzania`, `web design Rwanda`, `website design East Africa`, `professional website East Africa`

**Meta title:**
```
Website Developer East Africa — Professional Web Design | Peter Bamuhigire, Kampala
```

**Meta description:**
```
Professional website design and development for East African businesses. Fast-loading, mobile-first websites that rank in local search results. Serving Uganda, Kenya, Tanzania, Rwanda, and beyond. Based in Kampala.
```

**Page h1:**
```
Website development for East African businesses — built for the networks and markets you operate in
```

**Sub-headline:**
```
A business website for the East African market must perform on mobile networks, rank in local and regional Google search results, and convert visitors from a context where trust signals and local credibility markers differ from those in Western markets. This practice builds for all three.
```

**Body copy:**
```html
<section class="py-16 md:py-24 bg-warm-white">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 prose prose-navy max-w-none">
    <h2>What East African businesses need from a website that most web designers miss</h2>
    <p>
      The East African internet user is predominantly mobile. The East African mobile network varies from fibre-fast 4G LTE in Nairobi CBD to 2G EDGE in secondary towns. A website built on a standard WordPress theme with unoptimised images and a dozen plugins will load in 8-12 seconds on a 3G connection — which means most of your potential clients will leave before it finishes loading.
    </p>
    <p>
      The websites built by this practice are static sites — no database queries on page load, no WordPress overhead, no unnecessary scripts. They load in under 2 seconds on a 3G connection. They are built with mobile-first design from the start, not retrofitted from a desktop design.
    </p>
    <h2>Local SEO for East African markets</h2>
    <p>
      A website that cannot be found in local search results is a website that does not exist for most potential clients. Every website delivered by this practice includes Google Search Console setup, basic on-page SEO for the target market (Uganda, Kenya, Tanzania, Rwanda — whichever applies), and a Google Business Profile optimisation brief. These are not add-ons: they are included because a website without them is incomplete.
    </p>
  </div>
</section>
```

**Cross-link block:**
```html
<div class="bg-navy-50 rounded-xl p-6 border border-navy-100">
  <p class="text-sm font-semibold text-navy-900">Based in Uganda?</p>
  <p class="text-sm text-navy-600 mt-1">See the Uganda-specific web design page for Uganda pricing, Uganda SEO context, and local references.</p>
  <a href="/en/website-development-uganda/" class="inline-flex items-center text-sm font-semibold text-gold-600 hover:text-amber-accent mt-3 gap-1.5">
    Website development Uganda →
  </a>
</div>
```

**CTA:**
```
h2: Get a quote for your East Africa website
sub: Describe your business and what you need from a website. A written quote arrives within 24 hours.
CTA button: Request a website quote
Link: /en/contact/
```

---

## Page Template Structure (all three East Africa pages)

1. Hero — dark (`bg-navy-900 geo-pattern`) — h1 + sub-headline
2. Body copy — `bg-warm-white` — prose, h2 sections, benefit-led
3. Countries covered — visual grid (Uganda, Kenya, Tanzania, Rwanda, Ethiopia, Burundi)
4. Proof element — CaseSnippet component
5. Cross-link to Uganda equivalent — contextual panel
6. CTA section — CTASection component

## Acceptance Criteria

- [ ] `src/pages/en/it-consulting-east-africa.astro` created and builds without errors
- [ ] `src/pages/en/software-development-east-africa.astro` created and builds without errors
- [ ] `src/pages/en/website-development-east-africa.astro` created and builds without errors
- [ ] All three pages have unique meta titles targeting the primary East Africa keyword
- [ ] All three pages have ProfessionalService schema with `areaServed` scoped to East Africa countries
- [ ] All three pages link to the corresponding Uganda page (cross-link block)
- [ ] All three pages link to the homepage and contact page
- [ ] Countries served list includes: Uganda, Kenya, Tanzania, Rwanda, Ethiopia, Burundi
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day (3 pages)
