# 05 — Lead Qualification Flow: Complete Alpine.js Qualification Form

## Skills Applied
- `sales-copywriting` — `references/website-messaging-framework.md` (Section 7, Forms)
- `cro-audit` — `references/heuristic-checklist.md` (Section 5, Forms)
- `page-builder` — `references/page-patterns.md`

## Current State

**File:** `src/pages/en/contact.astro`

The contact page has a standard contact form. It accepts name, email, and message. Every submission, regardless of fit or readiness, receives the same response.

From Phase 3, file 02 (CTA Ladder): "Rung 4 — the qualification flow — allows visitors to self-qualify. A 5-question flow with scoring logic routes: 0-4 score → resources page; 5-7 score → standard form; 8-10 score → priority response."

## Target State

A 5-question Alpine.js qualification flow on the contact page. The flow scores the visitor's response and routes them to one of three outcomes: resources, standard contact form, or priority contact form.

## Why This Matters

Not all contact form submissions represent qualified leads. A qualification flow serves two purposes: it helps visitors understand whether the practice is the right fit before they submit (reducing enquiries from mismatched buyers), and it routes genuinely qualified leads to a faster response path (increasing conversion for the best-fit buyers).

## Complete Alpine.js Implementation

### The 5 Questions and Scoring Logic

**Question 1: Organisation type**
- My organisation is a registered business or NGO with existing operations — 2 points
- My organisation is a new venture or pre-revenue startup — 1 point
- I am an individual, not an organisation — 0 points

**Question 2: Technology challenge**
- We need to implement or improve a specific technology system (ERP, website, software) — 2 points
- We need advice on our overall technology strategy — 2 points
- We need ongoing technology management support — 2 points
- I am not sure yet — 0 points

**Question 3: Timeline**
- We need to start within the next 3 months — 2 points
- We are planning for 3-12 months from now — 1 point
- We are at an exploratory stage — 0 points

**Question 4: Investment readiness**
- We have a confirmed budget for this engagement — 2 points
- We have an approximate budget range in mind — 1 point
- We have not yet established a budget — 0 points

**Question 5: Fit check**
- We operate in Uganda, East Africa, or Francophone Africa — 2 points
- We operate internationally with some Africa-related work — 1 point
- We operate outside Africa — 0 points

**Scoring outcomes:**
- 0-4 points: "It looks like this might not be the best fit right now" → show resources
- 5-7 points: "We would be glad to start a conversation" → show standard contact form
- 8-10 points: "This sounds like a strong fit — let's talk soon" → show priority form

---

### Full Alpine.js Component Code

**File:** `src/components/QualificationFlow.astro` (new file)

