# 02 — Build the Full 5-Rung CTA Ladder

## Skills Applied
- `sales-copywriting` — `references/website-messaging-framework.md` (Section 7, CTA ladder)
- `cro-audit` — `references/heuristic-checklist.md` (Section 6, CTAs)
- `agency-positioning` — `references/premium-audit-offers.md`

## Current State

From the analysis: the site has only rung 1 (Explore: "Learn more," "View our portfolio") and rung 5 (Convert: "Book a Consultation"). Rungs 2, 3, and 4 are absent. Visitors who are interested but not ready to book have nowhere to go.

| Rung | Name | Status |
|------|------|--------|
| 1 | Explore | Present — "View our portfolio," "Learn more" |
| 2 | Learn | **Absent** — no downloadable resource, no guide |
| 3 | Subscribe | Partially present — newsletter form exists but is broken and not promoted |
| 4 | Self-qualify | **Absent** — no quiz, questionnaire, or fit-assessment |
| 5 | Convert | Present — "Book a Consultation" |

## Current Score

**Sales copywriting and CTA architecture: 5.5/10**
**CRO and lead generation: 5.5/10**

## Target State

All 5 rungs implemented with specific copy and placement. Each rung is available on the relevant pages.

## Target Score

**Sales copywriting and CTA architecture: 7.5/10** (+2.0)
**CRO and lead generation: 6.5/10** (+1.0)

## Why This Matters

The CTA ladder is how a site converts visitors at different stages of readiness. A visitor who finds the site from a blog post is not ready to book a consultation. Without rungs 2-4, that visitor has no next step and leaves. The TAYA skill's assignment-selling model requires content assets at each rung — Peter has the content but no mechanism to capture leads around it.

## Step-by-Step Instructions

### Rung 1 — Explore (Refine existing)

**Current state:** "Learn more" links on service cards. These work; they just need better anchor text.

**Implementation:**
On each service card on the homepage (`src/pages/en/index.astro`), find "Learn More" or "View Details" links and replace with context-specific text:

- Software Development card: `"See software we've built →"`
- ICT Consulting card: `"See how the process works →"`
- Website Development card: `"See website examples →"`
- Business Consulting card: `"Read how we approach business planning →"`

No structural change needed — only anchor text.

### Rung 2 — Learn (Lead Magnet: African Business Technology Health Check)

**The offer:** A 1-page PDF checklist — "The African Business Technology Health Check: 10 questions every East African enterprise should be able to answer about their technology systems."

**PDF brief (hand this brief to Peter to produce the PDF):**

Title: "The African Business Technology Health Check"
Sub-title: "10 questions for IT leaders and business owners in East and Francophone Africa"

Checklist items:
1. Does every business-critical system have a documented disaster recovery plan tested in the last 12 months?
2. Can your staff access the systems they need from any location in the countries you operate in?
3. Are your ERP and accounting systems integrated, or are staff re-entering data between them?
4. Do you know exactly who has administrative access to each of your systems — and who no longer needs it?
5. Is your customer data backed up in a location separate from your primary office?
6. Can your systems produce management reports in under 30 minutes, without requiring your IT team?
7. If your primary IT person left tomorrow, could operations continue uninterrupted for 2 weeks?
8. Are your software licences current and compliant with the terms under which you operate?
9. Do you have a written ICT strategy that your board or senior management has reviewed in the last 18 months?
10. Is your website generating qualified enquiries — or is it a digital brochure that nobody visits?

CTA on the PDF: "If you answered 'no' to 3 or more of these questions, book a 30-minute ICT diagnostic at techguypeter.com/en/contact/"

**Opt-in copy for homepage (place after the stats strip):**

