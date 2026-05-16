# New Project Kickstart Prompt

> **Purpose:** Paste this prompt into Claude Code at the root of any new website project to kick off the full build pipeline. Claude will read your source documents and photos, generate all content files, then build the complete site.
>
> **Prerequisites:**
> 1. Copy `new-project.sh` / `new-project.ps1` into your project root, then run it: `bash new-project.sh` (Linux/macOS) or `.\new-project.ps1` (Windows)
> 2. Drop all business documents (PDF, DOCX, TXT) into `docs/references/`
> 3. Drop all photos into the appropriate `photo-bank/` subdirectory
> 4. Drop your logo (PNG with transparent background) into `photo-bank/branding/`
> 5. Open Claude Code at the project root: `claude`
> 6. Paste this entire prompt
>
> **What this prompt does:**
> - Phase 1: Pre-flight checks (gitignore, submodule, files present)
> - Phase 2: Reads all source documents and catalogs photos
> - Phase 3: Produces a discovery summary — **waits for your review**
> - Phase 4: Generates all `docs/en/` content files from the documents
> - Phase 5: Triggers the full website build pipeline
>
> **Important:** Fill in the `[PROJECT CONFIGURATION]` section below before pasting.

---

## [PROJECT CONFIGURATION] — Fill This In Before Pasting

```
Client/company name:        [e.g. Acme Consulting]
Domain (if known):          [e.g. acmeconsulting.co.ug  or  [UNKNOWN]]
Primary language:           [English / French / Kiswahili — default: English]
Languages to enable:        [e.g. en, fr  |  en only  |  en, fr, sw — default: en, fr, sw]
Industry/sector:            [e.g. law firm / SaaS / restaurant / ecommerce / consulting / healthcare]
Primary CTA goal:           [e.g. book a consultation / request a demo / buy online / call us]
Design references (URLs):   [e.g. competitor1.com, competitor2.com  or  [NONE]]
Special requirements:       [e.g. e-commerce, booking system, photo gallery, blog  or  [NONE]]
```

---

## Prompt

You are kicking off a new website project. Your job is to read the client's source documents and photos, understand their business, generate all content files, then build a complete, production-grade website using the skills in `.claude/skills/`.

Work methodically through the phases below. Stop at each checkpoint and wait for confirmation before proceeding.

---

### PHASE 1 — Pre-Flight Checks

Before doing anything else, run these checks and fix any issues silently:

**1.1 Verify .gitignore protects private content**

Read `.gitignore`. If `docs/` and `photo-bank/` are not already excluded, add them now. These directories contain client confidential documents and photos that must never be pushed to git.

The `.gitignore` must include:
```
# Client confidential content — never commit
docs/
photo-bank/
```

If they are already present, continue. If not, add them to `.gitignore` now without comment.

**1.2 Verify skills submodule**

Check that `.claude/skills/` exists and contains `website-builder/SKILL.md`. If the directory is empty or missing, stop and tell the user: "The skills submodule is missing. Please run: `git submodule update --init --recursive`"

**1.3 Catalog source documents**

List every file in `docs/references/`. Note the filename, type (PDF/DOCX/TXT/image), and estimated size. If `docs/references/` is empty, stop and tell the user: "No source documents found in `docs/references/`. Please add at least one document describing the business before proceeding."

**1.4 Catalog photo bank**

List every file in `photo-bank/` and all subdirectories. Note filenames, types, and which subdirectory each is in. Pay special attention to `photo-bank/branding/` for logos.

Report Phase 1 status in a brief table, then proceed immediately to Phase 2.

---

### PHASE 2 — Document Intelligence

Read every file in `docs/references/`. Extract structured information from all documents.

**For PDFs:** Use the Read tool directly. For large PDFs (over 10 pages), read in sections using the `pages` parameter. Extract all relevant content — do not skip sections because they seem unimportant.

**For DOCX files:** Use the Read tool. If the file cannot be read directly, note it and continue with other documents.

**For images (scanned documents):** Describe what you see. Note that text extraction from images is limited.

Extract the following from all documents combined:

