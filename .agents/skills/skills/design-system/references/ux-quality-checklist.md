# UX Quality Checklist — Validate Before Launch

Concrete evaluation methods to verify a website meets world-class UX standards. Run these checks after design-system and page-builder complete, before deploy.

Sources: Benjamin Franz, "Usability and User Experience Design" (2025); Anthony Conta, "The Art and Science of UX Design" (2024); Russ Unger, "A Project Guide to UX" (2024).

---

## 0. The Squint Test (Quick Visual Hierarchy Check)

The fastest way to verify visual hierarchy works. Takes 5 seconds.

**How to perform:**
1. Pull up the page at desktop width
2. Squint your eyes (or blur your vision) until you can't read any text
3. Observe: what elements are still visible? What jumps out first?

**What you should see:**
- The **headline** is the most prominent element
- The **primary CTA** is clearly visible as a distinct block of colour
- **Sections** are visually grouped — you can tell where one ends and another begins
- **Navigation** is visible but not competing with content
- The **visual hierarchy** has 3–4 clear levels, not a flat wall of sameness

**What means it fails:**
- Everything looks the same weight/size — no hierarchy
- Multiple elements compete for attention at the same level
- The CTA blends into the surroundings
- You can't distinguish sections from each other
- Decorative elements are more prominent than content

**Fix pattern:** Increase contrast between hierarchy levels. Make headings bolder/larger, reduce visual weight of secondary elements, ensure the CTA is the only accent-coloured element in its viewport.

---

## 0.5. The AI Slop Check

Run the 5-point AI Slop Audit from `design-system/references/ai-slop-prevention.md`. This catches AI-generated aesthetic clichés before they ship:

- [ ] **Screenshot test** — doesn't look "AI-generated" or "template-like"
- [ ] **Palette test** — colours feel brand-specific, not generic blue-purple
- [ ] **Layout test** — has surprising/asymmetric elements, not all centred cards
- [ ] **Copy test** — text is client-specific, not interchangeable with other sites
- [ ] **Personality test** — recognisable without the logo

---

## 1. The Design Grid Check

A structural quality test that measures visual alignment and consistency. Fewer grid lines = calmer, more professional layout.

**How to perform:**
1. Take a screenshot of each page at desktop width
2. Draw vertical lines at the left and right edge of every element
3. Count the distinct vertical lines — **fewer = better** (elements share alignment points)
4. Draw horizontal lines at the top and bottom edge of every element
5. Measure the distances between horizontal lines — **fewer distinct distances = better**
6. Compare before/after to measure improvement

**Quality targets:**
- Desktop page: no more than 6-8 distinct vertical alignment points
- Consistent horizontal spacing: use 2-3 standard section gaps (e.g., 64px, 96px, 128px)
- Cards in a grid: all cards share identical vertical lines; inner content aligns across cards
- If any element's edge doesn't align with at least one other element, it looks "floating" — fix it

**Deliberate grid breaks:** You CAN break the grid at defined accent points (hero section, featured testimonial, CTA banner) to create visual interest. But the break must be intentional, not accidental.

**Responsive check:** Run the grid check at all three breakpoints (375px, 768px, 1280px). Each breakpoint has its own grid — elements reorganise, not just shrink.

---

## 2. The 5-Second Test

Validates that the page's value proposition and visual hierarchy work at first-impression speed.

**How to perform:**
1. Show the page (screenshot or live) for exactly 5 seconds, then hide it
2. Ask: "What is this page about?" / "What does this company do?" / "What should you do next?"
3. If the answers don't match the page's intent, the visual hierarchy has failed

**Apply to:**
- Every homepage hero section (mandatory)
- Every service/product page above-the-fold
- Blog post hero + opening paragraph
- Landing pages and CTA-heavy sections

**Quality targets:**
- 80%+ of test respondents correctly identify the business/page purpose
- 60%+ can name the primary CTA or next action
- If testing against competitors, your page should score equal or higher