```astro
<!-- Lead Magnet: ICT Health Check -->
<section class="bg-warm-cream py-12 md:py-16">
  <div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="bg-white rounded-2xl border border-navy-100 p-8 md:p-10 shadow-sm">
      <p class="text-sm font-semibold text-gold-500 uppercase tracking-widest mb-3">Free Resource</p>
      <h2 class="text-2xl md:text-3xl font-bold text-navy-900 mb-4">
        The African Business Technology Health Check
      </h2>
      <p class="text-navy-600 leading-relaxed mb-6">
        10 questions every East and Francophone African enterprise should be able to answer about their technology systems. Download the checklist — it takes 5 minutes and tells you where to focus first.
      </p>
      <form
        x-data="{ email: '', submitted: false }"
        @submit.prevent="
          fetch('/api/newsletter.php', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({ email, source: 'homepage-lead-magnet', lang: 'en' })
          }).then(r => r.json()).then(data => { if(data.success) submitted = true });
        "
      >
        <div x-show="!submitted" class="flex flex-col sm:flex-row gap-3">
          <label for="hc-email" class="sr-only">Your email address</label>
          <input
            id="hc-email"
            type="email"
            x-model="email"
            required
            placeholder="your@email.com"
            class="flex-1 px-4 py-3 border border-navy-200 rounded-lg text-navy-900 placeholder-navy-400 focus:outline-none focus:ring-2 focus:ring-gold-400"
          />
          <button
            type="submit"
            class="px-6 py-3 bg-amber-accent text-white font-semibold rounded-lg hover:bg-amber-accent/90 transition-colors whitespace-nowrap"
          >
            Send me the checklist
          </button>
        </div>
        <p x-show="submitted" class="text-green-700 font-medium">
          The checklist is on its way to your inbox. Check your email in the next 5 minutes.
        </p>
        <p class="text-xs text-navy-400 mt-2">No spam. Unsubscribe at any time. Your details are never shared.</p>
      </form>
    </div>
  </div>
</section>
```

**File:** Add to `src/pages/en/index.astro` after the stats strip section. Also add to `src/pages/en/services.astro` at the bottom of the page before the CTA section.

**FR version of opt-in copy:**

```html
<p class="text-sm font-semibold text-gold-500 uppercase tracking-widest mb-3">Ressource Gratuite</p>
<h2 class="text-2xl md:text-3xl font-bold text-navy-900 mb-4">
  Le Bilan Technologique pour les Entreprises Africaines
</h2>
<p class="text-navy-600 leading-relaxed mb-6">
  10 questions que toute entreprise en Afrique de l'Est et en Afrique francophone devrait pouvoir répondre sur ses systèmes technologiques. Téléchargez la liste de contrôle — 5 minutes suffisent pour savoir où concentrer vos efforts.
</p>
```

### Rung 3 — Subscribe (Monthly Brief)

**Value proposition for the newsletter:** "The African ICT Brief — one email per month covering technology decisions for East and Francophone African enterprises."

**Replace the blog newsletter form copy:**

**File:** `src/pages/en/blog.astro` — find the newsletter form section (around line 275-293).

Current button text (approximate): "Subscribe"

Replace the surrounding copy with:
```html
<div class="text-center mb-6">
  <h3 class="text-xl font-bold text-navy-900 mb-2">The African ICT Brief</h3>
  <p class="text-navy-600 text-sm">
    One email per month. Practical technology guidance for East and Francophone African enterprises. No filler, no sales pitch.
  </p>
</div>
```

Replace the button from "Subscribe" to:
```html
<button type="submit" class="[existing classes]">
  Send me the monthly brief
</button>
```

**FR version:**
```html
<h3 class="text-xl font-bold text-navy-900 mb-2">La Revue ICT Africaine</h3>
<p class="text-navy-600 text-sm">
  Un e-mail par mois. Conseils technologiques pratiques pour les entreprises en Afrique de l'Est et en Afrique francophone. Pas de remplissage, pas de démarche commerciale.
</p>
```
FR button: `"Recevoir la revue mensuelle"`

**Note:** The newsletter form connection is fixed in Phase 1, file 03. This file handles the copy only.

### Rung 4 — Self-Qualify (5-Question Fit Assessment)

**The mechanism:** A 5-question assessment on the contact page that helps visitors determine whether Peter's practice is the right fit before submitting the main contact form.

**The 5 questions and their purpose:**

1. **"What is the primary nature of your technology challenge?"**
   Options: ERP / software integration | Custom software development | Website design and development | ICT strategy and advisory | I am not sure yet
   *Purpose: Identifies service fit. "Not sure yet" routes to diagnostic offer.*