| Category | What to Extract |
|----------|-----------------|
| **Company identity** | Full legal name, trading name, tagline/slogan, founding year, registration details |
| **Business overview** | What they do, primary products/services, unique value proposition |
| **Target customers** | Who they serve, demographics, geography, industries |
| **Services/products** | Full list with descriptions, pricing (if available), key features |
| **Team** | Names, roles, bios, photos mentioned |
| **Contact details** | Address, phone, email, WhatsApp, social media, website |
| **Brand personality** | Tone words (e.g. professional, friendly, bold), colour mentions, style preferences |
| **Competitors** | Any competitors named or implied |
| **Social proof** | Testimonials, case studies, client names, awards, years in business |
| **Metrics/credentials** | Years in operation, clients served, certifications, accreditations |
| **Story/origin** | Why the company was founded, the problem it solves |
| **Mission/vision/values** | Explicit or inferred |
| **FAQ/common questions** | Any recurring questions answered in documents |
| **Legal requirements** | Industry regulations, certifications required (e.g. legal ethics, medical, financial) |

Note any gaps — information that a complete website needs but is not present in the documents. You will flag these in the discovery summary.

---

### PHASE 3 — Discovery Summary (CHECKPOINT — WAIT FOR CONFIRMATION)

Produce a structured discovery summary in this format:

---

**DISCOVERY SUMMARY**

**Company:** [name]
**Industry:** [inferred sector]
**Location:** [city, country]
**Primary language:** [language of source documents]

**What I understood:**
[3-5 sentences synthesising what this business is, who it serves, and what makes it distinctive. Write this as if briefing a designer.]

**Services/Products identified:**
[Bulleted list — be specific]

**Brand personality inferred:**
[3-5 adjectives with a one-sentence rationale for each]

**Photos available:**
- Logo: [yes — filename / no — will use text logo]
- Hero images: [count and description]
- Team photos: [count]
- Service/product images: [count and description]
- Other: [anything notable]

**Languages to build:**
[List based on project configuration above]

**Sector treatment:**
[Which sector skill to use, if any — e.g. sectors/legal, or sector-strategies with "professional services"]

**Information gaps (need your input before I proceed):**
[Numbered list of missing information that will affect content quality. Be specific: "No phone number found", "Pricing not mentioned — I will use placeholder", "No team photos available — I will use CSS placeholders"]

**Assumptions I will make if you approve:**
[Numbered list of reasonable assumptions you will make for missing details — taglines, placeholder metrics, etc.]

---

**→ STOP HERE. Review the discovery summary above.**

- If anything is wrong or missing, correct me before I proceed.
- If the gaps list needs your input, provide that information now.
- When you are satisfied, reply: **"Proceed to Phase 4"**

---

### PHASE 4 — Content Generation

*Do not start this phase until the user confirms "Proceed to Phase 4".*

Generate all content files in `docs/en/`. Each file must be a complete, polished marketing document in British English. Every claim must be grounded in the source documents or the approved assumptions from Phase 3. Never fabricate services, products, team members, credentials, or metrics.

**Language standard:** British English throughout — colour, organisation, travelling, centre, recognise, licence (noun), emphasise, prioritise.

**Tone:** Determined by the brand personality inferred in Phase 3. Hold this tone consistently across all files.

**Placeholder rule:** When real data is missing, use a clearly marked placeholder: `[PLACEHOLDER — description of what's needed]`. Never invent specific numbers, dates, or names.

Generate these files in order:

---

#### `docs/en/company-profile.md`

Extract from: company identity, mission/vision/values, contact details, key metrics.

Include:
- Company name, tagline, industry
- Mission statement (extract or craft from the documents)
- Vision statement
- Core values (3-5 with brief descriptions)
- Key proof points (years in business, clients served, locations — use placeholders if unknown)
- Full contact details (address, phone, email, social media)
- Brief company description (2-3 paragraphs for the About section)

---

#### `docs/en/pages.md`

Design the site architecture based on the business type and services identified.

Structure:
- List every page with its purpose, hero message, primary CTA, and key sections
- Navigation order (typically: Home, [core service pages], About, Contact)
- Primary CTA across the site (from project configuration above)
- Secondary CTA
- Page-by-page content outline (not full copy — that comes from other files)

For each page include:
```yaml
slug: about
title: [page title]
hero_headline: [10 words max — benefit-driven]
hero_subheadline: [20 words max — supports the headline]
cta_primary: [button text]
cta_link: /contact
sections:
  - [section name: what it contains]
  - ...
```

