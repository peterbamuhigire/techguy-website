# Page Conversion Checklist

Per-template anatomy and QA gate for every page the agency ships. Pair with `website-messaging-framework.md` (copy rules) and `authority-content-matrix.md` (content structure).

Grounded in *Made to Sell* (page anatomy, CTA mechanics, layout rules), Sugarman (slippery slide, trigger placement), Bly (landing-page 10 rules, Motivating Sequence), and Handley (scanner pass, voice discipline).

Every template has one primary persuasion purpose. If a template does not earn its place against that purpose, cut it.

---

## 1. Universal page requirements

Every page ships with these six elements confirmed. Missing any = not ready to ship.

- **One primary CTA.** Named, visible above the fold (or within one scroll), repeated at page end.
- **One proof signal in the hero.** Logo row, named outcome, award, press mention — *something*.
- **A who-this-is-for line.** A single sentence within the first screen that names the reader. Repels wrong-fit.
- **One objection handled per section.** Each major section answers the question that arises at that point in the scroll.
- **At least one scan path.** Subheads every 2–3 paragraphs, bullets for lists, bold on decision-relevant phrases. Full read is an optional upgrade.
- **At least one measurement event.** Every CTA, form, video, scroll milestone, outbound link — instrumented. See `analytics-event-map.md` in `seo/references/`.

---

## 2. Page anatomy — the default section stack

The base template. Most pages use most of this. Adapt order for page type.

| # | Section | Purpose | Minimum content |
|---|---------|---------|-----------------|
| 1 | Pre-header (optional) | Promo, event, urgency | Single line, dismissable |
| 2 | Header nav | Wayfinding | Logo, 4–6 top links, CTA button |
| 3 | Hero | Grab + promise + CTA | Headline, subhead, CTA, hero image |
| 4 | Audience qualifier | "Is this for me?" | 1–2 lines + context image |
| 5 | Problem / stakes | Name the pain in reader's words | Problem statement + emotional hook |
| 6 | Offer summary | What you get | 3–5 bullets in feature→benefit format |
| 7 | How it works | Process | 3–6 numbered steps with icons or imagery |
| 8 | Proof band | Social proof | Logos, testimonials, case excerpts |
| 9 | Comparison / USP | How we differ | Comparison table or side-by-side |
| 10 | Named case study | Outcome in context | 1 story, 1 number, 1 quote |
| 11 | Pricing or tiers | "What does it cost?" | Honest floor + tier logic |
| 12 | Objection handling | "What if…" answers | 3–5 common questions, answered |
| 13 | Guarantee / risk reversal | Close the loop | Specific commitment, not corporate hedge |
| 14 | Final CTA | Ask for the decision | One button, one line of proof above it |
| 15 | Footer | Meta + trust + links | Contact, secondary nav, policies, credits |

### Layout discipline (*Made to Sell*)

- **Max 2 font families per page.**
- **Max 3 font weight combinations.**
- **Max 3 distinctive colours per section.**
- **Max 1 moving animation per section.**
- **Max 3 lines for centre-aligned headlines or subheads.**
- **Body copy mobile minimum 14px; target 16–18px.**
- **One main idea per section.**

---

## 3. Template-specific checklists

### Home page

Primary purpose: qualify the visitor, communicate the category, deliver them to the right deeper page.

- [ ] Hero headline passes 4 U's (≥3 scoring 3–4)
- [ ] Audience qualifier visible on first screen
- [ ] 3–7 client logos or named-outcome proof in first screen
- [ ] Three deeper-page entry points (services, about, case studies) with distinct benefits
- [ ] One primary CTA (usually "self-qualify" rung: book consult / see fit)
- [ ] Secondary CTA one rung below primary (e.g. "see the work")
- [ ] No carousel. No autoplay video with sound. No modal on load.
- [ ] Above-the-fold tells the reader: what we do, who we do it for, what to do next

### Services page (money page)

Primary purpose: convert a qualified visitor to a next step.

- [ ] Hero ties offer to a named benefit and a named reader
- [ ] Problem statement in reader's own words (from interview notes, not fabricated)
- [ ] Offer summary in feature → benefit format
- [ ] How-it-works section with 3–6 phases
- [ ] Minimum 2 testimonials or 1 case excerpt inline with the offer
- [ ] Pricing or fee range stated; no "contact us for pricing" unless engagement is strictly custom
- [ ] 3–5 objection FAQs specific to this service
- [ ] Guarantee or risk reversal block within the final third
- [ ] Primary CTA appears at least twice; final CTA has one proof line above
- [ ] Scope inclusions and exclusions named (what's in, what's out)

### About page

Primary purpose: earn trust through specific humanity, not corporate history.

