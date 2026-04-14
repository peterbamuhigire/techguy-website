# 05 — Replace the "Available for New Projects" Badge

## Skills Applied
- `agency-positioning` — `references/agency-narrative.md`, `references/legacy-guidance.md`
- `east-african-english` — formal professional register

## Current State

**File:** `src/pages/en/index.astro:70-73`

```html
<div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-gold-400/10 border border-gold-400/20 mb-6">
  <span class="w-2 h-2 rounded-full bg-gold-400 animate-pulse"></span>
  <span class="text-gold-400 text-sm font-medium">Available for new projects</span>
</div>
```

The badge sits above the h1 in the hero section. It currently signals:
1. **Availability** — the opposite of expert selectivity. Premium consultants are in demand, not available.
2. **Freelancer framing** — the phrase "available for new projects" is the standard language of freelancer profile pages (Upwork, LinkedIn). It positions Peter in the commodity market.
3. **No credibility signal** — the animated pulse dot adds visual energy to a phrase that does no commercial work.

## Current Score

**Agency expert posture and messaging: 5.0/10**

## Target State

**Recommendation: Option C — Replace with a credibility signal.**

The badge location is visible real estate. Removing it (Option A) wastes that space. Replacing with a geographic qualifier (Option B) is better. Replacing with a verifiable credibility signal (Option C) is the strongest commercial use of the space.

All three options scored:

**Option A — Remove entirely**
- Pros: Eliminates the order-taker signal cleanly.
- Cons: Wastes the visual real estate. The animated pulse dot draws the eye; removing the badge without replacement leaves a gap.
- Verdict: Acceptable fallback if the replacement copy is not ready.

**Option B — Geographic qualifier**
Text: "Currently accepting engagements · East & Francophone Africa"
- Pros: Signals selectivity (geographic qualifier implies not accepting all work).
- Cons: Still uses "accepting" language, which implies the practitioner is in a receiving mode.
- Verdict: Better than the current state; not as strong as Option C.

**Option C (RECOMMENDED) — Credibility signal**
Text: "15 years · 10 countries · 3 proprietary platforms · Bilingual EN/FR"
- Pros: Every element is verifiable. Names a specific differentiator (3 proprietary platforms — this refers to the Chwezi products). The bilingual signal is unique in the market.
- Cons: Slightly longer. May wrap on very small screens.
- Verdict: The strongest commercial use of this space. Proof, not availability.

## Target Score

**Agency expert posture and messaging: 6.5/10** (+1.5)
**Brand positioning and differentiation: 6.8/10** (+1.3)

## Why This Matters

The agency-positioning skill's narrative section 8 states: "We diagnose before we prescribe." A practitioner who announces availability is not diagnosing — they are waiting for instructions. The credibility signal converts the same visual space from an order-taker signal to an authority signal.

## Step-by-Step Instructions

### Step 1 — Replace the EN badge

**File:** `src/pages/en/index.astro:70-73`

Replace:
```html
<div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-gold-400/10 border border-gold-400/20 mb-6">
  <span class="w-2 h-2 rounded-full bg-gold-400 animate-pulse"></span>
  <span class="text-gold-400 text-sm font-medium">Available for new projects</span>
</div>
```

With (Option C):
```html
<div class="inline-flex items-center gap-x-4 gap-y-1 flex-wrap px-4 py-2 rounded-full bg-gold-400/10 border border-gold-400/20 mb-6">
  <span class="text-gold-400 text-sm font-medium">15 years</span>
  <span class="text-gold-400/40 text-sm">·</span>
  <span class="text-gold-400 text-sm font-medium">10+ countries</span>
  <span class="text-gold-400/40 text-sm">·</span>
  <span class="text-gold-400 text-sm font-medium">3 proprietary platforms</span>
  <span class="text-gold-400/40 text-sm">·</span>
  <span class="text-gold-400 text-sm font-medium">Bilingual EN / FR</span>
</div>
```

The `flex-wrap` ensures it wraps gracefully on small screens rather than overflowing horizontally.

### Step 2 — Replace the FR badge

**File:** `src/pages/fr/index.astro`

Find the equivalent badge element and replace with the French version:
```html
<div class="inline-flex items-center gap-x-4 gap-y-1 flex-wrap px-4 py-2 rounded-full bg-gold-400/10 border border-gold-400/20 mb-6">
  <span class="text-gold-400 text-sm font-medium">15 ans d'expérience</span>
  <span class="text-gold-400/40 text-sm">·</span>
  <span class="text-gold-400 text-sm font-medium">10+ pays</span>
  <span class="text-gold-400/40 text-sm">·</span>
  <span class="text-gold-400 text-sm font-medium">3 plateformes propriétaires</span>
  <span class="text-gold-400/40 text-sm">·</span>
  <span class="text-gold-400 text-sm font-medium">Bilingue EN / FR</span>
</div>
```

### Step 3 — Remove any other "Available" signals site-wide

Search for remaining instances:
```bash
grep -r "available for\|Available for" src/pages/ src/components/
```

If any other pages contain "available for new projects" or similar language, replace with:
- On services pages: "Accepting engagements for established organisations in East and Francophone Africa"
- On contact pages: Remove entirely (the contact page copy is rewritten in Phase 3, file 04)

### Step 4 — Verify visual rendering

Run `npm run dev`. At 375px mobile:
- Confirm the credibility strip wraps to 2 lines without overflowing the container
- Confirm the gold dots between items remain visible after wrapping
- Confirm spacing between the strip and the h1 is comfortable (the `mb-6` class handles this)

At 1280px desktop:
- Confirm all four items display in a single line

## Acceptance Criteria

- [ ] The phrase "Available for new projects" does not appear anywhere on the site
- [ ] The EN hero credibility strip displays: 15 years · 10+ countries · 3 proprietary platforms · Bilingual EN/FR
- [ ] The FR hero credibility strip displays the French equivalent
- [ ] The strip wraps gracefully at 375px mobile
- [ ] A site-wide search for "Available for" returns zero results in `src/pages/`
- [ ] `npm run build` passes with no errors

## Effort

**S** — 1 hour
