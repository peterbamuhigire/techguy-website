# Conversion Design Rules — Page Builder Skill

Layout, UX, and visual hierarchy rules that prevent common design mistakes killing conversions. These rules complement the copywriting reference and apply to every page built.

Sources: Gill Andrews, *Making Your Website Work: 100 Copy & Design Tweaks*; Anthony Conta, *The Art and Science of UX Design* (2024); Benjamin Franz, *Usability and User Experience Design* (2025); Zuzanna Kruger, *The Art of SXO* (2024).

---

## The 7-Second First Impression

Online visitors form a first impression in 7 seconds. In that window they decide whether to stay or leave. Everything above the fold must pass this test:

1. **Headline answers "what is this?"** — no ambiguity, no cleverness over clarity
2. **Subheadline answers "is this for me?"** — identify the audience
3. **Visual hierarchy guides the eye** — headline → subheadline → CTA, in that order
4. **Nothing competes for attention** — no auto-playing videos, no pop-ups, no competing CTAs
5. **The page looks professional** — consistent fonts, aligned elements, quality imagery

If a visitor has to scroll to understand what the business does, the above-fold content has failed.

---

## Readability Typography Standards

Body copy must be physically comfortable to read. These are hard minimums:

| Element | Standard | Implementation |
|---------|----------|----------------|
| Body font size | Minimum 16px (never below 14px) | `text-base` (16px) or `text-lg` (18px) |
| Line height | 1.5-1.75 (24-28px at 16px font) | `leading-relaxed` or `leading-7` |
| Line width | Maximum 65 characters (~600px) | `max-w-prose` (65ch) |
| Paragraph spacing | Visible gap between paragraphs | `space-y-4` or `space-y-6` on containers |
| Sub-headlines | Every 2-3 paragraphs | Break text walls with H2/H3 headings |
| Contrast | Dark text on light background | WCAG AA minimum (4.5:1 ratio) |

**Reading level target:** 8th-grade level. Use short words, short sentences, and conversational language. If a reader needs a dictionary, you've lost them.

**ALL CAPS:** Avoid in body text (slows word recognition). Acceptable only for very short labels like "NEW" or "FREE".

---

## CTA Placement & Isolation

### CTAs Come After Persuasion, Not Before

A CTA button asks for commitment. Placing one before providing enough information to decide is like asking someone to marry you on the first date. Position CTAs after sufficient persuasive copy — pain statement, solution overview, or proof section. Exception: "soft" CTAs like "See How It Works" can appear earlier.

### Max 1 CTA Per Screen View

On any single screen view (the portion visible without scrolling), show at most ONE CTA button. More CTAs = less attention per CTA. When visitors see 5 buttons, they click none.

**Exceptions:** Product/service grids where each card has its own CTA are acceptable because the grid is the unit of attention, not individual cards.

### Remove Noise Around Primary CTAs

The most important CTA on a page performs dramatically better when it's the ONLY prominent action visible. Remove competing visual elements, secondary CTAs, social icons, and decorative distractions near the primary CTA. White space around a CTA is not wasted — it's strategic.

---

## Carousel & Slider Ban

**Never use auto-rotating carousels** for any purpose:
- Homepage hero sliders — visitors don't wait; they see slide 1 or nothing
- Testimonial carousels — visitors can't read at the carousel's pace
- Client logo carousels — they distract from reading the page
- Moving elements trigger banner blindness — visitors assume they're ads

**Use instead:** Static grids, stacked sections, or tabbed content the visitor controls.

---

## Social Icons: Footer Only

Social media icons belong in the **footer only**. Never place them in the header, sidebar, or body content. Placing social icons before the visitor has engaged with your content gives them an exit — once they're on Instagram, they're lost to cat videos and never return. People who genuinely want to follow will scroll to the footer.

---

## No Body Links on Presentation Pages

Homepage, About page, and service/sales pages are **presentations**, not blog posts. Do NOT place inline text links in body copy on these pages. A text link mid-sentence is like opening a door and inviting your audience to leave during a presentation.

**Only CTA buttons** (visually prominent, strategically placed) should be clickable on these pages. If you have important info on another page, summarise it as plain text right here rather than linking away.

This rule does NOT apply to blog posts, where internal linking is encouraged.

---

## Reading Measure (Line Width)

Body text should occupy **~50-60% of desktop screen width** (approximately 55-75 characters per line). The remaining space is whitespace. Lines that span the full screen width are physically tiring to read — readers turn their heads left and right.

