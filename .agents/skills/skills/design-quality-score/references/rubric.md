# Design Quality Rubric

**Read this when**: scoring a primary template for launch.

**Purpose**: The 7-category rubric the engine uses to decide whether a
rendered output is genuinely premium or has drifted into generic AI
aesthetic. Scoring is on a 0–10 scale per category.

## How to score

- Open the template rendered (both desktop and 3G-throttled mobile).
- Walk category by category in the order below.
- For each category, check the sub-criteria; record a score with
  evidence (class names, specific copy, screenshot region).
- Do not average the scores to arrive at the overall; the overall is
  the **minimum** across all categories.
- A category score below 8 blocks launch.

## Calibration baseline

- **10/10** — world-class, in the same category as a published
  benchmark site.
- **9/10** — clearly distinctive; one or two small improvements
  available but does not read as generic.
- **8/10** — ships. Meets every sub-criterion.
- **7/10** — ships only with remediation that the operator has already
  queued.
- **6/10 or below** — does not ship. Named remediation before re-score.

## Categories

### 1. Typographic rhythm (0–10)

Sub-criteria:
- Modular type scale adhered to across headings and body (no one-off
  font sizes).
- Line-height formula (body: font × 1.6) respected.
- Vertical baseline grid respected on desktop breakpoints; acceptable
  drift on mobile.
- Distinct heading and body typefaces, or a single superfamily with
  deliberate weight pairing.
- No orphans or widows in primary hero or section headers.

Red flags:
- Two body font sizes on the same page.
- Heading sizes that do not step on the scale.
- Letter-spacing used to fake hierarchy.

### 2. Colour discipline (0–10)

Sub-criteria:
- Palette limited to the design-system tokens; no off-palette values.
- Contrast rendered in real context meets WCAG 2.2 AA at minimum.
- No pure `#000000` or pure `#FFFFFF` against sensitive surfaces.
- Accent colour used deliberately, not decoratively.
- Banned palettes from `design-system/references/ai-slop-prevention.md`
  not present.

Red flags:
- Gradient backgrounds without purpose.
- Rainbow-mix accent usage.
- Low-contrast secondary text below 4.5:1.

### 3. Spacing consistency (0–10)

Sub-criteria:
- 8-point grid respected (4-point allowed for fine alignment).
- Section padding consistent across templates.
- Component nesting follows the nested-radius formula.
- Cluster spacing (between related items) clearly tighter than space
  between unrelated groups.
- Mobile spacing respects thumb zones.

Red flags:
- One-off margins on hero or section dividers.
- Inconsistent padding across similar components.

### 4. Hierarchy strength (0–10)

Sub-criteria:
- Squint test passes: primary action is the clearest element.
- Hero communicates value in ≤ 10 words.
- Secondary content recedes; does not compete with primary.
- Three-tier progressive disclosure visible where applicable.
- Rule of Thirds applied on hero composition.

Red flags:
- Two competing CTAs in the same frame.
- Equal-weight sections that flatten the page.

### 5. Copy quality (0–10)

Sub-criteria:
- No banned AI phrases (per `references/banned-patterns.md`).
- No generic hero headlines ("Welcome to", "We are passionate about",
  "Your one-stop solution").
- No template phrases left from the design system starter.
- Voice consistent with the brand style guide.
- Krug's three rules respected (omit words, kill happy talk, kill
  instructions).
- Sales copy follows the `sales-copywriting` direct/transitional CTA
  distinction.

Red flags:
- Sentences longer than 25 words.
- Abstract value claims without proof.
- First-person plural used where customer-first framing would serve.

### 6. Trust-signal placement (0–10)

Sub-criteria:
- Proof element above the fold on primary pages (home, services).
- Proof repeated at the point of primary CTA.
- Testimonials attributed (named person, company, photo where consent
  given).
- Case studies linked where they exist; not just claimed to exist.
- Regulator, association, or payment provider badges placed per
  `sector-strategies` sector rules.
- Africa trust signals per `africa-excellence/references/africa-trust-signals.md`
  (Phase 12) when the project is for an African client.

Red flags:
- Generic star ratings from anonymous users.
- Stock photos used as "team" photos.
- Award claims without source or year.

### 7. Section originality (0–10)

Sub-criteria:
- No generic three-column feature grid with icons unless the content,
  typography, or photography make it distinctive.
- Hero section has > 8 words of distinct, concrete value (not abstract
  taglines).
- At least one section is specific enough that it could not be
  lifted onto a competitor site without obvious mismatch.
- Photography conveys the specific business (owner/team/service) rather
  than generic stock.
- Section-to-section transitions feel composed, not default.

Red flags:
- "Trusted by" with three greyscale logos that could be anywhere.
- Stock photography with diverse people in sunlit offices.
- Testimonials presented in identical cards with no variation.

## Reporting a score

For each category, record:

- Score (0–10).
- Evidence (specific element, class, or screenshot region).
- Rubric clause cited (e.g. "#1 sub-criterion 2").
- Remediation queued if < 9.

Per-template report format is in `report-template.md`.

## Two-operator calibration

The engine expects two operators to score the same template within one
point per category. If the variance exceeds one point, the operators
meet with the rubric and worked examples until they agree. The
agreement is the calibration event; document it in
`score-calibration.md`.

## Floor rule

A score of 8 in every category is the minimum to ship. There is no
"average of 8 across categories" — the overall is the minimum score.
This prevents one strong category from masking one weak one.

---

## Category 8: UX Maturity (Process — added 2026-05-04 from Synechron Enterprise UX)

**Important:** This category is *additive*. It does not retroactively fail templates scored under the original 7-category rubric. Apply going forward.

### Definition
Scores the process maturity behind the deliverable, not the rendered output. A pretty page produced without research, personas, or stakeholder discovery may pass the visual rubric but fail the maturity gate — and therefore cannot ship under premium-pricing claims.

### Reference
See `references/enterprise-ux-maturity-checklist.md` for the full 5-level model and activity-by-level matrix.

### Scoring criteria

| Score | Maturity level reached | Premium-launch eligibility |
|---|---|---|
| 1–3 | Level 0–1 (No design / Styling only) | **Disqualified** — premium claims rejected |
| 4–6 | Level 2 (Style & Color / Problem Solving) | Conditional — only for non-premium tiers |
| 7 | Level 3 partial — some required activities missing | Eligible only after closing gaps |
| 8–9 | **Level 3 (UX Design) — all required activities documented** | **Premium-eligible** |
| 10 | Level 4 (Experience Design) — innovation evidence | Top-tier eligible |

### Pass-fail gate
A premium-priced project (≥ $20k) must score **≥ 8** on this category. No score on the visual rubric can compensate for failure here.

### Evidence required for ≥ 8

Documented presence of all of:
- Problem definition + business objective
- Stakeholder discussions (interview notes)
- Success criteria (signed)
- User research (qualitative + quantitative)
- Competitor analysis (matrix per `levy-competitive-matrix.md`)
- Personas (named, with goals + pain points)
- User journeys (per primary persona)
- Information architecture (sitemap + navigation flow)
- Wireframes (low-fi + high-fi)
- Clickable prototype (per crucial user scenarios)
- Heuristic evaluation report
- Visual design mockups
- ADA / Section 508 compliance verification
