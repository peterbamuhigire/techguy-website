# Form UX Design

## When to Use

Use for: contact forms, newsletter signups, quote forms, booking forms, multi-step wizards, checkout flows.

**Conversion evidence:**
- Reducing fields from 11 → 4 increased conversions 160% (Imagescape)
- 3 fields vs 5 fields = 25% conversion lift (Marketo)
- First rule: remove every field that isn't strictly necessary

**Three dimensions, ranked by impact:** Words > Layout > Flow. Most teams focus on Layout; the highest gains come from Words. Address in this order.

---

## 1. WORDS — The Most Influential Dimension

### Four-Stage Question Answering Model (Tourangeau)

Every form question forces users through four cognitive steps. Apply as a checklist:

1. **Comprehension** — Do they understand what's being asked?
2. **Retrieval** — Can they recall the information needed?
3. **Judgement** — Can they accurately judge/estimate it?
4. **Answering** — Can they map their answer to the available response options?

If any stage fails, the user guesses, skips, or abandons. Design removes the friction at each stage.

### Comprehension Rules

**Plain language:**
- Use the simplest word that conveys meaning ("use" not "utilise", "start" not "commence")
- Shorter sentences. Active voice. The user's vocabulary, not your internal jargon.
- If you wouldn't say it out loud to a customer, rewrite it.

**Reduce ambiguity — add frames of reference:**
- BAD: "Where do you work?" → user doesn't know if you mean city, company name, or office address
- GOOD: "In which town is your workplace located?"
- Frame of reference answers: "What kind of? Which one? During what time period? How many?"

**One concept per question:**
- Never double-barrel: "How satisfied are you with our speed and quality?" → split into two separate questions

### Satisficing (users stop when they think they have enough)

Users don't read labels fully — they stop at the first plausible interpretation. Counter it:

**Put the frame of reference at the START of the label:**
- BAD: "Has your address changed since your last visit?"
- GOOD: "Since your last visit, has your address changed?" → user knows the time frame before reading the question

**Critical info belongs in the label, not help text:**
- Help text is rarely read. If the information is essential, put it in the label.
- Exception: format hints (e.g., "DD / MM / YYYY") go above the field.

**Turn critical instructions into questions:**
- BAD: "Use the billing address on file with your bank"
- GOOD: "Is your billing address the same as your delivery address?" with Yes/No radios

### Common Field Best Practices

**Name:**
- Single field preferred ("Full name") unless you need to address the user formally
- If split: "Given name(s)" + "Family name" (not "First" / "Last" — cultural assumption)
- Accept ALL special characters: hyphens, apostrophes, accents, non-Latin scripts