2. **"How many countries does your organisation operate in?"**
   Options: 1 country | 2-3 countries | 4+ countries
   *Purpose: Identifies geographic complexity. 2+ countries is ideal-fit territory.*

3. **"What is your approximate technology investment budget for this engagement?"**
   Options: Under $5,000 | $5,000–$15,000 | $15,000–$50,000 | Over $50,000 | Not yet determined
   *Purpose: Filters by budget. Under $5,000 routes to a resource recommendation.*

4. **"What is your preferred timeline for beginning work?"**
   Options: Immediately (within 2 weeks) | Within 1-2 months | 3-6 months | Exploring options, no fixed timeline
   *Purpose: Identifies urgency. "Exploring options" routes to newsletter subscription.*

5. **"Have you worked with an external ICT consultant or software development firm before?"**
   Options: Yes, successfully | Yes, but it did not meet expectations | No, this would be a first engagement
   *Purpose: Identifies buyer sophistication and potential objections.*

**Scoring logic:**

- Score 0-4: "Based on your responses, the most useful next step may be one of our free resources." → Display links to 3 blog articles + newsletter sign-up. No contact form.
- Score 5-7: "Your situation sounds like a good starting point for a conversation." → Display standard contact form.
- Score 8-10: "Your situation looks like a strong fit for our practice." → Display contact form with pre-filled service category + flag internally as high-priority.

**Scoring rules:**
- Q1: Specific service (not "not sure") = +2
- Q2: 2-3 countries = +1, 4+ = +2
- Q3: $5k-$15k = +1, $15k-$50k = +2, $50k+ = +2
- Q4: Immediately = +2, 1-2 months = +1
- Q5: Yes successfully = +1, Yes with issues = +2 (more motivated to get it right)

**Alpine.js component for contact page (`src/pages/en/contact.astro`):**

```html
<div
  x-data="{
    step: 1,
    answers: {},
    score: 0,
    result: null,
    calculateScore() {
      let s = 0;
      const q1 = ['erp', 'software', 'website', 'ict'];
      if (q1.includes(this.answers.q1)) s += 2;
      if (this.answers.q2 === '2-3') s += 1;
      if (this.answers.q2 === '4plus') s += 2;
      if (this.answers.q3 === '5-15') s += 1;
      if (this.answers.q3 === '15-50' || this.answers.q3 === '50plus') s += 2;
      if (this.answers.q4 === 'immediately') s += 2;
      if (this.answers.q4 === '1-2months') s += 1;
      if (this.answers.q5 === 'yes-success') s += 1;
      if (this.answers.q5 === 'yes-issues') s += 2;
      this.score = s;
      if (s <= 4) this.result = 'resources';
      else if (s <= 7) this.result = 'standard';
      else this.result = 'priority';
    }
  }"
  class="max-w-2xl mx-auto"
>
  <!-- Question 1 -->
  <div x-show="step === 1">
    <h3 class="text-lg font-semibold text-navy-900 mb-4">What is the primary nature of your technology challenge?</h3>
    <div class="space-y-3">
      <label class="flex items-center gap-3 p-4 border border-navy-200 rounded-lg cursor-pointer hover:border-gold-400 transition-colors">
        <input type="radio" x-model="answers.q1" value="erp" class="text-gold-400" />
        <span>ERP or software integration</span>
      </label>
      <label class="flex items-center gap-3 p-4 border border-navy-200 rounded-lg cursor-pointer hover:border-gold-400 transition-colors">
        <input type="radio" x-model="answers.q1" value="software" class="text-gold-400" />
        <span>Custom software development</span>
      </label>
      <label class="flex items-center gap-3 p-4 border border-navy-200 rounded-lg cursor-pointer hover:border-gold-400 transition-colors">
        <input type="radio" x-model="answers.q1" value="website" class="text-gold-400" />
        <span>Website design and development</span>
      </label>
      <label class="flex items-center gap-3 p-4 border border-navy-200 rounded-lg cursor-pointer hover:border-gold-400 transition-colors">
        <input type="radio" x-model="answers.q1" value="ict" class="text-gold-400" />
        <span>ICT strategy and advisory</span>
      </label>
      <label class="flex items-center gap-3 p-4 border border-navy-200 rounded-lg cursor-pointer hover:border-gold-400 transition-colors">
        <input type="radio" x-model="answers.q1" value="unsure" class="text-gold-400" />
        <span>I am not certain yet</span>
      </label>
    </div>
    <button @click="step = 2" :disabled="!answers.q1" class="mt-6 px-6 py-3 bg-amber-accent text-white font-semibold rounded-lg disabled:opacity-40 hover:bg-amber-accent/90 transition-colors">
      Next →
    </button>
  </div>

  <!-- Questions 2-5 follow same pattern; step increments 1-5 -->
  <!-- After step 5: @click="calculateScore(); step = 6" -->

  <!-- Result: resources (score 0-4) -->
  <div x-show="step === 6 && result === 'resources'">
    <h3 class="text-lg font-semibold text-navy-900 mb-4">Based on your responses, these free resources may be most useful right now:</h3>
    <ul class="space-y-3 mb-6">
      <li><a href="/en/blog/" class="text-amber-accent hover:underline font-medium">Browse the ICT blog for African businesses →</a></li>
      <li><a href="/en/blog/website-costs-uganda/" class="text-amber-accent hover:underline font-medium">What a website costs in Uganda →</a></li>
      <li><a href="/en/blog/" class="text-amber-accent hover:underline font-medium">How to evaluate an IT consultant →</a></li>
    </ul>
    <p class="text-navy-600 text-sm">Or sign up for the monthly ICT brief — one email per month, practical technology guidance for African enterprises.</p>
  </div>

  <!-- Result: standard contact form (score 5-7) -->
  <div x-show="step === 6 && result === 'standard'">
    <p class="text-navy-700 mb-6">Your situation sounds like a good starting point for a conversation. Complete the form below to begin.</p>
    <!-- Standard contact form goes here -->
  </div>

  <!-- Result: priority contact (score 8-10) -->
  <div x-show="step === 6 && result === 'priority'">
    <p class="text-navy-700 mb-6 font-medium">Your situation looks like a strong fit for this practice. We will prioritise your enquiry.</p>
    <!-- Standard contact form goes here with hidden priority flag -->
    <input type="hidden" name="priority" value="high" />
  </div>
</div>
```