- [ ] Hero leads with reader benefit, not "founded in YYYY"
- [ ] Named team members with real photos (no stock)
- [ ] Founder or principal story with a concrete moment
- [ ] One Easter egg — a quirky, memorable line or detail
- [ ] Values stated as positions, not platitudes ("We refuse pay-for-performance" beats "Integrity")
- [ ] At least 2 named client or partner references in the narrative
- [ ] Zero instances of "world-class," "industry-leading," "best-in-class," "cutting-edge"
- [ ] CTA is a fit-qualifier ("See if we work together") not a generic "Contact us"

### Case study / portfolio piece

Primary purpose: proof by narrative with numbers.

- [ ] Client named (with permission logged in `project-log/decisions/`)
- [ ] Before-state with specific numbers
- [ ] Challenge statement in 2–3 sentences
- [ ] Approach / what we did in 3–6 bullets
- [ ] After-state with specific numbers (month-over-month or year-over-year)
- [ ] At least one direct client quote (10+ words, named)
- [ ] At least one visual: before/after, chart, product shot, dashboard screenshot
- [ ] CTA to related service or to a consult
- [ ] Cross-links to at least 2 related case studies or services

### Landing page (campaign, lead magnet, paid-traffic destination)

Primary purpose: single-goal conversion. No distraction.

- [ ] No main-site navigation (exit option only via logo-click)
- [ ] Message-match: headline echoes the ad or referring link
- [ ] Single offer, single CTA, single form
- [ ] Form fields: minimum viable (email only for lead magnet, email + 2 qualifier fields for consult)
- [ ] Proof signals within first 1.5 screen heights
- [ ] Risk reversal above the button
- [ ] Post-conversion page mapped (thank-you + next-step)
- [ ] Email autoresponder triggers on submit
- [ ] Pixel / conversion event fires on submit

### Blog / article

Primary purpose: build authority; move readers to a deeper page or list.

- [ ] Title passes 4 U's
- [ ] Lede opens with reader-in-scene, stat, question, or fake-out — not "In this post…"
- [ ] Table of contents for articles over 1,000 words
- [ ] Subheads every 2–3 paragraphs
- [ ] At least one image, chart, or pull quote in the top third
- [ ] One inline CTA mid-article (related content) + one end-of-article CTA (list signup or related service)
- [ ] Author byline with photo and 1-line bio
- [ ] Published and updated dates visible
- [ ] 2–4 internal links to related articles or money pages
- [ ] Meta description and OG image present (see `premium-seo-package.md`)

### FAQ page or section

Primary purpose: handle leftover objections.

- [ ] 5–10 questions max (above 10, copy elsewhere is failing)
- [ ] Questions phrased in reader's voice ("How much?" beats "What is the fee structure?")
- [ ] Answers 1–3 sentences; longer answers link to a dedicated page
- [ ] Organised by category (scope, timeline, pricing, process, outcomes, boundaries)
- [ ] Collapsible accordion or anchor links for scanning
- [ ] Schema: FAQPage structured data

### Pricing page

Primary purpose: convert the budget-qualified reader; disqualify the under-budget reader quickly.

