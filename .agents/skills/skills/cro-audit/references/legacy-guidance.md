# CRO Audit Skill

Run a structured Conversion Rate Optimisation audit against any website, score 7 dimensions, and produce a prioritised improvement plan with A/B test hypotheses.

## When to Run

**Post-build audit:** Run immediately after `deploy` completes and before the site goes live. Catch conversion problems before real traffic arrives.

**Standalone audit:** Run on any existing client site at any time. Requires only browser access to the live site and the client's `docs/` content files.

**Output:** `docs/cro-audit-report.md` — executive summary, dimension scores (1-5), top 10 issues ranked by impact, and 5 A/B test hypotheses with expected lift ranges.

---

## The 7 CRO Audit Dimensions

Score each dimension 1-5. A score of 3 is baseline acceptable. Below 3 requires immediate action.

---

### Dimension 1: Headlines and Above the Fold

The above-fold zone earns or loses the visitor in the first 3 seconds (Murtagh's 2-3 Second Rule). Brunson's headline tests confirm it is the second-highest-impact variable after the offer itself.

**Audit checklist:**

- [ ] Can a stranger state what the site offers within 5 seconds without scrolling?
- [ ] Does the headline contain a specific number or concrete event rather than a round number or generic claim? (Brunson: specific numbers beat round numbers by +33.56%)
- [ ] Is the headline written in present tense? ("Puts money in your account" not "will put money")
- [ ] Is the headline free of a human face placed directly beside it? (Brunson: faces next to headlines reduce conversions; faces should look toward the copy)
- [ ] Does the hero section contain: headline, subhead, primary CTA, and at minimum one trust signal?
- [ ] Is there a single, unambiguous primary CTA above the fold or within the first scroll?
- [ ] Is the value proposition stated in terms of outcome for the visitor, not features of the product?

**Scoring guide:** 7 items pass = 5. 5-6 = 4. 3-4 = 3. 1-2 = 2. 0 = 1.

---

### Dimension 2: CTAs and Buttons

CTAs are the mechanical link between attention and conversion. Brunson's tests are unambiguous: button visibility, timing, copy, and colour all have measured, significant effects.

**Audit checklist:**

- [ ] Does every page have exactly one primary CTA? Secondary CTAs must be visually subordinate (Hick's Law: multiple competing CTAs increase decision time and abandonment).
- [ ] Is the primary CTA button visually distinct from all other page elements? (High contrast, not blending into the colour scheme)
- [ ] Does CTA copy describe what the visitor gets, not what they do? ("Get the free guide" not "Submit")
- [ ] Is the CTA visible without scrolling on the key conversion pages?
- [ ] For pages with a sales video: is the order button visible immediately, not hidden until price reveal? (Brunson: showing immediately vs. delayed = +30% to +188% across 5 tests)
- [ ] Does the CTA button copy avoid weak words: "click here," "submit," "go," "send"?
- [ ] For free offers: does the CTA copy or surrounding text say "it's free"? (Brunson: +28%)
- [ ] Are CTA buttons placed below the video rather than to the side? (Side placement "bombed completely" in Brunson's test)

**Scoring guide:** 8 items pass = 5. 6-7 = 4. 4-5 = 3. 2-3 = 2. 0-1 = 1.

---

### Dimension 3: Forms

Forms are the conversion event itself. Every unnecessary field, every ambiguous label, and every moment of hesitation costs completions.

**Audit checklist:**

- [ ] Does the form ask only for information that is strictly necessary at this stage? (Progressive disclosure: get minimal data now, more later)
- [ ] Is there a micro-commitment step before the main form ask? (Brunson: survey question before email opt-in = +95%; Nahai: yes-ladders)
- [ ] Are all field labels clear and positioned outside the field, not as placeholder text inside?
- [ ] For multi-field forms: are they broken into logical steps rather than presented as one long form?
- [ ] Is the submit button copy action-forward and specific? ("Get my free report" not "Submit")
- [ ] Does the form have HTTPS? (Brunson: +29.26%)
- [ ] Is there a privacy reassurance line directly below the email field? ("We never share your details")
- [ ] For order forms: are credit card fields on the left side of the form? (Brunson: left side wins)
- [ ] For order forms: are testimonials placed at the top of the form, above the offer recap? (Brunson: testimonials first = +80% revenue)
- [ ] Is there zero empty space on order forms? Empty space should be filled with short testimonials. (Brunson: +44%)

**Scoring guide:** 10 items, weight per item = 0.5 points. 9-10 pass = 5. 7-8 = 4. 5-6 = 3. 3-4 = 2. 0-2 = 1.

---

### Dimension 4: Trust Signals

Trust is evaluated in milliseconds (Fogg's surface credibility). Once damaged, it rarely recovers in the same session.

**Fogg Credibility Model — four types to assess:**

1. **Presumed credibility** — does the site look like a legitimate business in its category?
2. **Reputed credibility** — are third-party endorsements, media mentions, or awards visible?
3. **Surface credibility** — does the design feel polished and professional?
4. **Earned credibility** — are consistency, transparency, and follow-through signals present?

**Audit checklist:**

- [ ] Is there a physical address, real phone number, or named team member visible? (Nahai: specific contact information builds earned credibility)
- [ ] Are security/SSL badges present on checkout and order form pages only — not on opt-in or registration pages? (Brunson: trust seals on non-payment pages hurt conversions by 13-14%)
- [ ] Are testimonials present with full names, photos, and specific outcomes? (Vague testimonials erode rather than build trust)
- [ ] Are testimonials formatted to appear like authentic social media posts rather than polished marketing copy? (Brunson: Facebook-style testimonials = +296%)
- [ ] Are third-party credibility indicators visible: certifications, awards, accreditation logos, media mentions?
- [ ] Is there a clear, findable privacy policy and refund/guarantee policy?
- [ ] Is the guarantee prominently placed near the primary CTA or on the order form? (Guarantee near the decision point reduces abandonment)
- [ ] Are there zero trust destroyers: autoplay audio, aggressive entry pop-ups, outdated copyright dates, broken links, stock photography with posed generic models?

**Scoring guide:** 8 items pass = 5. 6-7 = 4. 4-5 = 3. 2-3 = 2. 0-1 = 1.

---

### Dimension 5: Pricing and Offers

Pricing is the highest-impact variable of all (Brunson: offer is the biggest lever). Presentation of the offer is as important as the offer itself.

**Audit checklist:**

- [ ] Are prices shown in dollar amounts for discounts, not percentages? (Brunson: "$10 off" beats "10% off" by 22%)
- [ ] Is there a high-price anchor shown before the primary offer? (Anchoring: the first price seen calibrates value judgement for everything after)
- [ ] Are pricing options limited to 1-2 choices with one clear recommended option? (Brunson: too many options reduces AOV; Paradox of Choice: 6 options = 10x higher purchase rate than 24)
- [ ] For prices above $100: is a payment plan option available and tested? (Brunson: adding 2-pay option = +217%)
- [ ] For free trial offers: is credit card entry optional rather than required? (Brunson: removing CC requirement = +500% sign-ups)
- [ ] Is urgency — where present — real, specific, and credible? (Artificial countdown timers destroy trust permanently once discovered)
- [ ] Does the offer lead with the continuity/main product and position any entry item as a bonus rather than vice versa? (Brunson: Dan Kennedy format = +109% revenue)

**Scoring guide:** 7 items pass = 5. 5-6 = 4. 3-4 = 3. 1-2 = 2. 0 = 1.

---

### Dimension 6: Layout and Visual Flow

The eye follows predictable patterns. Layouts that fight these patterns bleed attention; layouts that use them funnel attention to the conversion event.

**Core patterns to audit against:**

- **F-pattern:** On text-heavy pages, users scan a horizontal band at the top, a second shorter horizontal band further down, then a vertical scan down the left edge. Place critical content and CTAs in the top-left zone and top horizontal.
- **Z-pattern:** On sparse pages (landing pages, ads), the eye travels top-left → top-right → diagonal to bottom-left → bottom-right. Place primary CTA at the terminal point (bottom-right).
- **Gutenberg Rule:** The bottom-right corner of any layout receives the most attention at the end of a reading sequence. Place secondary CTAs here.

**Audit checklist:**

- [ ] Does the page have a clear visual hierarchy: one dominant element draws the eye first, then guides it downward?
- [ ] Is critical content (value proposition, primary CTA) positioned in the F-pattern hot zones (top-left, top horizontal strip)?
- [ ] Does the page follow the 3-click rule? No piece of content is more than 3 clicks from the home page.
- [ ] Is there a conversion mechanism (CTA, opt-in, contact link) clickable from every page? (Murtagh's 1-click conversion rule)
- [ ] Is the primary navigation limited to 5-7 items? (Nahai: Hick's Law; Paradox of Choice)
- [ ] Is white space used deliberately to reduce cognitive load? Is the page free of visual clutter and competing elements?
- [ ] Is the page's single most important action clearly more prominent than every other element by size, colour, or contrast?
- [ ] Are images positioned so subjects face toward the copy, not away from it or at the camera? (Brunson: directional images guide eye toward the CTA)
- [ ] Is the page stripped of any section that does not directly advance the conversion decision? (Brunson: removing unnecessary blocks = +80%)

**Scoring guide:** 9 items pass = 5. 7-8 = 4. 5-6 = 3. 3-4 = 2. 0-2 = 1.

---

### Dimension 7: Mobile Experience

Mobile is not a degraded version of desktop — it is the primary experience for most visitors.

**Audit checklist:**

- [ ] Are all tap targets at least 44x44px? (Apple HIG minimum; smaller targets cause mis-taps and frustration)
- [ ] Are the primary CTAs within the natural thumb zone (centre-to-bottom of screen on a standard phone)?
- [ ] Does the form reduce to a single column on mobile with no horizontal scrolling required?
- [ ] Do all hero sections display headline and primary CTA above the fold on a 375px screen without requiring a scroll?
- [ ] Is page load time under 3 seconds on a mobile connection? (Murtagh: 1-second delay = -7% conversions; 3-second delay = 40% abandonment)
- [ ] Are mobile-specific CTAs present where appropriate? (e.g. "tap to call" on contact pages)
- [ ] Is there zero autoplay video or audio on mobile? (Trust destroyer; also damages data usage for visitors)
- [ ] Has the mobile conversion sequence been tested end-to-end, not just visually checked? (Brunson: mobile responsive versions can reduce purchases by -83% despite higher opt-in rates)

**Scoring guide:** 8 items pass = 5. 6-7 = 4. 4-5 = 3. 2-3 = 2. 0-1 = 1.

---

## The 22 Mistakes Checklist (Murtagh)

Use this as a pre-audit strategic sanity check. These are not design or copy issues — they are strategic failures that no amount of CRO optimisation can fix.

| # | Mistake | Pass / Fail |
|---|---------|-------------|
| 1 | Strategy was delegated to the designer or developer | |
| 2 | Site was built without SEO integrated from the start | |
| 3 | Budget was used to define scope instead of goals | |
| 4 | The website is treated as a completed project, not a living asset | |
| 5 | Domain was chosen randomly without SEO or brand consideration | |
| 6 | Design came before strategy, site map, and personas | |
| 7 | Success is measured by number of pages, not outcomes | |
| 8 | The website is treated as a marketing expense, not a business asset | |
| 9 | The site is designed for the organisation's preferences, not the visitor's | |
| 10 | There is no memorable moment or interactive element | |
| 11 | Quality of content and execution is inconsistent across pages | |
| 12 | Competitor sites were copied rather than differentiated from | |
| 13 | Content was written before the information architecture was planned | |
| 14 | Platform was selected before requirements were defined | |
| 15 | SEO was planned as a post-launch activity | |
| 16 | The RFP or brief was vague | |
| 17 | Mobile was not included in the original plan | |
| 18 | A site redesign was done without preserving SEO equity | |
| 19 | The web agency was trusted to set the website strategy | |
| 20 | The ideal customer was not defined before build began | |
| 21 | There is no maintenance plan for after launch | |
| 22 | Historical analytics data is ignored in planning decisions | |

Any Fail here is a strategic red flag. Note it in the audit report's executive summary.

---

## Split-Test Priority Rules

See `cro-audit/references/split-test-rules.md` for the full distilled ruleset with supporting data.

**The highest-ROI rules to check first:**

1. Show order/CTA buttons immediately — never delay until price reveal (+30% to +188%)
2. Place Facebook-style testimonials at the top of order forms, above the offer recap (+80%)
3. Use specific numbers in headlines, not round numbers (+33.56%)
4. Add "it's free" near the CTA for free offers (+28%)
5. Use present-tense copy throughout ("puts money in accounts" not "will put")
6. Fill all empty space on order forms with short testimonials (+44%)
7. Use HTTPS on every page (+29.26%)
8. Include "Other" as a fourth option in any micro-survey (+206% EPC)
9. Express discounts in dollar amounts, not percentages (+22%)
10. Keep pricing options to 1-2 choices with one high-price anchor (+83% profit in decoy removal test)

---

## Attention Flow Analysis

**How to run an attention flow analysis:**

1. Take a screenshot of the page at 1280px wide and at 375px wide.
2. On the 1280px version, draw the expected F-pattern or Z-pattern (choose based on content density).
3. Mark the five elements that have the highest visual weight (largest, brightest, highest contrast, or containing a human face).
4. Check whether these five high-weight elements align with the desired conversion path or fight it.
5. Identify where the eye is expected to land last (Gutenberg terminal zone: bottom-right). Is there a CTA there?

**Common attention flow failures:**

- Logo or navigation receives more visual weight than the headline
- A stock photo face looks at the camera instead of toward the CTA, pulling the eye off the page
- Multiple equally-weighted CTAs create visual paralysis
- The most important information is below the fold on mobile (check 375px, not 768px)
- Decorative elements have higher contrast than functional elements

---

## Hypothesis Generator

When an audit reveals a failing element, form a testable hypothesis before recommending a change.

**Hypothesis formula:**

> "We believe that changing [element] from [current state] to [proposed state] will increase [metric] because [evidence or principle]. We expect [X%] lift. We will know in [time period] with [minimum sample size]."

**Priority scoring (ICE framework):**

| Factor | Question | Score 1-10 |
|--------|----------|------------|
| Impact | How significantly will this affect conversion if it works? | |
| Confidence | How strongly does evidence (split test data, heuristic principle) support this hypothesis? | |
| Ease | How little effort/risk does implementation require? | |

**Priority score = (Impact + Confidence + Ease) / 3**

Run highest-scoring hypotheses first. Always test one variable at a time. Never change headline, CTA, and layout simultaneously and call it a split test.

**Evidence tiers for Confidence scoring:**

- Tier 1 (score 9-10): Brunson's split test data — directly observed lift with stated sample size
- Tier 2 (score 7-8): Established heuristic with academic backing (Fogg, Cialdini, Kahneman)
- Tier 3 (score 5-6): Widely repeated agency best practice without primary data
- Tier 4 (score 3-4): Logical inference from first principles
- Tier 5 (score 1-2): Gut feel or aesthetic preference

---

## Audit Report Format

Output to `docs/cro-audit-report.md` using this structure:

```markdown
# CRO Audit Report — [Site Name]
**Date:** [date]
**Auditor:** Claude Code CRO Audit Skill
**Overall CRO Score:** [X/5]

---

## Executive Summary

[2-3 sentences: overall conversion health, biggest single issue, biggest single opportunity.
Flag any of Murtagh's 22 strategic mistakes found.]

---

## Dimension Scores

| Dimension | Score (1-5) | Status |
|-----------|-------------|--------|
| 1. Headlines and Above the Fold | | |
| 2. CTAs and Buttons | | |
| 3. Forms | | |
| 4. Trust Signals | | |
| 5. Pricing and Offers | | |
| 6. Layout and Visual Flow | | |
| 7. Mobile Experience | | |
| **Overall** | | |

---

## Top 10 Issues (Ranked by Impact)

| Rank | Issue | Dimension | Impact | Effort | Priority |
|------|-------|-----------|--------|--------|----------|
| 1 | | | High/Med/Low | High/Med/Low | |
...

---

## 5 A/B Test Hypotheses

### Hypothesis 1: [Short name]
- **Element:** [What to change]
- **Current state:** [Description]
- **Proposed state:** [Description]
- **Evidence:** [Brunson test / Cialdini principle / etc.]
- **Expected lift:** [X-Y%]
- **ICE score:** [X/10]
- **Sample size needed:** [N visitors per variant for significance]

[Repeat for hypotheses 2-5]

---

## Quick Wins (No Testing Required)

[List 3-5 changes with Tier 1 or Tier 2 evidence that should be implemented immediately
without waiting for A/B test results. Example: adding HTTPS, adding "it's free" to CTA,
filling empty order form space with testimonials.]
```

---

## Reference Files

- `cro-audit/references/split-test-rules.md` — Brunson's 86 tests distilled to actionable always/never rules by category
- `cro-audit/references/heuristic-checklist.md` — Full pass/fail checklist for running a complete CRO audit manually
