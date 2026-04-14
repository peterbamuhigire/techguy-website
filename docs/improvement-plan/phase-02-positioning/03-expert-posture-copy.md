# 03 — Fix All Order-Taker Signals Across the Site

## Skills Applied
- `agency-positioning` — `references/agency-narrative.md`, `references/legacy-guidance.md`
- `sales-copywriting` — `references/website-messaging-framework.md`
- `east-african-english` — formal register, British spelling

## Current State

The analysis identified four distinct order-taker signals. Each one undermines the expert posture being built in files 01 and 02.

| Signal | Location | Why It's an Order-Taker Signal |
|--------|----------|-------------------------------|
| "Available for new projects" badge | `src/pages/en/index.astro:72` | Signals availability, which is correct for a freelancer but wrong for an expert. Experts are selective, not available. |
| "enquiries are always welcome" | `src/pages/en/contact.astro:43-45` | Opposite of the Doctor posture. A doctor does not welcome all enquiries; they screen. |
| Services listed as a flat menu | `src/pages/en/services.astro` | "We do everything" language prevents category ownership. |
| "Get in Touch" / "Let's talk" CTAs | Header, multiple pages | No verb-specificity, no reward named, no action described. |

## Current Score

**Agency expert posture and messaging: 5.0/10**

## Target State

Every copy signal on the site projects expert confidence, not availability. The Doctor posture (from the agency-positioning skill's legacy guidance) requires: the expert diagnoses before prescribing; the expert sets the terms; the expert does not advertise availability.

## Target Score

**Agency expert posture and messaging: 6.5/10** (+1.5)

## Why This Matters

The agency-positioning skill states: "Without a category, the site cannot command premium positioning." Premium positioning requires consistency — one order-taker phrase can undermine an otherwise expert-postured page. The fix is precise: change the language, not the page structure.

## Step-by-Step Instructions

### Fix 1 — "Available for new projects" badge

**File:** `src/pages/en/index.astro:70-73`

This badge is also addressed in `05-available-badge-fix.md`. For this file, the fix is to change the text only (the structural decision is in file 05). If file 05 decides to remove it entirely, this step is redundant. If file 05 decides to keep it, use this replacement:

Current text: `"Available for new projects"`

**Replacement text (Option B from file 05):**
```
Currently accepting engagements in East and Francophone Africa
```

Full code replacement:
```html
<div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-gold-400/10 border border-gold-400/20 mb-6">
  <span class="w-2 h-2 rounded-full bg-gold-400 animate-pulse"></span>
  <span class="text-gold-400 text-sm font-medium">Currently accepting engagements · East & Francophone Africa</span>
</div>
```

This is not a direct instruction to change it — that decision is in file 05. This file documents the copy direction if the badge is retained.

### Fix 2 — "enquiries are always welcome"

**File:** `src/pages/en/contact.astro:43-45`

Find the paragraph containing "enquiries are always welcome." The exact text is:
```
Whether you have a project in mind, need strategic guidance, or simply wish to explore possibilities — enquiries are always welcome.
```

Replace with:
```
If your organisation is facing a technology challenge that requires more than a generalist solution — whether that is custom software, ERP implementation, ICT strategy, or cross-border systems — this is the right place to start.
```

**Why:** The original copy welcomes all enquiries from anyone. The replacement qualifies: it names the type of challenge, which repels wrong-fit enquiries and attracts right-fit ones. It maintains formal East African register.

### Fix 3 — Services listed as a flat menu (services page intro)

**File:** `src/pages/en/services.astro`

Find the services page hero or intro section. Locate the opening paragraph or sub-headline that describes the services offering. It likely reads something like:
```
Software Development, ICT Consulting & Strategy, Business Consulting, Property Management Technology, Social Media Management
```

This flat menu signals "we do everything." Add a qualifier sentence before or after the menu:

```
Not every technology challenge requires the same approach. Peter works with clients to identify the right intervention before recommending a solution — and declines engagements where a different specialist would serve the client better.
```

**Why:** This sentence introduces the diagnostic-before-prescribing posture without removing the services listing. It is an addition, not a removal.

### Fix 4 — "Get in Touch" CTA in the header

**File:** `src/components/Header.astro`

Find the header CTA button. It likely reads "Get in Touch" or "Book a Consultation."

If it reads "Get in Touch":
- Replace with: `"Book a Diagnostic Call"`

If it reads "Book a Consultation":
- Replace with: `"Book a 30-Minute Diagnostic"`

The word "diagnostic" signals expert posture — the practitioner diagnoses before prescribing. "Get in Touch" signals the opposite.

Full button replacement (adapt the class attributes to match the existing button):
```html
<a href="/en/contact/" class="[existing classes]">
  Book a Diagnostic Call
</a>
```

For the FR version in `src/components/Header.astro` (or the FR equivalent):
```html
<a href="/fr/contact/" class="[existing classes]">
  Réserver un appel diagnostic
</a>
```

### Fix 5 — "Let's talk" or similar soft CTAs

Search for soft CTA copy across all EN pages:

```bash
grep -r "Let's talk\|let's talk\|reach out\|get in touch\|drop us a line\|feel free to contact" src/pages/en/
```

For each instance found:
- "Let's talk" → "Book a diagnostic call"
- "Get in touch" → "Start the conversation"
- "Reach out" → "Send your project brief"
- "Feel free to contact" → "If your situation matches, contact us"
- "Drop us a line" → "Send a message"

Apply the same pattern to FR pages:
- "Contactez-nous" (generic) → "Réservez un appel diagnostic" or "Envoyez votre brief"

### Fix 6 — Services page process description

**File:** `src/pages/en/services.astro:21`

The analysis notes the positive signal: "This is a conversation, not a sales pitch." Keep this phrase — it is an expert posture signal. Do not remove it.

However, ensure the surrounding paragraph maintains expert posture. If any sentence nearby reads as "we'll do whatever you need" or "no project too small," replace with qualified language:

Replace any such phrases with:
```
The process starts with a diagnostic conversation. Peter listens, asks questions, and tells you honestly what would help most — and whether his practice is the right fit for your specific situation.
```

## Acceptance Criteria

- [ ] "enquiries are always welcome" has been replaced with the qualified version on `contact.astro`
- [ ] The header CTA reads "Book a Diagnostic Call" (or equivalent with the word "diagnostic")
- [ ] The FR header CTA reads "Réserver un appel diagnostic" or equivalent
- [ ] Services page intro has the diagnostic-before-prescribing qualifier sentence
- [ ] A site-wide search for "enquiries are always welcome," "Let's talk," and "available for new projects" returns zero false positives
- [ ] The about page and contact page maintain formal East African register throughout
- [ ] `npm run build` passes with no errors

## Effort

**M** — 4 hours (site-wide search + implementation + verification)