**Email:**
- Label: "Email address" (not "Email" — "email" alone is ambiguous in some markets)
- `type="email"` for mobile keyboard
- Single field only — never ask twice "for confirmation" (paste blockers don't prevent typos)
- If you'll use it for marketing, say so: "We'll send your quote here. No spam."

**Phone:**
- Specify which number: "Mobile number", "Work phone" — not just "Phone"
- Single field. Accept hyphens, spaces, parentheses, country code prefixes. `type="tel"`.
- Say why you need it: "So our team can call you to confirm your booking"

**Date of birth:**
- Ask for an age range instead (e.g., for eligibility) — far less sensitive data
- If full DOB is required: three text boxes (day / month / year) with format hints ABOVE each box. NEVER three dropdowns — month dropdown alone requires 12 interactions to scan.

**Credit card:**
- Detect card type from first digits (Visa = 4, Mastercard = 51–55, Amex = 34/37) — never ask user
- Ask only: card number, name on card, expiry (two text boxes MM / YY), security code
- Security code: label as "Security code" with small image showing location on card

**Sex / Gender:**
- Make optional unless legally required
- Sex (biological): radio buttons — Female / Intersex / Male / Prefer not to say (alphabetical)
- Gender (identity): free text — users self-describe; no dropdown covers the range; never conflate the two

### Error Messages

Three requirements — every error message must satisfy all three:

1. Communicate that an error occurred
2. State exactly what the error is and where it is
3. Tell the user exactly what to do to fix it

**Rules:**
- Never blame the user. Be specific. No technical codes.
- Include the field name: "Your email address must include an '@' symbol"

**Examples:**
- BAD: "Invalid input" / "Error" / "Required field"
- GOOD: "Your email address must include an '@' — for example, name@example.com"
- GOOD: "Your message is too short. Please write at least 20 characters."

### Button Labels

- Always contain an action verb
- Never use "Submit" — it says nothing about what happens
- Match the form's purpose:
  - Contact form → "Send message"
  - Quote form → "Get my quote"
  - Booking form → "Book now" or "Confirm booking"
  - Newsletter → "Sign me up" or "Get the newsletter"
  - Checkout → "Place order" or "Pay £49"
  - Multi-step → "Continue" (intermediate) + specific label (final step)
- Secondary/back button: "Back" or "Previous step" — never same visual weight as primary

### Form Title Rules

- Maximum 5 words
- Unique and descriptive: tells the user what they'll accomplish
- Never include the words: "form", "online", "web"
- BAD: "Online Contact Form" / "Web Enquiry Form"
- GOOD: "Get a free quote" / "Book a consultation" / "Join our newsletter"

### Required vs Optional Fields

- Mark optional fields with "(optional)" in plain text after the label
- Never use red asterisks (*): users don't know what they mean until they see an error
- Add instruction at top of form (one line): "All fields are required unless marked (optional)"
- Aim: remove optional fields entirely. If it's not required, is it worth asking?

---

## 2. LAYOUT

### The Three Native Field Types (Always Prefer)

Every form question can be answered with one of three native types:

| Type | When to use |
|------|-------------|
| **Checkboxes** | Choose none, one, or many from a list |
| **Radio buttons** | Choose exactly one from a list |
| **Text boxes** | Type a free response |

Start here. Every deviation from these three adds friction.

### Field Types to AVOID

**Dropdowns — use only as a last resort:**
- Options are hidden; user must click to see them
- Require 2+ interactions to select one option
- Terrible on touch (small hit targets, scroll behaviour varies)
- Visually scan cost is high — user can't compare options at a glance
- **Replace with:** radio buttons for ≤5 options; text input + auto-suggest for 5–20 options
- **Only use dropdown when:** list is >20 items AND user cannot know the options without seeing them (e.g., country selector)

**Placeholder text inside fields — NEVER:**
- Users skip fields that look filled
- Placeholder disappears while typing — user can't check what was asked
- Low contrast fails WCAG accessibility
- Screen readers may not announce it as a label
- **Fix:** always put label beside or above the field, never inside it

**Float labels (labels that animate inside then above) — also wrong:**
- Initially looks like a filled field → same skip problem
- Animation distracts and slows reading
- Screen reader support inconsistent
- **Fix:** static label above or to left of field, always visible

**Date pickers (calendar widgets):**
- Appropriate for "pick a date in the next 2 weeks" booking scenarios only
- For DOB, date ranges, or historical dates: three text boxes are always faster
- If used: provide text input as primary; date picker as supplementary "or use calendar"

**Sliders and steppers:**
- Sliders: imprecise, hard to land on exact value, terrible on mobile
- Steppers (+/−): slow for large ranges
- **Replace with:** plain text box with input validation

**Single checkbox:**
- Forces mental calculation: "Is ticked = yes? Is unticked = no?"
- **Replace with:** explicit Yes / No radio buttons

### Vertical Path to Completion

- All labels, fields, and the primary button must be in a single vertical column
- NEVER put two questions side by side — human foveal focus is ~9 characters wide; right-column questions are missed
- Exception: radio/checkbox groups with 3 or fewer short options can run horizontally (e.g., "Yes / No / Not sure")

### Label Placement

| Screen size | Label position | Reasoning |
|-------------|---------------|-----------|
| Large (≥768px) | Left of field, flush right | Form looks shorter; eye travels left-to-right |
| Small (<768px) | Above field | Label stays visible while user types in field below |

On large screens with left-side labels: align labels flush right so they sit close to their fields.

### Spacing (Proximity Principle)

- Label + help text + field = one question unit → keep these CLOSE together (small gap)
- Between questions: clear visual separation (larger gap)
- Between groups/sections: largest gap or a light divider line

**Help text and format hints:**
- Format hints (e.g., "DD / MM / YYYY"): ABOVE the field, always visible
- Help text (additional explanation): BELOW the label (between label and field), never below the input
- NEVER hide help behind hover tooltips or "?" icons — information must be visible without interaction

### Text Box Width

Proportional to expected answer length:
- Day field: narrow (~3 characters)
- Postcode / ZIP: short (~8 characters)
- Full name: medium (~20 characters)
- Email address: wider (~30 characters)
- Message textarea: full width

Width signals to the user what kind of answer is expected. A narrow box for a message textarea is confusing.

### Colour

- Reserve for: primary CTA button (brand colour), errors (red), warnings (amber), success (green), links (blue)
- NEVER use colour as the only signal — 10% of users are colour-blind
- Always pair colour with: icon + text label
- Error field: red border + exclamation icon + red error message text
- Success state: green border + checkmark icon + confirmation text

### Remove from Form Screens

Strip away everything that doesn't help the user complete the form:
- Main site navigation (reduces exit options, increases completion)
- Fat footers with links
- Sidebars, promotional banners, social proof carousels
- Unnecessary branding repetition

Keep: logo (for trust), form title, progress indicator (multi-step), privacy reassurance, phone number.

### Contact Information Alongside Forms

- Include a phone number on every form screen
- Serves two purposes: reassures the user the company is real; gives an escape hatch if the form fails
- Position: below the form or in a minimal side column on large screens

### Touch Targets

- Minimum height: 44px (2.75rem) for ALL inputs, buttons, radio/checkbox labels
- Full row of a radio/checkbox option must be clickable (not just the circle/box)
- No hover-only interactions — touch devices have no hover state

---

## 3. FLOW

### Five Principles for Question Order

1. **Follow user's mental model** — order questions the way a natural conversation would unfold; if you met the user to gather this info in person, what order would you ask?
2. **Core before supplementary** — most important data first, when user attention is highest; supplementary/demographic questions last
3. **Easy before difficult** — non-intrusive questions first (name, email); earn trust before asking for sensitive data (DOB, payment, address)
4. **Group related questions** — all contact info together, all payment info together, all project details together; never interleave unrelated topics
5. **Be consistent** — if Yes comes before No in one question, maintain that order throughout; never swap

### Number of Screens

| Form length | Approach |
|-------------|----------|
| Fits in ≤3 screenfuls (for 60% of users' screens) | Single page |
| Longer than 3 screenfuls | Multi-step wizard |

- Maximum 7 steps in a wizard
- Each step = one logical group of related questions
- Never split a logical group across two steps
- Short forms forced into multi-step lose conversions — don't add steps for aesthetics

### Progress Indicators (Multi-Step Forms)

**Required on every step:**
- Current step number + total steps: "Step 2 of 5"
- Back button to previous step (data preserved)

**Optional enhancements (large screens):**
- Named step labels ("Your details → Project scope → Budget → Review")
- Visual completion state (filled circle for done, highlighted for current, empty for upcoming)

**Never hide total steps.** Users abandon forms when they don't know how long remains. "Step 2 of ?" is worse than no indicator at all.

### Inline Validation

**Validate AFTER the user leaves the field** (on `blur` event), not while typing:
- Typing triggers constant error/success flashing = interrupts focus
- Exception: real-time validation is acceptable ONLY for password fields with complexity requirements

**Error display rules:**
- Position: error message appears BEFORE (above) the field that caused it
- Visual: light red background + exclamation icon + error message text
- The field itself: red border + `aria-invalid="true"`
- On resubmit attempt: scroll to and focus first error field

**No error summary at top for short forms.** For long forms (>10 fields): add error summary at top + in-field errors.

### Confirmation Screen

Always show after submission — never leave the user wondering.

Required elements:
- What happened: "Your message has been sent"
- What happens next: "We'll reply within one business day"
- Reference number or next step if applicable
- Contact fallback: "Need urgent help? Call us on 020 XXXX XXXX"

Optional: related action ("While you wait, read our guide to X").

### Tab Order

- Tab order must match visual reading order exactly (top-to-bottom, left-to-right)
- Test with keyboard only: Tab, Shift+Tab, Enter, Space, Arrow keys
- All interactive elements must be reachable and operable by keyboard
- Focus ring must be visible (never `outline: none` without a custom focus style)

---

## 4. ASTRO / TAILWIND IMPLEMENTATION PATTERNS

### Contact Form — Vertical Stack (Correct)

```html
<!-- All fields in single vertical column; labels above fields -->
<form class="space-y-6 max-w-lg" novalidate>
  <div class="flex flex-col gap-1">
    <label for="name" class="text-sm font-medium text-gray-700">
      Full name
    </label>
    <input
      id="name" type="text" name="name" autocomplete="name"
      class="w-full min-h-[44px] px-4 py-2.5 border border-gray-300 rounded-lg
             focus:ring-2 focus:ring-primary-500 focus:border-primary-500
             focus:outline-none transition-colors"
    >
  </div>

  <div class="flex flex-col gap-1">
    <label for="email" class="text-sm font-medium text-gray-700">
      Email address
    </label>
    <!-- Help text below label, above field -->
    <p class="text-xs text-gray-500">We'll send your quote here. No spam.</p>
    <input
      id="email" type="email" name="email" autocomplete="email"
      class="w-full min-h-[44px] px-4 py-2.5 border border-gray-300 rounded-lg
             focus:ring-2 focus:ring-primary-500 focus:border-primary-500
             focus:outline-none transition-colors"
    >
  </div>

  <button type="submit"
    class="w-full min-h-[44px] px-6 py-3 bg-primary-600 text-white font-medium
           rounded-lg hover:bg-primary-700 transition-colors">
    Send message
  </button>
</form>
<!-- NEVER: <input placeholder="Full name"> with no visible label -->
```

### Error State Pattern

```html
<!-- Error message ABOVE the field; red border; aria-invalid -->
<div class="flex flex-col gap-1">
  <label for="email" class="text-sm font-medium text-gray-700">
    Email address
  </label>
  <!-- Error: above field, not below -->
  <p id="email-error" class="flex items-center gap-1.5 text-sm text-red-700
                              bg-red-50 border border-red-200 px-3 py-1.5 rounded-md">
    <svg class="w-4 h-4 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"
         aria-hidden="true">
      <path fill-rule="evenodd"
        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z"
        clip-rule="evenodd"/>
    </svg>
    Your email address must include an '@' — for example, name@example.com
  </p>
  <input id="email" type="email" name="email"
    aria-invalid="true" aria-describedby="email-error"
    class="w-full min-h-[44px] px-4 py-2.5 border border-red-500 rounded-lg
           focus:ring-2 focus:ring-red-500 focus:outline-none bg-red-50">
</div>
```

### Multi-Step Progress Indicator

```html
<!-- Step counter + visual dots -->
<div class="flex items-center justify-between mb-8">
  <span class="text-sm font-medium text-gray-600">Step 2 of 4</span>
  <div class="flex items-center gap-2" aria-hidden="true">
    <!-- Completed step -->
    <div class="w-3 h-3 rounded-full bg-primary-600"></div>
    <!-- Current step -->
    <div class="w-3 h-3 rounded-full bg-primary-600 ring-2 ring-primary-200"></div>
    <!-- Upcoming steps -->
    <div class="w-3 h-3 rounded-full bg-gray-200"></div>
    <div class="w-3 h-3 rounded-full bg-gray-200"></div>
  </div>
</div>
<nav aria-label="Form progress" class="sr-only">
  <p>Step 2 of 4: Project details</p>
</nav>
```

### Radio Button Group (Replace Dropdown ≤5 Options)

```html
<!-- Full row clickable; 44px min height; no dropdown -->
<fieldset class="flex flex-col gap-1">
  <legend class="text-sm font-medium text-gray-700 mb-2">
    How did you hear about us?
  </legend>
  <div class="space-y-2">
    <label class="flex items-center gap-3 px-4 py-3 border border-gray-200
                  rounded-lg cursor-pointer min-h-[44px] hover:bg-gray-50
                  has-[:checked]:border-primary-500 has-[:checked]:bg-primary-50
                  transition-colors">
      <input type="radio" name="source" value="google"
             class="w-4 h-4 text-primary-600">
      <span class="text-sm text-gray-700">Google search</span>
    </label>
    <label class="flex items-center gap-3 px-4 py-3 border border-gray-200
                  rounded-lg cursor-pointer min-h-[44px] hover:bg-gray-50
                  has-[:checked]:border-primary-500 has-[:checked]:bg-primary-50
                  transition-colors">
      <input type="radio" name="source" value="referral"
             class="w-4 h-4 text-primary-600">
      <span class="text-sm text-gray-700">Referred by someone</span>
    </label>
  </div>
</fieldset>
```

### Date of Birth — Three Text Boxes (Not Dropdowns)

Three narrow `<input type="text" inputmode="numeric">` fields (DD / MM / YYYY) with format hints ABOVE each box. Set `maxlength="2"` for DD/MM, `maxlength="4"` for YYYY. Each gets a unique `aria-label`. Never three dropdowns — month dropdown alone requires 12 scan interactions.

---

## 5. TIDWELL FORM PATTERNS

From *Designing Interfaces* Ch10 (Tidwell, Brewer, Valencia). Full details: `book-extractions/tidwell-navigation-mobile-forms.md`.

### Forgiving Format
Accept multiple input formats; normalise programmatically — don't make users think about formatting.
- Credit card: accept with/without spaces or hyphens — strip and validate the 16 digits
- Phone: accept +256700000000, 0700 000 000, 0700-000-000 — detect country code, strip non-digits
- Dates: accept 20/7, 7/20/2025, "July 20" — parse and echo back in standard format
- Credit card type: detect from first digits (Visa=4, Mastercard=51–55, Amex=34/37) — never ask user to select

### Good Defaults and Smart Prefills
Pre-fill known data to minimise effort.
- Logged-in user: pre-fill name, email, known address
- If Zip/postcode available from previous order or IP, pre-fill city and region
- Offer "Same as last time?" for returning customers
- Defaults must serve the user — pre-select the cheapest/most privacy-preserving option, not the most profitable

### Gatekeeper Form Design
Forms that stand between user and their goal (checkout, contact, signup) must use Centre Stage or a Modal Panel:
- Strip away: site navigation, sidebars, promotional banners, social proof carousels
- Keep: logo, form title, progress indicator (multi-step), privacy reassurance, phone number
- Never put a gatekeeper form in a cluttered page — distraction directly reduces completion rate

## Quick Reference — Do / Never

| Do | Never |
|----|-------|
| Label above or left of field | Placeholder text as label |
| Mark optional fields "(optional)" | Red asterisks (*) |
| "Send message" / "Get quote" | "Submit" |
| Radio buttons for ≤5 options | Dropdown for ≤5 options |
| Three text boxes for date | Three dropdowns for date |
| Accept format variations (Forgiving Format) | Reject valid input over minor formatting |
| Pre-fill known data (Good Defaults) | Re-ask for information you already have |
| Validate on blur (field exit) | Validate while typing |
| Error above the field | Error below the field |
| 44px min touch target | Hover-only interactions |
| Show total steps ("3 of 5") | Hide total step count |
| Confirmation screen after submit | Silent form submission |