```astro
---
interface Props {
  lang?: 'en' | 'fr';
}
const { lang = 'en' } = Astro.props;
---

<div
  x-data="{
    step: 0,
    answers: {},
    score: 0,
    outcome: null,
    questions: [
      {
        id: 'q1',
        text: 'What best describes your organisation?',
        options: [
          { label: 'A registered business or NGO with existing operations', value: 2 },
          { label: 'A new venture or pre-revenue startup', value: 1 },
          { label: 'I am an individual, not an organisation', value: 0 }
        ]
      },
      {
        id: 'q2',
        text: 'What best describes your technology challenge?',
        options: [
          { label: 'Implement or improve a specific system (ERP, website, software)', value: 2 },
          { label: 'Review and improve our overall ICT strategy', value: 2 },
          { label: 'Ongoing technology management support', value: 2 },
          { label: 'I am not sure yet', value: 0 }
        ]
      },
      {
        id: 'q3',
        text: 'When do you need to start?',
        options: [
          { label: 'Within the next 3 months', value: 2 },
          { label: 'Planning for 3-12 months from now', value: 1 },
          { label: 'Still at an exploratory stage', value: 0 }
        ]
      },
      {
        id: 'q4',
        text: 'What is your investment readiness?',
        options: [
          { label: 'We have a confirmed budget for this engagement', value: 2 },
          { label: 'We have an approximate budget range in mind', value: 1 },
          { label: 'We have not established a budget yet', value: 0 }
        ]
      },
      {
        id: 'q5',
        text: 'Where does your organisation operate?',
        options: [
          { label: 'Uganda, East Africa, or Francophone Africa', value: 2 },
          { label: 'Internationally, with some Africa-related work', value: 1 },
          { label: 'Outside Africa', value: 0 }
        ]
      }
    ],
    selectAnswer(questionIndex, value) {
      this.answers[questionIndex] = value;
      if (questionIndex === this.questions.length - 1) {
        this.calculateScore();
      } else {
        this.step = questionIndex + 1;
      }
    },
    calculateScore() {
      this.score = Object.values(this.answers).reduce((sum, val) => sum + val, 0);
      if (this.score <= 4) {
        this.outcome = 'resources';
      } else if (this.score <= 7) {
        this.outcome = 'standard';
      } else {
        this.outcome = 'priority';
      }
      this.step = 'result';
    }
  }"
  class="max-w-2xl mx-auto"
>

  <!-- Progress indicator -->
  <div x-show="step !== 'result'" class="mb-8">
    <div class="flex gap-2">
      <template x-for="(q, i) in questions" :key="i">
        <div
          class="h-1.5 flex-1 rounded-full transition-colors duration-300"
          :class="i <= step ? 'bg-gold-400' : 'bg-navy-100'"
        ></div>
      </template>
    </div>
    <p class="text-xs text-navy-400 mt-2" x-text="`Question ${step + 1} of ${questions.length}`"></p>
  </div>

  <!-- Questions -->
  <template x-for="(question, i) in questions" :key="i">
    <div x-show="step === i" class="fade-up">
      <h3 class="text-xl font-bold text-navy-900 mb-6" x-text="question.text"></h3>
      <div class="space-y-3">
        <template x-for="(option, j) in question.options" :key="j">
          <button
            class="w-full text-left px-5 py-4 rounded-xl border border-navy-200 bg-white hover:border-gold-400 hover:bg-gold-50 transition-colors text-navy-700 font-medium"
            x-on:click="selectAnswer(i, option.value)"
            x-text="option.label"
          ></button>
        </template>
      </div>
    </div>
  </template>

  <!-- Results -->
  <div x-show="step === 'result'" class="fade-up">

    <!-- Not a fit -->
    <div x-show="outcome === 'resources'" class="text-center py-8">
      <div class="w-16 h-16 bg-navy-100 rounded-full flex items-center justify-center mx-auto mb-4">
        <svg class="w-8 h-8 text-navy-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
        </svg>
      </div>
      <h3 class="text-xl font-bold text-navy-900 mb-3">This may not be the best fit right now</h3>
      <p class="text-navy-600 leading-relaxed mb-6">
        Based on your responses, this practice may not be the right match for your current stage or situation. That is not a criticism — it is an honest assessment. The resources below may be more useful at this point.
      </p>
      <div class="space-y-3">
        <a href="/en/blog/" class="block px-5 py-3 bg-navy-50 rounded-xl text-navy-700 font-medium hover:bg-navy-100 transition-colors text-sm">
          Read our articles on technology strategy and planning →
        </a>
        <a href="/en/pricing/" class="block px-5 py-3 bg-navy-50 rounded-xl text-navy-700 font-medium hover:bg-navy-100 transition-colors text-sm">
          Review pricing and scope expectations →
        </a>
      </div>
      <p class="text-sm text-navy-400 mt-6">If your situation changes, this form is always here.</p>
    </div>

    <!-- Standard fit -->
    <div x-show="outcome === 'standard'">
      <div class="bg-navy-50 rounded-xl p-5 mb-8 border border-navy-100">
        <p class="font-semibold text-navy-900 mb-1">We would be glad to start a conversation.</p>
        <p class="text-sm text-navy-600">Complete the form below. Peter will respond within 1 business day with either a direct response or an invitation to a 30-minute diagnostic call.</p>
      </div>
      <!-- Standard contact form -->
      <form action="/api/contact.php" method="POST" class="space-y-5">
        <input type="hidden" name="qualification_score" x-bind:value="score" />
        <div>
          <label for="name-std" class="block text-sm font-medium text-navy-700 mb-1.5">Your name</label>
          <input type="text" id="name-std" name="name" required class="w-full px-4 py-3 rounded-lg border border-navy-200 focus:border-gold-400 focus:ring-2 focus:ring-gold-400/20 outline-none transition-colors text-navy-900" />
        </div>
        <div>
          <label for="email-std" class="block text-sm font-medium text-navy-700 mb-1.5">Email address</label>
          <input type="email" id="email-std" name="email" required class="w-full px-4 py-3 rounded-lg border border-navy-200 focus:border-gold-400 focus:ring-2 focus:ring-gold-400/20 outline-none transition-colors text-navy-900" />
        </div>
        <div>
          <label for="org-std" class="block text-sm font-medium text-navy-700 mb-1.5">Organisation name</label>
          <input type="text" id="org-std" name="organisation" class="w-full px-4 py-3 rounded-lg border border-navy-200 focus:border-gold-400 focus:ring-2 focus:ring-gold-400/20 outline-none transition-colors text-navy-900" />
        </div>
        <div>
          <label for="message-std" class="block text-sm font-medium text-navy-700 mb-1.5">Describe your challenge or requirement</label>
          <textarea id="message-std" name="message" rows="5" required class="w-full px-4 py-3 rounded-lg border border-navy-200 focus:border-gold-400 focus:ring-2 focus:ring-gold-400/20 outline-none transition-colors text-navy-900 resize-y"></textarea>
        </div>
        <p class="text-xs text-navy-400">
          Organisations from 10 African countries have trusted this practice. The diagnostic call costs nothing; it takes 30 minutes; and it is genuinely useful whether or not we work together.
        </p>
        <button type="submit" class="w-full bg-navy-900 text-warm-white font-bold py-4 px-6 rounded-lg hover:bg-navy-800 transition-colors">
          Send my project brief
        </button>
      </form>
    </div>

    <!-- Priority fit -->
    <div x-show="outcome === 'priority'">
      <div class="bg-gold-50 rounded-xl p-5 mb-8 border border-gold-200">
        <p class="font-bold text-navy-900 mb-1">This sounds like a strong fit — let us talk soon.</p>
        <p class="text-sm text-navy-700">Your situation aligns closely with the practice's work. Complete the form below and Peter will respond within 4 business hours (during working hours) to schedule a diagnostic call at your earliest convenience.</p>
      </div>
      <!-- Priority contact form — same fields, different label -->
      <form action="/api/contact.php" method="POST" class="space-y-5">
        <input type="hidden" name="qualification_score" x-bind:value="score" />
        <input type="hidden" name="priority" value="high" />
        <div>
          <label for="name-pri" class="block text-sm font-medium text-navy-700 mb-1.5">Your name</label>
          <input type="text" id="name-pri" name="name" required class="w-full px-4 py-3 rounded-lg border border-navy-200 focus:border-gold-400 focus:ring-2 focus:ring-gold-400/20 outline-none transition-colors text-navy-900" />
        </div>
        <div>
          <label for="email-pri" class="block text-sm font-medium text-navy-700 mb-1.5">Email address</label>
          <input type="email" id="email-pri" name="email" required class="w-full px-4 py-3 rounded-lg border border-navy-200 focus:border-gold-400 focus:ring-2 focus:ring-gold-400/20 outline-none transition-colors text-navy-900" />
        </div>
        <div>
          <label for="org-pri" class="block text-sm font-medium text-navy-700 mb-1.5">Organisation name</label>
          <input type="text" id="org-pri" name="organisation" required class="w-full px-4 py-3 rounded-lg border border-navy-200 focus:border-gold-400 focus:ring-2 focus:ring-gold-400/20 outline-none transition-colors text-navy-900" />
        </div>
        <div>
          <label for="phone-pri" class="block text-sm font-medium text-navy-700 mb-1.5">WhatsApp or phone number</label>
          <input type="tel" id="phone-pri" name="phone" class="w-full px-4 py-3 rounded-lg border border-navy-200 focus:border-gold-400 focus:ring-2 focus:ring-gold-400/20 outline-none transition-colors text-navy-900" placeholder="+256 or +225 or +221..." />
        </div>
        <div>
          <label for="message-pri" class="block text-sm font-medium text-navy-700 mb-1.5">Describe your challenge or requirement in detail</label>
          <textarea id="message-pri" name="message" rows="6" required class="w-full px-4 py-3 rounded-lg border border-navy-200 focus:border-gold-400 focus:ring-2 focus:ring-gold-400/20 outline-none transition-colors text-navy-900 resize-y" placeholder="Include: the problem you are facing, what you have tried so far, your timeline, and any budget parameters."></textarea>
        </div>
        <button type="submit" class="w-full bg-gold-400 text-navy-900 font-bold py-4 px-6 rounded-lg hover:bg-gold-300 transition-colors">
          Send my brief — I am ready to talk soon
        </button>
      </form>
    </div>

  </div>

</div>
```

