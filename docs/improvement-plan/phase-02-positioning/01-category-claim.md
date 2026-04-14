# 01 — Define and Deploy the Category Claim

## Skills Applied
- `agency-positioning` — `references/agency-narrative.md`, `references/positioning-language.md`
- `brand-alignment` — `references/trust-architecture-checklist.md`
- `east-african-english` — formal register, British spelling

## Current State

**File:** `src/layouts/BaseLayout.astro:57`
```
"name": "Peter Bamuhigire — IT Consultant & Software Developer"
```

Every page title uses the format `[Page Name] — Peter Bamuhigire — IT Consultant & Software Developer, Kampala Uganda`. "IT Consultant & Software Developer" is a job title, not a category. It describes what Peter does, not what kind of practice this is or who it serves. The agency-positioning skill's agency-narrative defines a category as an "ownable statement of what the practice is" — a named claim that separates it from every other consultant with the same job title.

The site has no category claim anywhere: not in the hero, not in meta descriptions, not in the about page opening, not in structured data.

## Current Score

**Brand positioning and differentiation: 5.5/10**
**Agency expert posture and messaging: 5.0/10**

From the analysis: "The site has no category name. 'IT Consultant & Software Developer' is a job title, not a category."

## Target State

The category claim is:

> **ICT Systems and Custom Software for East and Francophone African Enterprises**

Short form (for headlines and tight spaces):
> **Technology Built for African Business**

This category is:
- **Ownable** — no other single practitioner in Uganda is making this claim with a bilingual site and 15 years of pan-African evidence
- **Specific enough to repel** — "enterprises" and "East and Francophone Africa" screen out startups, one-country buyers, and anglophone-only clients
- **Broad enough to grow within** — covers ICT consulting, software development, website development, ERP, and business advisory
- **Verifiable** — Peter's career timeline proves it (Sierra Leone, Senegal, Uganda, 10+ countries, EN/FR capability)

The category appears in:
1. The hero section pre-head (above the h1)
2. The BaseLayout title template suffix
3. The `ProfessionalService` schema `description` field
4. The about page opening paragraph
5. Every page's meta description pattern

## Target Score

**Brand positioning and differentiation: 6.8/10** (+1.3)
**Agency expert posture and messaging: 6.5/10** (+1.5)

## Why This Matters

Without a category, Peter competes in the commodity market of "IT consultants." With a category, he competes in a market of one — there is no other bilingual, pan-African ICT consultant with a structured web presence making this specific claim. The agency-positioning skill states: "Without a category, the site cannot command premium positioning. Buyers who search 'IT consultant Kampala' will compare Peter to a commodity market."

The category claim also anchors every downstream piece of copy. Every headline, every service description, every blog post introduction should be able to point back to this claim.

## Step-by-Step Instructions

### Step 1 — Update the BaseLayout title template

**File:** `src/layouts/BaseLayout.astro`

The current schema `name` field at line 57 reads:
```json
"name": "Peter Bamuhigire — IT Consultant & Software Developer"
```

Change it to:
```json
"name": "Peter Bamuhigire — ICT Consulting & Custom Software for African Enterprises"
```

The current schema `description` field at line 61 reads:
```
"IT consulting, software development, website design, and business advisory services in Kampala, Uganda. Serving clients across East Africa and internationally."
```

Change it to:
```
"ICT consulting, custom software development, and enterprise technology systems for businesses operating across East and Francophone Africa. Based in Kampala, Uganda. Bilingual: English and French."
```

### Step 2 — Update the homepage hero pre-head badge

**File:** `src/pages/en/index.astro:70-73`

Current code:
```html
<div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-gold-400/10 border border-gold-400/20 mb-6">
  <span class="w-2 h-2 rounded-full bg-gold-400 animate-pulse"></span>
  <span class="text-gold-400 text-sm font-medium">Available for new projects</span>
</div>
```

Replace the badge text with the category pre-head. The "Available for new projects" badge is addressed separately in `05-available-badge-fix.md`. For now, the priority is adding the category claim. If the badge remains, it appears below the category pre-head; if removed (per file 05), the category stands alone.

Add this component directly above the h1 (before line 75):
```html
<p class="text-gold-400 text-sm font-semibold uppercase tracking-widest mb-3">
  ICT Consulting & Custom Software · East & Francophone Africa
</p>
```

### Step 3 — Update the French homepage equivalent

**File:** `src/pages/fr/index.astro`

Find the equivalent hero text section and add before the h1:
```html
<p class="text-gold-400 text-sm font-semibold uppercase tracking-widest mb-3">
  Conseil Informatique & Logiciels Sur Mesure · Afrique de l'Est & Afrique Francophone
</p>
```

### Step 4 — Update the about page opening

**File:** `src/pages/en/about.astro`

Find the about page hero/opening section. The current title is "Peter Bamuhigire's Story" — that change is handled in Phase 4, file 03. For this task, add a category statement as the first sentence of the about page sub-headline or opening paragraph:

Locate the about page hero sub-headline (typically the first `<p>` tag in the about page hero section). Prepend this sentence:

```
Peter Bamuhigire runs an ICT consulting and custom software practice serving businesses across East and Francophone Africa — from Kampala to Kinshasa, from Nairobi to Dakar.
```

### Step 5 — Update the FR about page equivalent

**File:** `src/pages/fr/about.astro`

Add the equivalent French opening:
```
Peter Bamuhigire dirige un cabinet de conseil informatique et de développement logiciel au service des entreprises à travers l'Afrique de l'Est et l'Afrique francophone — de Kampala à Kinshasa, de Nairobi à Dakar.
```

### Step 6 — Update the `og:site_name` meta tag

**File:** `src/layouts/BaseLayout.astro:158`

Current:
```html
<meta property="og:site_name" content="Peter Bamuhigire — IT Consultant & Software Developer, Kampala" />
```

Change to:
```html
<meta property="og:site_name" content="Peter Bamuhigire — ICT Consulting & Custom Software for African Enterprises" />
```

### Step 7 — Verify the change compiles

Run:
```bash
npm run build
```

Confirm no build errors. Check that the category line appears in the homepage hero on `localhost:4321/en/`.

## Acceptance Criteria

- [ ] BaseLayout schema `name` field uses the new category phrase
- [ ] BaseLayout schema `description` field references East and Francophone Africa and bilingual capability
- [ ] Homepage EN hero has the category pre-head line above the h1
- [ ] Homepage FR hero has the French equivalent category pre-head
- [ ] About page EN opening paragraph contains the category claim sentence
- [ ] About page FR opening paragraph contains the French equivalent
- [ ] `og:site_name` updated in BaseLayout
- [ ] `npm run build` passes with no errors
- [ ] Reading the homepage hero, a new visitor can state in one sentence what kind of practice this is

## Effort

**S** — 4 hours total (writing and implementation)
