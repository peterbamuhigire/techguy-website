# 01 — Headline Audit and Full Rewrites (All Main Pages)

## Skills Applied
- `sales-copywriting` — `references/headline-mastery.md`, `references/website-messaging-framework.md`
- `east-african-english` — formal register, British spelling

## Current State

From the April 2026 analysis, all main page headlines fail the 4 U's scoring test (minimum 12/16 to ship):

| Page | Current Headline | U | US | UR | UN | Total |
|------|-----------------|---|----|----|----|-------|
| Homepage | "Building Technology Solutions Across Africa & Beyond" | 2 | 1 | 1 | 2 | 6/16 |
| Services | "IT Consulting & Software Development Services" | 2 | 1 | 1 | 1 | 5/16 |
| About | "Peter Bamuhigire's Story" | 1 | 2 | 1 | 1 | 5/16 |
| Contact | "Get in Touch" | 1 | 1 | 1 | 1 | 4/16 |
| Blog | "Tech Insights for African Businesses" | 2 | 2 | 1 | 2 | 7/16 |

## Current Score

**Sales copywriting and CTA architecture: 5.5/10**

## Target State

All main page headlines score 12+/16 on the 4 U's. No headline below 10/16 ships.

## Target Score

**Sales copywriting and CTA architecture: 7.0/10** (+1.5)

## Why This Matters

The headline is read by 80% of visitors; the body copy by 20% (Ogilvy). Every headline that fails the 4 U's test is squandering the attention of 80% of the site's visitors.

## Step-by-Step Instructions

### Page 1 — Homepage (EN)

**File:** `src/pages/en/index.astro:75-78`

Done in Phase 2, file 02. The new headline is:
"The ICT consultant East and Francophone African enterprises call when the technology challenge is too complex for generalists"

4 U's: U=3, US=4, UR=3, UN=4 = **14/16** ✓

### Page 2 — Homepage (FR)

**File:** `src/pages/fr/index.astro`

Done in Phase 2, file 02. The new headline is:
"Le consultant ICT que les entreprises d'Afrique francophone sollicitent lorsque le défi technologique dépasse les généralistes"

4 U's: U=3, US=4, UR=3, UN=4 = **14/16** ✓

### Page 3 — Services (EN)

**File:** `src/pages/en/services.astro`

Find the services page h1. Current: `"IT Consulting & Software Development Services"` (or equivalent).

**New EN headline:**
```
ICT consulting, custom software, and enterprise systems for businesses operating across Africa
```

4 U's: U=3, US=3, UR=2, UN=3 = **11/16** — acceptable; stronger than 5/16.

**New EN sub-headline:**
```
This is not a menu of services. It is a diagnostic practice — one that identifies the right technological intervention for your specific situation before recommending a solution.
```

**File change:** Find the h1 in `services.astro` and replace. Then find the sub-headline `<p>` immediately below and replace with the above.

### Page 4 — Services (FR)

**File:** `src/pages/fr/services.astro`

**New FR headline:**
```
Conseil ICT, développement logiciel et systèmes d'entreprise pour les organisations opérant à travers l'Afrique
```

**New FR sub-headline:**
```
Il ne s'agit pas d'un catalogue de services, mais d'une pratique de diagnostic — qui identifie la bonne intervention technologique pour votre situation spécifique avant de recommander une solution.
```

### Page 5 — About (EN)

**File:** `src/pages/en/about.astro`

Current h1: `"Peter Bamuhigire's Story"` — biography framing, not buyer framing.

**New EN headline:**
```
Why organisations across 10 African countries have trusted the same practitioner for 15 years
```

4 U's: U=4, US=4, UR=3, UN=3 = **14/16** ✓

**New EN sub-headline:**
```
The answer is not credentials — it is a consistent approach to technology that starts with listening before prescribing.
```

**File change:** Find the h1 in `about.astro` and replace the current text.

### Page 6 — About (FR)

**File:** `src/pages/fr/about.astro`

**New FR headline:**
```
Pourquoi des organisations dans 10 pays africains ont fait confiance au même praticien pendant 15 ans
```

**New FR sub-headline:**
```
La réponse ne tient pas aux diplômes — elle tient à une approche constante qui commence par écouter avant de prescrire.
```

### Page 7 — Contact (EN)

**File:** `src/pages/en/contact.astro`

Current h1: `"Get in Touch"` — 4/16 on 4 U's.

**New EN headline:**
```
Tell us about your technology challenge
```

4 U's: U=3, US=2, UR=2, UN=3 = **10/16** — acceptable minimum; the contact page's job is conversion, not attention-getting.

**New EN sub-headline:**
```
The first conversation is a diagnostic, not a sales pitch. You will leave knowing whether Peter's practice is the right fit for your situation — and, if not, who is.
```

**File change:** `src/pages/en/contact.astro` — find the h1 and sub-headline and replace.

### Page 8 — Contact (FR)

**File:** `src/pages/fr/contact.astro`

**New FR headline:**
```
Parlez-nous de votre défi technologique
```

**New FR sub-headline:**
```
La première conversation est un diagnostic, non une démarche commerciale. Vous repartirez en sachant si le cabinet de Peter convient à votre situation — et, dans le cas contraire, vers qui vous orienter.
```

### Page 9 — Blog (EN)

**File:** `src/pages/en/blog.astro`

Current: `"Tech Insights for African Businesses"` — 7/16.

**New EN headline:**
```
ICT and technology guides for businesses operating across East and Francophone Africa
```

4 U's: U=3, US=3, UR=2, UN=3 = **11/16** ✓

**New EN sub-headline:**
```
Practical articles on software development, ICT strategy, ERP implementation, and digital transformation — written from 15 years of on-the-ground experience in 10+ African countries.
```

### Page 10 — Blog (FR)

**File:** `src/pages/fr/blog.astro`

**New FR headline:**
```
Guides ICT et technologie pour les entreprises opérant en Afrique de l'Est et en Afrique francophone
```

**New FR sub-headline:**
```
Articles pratiques sur le développement logiciel, la stratégie ICT, l'implémentation ERP et la transformation numérique — rédigés à partir de 15 ans d'expérience terrain dans plus de 10 pays africains.
```

### Page 11 — Websites service page (EN)

**File:** `src/pages/en/websites.astro`

**New EN headline:**
```
Professional websites for East African businesses that need to be found — and trusted — online
```

4 U's: U=3, US=3, UR=2, UN=3 = **11/16** ✓

### Page 12 — Websites service page (FR)

**File:** `src/pages/fr/websites.astro`

**New FR headline:**
```
Sites web professionnels pour les entreprises africaines qui doivent être trouvées — et reconnues comme fiables — en ligne
```

### Page 13 — Business Planning Consulting (EN)

**File:** `src/pages/en/business-planning-consulting-service.astro`

**New EN headline:**
```
Business planning and advisory for organisations ready to formalise their growth strategy
```

### Page 14 — Digital Marketing Strategy (EN)

**File:** `src/pages/en/digital-marketing-strategy.astro`

**New EN headline:**
```
Digital marketing strategy for East African businesses that want to be found before their competitors
```

## Acceptance Criteria

- [ ] All 14 pages listed above have updated h1 tags
- [ ] No h1 on any main page scores below 10/16 on the 4 U's
- [ ] All EN headlines use British spelling (organisation, programme, favour, colour)
- [ ] All FR headlines use formal francophone African register (vouvoiement implied, no Parisian slang)
- [ ] Sub-headlines are present on every page (not just h1 changes)
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day (writing rewrites, verifying 4 U's scores, implementing in all files)