### Implementation on the Contact Page

**File:** `src/pages/en/contact.astro`

Replace the existing contact form section with:

```astro
import QualificationFlow from '@/components/QualificationFlow.astro';

<!-- In the page body, below the h1 and sub-headline: -->
<section class="py-16 md:py-24 bg-warm-white">
  <div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
    <QualificationFlow lang="en" />
  </div>
</section>
```

**Note:** Keep the existing contact form as a fallback below the qualification flow for visitors who prefer to skip the qualification and submit directly:

```astro
<div class="mt-8 text-center">
  <p class="text-sm text-navy-400">Prefer to skip the questions?</p>
  <a href="#direct-form" class="text-sm text-gold-600 font-medium hover:text-amber-accent">Submit directly below →</a>
</div>
<!-- ... existing form with id="direct-form" ... -->
```

### FR Qualification Flow

The FR version uses the same Alpine.js logic — only the question and option text changes. Create a `lang="fr"` path in `QualificationFlow.astro` by checking the `lang` prop and rendering FR question text when `lang === 'fr'`:

Key FR translations:
- Q1 (FR): `"Quelle description correspond le mieux à votre organisation ?"`
- Q2 (FR): `"Quelle description correspond le mieux à votre défi technologique ?"`
- Q3 (FR): `"Quand souhaitez-vous démarrer ?"`
- Q4 (FR): `"Quelle est votre capacité d'investissement ?"`
- Q5 (FR): `"Où votre organisation opère-t-elle ?"`
- Submit button (priority, FR): `"Envoyer mon brief — je suis prêt·e à discuter rapidement"`

## Acceptance Criteria

- [ ] `src/components/QualificationFlow.astro` created with 5 questions and 3-outcome routing
- [ ] Scoring logic correct: 0-4 → resources; 5-7 → standard form; 8-10 → priority form
- [ ] All three outcome states render correctly with appropriate copy
- [ ] Resources outcome links to blog and pricing pages
- [ ] Standard and priority forms submit to `/api/contact.php` with `qualification_score` field
- [ ] Priority form includes phone field and more detailed message prompt
- [ ] "Skip questions" link preserved for visitors who prefer direct submission
- [ ] FR qualification flow text included (via `lang` prop)
- [ ] Alpine.js runs without errors (test at localhost:4321/en/contact/)
- [ ] Qualification flow is accessible: keyboard-navigable, aria labels on buttons
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day (Alpine.js component build, EN + FR copy, contact page integration)