**Implementation:** Use `max-w-prose` (Tailwind's 65ch container) or `max-w-2xl` for body text blocks. Grid layouts with sidebars naturally constrain width. Never let body paragraphs run edge-to-edge on desktop.

---

## False Bottom Prevention

A "false bottom" is a section that looks like the page ends when content continues below. This hides CTAs, persuasive copy, and entire sections from visitors who stop scrolling.

**Common causes:**
- A full-width coloured band followed by a CTA, then more content in the same background colour
- A large hero image or section that fills the viewport with no visual hint that content follows
- Strong visual "endings" (heavy borders, large spacing) mid-page

**Prevention:**
- Alternate section background colours so the next section is always visually distinct
- Never place a CTA immediately before a false bottom
- Test by scrolling through every page on mobile — if any point looks like the end, fix it
- Use subtle scroll indicators or partially visible next-section content

---

## Bullet Point Spacing

List items without vertical spacing become walls of text with decorations. Every `<ul>` and `<ol>` must have spacing between items.

**Implementation:** Apply `space-y-3` or `space-y-4` on list containers. The exact spacing depends on the design system but must be visually distinct from line-height spacing within a list item.

---

## The 60% Unhighlighted Rule

On any screen view containing emphasised text, **at least 60% of the text must be plain** (not bold, not highlighted, not enlarged). When everything is bold, nothing is bold.

**Violations to catch:**
- 6+ consecutive bold lines
- 3+ buttons side-by-side on the same row
- An entire paragraph in bold
- More than 3 consecutive one-line paragraphs (creates visual monotony — vary paragraph lengths)

---

## Text on Images

When placing text over images (hero sections, headers, banners):

1. **Ask first:** Would a solid colour or gradient work instead? If yes, prefer that.
2. **Place text on the less busy area** of the image.
3. **Use a contrasting font colour** that stands out from the image.
4. **Add a semi-transparent overlay** (e.g., `bg-gradient-to-r from-primary-900/80 to-primary-900/40`) behind the text.
5. **Test readability** at all breakpoints — an overlay that works on desktop may fail on mobile where the busy part of the image shifts.

---

## Complex Topic = Simpler Design

The more intellectually demanding the content, the simpler the visual design must be. Complex topics consume cognitive capacity, leaving less ability to process design elements.

**When content is complex:**
- Unify section styling (same structure, same fonts)
- Use fewer visual highlights per screen view
- Shorten paragraphs
- Increase whitespace between bullet points
- Reduce the number of colours, fonts, and decorative elements

---

## Hidden-Info Anti-Patterns

Never hide critical information behind interactive patterns:

1. **No critical info on hover-only** — not everyone will guess to hover; doesn't work on mobile
2. **Don't hide key info behind tabs** — not everyone realises tabs exist or clicks them. Display as stacked sections instead.
3. **No text links to other pages for critical sales info** — if it's needed for the current conversion, summarise it here as plain text
4. **Make all links visually obvious** — if visitors can't tell it's clickable, they won't click
5. **No carousels for important content** — carousels rotate too fast and visitors miss slides

**Rule:** Have something important to say? Make it static. Make it visible. Make it noticeable.

---

## Homepage ≠ Navigation Mirror

Homepage sections must NOT merely repeat navigation labels with a heading, a few lines, and a button (e.g., "Services" heading → 2 sentences → "Learn More"). Visitors already saw the navigation — they now want context.

**Provide instead:**
- How services solve their specific problems
- What your specialisation is
- What your process looks like
- Why they should trust you (proof, credentials, results)
- Popular products, special offers, new arrivals

Homepage space is too valuable to waste repeating yourself.

---

## Blog Posts on Homepage

Only display blog posts/articles on the homepage if blogging is part of the sales funnel:
- **Include if:** Expertise-based services (consulting, coaching), content creators, bloggers
- **Skip if:** Strong buying intent (e-commerce), few blog posts (<5), low-quality posts

When included, show 2-3 carefully selected posts with featured images, not a raw feed of latest articles.

---

## Footer Content Checklist

The footer appears on every page — don't leave it empty. Include what's relevant:

- [ ] Company snippet (1-2 sentences) + photo/logo
- [ ] Navigation links to main pages
- [ ] Latest articles (if blog is active)
- [ ] Email signup / newsletter CTA
- [ ] Contact information (email, phone, WhatsApp)
- [ ] Postal address or link to map
- [ ] Social media icons (footer is the ONLY appropriate place)
- [ ] Copyright notice
- [ ] Privacy policy and terms of use links

**Footer must have a visually distinct background colour** from the page body. Same-colour footers blend in — visitors can't find them or scroll past CTAs.

---

## OG Image — Mandatory Per Page

Every page and blog post MUST pass a unique `ogImage` to BaseLayout. The site-wide `/og-image.png` default is a **fallback only** — it should never be the final value for any published page.

**Page builder must:**
1. Search `_catalog.json` for HD images (`*-HD.jpg`) or hero images matching the page
2. Pass the best match via `<BaseLayout ogImage={img.src}>`
3. For blog posts, always use the article's featured image

If no suitable image exists, flag it in the replacement checklist as a missing OG image.

---

## 80/20 Prototypicality Rule

~80% of website patterns should match niche conventions (navigation structure, colour schemes, homepage layout, content hierarchy). Uniqueness comes from the remaining ~20% — distinctive fonts, accent colours, brand personality, copywriting voice.

Prototypical feels familiar. Familiar evokes trust. A website that looks radically different from what visitors expect in its niche triggers distrust, no matter how beautiful it is.

---

## Button Anatomy & All Six States

Every interactive button must have all six states designed. Omitting any state breaks the user's mental model of what is happening.

| State | When It Applies | Design Requirement |
|-------|----------------|--------------------|
| **Default/Normal** | Resting state | Brand accent colour, clear label |
| **Hover** (web only) | Cursor rolls over | Colour shift or shadow — signals interactivity |
| **Focus** | Keyboard Tab navigation | 2px visible outline — required for accessibility |
| **Active/Pressed** | Click or tap | Slightly darker/inset — confirms the action registered |
| **Disabled** | Action unavailable | Reduced opacity, cursor not-allowed — always pair with a tooltip explaining why |
| **Loading/Processing** | Action taken, system is working | Spinner or "Loading…" text — never leave the user wondering if their click registered |

**Button hierarchy on every page:**
1. Primary button — brand accent colour, filled, one per section
2. Secondary button — ghost (transparent + border)
3. Tertiary action — text link only

Only one primary button per screen view. When visitors see five equally prominent buttons, they click none.

**Corner radius signals brand personality:**
- Rounded (32–64px): friendly, approachable, consumer-facing
- Slightly rounded (4–8px): professional, modern
- Sharp corners (0px): authoritative, formal, premium

**Button padding (1x-2x rule):** 8px vertical, 16px horizontal.

---

## The Endowed Progress Effect

People are more motivated to complete tasks when they perceive they've already made progress — even if that progress was artificially given.

**Applications:**
- Progress bars that start at 20% rather than 0%
- Profile completion meters (LinkedIn model)
- Onboarding checklists with one step pre-checked
- Tutorial flows that begin with the easiest win
- Form flows that show "Step 1 of 3 complete" on arrival

**Build this into:** multi-step contact forms, quote calculators, booking flows, and any onboarding sequence.

---

## Von Restorff Effect — One Thing Must Stand Out

The primary CTA must look like nothing else on the page. Contrast in colour, size, and shape creates memorability and draws the eye.

**Checklist:**
- [ ] Primary CTA uses a colour not used anywhere else on the same screen view
- [ ] Primary CTA is physically larger than surrounding text elements
- [ ] White space around the CTA creates isolation (isolation amplifies distinctiveness)
- [ ] No more than one element on the page uses the primary CTA colour
- [ ] Secondary and tertiary actions are visually subordinate (ghost button or text link)

---

## Flow — Keeping Users in the Zone

Flow is the state where users are so engaged they move through the site naturally toward conversion. It exists at the balance point between boredom and anxiety.

**Design checklist for flow:**
- [ ] Every page has one clear purpose — the user always knows why they're here
- [ ] Every action produces immediate feedback (button state change, confirmation message, progress update)
- [ ] Complex interfaces use progressive disclosure — don't show everything at once
- [ ] No intrusive interruptions (no pop-ups before scroll, no auto-playing audio)
- [ ] Each section leads logically to the next — no dead ends, no orphan pages
- [ ] Users have meaningful control (filters, preferences, self-paced navigation)

---

## The 60-30-10 Colour Rule

A colour distribution formula that creates visual hierarchy and guides the eye to interactive elements.

- **60%** = dominant/background colour (e.g., white, off-white, dark surface)
- **30%** = secondary/interactive colour (e.g., brand primary for headings, borders, section backgrounds)
- **10%** = accent colour (e.g., CTA buttons, key highlights, active states)

**Colour hierarchy for actions:**
- **Primary action** = filled with accent colour (solid button) — one per viewport
- **Secondary action** = outlined with brand colour (ghost button)
- **Tertiary action** = text-only link (minimal visual weight)

Text-heavy designs may swap the 30% and 10% proportions, but the principle holds: the accent colour must remain scarce to retain its power.

---

## Signifier-Affordance Alignment

Every visual cue must correctly communicate what an element does.

**Checklist:**
- [ ] Every clickable element looks clickable (colour, cursor change, hover state)
- [ ] Every non-clickable element looks static (no underlines, no button-like styling)
- [ ] Interactive colour is reserved exclusively for interactive elements
- [ ] Disabled controls are grey + cursor: not-allowed (never invisible)
- [ ] Links use consistent styling (colour + underline or colour-only, but never alternating)
- [ ] Form inputs look distinct from display text (border, background, or shape difference)

**When signifier and affordance align, the experience feels intuitive.** When they don't, users click static text, ignore real buttons, and blame themselves for "not understanding the site."

---

## Cognitive Overload — 4 Causes to Check

Every page must be audited for these four causes of cognitive overload. If any exists, fix it before adding more content.

| Cause | Symptom | Fix |
|-------|---------|-----|
| **Internal inconsistency** | Different button styles, spacing rules, or typography across pages | Enforce design-tokens.md; audit every page against the design system |
| **Unnecessary actions** | Extra clicks to reach content; redundant steps | Reduce steps; use smart defaults; direct links to key content |
| **Too many competing elements** | Multiple CTAs, colours, animations fighting for attention | One primary CTA per viewport; 40% highlight limit; remove decorative noise |
| **Ambiguous signifiers** | Unclear what is clickable vs static; links that don't look like links | Consistent interactive colour; hover states; standard link patterns |

---

## SCAMPER — Differentiation Technique

When a page design feels generic, run the SCAMPER checklist to find distinctive approaches:

- **S**ubstitute — Replace a standard element (e.g., replace a hero slider with a single bold statement + large photo)
- **C**ombine — Merge two sections (e.g., testimonials embedded within service descriptions instead of separate section)
- **A**dapt — Borrow from another industry (e.g., use a restaurant-style menu layout for a pricing page)
- **M**odify — Amplify or reduce one element (e.g., make the hero headline 3× larger than convention)
- **P**ut to other use — Repurpose a pattern (e.g., use a timeline component for a service process instead of company history)
- **E**liminate — Remove what every competitor has (e.g., drop the generic "Why Choose Us" section; prove it through content instead)
- **R**earrange — Flip the expected order (e.g., lead with social proof before explaining the service)

**Rule:** Apply 1-2 SCAMPER changes per page for the 20% differentiation (per the 80/20 prototypicality rule). Don't SCAMPER everything — that creates confusion, not distinctiveness.

---

## Association Space Design

The visual design of each page triggers associations in visitors' minds. These associations must match the brand's intended identity.

**Process:**
1. Define 3-5 target adjectives from the brand brief (e.g., "innovative," "trustworthy," "African," "premium")
2. Select basic design elements that trigger those associations:
   - **Colours** — Industry conventions exist: green/brown = organic, white/blue = medical, black/gold = premium
   - **Shapes** — Rectangles = order/structure; circles = balance/softness; diagonals = energy/movement
   - **Typography** — Serif = traditional/authoritative; sans-serif = modern; display = distinctive/bold
   - **Imagery** — Strong images with clear subjects trigger consistent associations across viewers
   - **Composition** — Horizontal = calm/trustworthy; vertical = bold/alert; diagonal = energy/action
3. Verify: the triggered associations must connect to actual product/service properties. A creative agency CAN use playful design; a CRM tool should NOT use "sex sells."

**Blues recede, reds advance** — use colour depth for visual layering. Background in cool blue tones, foreground CTAs in warm tones.

---

## Dual Decision-Maker Rule

Every page must serve both logical and emotional decision-makers simultaneously.

| Type | What They Need | How to Deliver |
|------|---------------|----------------|
| **Logical** | Facts, data, comparisons, specifics | Tables, metrics, case study results, feature lists, pricing |
| **Emotional** | Trust, stories, visual confidence | Testimonials, team photos, brand story, quality imagery, tone of voice |

**Rule:** Pair every statistic with a human story. Pair every testimonial with a concrete result. Never build a page that only appeals to one type.