**Placement:** Add this qualification flow before the main contact form on `src/pages/en/contact.astro`. The contact form appears conditionally based on the score.

### Rung 5 — Convert (Book a 30-Minute ICT Diagnostic)

**Rename the CTA throughout the site:**

Current: "Book a Consultation" or "Book a Free Consultation"
New: "Book a 30-Minute ICT Diagnostic"

**Surrounding copy for the diagnostic CTA (place before any "Book" button on services and homepage):**

```html
<div class="text-center text-sm text-navy-500 mb-4">
  <strong class="text-navy-700">The first step is a diagnostic, not a sales call.</strong>
  In 30 minutes, Peter reviews your situation and tells you honestly what would help most — and whether this practice is the right fit.
</div>
```

**Update every CTA button** that currently reads "Book a Consultation" or "Book a Free Consultation" to read:
```
Book a 30-Minute ICT Diagnostic
```

Files to update:
- `src/pages/en/index.astro` — hero CTA and footer CTA
- `src/pages/en/services.astro` — bottom CTA
- `src/pages/en/contact.astro` — form submit button
- `src/components/CTASection.astro` — if this shared component exists
- Equivalent FR files: "Réserver un diagnostic ICT de 30 minutes"

## Acceptance Criteria

- [ ] Service card anchor text updated from "Learn More" to context-specific text (Rung 1)
- [ ] ICT Health Check lead magnet form appears on homepage and services page (Rung 2)
- [ ] Newsletter form copy updated: "Send me the monthly brief" / "The African ICT Brief" (Rung 3)
- [ ] Self-qualification flow (5 questions + routing) implemented on contact page (Rung 4)
- [ ] All "Book a Consultation" CTAs renamed to "Book a 30-Minute ICT Diagnostic" (Rung 5)
- [ ] FR equivalents implemented for all 5 rungs
- [ ] Alpine.js qualification flow works correctly: questions advance, routing logic fires, form appears conditionally
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day (writing all copy + implementing the Alpine.js qualification flow)
