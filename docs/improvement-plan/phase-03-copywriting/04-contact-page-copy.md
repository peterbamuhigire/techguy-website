# 04 — Contact Page Full Copy Rewrite

## Skills Applied
- `sales-copywriting` — `references/website-messaging-framework.md` (Sections 3, 7)
- `cro-audit` — `references/heuristic-checklist.md` (Section 5, Forms)
- `east-african-english` — formal register, British spelling

## Current State

**File:** `src/pages/en/contact.astro:40-45`

Current hero headline: `"Get in Touch"` — 4/16 on the 4 U's.

Current sub-headline (from analysis): `"Whether you have a project in mind, need strategic guidance, or simply wish to explore possibilities — enquiries are always welcome."`

Problems:
- "Get in Touch" — no verb-specificity, no reward, fails all four U's
- "enquiries are always welcome" — order-taker language (fixed in Phase 2, file 03)
- Submit button copy unknown but likely "Submit" or "Send" — weak anti-verb
- Meta title targets same keyword as homepage (cannibalisation)

## Current Score

**Sales copywriting and CTA architecture: 5.5/10**
**CRO and lead generation: 5.5/10**

## Target State

Every element of the contact page is rewritten to serve the diagnostic posture: the visitor is not enquiring generically — they are beginning a structured intake process.

## Target Score

**Sales copywriting and CTA architecture: 7.0/10** (partial — full improvement requires all Phase 3 files)
**CRO and lead generation: 6.5/10** (partial)

## Why This Matters

The contact page is the highest-intent page on the site — visitors who arrive there have already decided they want to start a conversation. The current copy wastes that intent by using the lowest-energy language on the site. Rewriting the contact page converts the same high-intent visitor into a qualified lead rather than a browser.

## Step-by-Step Instructions

### Step 1 — Rewrite the EN meta title and description

**File:** `src/pages/en/contact.astro` — find the `title` and `description` props passed to `BaseLayout`.

Current title (approximate): `"Contact Peter Bamuhigire — IT Consultant, Kampala Uganda"`

**New title:** `"Book an ICT Diagnostic Call — Peter Bamuhigire, Kampala"`

Current description (approximate): `"Contact Peter Bamuhigire for IT consulting, software development, and technology solutions in Uganda and East Africa."`

**New description:** `"Book a 30-minute ICT diagnostic call with Peter Bamuhigire. We discuss your technology challenge and tell you honestly whether this practice is the right fit. Based in Kampala, Uganda, serving East and Francophone Africa."`

### Step 2 — Rewrite the FR meta title and description

**File:** `src/pages/fr/contact.astro`

**New FR title:** `"Réserver un appel diagnostic ICT — Peter Bamuhigire, Kampala"`

**New FR description:** `"Réservez un appel diagnostic ICT de 30 minutes avec Peter Bamuhigire. Nous analysons votre défi technologique et vous disons honnêtement si ce cabinet est adapté à votre situation. Basé à Kampala, Ouganda, au service de l'Afrique de l'Est et francophone."`

### Step 3 — Rewrite the EN contact page h1

**File:** `src/pages/en/contact.astro` — find the h1 element.

Current: `"Get in Touch"`

**New EN h1:**
```
Tell us about your technology challenge
```

4 U's: U=3, US=2, UR=2, UN=3 = **10/16** — acceptable for a conversion page where commitment is the goal, not attention-getting.

### Step 4 — Rewrite the EN contact page sub-headline

**File:** `src/pages/en/contact.astro`

Find the paragraph immediately below the h1. Current text includes "enquiries are always welcome."

**New EN sub-headline:**
```
The first conversation is a 30-minute diagnostic — not a sales call. By the end of it, you will know whether this practice is the right fit for your situation, and Peter will know whether he can genuinely help. If the fit is not right, he will tell you that too.
```

### Step 5 — Rewrite the FR contact page h1 and sub-headline

**File:** `src/pages/fr/contact.astro`

**New FR h1:**
```
Parlez-nous de votre défi technologique
```

**New FR sub-headline:**
```
La première conversation est un diagnostic de 30 minutes — pas une démarche commerciale. À l'issue de cet échange, vous saurez si ce cabinet correspond à votre situation, et Peter saura s'il peut véritablement vous aider. Si ce n'est pas le cas, il vous le dira également.
```

### Step 6 — Rewrite the EN form section intro

**File:** `src/pages/en/contact.astro`

Find the paragraph or label above the form fields (e.g. "Kindly share your details" at line 62).

Current: `"Kindly share your details"` — appropriately formal (East African register), but generic.

**New form intro:**
```
Complete the form below. We respond within 1 business day, usually sooner. If you have a detailed brief ready, include it — it makes the diagnostic call more productive for both parties.
```

**FR equivalent:**
```
Remplissez le formulaire ci-dessous. Nous répondons dans un délai d'un jour ouvrable, souvent avant. Si vous disposez d'un cahier des charges détaillé, joignez-le — cela rend l'appel diagnostic plus productif pour les deux parties.
```

### Step 7 — Rewrite the submit button copy

**File:** `src/pages/en/contact.astro` — find the form submit button.

Current (likely): `"Submit"` or `"Send Message"`

**New EN submit button:**
```
Send my project brief
```

**New FR submit button:**
```
Envoyer mon brief de projet
```

### Step 8 — Add a proof line near the CTA

Directly above the submit button, add a proof line that reduces friction:

**EN:**
```html
<p class="text-xs text-navy-400 mb-4">
  Organisations from 10 African countries have trusted this practice. The diagnostic call costs nothing; it takes 30 minutes; and it is genuinely useful whether or not we work together.
</p>
```

**FR:**
```html
<p class="text-xs text-navy-400 mb-4">
  Des organisations de 10 pays africains ont fait confiance à ce cabinet. L'appel diagnostic ne coûte rien, dure 30 minutes et est réellement utile, que nous travaillions ensemble ou non.
</p>
```

### Step 9 — Add operating hours clearly

**File:** `src/pages/en/contact.astro`

Find the section listing contact details. Ensure this appears:
```
Response time: within 1 business day
Working hours: Monday to Friday, 08:00–17:00 EAT (East Africa Time, UTC+3)
WhatsApp: +256 784 464178 (preferred for urgent matters)
```

**FR:**
```
Délai de réponse : dans un jour ouvrable
Horaires : lundi au vendredi, 08h00–17h00 HAE (UTC+3)
WhatsApp : +256 784 464178 (recommandé pour les questions urgentes)
```

## Acceptance Criteria

- [ ] EN meta title: "Book an ICT Diagnostic Call — Peter Bamuhigire, Kampala"
- [ ] EN meta description references 30-minute diagnostic and East and Francophone Africa
- [ ] EN h1: "Tell us about your technology challenge"
- [ ] FR h1: "Parlez-nous de votre défi technologique"
- [ ] EN sub-headline references the diagnostic, not a sales call
- [ ] "enquiries are always welcome" does not appear anywhere on the contact page
- [ ] Submit button reads "Send my project brief" (EN) / "Envoyer mon brief de projet" (FR)
- [ ] Proof line appears above submit button
- [ ] Response time and working hours are clearly stated
- [ ] `npm run build` passes with no errors

## Effort

**S** — 3 hours