**When it fails, fix:**
- Headline clarity (too clever, not descriptive enough)
- Visual hierarchy (competing elements dilute attention)
- CTA prominence (not visible or not distinct enough)
- Image choice (photo doesn't support the message)

---

## 3. Hierarchy of Needs Audit

Every page must satisfy four levels in order. A page that fails at a lower level cannot succeed at a higher one.

| Level | Check | Pass Criteria |
|-------|-------|--------------|
| **Functional** | Does the page load? Do all links work? Do forms submit? | Zero broken elements, all interactive features operational |
| **Reliable** | Does it work on all devices and browsers? Consistently? | Tested on Chrome, Safari, Firefox + mobile; no intermittent failures |
| **Usable** | Can users find what they need and complete their task? | Navigation clear, text readable, CTA obvious, forms validated |
| **Pleasurable** | Does it delight? Does the brand personality come through? | Distinctive fonts, meaningful animations, polished micro-interactions |

**Audit process:** Check every page against all four levels. Stop at the first failure — fix that level before moving up.

---

## 4. Cognitive Overload Audit

Four causes of cognitive overload. Check each page for all four.

| Cause | What to Look For | Fix |
|-------|-----------------|-----|
| **Internal inconsistency** | Different button styles, typography rules, or spacing on the same site | Enforce design tokens consistently; audit every page against design-tokens.md |
| **Unnecessary actions** | Extra clicks to reach content, redundant confirmation steps | Reduce steps; direct links to key content; smart defaults |
| **Too many competing elements** | Multiple CTAs, colours, shapes, animations all fighting for attention | One primary CTA per viewport; limit highlights to 40% of visible text |
| **Ambiguous signifiers** | Unclear what is clickable vs. static; links that don't look like links | Consistent interactive colour; hover states; standard link patterns |

---

## 5. Association Space Verification

Validates that the visual design triggers the desired brand associations — not just "looks nice."

**How to perform:**
1. Define 3-5 target adjectives from the brand brief (e.g., "innovative," "trustworthy," "African")
2. Show the website to 5+ people for 30 seconds
3. Ask them to write down 3 words that describe their impression
4. Compare their words against your target adjectives
5. If there's a mismatch, the visual design needs adjustment

**What causes mismatches:**
- Colour palette triggers wrong industry associations (medical blue on a creative agency)
- Typography personality doesn't match brand voice (playful font on a law firm)
- Imagery style conflicts with target emotion (stock photos of handshakes on a "personal" brand)
- Layout composition signals wrong energy (diagonal/dynamic for a calm wellness brand)

**Fix pattern:** Identify which basic design element (colour, shape, typography, imagery) is triggering the wrong association, then adjust that element while keeping others stable.

---

## 6. Expert Review Heuristics

Walk through every page evaluating against these seven interaction principles (ISO 9241-110). See `page-builder/references/interaction-design-principles.md` for full details.

| Principle | Key Question |
|-----------|-------------|
| Task suitability | Does this page help users accomplish their actual task? |
| Self-descriptiveness | Can a first-time visitor complete their task without help? |
| Conformity with expectations | Does the site behave like other sites users know? |
| Learnability | Can users grasp the structure within seconds? |
| Controllability | Are users in control of their experience? |
| Error robustness | Are errors prevented, tolerated, and recoverable? |
| User engagement | Does the site motivate users to stay and return? |

**Process:**
1. Evaluate each page individually against all seven principles
2. Document findings on annotated screenshots
3. Colour-code by severity: red (blocks task), amber (degrades experience), green (opportunity)
4. Prioritise fixes by: consequences × frequency × recoverability

---

## 7. The Complete Pre-Launch UX Checklist

Run in order. Each check builds on the previous.

### Visual Quality
- [ ] Design Grid check passes at all 3 breakpoints (375px, 768px, 1280px)
- [ ] 5-Second Test: homepage purpose clear without scrolling
- [ ] Association Space: 3+ out of 5 target adjectives matched by test respondents
- [ ] Colour contrast: all text passes WCAG AA (4.5:1 body, 3:1 large text)
- [ ] No more than 2 font families used across the entire site
- [ ] Icon style consistent (all outlined OR all filled)

### Content Quality
- [ ] Every page has one clear primary purpose
- [ ] Headlines answer "what is this?" within the first 7 words
- [ ] Body text: 16px+ font, max 65ch line width, 1.5+ line height
- [ ] No text walls: subheadings every 2-3 paragraphs
- [ ] F-Pattern respected: key info at start of lines and paragraphs
- [ ] Inverted pyramid: most critical information first on every page

### Interaction Quality
- [ ] All seven interaction principles satisfied (expert review)
- [ ] Every clickable element has visible hover/focus/active states
- [ ] Primary CTA is the only element using accent colour per viewport
- [ ] Buttons trigger actions; links handle navigation
- [ ] One primary button per decision point; secondary and tertiary actions are clearly subordinate
- [ ] Destructive actions use a distinct danger treatment and explicit label
- [ ] No auto-moving elements (carousels, tickers, auto-play)
- [ ] Forms validate inline with helpful error messages
- [ ] 404 page includes search + navigation + homepage link
- [ ] Back button works correctly on every page

### Performance Quality
- [ ] Hierarchy of Needs: Functional → Reliable → Usable → Pleasurable (in order)
- [ ] Cognitive overload audit: no internal inconsistency, unnecessary actions, competing elements, or ambiguous signifiers
- [ ] Kano threshold features present: mobile responsive, SSL, contact info, fast loading, clear navigation
- [ ] All pages tested on real devices at all three breakpoints

### Trust Quality
- [ ] Contact information visible on every page (header or footer)
- [ ] Trust signals near conversion points (not buried in footer)
- [ ] Privacy policy and terms accessible from every page
- [ ] Real company/team information (not generic stock content)
- [ ] OG image set for every page (no fallback defaults)

### Polish Quality (Final Pass)
- [ ] **Squint test passes** — visual hierarchy clear with blurred vision at all breakpoints
- [ ] **AI slop check passes** — 5-point audit from `ai-slop-prevention.md`
- [ ] **Pixel alignment** — no elements off-grid at any breakpoint; deliberate breaks only
- [ ] **Source-of-truth parity** — the documented tokens and components match the shipped UI; no “real product” branch-off styling
- [ ] **Typography consistency** — same heading levels look identical across all pages
- [ ] **Tinted neutrals** — no pure gray or pure black; all neutrals have brand hue tint
- [ ] **Interaction states complete** — all 8 states designed for every interactive element (see `component-design-rules.md`)
- [ ] **Token discipline** — no one-off hex values, random radii, or page-specific spacing values where tokens should exist
- [ ] **Component reuse** — repeated UI problems resolve through shared components, not slightly different duplicates
- [ ] **Microcopy quality** — error messages, empty states, buttons follow `ux-writing-patterns.md`
- [ ] **Button labels are specific** — no "Submit", "OK", or unlabeled icon controls
- [ ] **Loading buttons preserve context** — spinner plus verb, not spinner alone
- [ ] **Touch targets pass** — all buttons and icon buttons meet the 44x44 minimum in rendered context
- [ ] **Motion consistency** — all animations use motion tokens, not hard-coded values (see `motion-design.md`)
- [ ] **No banned easing** — no bounce, elastic, or linear on UI transitions
- [ ] **Edge case hardening** — text overflow, i18n expansion, image fallbacks all handled (see `design-hardening.md`)
- [ ] **Widows/orphans** — no single words on a line at the end of headings or short paragraphs
- [ ] **Icon consistency** — all icons same style (outline OR filled), same weight, same size per context
- [ ] **Loading states designed** — skeleton/spinner for every data-dependent section
- [ ] **Empty states designed** — helpful guidance for every section that could be empty
- [ ] **Container query test** — components work in different width containers (sidebar vs full-width)

### System Governance
- [ ] **UI audit completed** — pre-existing variants and duplicated components were inventoried before redesigning
- [ ] **Contribution rule exists** — new components have an explicit reason they cannot be solved by extending an existing one
- [ ] **Ownership is clear** — someone owns design-system updates, documentation updates, and downstream page adoption
- [ ] **System is treated as ongoing** — maintenance, adoption, and drift checks exist instead of assuming “finished forever”

---

## First-impression and orientation (added 2026-05-04 from Deacon + Fekeshazi)

Sources: `deacon-ux-ui-strategy-extraction.md` Section 4 (UI Design Considerations); `fekeshazi-pm-ux-guide-extraction.md` Section 1.2 (5-10 minute rule).

### The 5–10 minute rule (Fekeshazi)
At first use, you have a maximum of 5–10 minutes to give users answers about how the app works and how they benefit. **Tutorials are futile.** The interface itself must explain.

**Audit:** can a first-time user accomplish the primary goal within 5 minutes without watching a tutorial or reading a help page?

### Consistency (Deacon)
- Colors, borders, font size, style, background images, effects — match across pages
- Doing similar tasks in similar/familiar ways
- Logo always returns to home
- Header, footer, body structure consistent across all pages

### Responsiveness (Deacon)
- Confirm submissions explicitly ("Saved", not silent success)
- Loading indicators for any operation > 1 second
- Never leave the user with a blank page or no path back
- Loading state messages: progress percentage if known, indeterminate spinner if not

### Familiar words (Deacon)
- Use sign-up, register, login — not invented vocabulary
- "Submit" or "Send" — not "Initiate transmission"
- Industry-standard terms reduce cognitive load on first visit

### Streaming (Deacon)
- Every page contains a link to contact information
- Throw away unwanted content; clutter doesn't improve the interface
- Sticky/scroll-aware footer with key links

### Pre-launch checklist
- [ ] First-time user can reach primary goal in ≤ 5 minutes without coaching
- [ ] No tutorials required (no overlay tour, no "5 things to know" modal)
- [ ] Color/font/spacing consistent across all primary templates
- [ ] Logo links home from every page
- [ ] Every form submission has explicit success/failure feedback
- [ ] Loading states present for all > 1s operations
- [ ] Standard vocabulary used throughout (sign-up / login / submit, not invented terms)
- [ ] Contact info reachable from every page