- [ ] Tiers named clearly (Foundation / Growth / Authority)
- [ ] Floor stated ("From $12,000")
- [ ] What's included per tier, in feature→benefit format
- [ ] What's excluded per tier, stated directly
- [ ] Value logic explained (why this tier, who it's for)
- [ ] Social proof at the tier comparison (testimonial from the tier's typical buyer)
- [ ] Objection FAQs specific to pricing ("Why is it $X?" "Is it worth it?")
- [ ] Risk reversal or guarantee near the CTA
- [ ] Primary CTA per tier + overall final CTA

### Contact page

Primary purpose: convert the self-qualified reader to a real next step.

- [ ] Form with minimum viable fields (name, email, context — 3 fields max for consult booking)
- [ ] Explicit promise of response time and next step
- [ ] Alternative channel visible (email, phone, calendar link)
- [ ] No generic "We'd love to hear from you" hero — state what happens next
- [ ] Anti-spam: honeypot, reCAPTCHA v3, or equivalent; never visible captcha as first defence
- [ ] Email autoresponder triggers on submit
- [ ] Post-submit: thank-you page, not inline toast, so analytics can record

---

## 4. Conversion mechanics (every page)

### CTA rules

- Verb-led. "Book the consult," "See the work," "Download the guide."
- Second person. "Start your diagnostic" > "Start diagnostic."
- Name the reward. "Get the 14-week roadmap" > "Submit form."
- Describe what happens next. "Book a 30-min diagnostic call" > "Get in touch."
- One line of risk reversal above the button. "No credit card. 90 seconds."
- **Banned words on CTAs:** Submit, Click here, Learn more (unpaired), Contact us.

### Button design

- Contrast ratio meets WCAG AA against its section background.
- Minimum tap target 44×44 px.
- One primary button per section. Secondary is a text link, not a competing button.
- On mobile, primary CTA may be sticky-footer on high-intent pages.

### Form design

- Only ask for what you need. Every field reduces completion by measurable percent.
- Label above field. No placeholder-only labels.
- Inline validation, not post-submit error pages.
- Progress indicator for multi-step forms.
- Autofill-friendly field names.
- Success state: thank-you page, not toast (for measurement).
- Error state: specific, human, actionable ("Please use a valid email like name@firm.com").

### Friction audit

For every page, ask:

- What is the reader being asked to do?
- What is the smallest thing they can do right now?
- What stands between them and that thing?
- Is it worth the friction? (Only for serious commitments.)

### Microcommitment ladder

Offer the next rung down when the primary CTA is too much:

- Primary: "Book a diagnostic call" →
- Lower: "Get the 14-week roadmap (free PDF)" →
- Lowest: "Read how we work"

Primary CTA stays primary. Ladder is secondary.

---

## 5. Trust and proof placement

- [ ] Hero: 1 proof element (logos, named stat, award).
- [ ] Immediately after the primary promise: 1 named testimonial or outcome.
- [ ] Each benefit bullet paired with 1 specific (number, quote fragment, duration).
- [ ] Pricing section: strongest objection-handling proof (case study link, guarantee, FAQ).
- [ ] CTA module: 1 final proof line above the button.
- [ ] Footer: certifications, affiliations, published credits.
- [ ] Never a dedicated testimonials-only page that replaces inline proof.

---

## 6. Analytics instrumentation (confirmed before launch)

See `seo/references/analytics-event-map.md` for the full schema. Per-page minimums:

- [ ] Page_view event fires on load
- [ ] Primary CTA click event with button label + section identifier
- [ ] Secondary CTA click events
- [ ] Scroll depth at 25%, 50%, 75%, 90% (key sales pages only)
- [ ] Outbound link clicks (to phone, email, WhatsApp, external)
- [ ] Form submit event with form ID
- [ ] Form field abandonment events on multi-step forms
- [ ] Video play / 25% / 50% / 75% / complete events
- [ ] Download events (PDF, asset)

---

## 7. Accessibility (every page)

- [ ] Colour contrast meets WCAG 2.2 AA
- [ ] Focus states visible on all interactive elements
- [ ] Alt text on all content images (empty alt on decorative)
- [ ] Heading hierarchy (H1 → H2 → H3) unbroken
- [ ] Form labels associated with inputs
- [ ] Keyboard navigable end-to-end
- [ ] Video captions or transcripts
- [ ] No colour-only information encoding

---

## 8. Performance (every page)

- [ ] Largest Contentful Paint ≤ 2.5s on 3G
- [ ] Cumulative Layout Shift ≤ 0.1
- [ ] Interaction to Next Paint ≤ 200ms
- [ ] First-load weight under 500KB (incl. images)
- [ ] Hero image has explicit width/height to prevent CLS
- [ ] Below-the-fold images lazy-loaded
- [ ] No render-blocking JS above the fold

---

## 9. Pre-launch review (the gate)

Before a page ships, two people review:

### Strategic review

- Does the page serve its named persuasion purpose?
- Does the headline pass the 4 U's?
- Is there at least one proof signal per meaningful claim?
- Are objections handled where they arise?
- Is there exactly one primary CTA?
- Does the page read in 15 seconds for a scanner?
- Does the 3-minute full read deliver a decision-ready reader?

### Craft review

- Are banned words absent (jargon, "world-class," "Submit")?
- Is the voice consistent with the brand voice guide?
- Are metrics instrumented and firing on a test submission?
- Are performance and accessibility targets met?
- Does the page look right on 375px, 768px, 1280px?
- Does the page look right in dark mode (if enabled)?
- Do links point where they say they do?

### Logo-mask test

Cover the logo. Read the page aloud. Would a reader recognise it as this firm — or does it sound like any competitor?

If the answer is "any competitor," rewrite until the brand's fingerprints are on the page.

---

## 10. Post-launch (first 30 days)

- [ ] Heatmap / session replay installed on the 3 most important pages
- [ ] Form conversion rate recorded day 1, reviewed weekly
- [ ] Event data reviewed in GA4 and flagged in the project log
- [ ] First-week issues logged in `project-log/CHANGELOG.md`
- [ ] First-month report produced from project-log via `monthly-report` skill
- [ ] One optimisation hypothesis identified and scheduled

Launch is not the end of the work. It is the beginning of measurement.