---

#### `docs/en/style-brief.md`

Based on the industry, brand personality, and any design clues in the source documents.

Include:
- Mood board description (3-4 sentences describing the intended visual feel)
- Colour direction (describe, don't just name — e.g. "deep forest green evoking growth and stability, paired with warm gold for premium feel")
- Typography direction (personality of heading font, body font — no specific names needed)
- Photography style (describe the ideal photo treatment)
- Layout preferences (spacious/dense, bold/minimal, etc.)
- Dark mode / light mode preference
- Things to avoid (visual clichés for this industry)
- Reference sites (from project configuration above)

---

#### `docs/en/services.md`

One entry per service or product identified in the source documents.

For each service:
- Name
- One-sentence description (the promise)
- 4-6 bullet points of specific capabilities (extracted from documents)
- Who it is for (target customer)
- CTA (e.g. "Get a free consultation", "Request a demo")

Group services into logical categories if there are more than 5.

Mark any "Coming Soon" services clearly.

---

#### `docs/en/team-profiles.md`

For each team member found in the documents:
- Full name
- Role/title
- Bio (2-3 sentences — professional, third person)
- Expertise areas (3-5 bullet points)
- LinkedIn placeholder if not provided
- Photo reference (filename from photo-bank/team/ if available, else `[PLACEHOLDER — team headshot needed]`)

Add placeholder slots for any roles that are clearly implied but not named. Mark them: `[PLACEHOLDER — role name, bio needed]`

---

#### `docs/en/contact.md`

Extract all contact information from documents.

Include:
- Primary phone number(s)
- Primary email address(es)
- Physical address (with map embed instructions as a comment)
- WhatsApp number if different from phone
- Business hours
- Social media links
- Primary conversion action (consultation / demo / enquiry — from project configuration)
- If the business has multiple service divisions, include separate enquiry paths per division

---

#### `docs/en/testimonials.md`

If real testimonials exist in the source documents, use them verbatim (preserve the client's exact words). You may rewrite for clarity and grammar while preserving the customer's meaning.

If no real testimonials exist, create the file with a header and a note for the client:

```markdown
# Testimonials

<!-- CLIENT ACTION REQUIRED: Please provide 3-5 real customer testimonials.
     Include: customer name, location, industry/business type, and their quote.
     We will rewrite for clarity and translate into all enabled languages. -->
```

Never fabricate, invent, or generate fictional testimonials — even as placeholders with realistic names. Fake social proof destroys trust and may violate advertising regulations.

---

#### `docs/en/portfolio.md`

If real case studies or projects exist in the source documents, document them accurately.

If not, create 3-4 placeholder case studies that represent the types of work described in the documents. Each should include:
- Client type (not a real name unless from documents)
- Challenge
- Solution (referencing actual services)
- Outcome with metric placeholders

Mark all placeholders clearly.

---

#### `docs/en/faq.md`

Write 10-15 FAQs covering:
- What the company does (general)
- Who they serve
- How to get started
- One FAQ per major service
- Pricing/quoting process
- Location and service area
- Industry-specific trust questions (e.g. for legal: confidentiality; for medical: credentials; for tech: data security)

Base answers on actual information from the documents. Where information is not available, give an honest answer: "Contact us for a personalised quote."

---

#### `docs/en/about-story.md`

Tell the company's origin story using the Hero's Journey framework (the customer is the hero, the company is the guide):

1. **The world before** — What problem did clients face before this company existed?
2. **The turning point** — Why was this company founded? What did the founder(s) see?
3. **The mission** — What are they working to achieve for their clients?
4. **How they're different** — What makes their approach distinctive?
5. **The proof** — Milestones, credentials, client outcomes (use real data or placeholders)
6. **The vision** — Where is this headed?

Use the company's actual founding story if available in the documents. Do not fabricate origin details — use placeholders for unknown dates and milestones.

---

#### `docs/en/gallery.md`

Cross-reference the `photo-bank/` catalog from Phase 1.

For each photo in photo-bank/:
- Create a gallery entry with filename, category, caption (descriptive, SEO-friendly), and alt text
- Assign to the most appropriate gallery category

For categories with no photos yet:
- Create placeholder entries marked `[PHOTO NEEDED — description of ideal shot]`

---

#### `docs/i18n-config.md`

Update the i18n configuration based on the languages specified in the project configuration above.

For each enabled language:
- Set the language code, name, and locale
- Set the default language
- Note translation status (en = source, fr/sw = needs translation)

If a language is disabled, comment it out with a note.

---

#### `docs/seo.md`

Fill in the SEO template using information from the documents and project configuration.

Include:
- Site URL (from project configuration, or placeholder)
- Business schema type (select the most appropriate: `LocalBusiness`, `ProfessionalService`, `Organization`, `MedicalBusiness`, `LegalService`, `Restaurant`, etc.)
- Per-page meta titles and descriptions (60 chars / 155 chars respectively)
- Target keywords per page (3-5 per page, based on industry and services)
- Local SEO fields (business name, address, phone, geo-coordinates if known)
- Open Graph defaults

---

**After generating all files:**

1. Report a content generation summary:
   - Files created: [list]
   - Placeholders that need human input: [numbered list — be specific]
   - Photos available vs. photos needed: [count each]
   - Translation work required: [what needs translating to fr / sw]

2. Ask: **"Content is ready for your review. Do you want to proceed with the full website build now, or review the content files first?"**

---

### PHASE 5 — Website Build

*Do not start this phase until the user confirms they want to proceed with the build.*

Now build the complete website by invoking the skills in `.claude/skills/` in the correct sequence.

**Read the `website-builder` skill first:** `.claude/skills/website-builder/SKILL.md`

Follow the website-builder skill exactly. It will orchestrate the remaining skills in the correct order:

1. **i18n** — Set up multi-language infrastructure based on `docs/i18n-config.md`
2. **design-reference** — Only if reference URLs were provided in the project configuration
3. **brand-strategy** — Run for brand positioning (produces `docs/brand-brief.md`)
4. **sector-strategies** or `sectors/{sector}` — Based on the industry identified in Phase 3
5. **design-system** — Define fonts, colours, tokens, animations
6. **photo-manager** — Compress and catalog all photos from `photo-bank/`
7. **page-builder** — Build all Astro pages, layouts, and components
8. **seo** — Integrate hreflang, sitemaps, structured data
9. **deploy** — Verify build, generate nginx.conf and deploy.sh

After the build completes, run `npm run build` and verify it succeeds with zero errors.

Report final build status:
- Build status: ✓ success / ✗ failed (with error)
- Pages built: [count per language]
- Photos used: [count]
- Lighthouse scores (if measurable): performance / accessibility / SEO
- What the user should do next:
  1. Review the site at `localhost:4321` (`npm run dev`)
  2. Replace placeholder content (list the specific placeholders)
  3. Add missing photos (list the specific slots)
  4. Commission translations for fr/ and sw/ directories
  5. Deploy when ready using `deploy.sh`

---

### Quality Gates (Apply Throughout)

These rules apply to every file generated in every phase:

**Content rules:**
- Never fabricate company information — only use what is in the source documents or approved assumptions
- Every service mentioned must be real (from documents)
- Every team member must be real (from documents) or clearly marked as a placeholder
- Placeholder text must be specific: `[PLACEHOLDER — founding year needed]` not just `[PLACEHOLDER]`

**Writing rules:**
- British English throughout (colour, organisation, centre, recognise, prioritise)
- No AI writing tells — no "In today's fast-paced world", "Leverage", "Synergy", "Delve", "Unlock", "Transformative", "Seamlessly", "Robust", "Cutting-edge", "Empower"
- Benefit-driven headlines: "Track Your Stock Across All Branches" not "Advanced Inventory Management"
- Fog Index 8-10 readability: short sentences, plain words
- Active voice preferred

**Design rules:**
- Never use Inter, Roboto, Arial, or system fonts as primary typefaces
- Never produce a generic blue/white SaaS layout
- Every site must look different — commit to a distinctive visual direction for this client's industry
- Mobile-first: design for 375px width first
- Zero unnecessary JavaScript

**Photo rules:**
- Never reference external placeholder services (no unsplash.com, placeholder.com, picsum.photos)
- Never upscale photos
- Always measure dimensions before placing
- Use CSS gradient placeholders for missing photos — never leave broken image references
