# Roots of UI/UX Design — Comprehensive Extraction
**Source:** Elisa Paduraru, Creative Tim (2024)
**Subtitle:** Learn to Develop Intuitive Web Experiences
**Coverage:** All 7 parts + appendices. Extraction focuses on specific, actionable rules.

---

## PART I — History and Context (Brief Reference)

- "Design is the intersection of art and function." — Paul Rand
- "Design is not just what it looks like and feels like. Design is how it works." — Steve Jobs
- Responsive web design coined by Ethan Marcotte (2010 article) — single codebase adapts fluidly to any screen size
- Mobile-first design gained prominence when mobile internet surpassed desktop (~2010s)
- CSS Grid and Flexbox replaced float-based layout hacks
- Flat UI (2010s): clean 2D shapes, no shadows/gradients, bold colours, grid-based layouts
- Material Design (Google, 2014): elevation via shadows on Z-axis, card-based layouts, responsive grid
- Neumorphism: soft ambient shadows inward + outward, blurs foreground/background distinction — avoid high contrast
- Glassmorphism: frosted-glass transparency on cards/modals, vibrant saturated backgrounds show through, minimalist layouts
- Neubrutalism: thick black borders on cards/buttons, strong colour contrast, asymmetric/irregular grids — intentional norm-breaking
- Bauhaus UI: geometric sans-serif type, primary colour palette (R/Y/B or B&W + one accent), grid systems for structure

---

## PART II — UI/UX Fundamentals

### 1. User Interface Characteristics

**Efficiency:**
- Logical placement of buttons and controls
- Reduce unnecessary steps in user workflows
- Streamline interactions so tasks are completed quickly with minimal effort

**User Satisfaction:**
- Aesthetics and visual appeal must avoid frustration
- Enjoyable experience is a measurable design outcome, not a luxury

**Brand Communication:**
- Consistency in colours, fonts, and logos reinforces brand image
- Every UI element communicates brand identity; inconsistency destroys trust

### 2. UX Design Guidelines (Core Four)
1. Product must be intuitive, logical, and self-explanatory
2. Product must address the user's specific needs and problems effectively
3. Product must be accessible and usable by a diverse audience
4. Tasks must be accomplished smoothly without causing frustration

### 3. CUBI Experience Model (Corey Stern)
Four components that shape user experience:
- **Content** — quality and relevance are central, not afterthoughts
- **User Goals** — what the user wants to accomplish
- **Business Goals** — what the business needs from the interaction
- **Interactions** — how the product responds to the user

Content is explicitly the first factor; design without content planning fails.

---

## PART III — Pixels to Elements (Core Technical Rules)

### 1. GRID AND LAYOUT

#### Column Systems
- **Standard: 12-column grid** — the universal desktop standard
- Acceptable alternatives: 6-column or 8-column grids
- **Never use 7, 9, or 11 columns** — these are not divisible by useful factors and produce awkward layouts
- Row grids are less common in web design; columns dominate

#### Grid Terminology
- **Columns:** Vertical segments
- **Rows:** Horizontal segments
- **Gutters:** Empty space between columns/rows
- **Margins:** Space surrounding the entire grid area; ample margins give users visual breathing room
- **Modular:** The intersection point of a column and row (where elements snap to)

#### Fluid vs Fixed Grid
- **Fluid Grid:** Column widths adjust to screen size; margins and gutters stay fixed → recommended for responsive design
- **Fixed Grid:** All measurements constant regardless of screen → use only for content that must not reflow

#### Desktop Grid Rules
- 12-column grid as default
- **Gutter size:** 12pt, 14pt, or 16pt
- **Margin size:** 160pt or 180pt
- **8pt Rule:** All element dimensions must be multiples of 8 (16, 24, 32, 40, 48...) — most screen sizes are divisible by 8; this ensures consistency and saves implementation time

#### Mobile Grid Rules
- 8pt grid system as foundation
- **Margins:** 16px standard; some apps use 20–24px
- **Gutters:** 16px recommended minimum; never below 16px (inadequate visual separation)
  - Exception: 8px gutters acceptable only in constrained/minimalist layouts
- **Baseline grid for text:** 4px increments

#### Text Alignment on Grid
- Always align text to the **baseline of the first line** when aligning multiple text blocks
- Baseline-first alignment produces clean, harmonious layouts
- Misaligned baselines create visual disorder even with correct column alignment

---

### 2. TYPOGRAPHY

#### Typeface Categories
- **Serif:** Decorative features at stroke ends; conveys sophistication and classic elegance
- **Sans Serif:** No decorative features; clean, informal, contemporary
- **Script:** Avoid as primary text in UI/UX — too difficult to read at body sizes

#### Selection Criteria for Typefaces
Prioritise in order:
1. Legibility (can individual letters be distinguished?)
2. Scalability (does it work at 12px and 80px?)
3. Variety of font weights available (Regular, Light, SemiBold, Bold, Italic minimum)

#### Line Height Rules
- **Inverse relationship:** Larger text = shorter line height; smaller text = taller line height
- **Formula for small/body text:** line-height = font-size × 1.6
  - Example: 16px font → 16 × 1.6 = 25.6 → round to 26px line height
  - Practical rule: 16px font / 26px line-height is the standard body text combination
- For text at 16px specifically: 26px line height is ideal

#### Line Length
- Shorter lines are more readable than long lines
- Excessively short lines disrupt text flow (fragmented reading)
- Excessively long lines disrupt reading rhythm (readers lose line start)
- Goal: balance between these extremes (implied ~60–80 characters per line)

#### Letter Spacing (Tracking / Kerning)
- Default letter spacing value: 0 (do not change without reason)
- **Exception:** Consecutive capital letters often need kerning — their inherent spacing is too tight
- Well-designed fonts have optimal built-in spacing; minimise manual adjustments
- Reference Material Design or Apple HIG for their specific typeface guidelines
- Caution: excessive letter spacing reduces legibility

#### Text Alignment Rules
- **Left-align is default** — ~90% of humans are right-handed and read left-to-right
- **Centre alignment:** Only appropriate for short text (2 lines or fewer); impairs readability at scale
- **The "rag" problem:** The uneven right margin in left-aligned text must be kept even; a jagged rag creates visual disruptions that impede reading flow

#### Type Scale
- Create a system of 10+ text styles, each with a defined purpose
- Limit font sizes in any single section to **maximum 3 font sizes**
- Use online tools to generate type scales from a base size

---

### 3. COLOURS

#### Colour Psychology — First 90 Seconds Rule
Research (Institute for Color): users take ~90 seconds to judge product quality; up to 90% of that judgement is based on colour alone. Colour decisions are conversion decisions, not aesthetic ones.

#### Colour Formats
- **HEX / RGB:** Digital screens (web, apps)
- **CMYK:** Print materials (brochures, business cards)
- **Pantone:** Standardised brand matching (identity systems)

#### Colour Terminology
- **Hue:** Pure colour, no adjustments
- **Tint:** Hue + white added (lighter)
- **Shade:** Hue + black added (darker)
- **Saturation:** Intensity of the colour

#### Why Pure Black Must Be Avoided
- Pure black on white = maximum contrast (0% vs 100% brightness) → eye strain during extended reading
- Use **dark grey** for text on white backgrounds instead
- Pure black background + white text = **halation effect** — white letters appear to bleed/glow, especially severe for users with astigmatism
- In dark mode: never use white shadows — they create jarring, visually tiring contrast

#### Colour Schemes — When to Use Each
- **Complementary:** Opposite on colour wheel → vivid, high contrast, demands attention → use sparingly for CTAs
- **Analogous:** Adjacent colours → harmonious, comfortable → designate one dominant, two accents
- **Split-complementary:** Primary + two colours flanking its complement → high contrast with less tension than complementary
- **Triadic:** Three colours equidistant on wheel → bold, high contrast, impactful
- **Rectangular (Tetradic):** Two complementary pairs → strong, striking contrasts
- **Monochromatic:** One hue + its tints and shades → subtle, easy to work with, safe

#### 5-Step Colour Palette Process
**Step 1 — Primary Colour:** Recurring accent applied to buttons, icons, headers, typography. Does not need to be from a colour wheel formula.

**Step 2 — Secondary Colour:** Directs users to secondary actions. Either the complementary to primary, or a neutral grey family.

**Step 3 — Attention-Grabbing Colours (Semantic Colours):**
- **Blue:** Information / general interactive state
- **Green:** Success / confirmation
- **Yellow:** Warning
- **Red:** Danger / error
Apply to notifications, alerts, modals, input validation states.

**Step 4 — Tints and Shades:** Create variations of selected colours for backgrounds, cards, image overlays.

**Step 5 — Golden Ratio Distribution (60-30-10 Rule):**
- **60%:** Dominant neutral (white, light grey, or dark background)
- **30%:** Secondary colour (complementary or grey family)
- **10%:** Accent colour (primary brand colour)

#### Pro Tip: Natural Colour Palettes
Drawing colours from nature produces palettes users find visually familiar and comfortable — they encounter these hues daily. Nature already balances tints and shades effectively.

#### Contrast
- Higher contrast = better clarity and visibility
- Lower contrast = more subdued, recessive quality
- Use contrast-ratio.com to compute ratios
- WCAG compliance minimum: 4.5:1 for normal text, 3:1 for large text

#### Dark Mode Colour Rules
- Tints create more pronounced contrast in dark mode than shades (opposite to light mode)
- Never use white shadows in dark mode — use a darker shade of the element's colour + lighter tint from background
- Dark mode reduces eye strain, screen flicker, and blue light exposure

---

### 4. GRADIENTS

#### Types
- **Linear:** Transition along a straight line (oblique, horizontal, or vertical) → best for square/polygonal shapes
- **Radial:** Colour starts at centre and blends outward → best for circular/round shapes; can create 3D effect with correct colours
- **Angular (Conic):** Colour distribution rotates around a central point with specified angles → unique visual effects

#### Gradient Creation Rules
- Strive for **gentle colour transitions** — harsh jumps between stops look cheap
- Limit to **maximum 3 colours** in small shapes
- Maintain symmetry among colour stops
- Position **lightest colour at top** in linear gradients — mimics natural light from above
- Primary + its tints/shades = safe gradient range

#### Gradient Colour Mixing Problem
When using two complementary colours in a gradient, an **ugly grey hue** appears at the midpoint.
- **Fix:** Add a third colour from the colour wheel to bridge the transition

#### Morph Gradient Technique
Combine a radial gradient + linear gradient to create a distinctive "morph" effect.

---

### 5. SHADOWS

#### Why Shadows Exist in UI
- Humans are accustomed to 3D perception with light/shadow from sunlight
- Without shadows, designs lose realism and sense of depth
- Shadows on the Z-axis communicate: element hierarchy, depth perception, movement direction, surface edges, relative positions

#### Shadow Types
- **No shadow:** Element appears flat on the background surface
- **Drop shadow:** Element appears raised above background (depth varies with shadow values)
- **Inner shadow:** Element appears embedded/recessed into background → used for input fields (signals "type here"), associated with Neumorphism

#### Rules for Realistic Shadows
1. **Never place shadow above the element** — contradicts natural sunlight direction; users find it unfamiliar and confusing
2. **Use two shadow layers** (most designers incorrectly use only one):
   - **Core shadow:** Narrow, dark ring immediately adjacent to the object
   - **Cast shadow:** Wider, lighter shadow extending behind the object
3. Shadow size is proportional to object size — larger objects cast larger shadows
4. Varying shadow sizes across different elements improves realism

#### Dark Mode Shadow Rules
- **Never use white shadows in dark mode** — creates stark, unnatural contrast
- Use a **darker shade of the element's colour** + lighter tint from background colour
- White shadows = common beginner error

---

### 6. BUTTONS

#### Foundational Psychology
- Users have been conditioned by physical buttons (doorbells, fax machines, radios) → buttons must look inherently interactive
- Interactivity is communicated through: shape, size, colour, shadow, and label
- **Rounded corners reduce cognitive effort** — sharp corners direct focus outward (away from the button); rounded corners direct focus inward (toward the label/action)
- Rounded corners enhance emphasis on button labels and actions

#### Minimum Touch Target Sizes
- Material Design minimum: **36px × 36px**
- Apple Human Interface Guidelines minimum: **40px × 40px**
- Mobile: **44px × 44px** or larger for comfortable thumb tapping
- Minimum spacing between adjacent buttons: **8–10px** to prevent accidental taps

#### Base Button Sizing Formula
- **Text size:** 16px (1rem) minimum — smaller impairs UX
- **Padding (height):** 12px top/bottom padding for base button
- **Width:** approximately 2× the height (as a starting guideline)
- Scale up/down proportionally for XS, SM, LG, XL variants

#### Button Hierarchy
- **Primary button:** Main call-to-action (filled, high contrast)
- **Secondary button:** Secondary actions (outlined or lower emphasis)
- **Tertiary button:** Minimal-impact actions (text button, ghost)
- **Rule:** All button tiers must share the same border-radius, typography, and shadow style — only fill/colour changes

#### Button Placement — F-Pattern and Z-Pattern
- Users scan pages in **F-pattern** (horizontal scan, then vertical left scan) or **Z-pattern** (diagonal across page)
- Place buttons where these natural scan paths land — misplaced buttons are missed regardless of colour/size
- **Forward/next actions:** Place on the RIGHT
- **Back/return actions:** Place on the LEFT
- **Exception:** To discourage destructive actions (account deletion), swap positions to slow user down

#### Button Colours
- Blue = information / neutral interactive
- Green = success / safe action
- Yellow = warning
- Red = danger / destructive / error

#### Button States (All 6 Must Be Designed)
1. **Default:** Unchanged, interactive, enabled
2. **Hover:** Visual feedback when cursor is over button
3. **Active/Pressed:** Visual change on click/tap
4. **Progress:** Loading animation — signals action is processing
5. **Focus:** Visible when button is highlighted via keyboard navigation
6. **Disabled:** Non-interactive, visually muted, may become enabled later

---

### 7. FORMS

#### Input Fields
- Size and layout must be comfortable for typing
- Accept the correct data type (text, email, number) to minimise errors
- Always include **placeholder text** with examples — reduces errors, speeds completion
- Input styles: outline (most common), with icons, with additional text
- Users prefer **rounded corner inputs** (dominant preference)
- Include relevant icons inside text fields to increase intuitiveness

#### Input States
- Default, focused, error, success states are all required
- Error messages must be specific: not "Error" but "Please enter a valid email address."
- Error messages must include **actionable correction steps** — not just alerts
- Success state: checkmark or green indicator confirming correct input

#### Input Width
- Match input width to expected content length (short for postcodes; full-width for messages)
- Narrower widths for constrained fields → creates more structured, organised appearance

#### Dropdowns
- Use when there are **more than 4 options** (fewer = use radio buttons instead)
- Chevron icon signals "this is a selection list"
- Include search within dropdown when list is long
- Include scrollbar to communicate multiple options available and prevent excessive list length
- Visual categories or dividers improve dropdown comprehension

#### Radio Buttons
- Use when there are **2 or more mutually exclusive options** and user must select exactly one
- Selecting one auto-deselects others

#### Checkboxes
- Use when **multiple options can be selected simultaneously**
- Each checkbox operates independently
- Mobile interaction area must exceed **48px** to accommodate fingertip size
- Desktop: smaller interaction areas acceptable (precise cursor control)

#### Toggle Buttons
- Two interconnected states (On/Off, Light/Dark, Active/Inactive)
- **Do NOT embed "ON" / "OFF" text inside the toggle graphic** — harder to read current state
- Use a distinct colour to indicate active state instead

#### Long Forms — Multi-Step Pattern
- When a form appears lengthy, users abandon it
- Solution: divide inputs into **logical categories across sequential steps** (wizard pattern)
- This reduces perceived complexity while collecting the same information

---

### 8. ICONS

#### Core Rules
- Brains process images **60,000× faster than text** — icons must be immediately recognisable
- Simple icons always outperform complex icons — complexity invites misinterpretation
- **Never mix icon styles** within a project (outline + glyph + 3D together = visual confusion)
- Gradient icons and glass icons: use sparingly — visually fatigue users when repeated frequently
- 3D icons: best suited to larger sizes only

#### Icon Styles
- **Outline icons:** Lightweight, clean, widely readable
- **Glyph (filled) icons:** Solid, high legibility at small sizes
- **Duo-tone icons:** Two complementary colours — visually rich, good for medium sizes
- **Gradient/Glass/3D icons:** Use sparingly; best for hero/feature sections

#### Icon Sizes (Standard Frames)
- 16×16px — smallest functional size
- 24×24px — standard UI size
- 32×32px — medium emphasis
- Always contain icons in a defined frame; resize the frame (not the icon) to scale proportionally

#### Icon Consistency Rules
- Maximum **3–4 colours** per icon
- Line widths must be **uniform across all icons** AND match the line weight of surrounding typography
- Rounded icons (like rounded buttons) are more user-friendly than sharp-cornered icons

#### Icon Functions (Three Types)
1. **Clarification icons:** Reinforce adjacent text; users who process the icon quickly skip the text; those who need text get visual support. Reduces misinterpretation.
2. **Interactive icons:** Represent an action users can perform; directly enable navigation
3. **Decorative icons:** Aesthetic purpose only; attract attention and create visual interest

#### Colour Treatment for Navigation Icons
- Do not use the same colour as navigation text for icons
- Apply a tint of the primary colour OR set opacity to 50–60% to achieve visual harmony without competing with text

---

### 9. IMAGES

#### Fundamental Facts
- Human brains process images **60,000× faster than text**
- ~90% of all information absorbed by humans is visual
- A person can form a general perception of a visual scene in **1/10 of a second**

#### Image Rules
- Every image needs a **clear focal point** that survives cropping
- **Rule of thumb:** "If an image is hard to interpret on a small screen, it's not the right choice"
- Always test images across multiple screen sizes and aspect ratios before publishing
- Blurry or low-quality images signal low product quality — compress AFTER optimising quality
- Compress all images before uploading (optimises load speed AND can improve perceived clarity)

#### Visual Uniformity
- Establish a style guide for images (mood board)
- All stock images must come from collections with consistent style, colour palette, and composition
- Inconsistent image styles fragment brand identity even if typography is consistent

#### Text Overlaid on Images
- Images rarely have enough contrast to support overlaid text alone
- Apply a **colour filter** (usually black or brand colour) at **50–80% opacity**
- This opacity range: preserves image details while ensuring text legibility
- Never overlay text on unfiltered photography without checking contrast ratios

#### "Allow Your Design to Breathe"
- Ensure sufficient space between text, images, and buttons
- Images in albums: maintain consistent spacing even when image sizes vary
- Align images precisely — irregular alignment reads as uncrafted

#### Open Images Principle
- Choose images with minimal visual clutter that leave room for other design elements
- Busy/complex images fight with UI elements; open/clean images collaborate with them

#### Rule of Thirds
- Divide image into 9 equal parts (3×3 grid)
- Place subjects at the intersections of the grid lines, not in the centre
- Off-centre subjects create more tension, energy, and visual interest than centred subjects

#### Emotional Image Selection
- Images conveying humanity (people) inspire confidence
- Nature scenes evoke calm
- Animals create playful atmosphere
- Avoid harsh, cold, clinical images — they produce negative emotional responses

---

### 10. ILLUSTRATIONS

#### When to Use Illustrations vs Photos
- Use illustrations when the product doesn't need to be seen precisely as it exists in reality
- Use photos when users need to see the real product (e-commerce, portfolios)
- Since 2021: 3D illustrations have grown in popularity — incorporate for visual currency

#### Illustration Rules
- **Don't scale down complex illustrations** into small spaces — details disappear; use simplified versions for small areas
- **Consistency is mandatory:** Same character, same colour palette, same style across all illustrations in a project (they tell a story together)
- Illustrations must follow the same colour tones as the design system

#### Where Illustrations Are Most Effective
1. **Hero sections:** Convey essence of content, set mood, introduce primary message
2. **Onboarding screens:** Guide users through features and benefits
3. **Empty states:** Prevent blank/confusing screens; offer visual direction on what to do
4. **Error pages:** Friendly, informative, or humorous response to problems — maintains positive UX during failures

---

### 11. NAVIGATION

#### Types of Navigation
- **Header Menu:** Primary navigation at top; links to key sections; include dropdown arrow to signal sub-categories
- **Sidebar Menu:** Left or right side; common in dashboards; aids section-to-section navigation
- **Footer Menu:** Bottom of page; links to resources, policies, contact, social media, newsletter

#### Mobile Navigation
- **Bottom tab bar:** Reserved for most critical app screens
- **Maximum 5 tabs** — beyond 5, individual tabs become too small to tap accurately
- Position interactive elements in thumb-friendly zones (bottom third of screen)

#### Breadcrumbs
- Essential when site has more than 2 levels of hierarchy
- Links must be distinctly highlighted to communicate page hierarchy
- Subtle breadcrumbs cause user disorientation

#### Navigation Best Practices
- Avoid cluttered navigation — overwhelms and confuses; prioritise primary pages only
- Navigation margins must be **minimum 16px** between links; smaller causes confusion
- Equal margins around all navbar content: use **24px gap** as standard
- Navigation bar maximum height: **80px** — taller headers consume valuable viewport space
- Active states must be visually clear — users must always know where they are
- Group sidebar links into logical categories for better hierarchy and scannability

---

## PART IV — UI/UX Components (Section-by-Section Rules)

### 1. NAVBARS

- Border radius: minimum **8px** — sharp-edged navbars feel unwelcoming
- Design consistency: buttons inside navbar must share the same border-radius as the bar itself
- Icons in navbar: use primary colour tint OR 50–60% opacity — never the same colour as nav text
- Navigation link gaps: **minimum 16px**; standard **24px** gap
- Navbar height: **maximum 80px**

**Navbar Styles:**
- Simple (transparent background)
- Light (clean, minimalist)
- Dark (sleek, styled)
- Blurred (glassmorphism effect — depth and intrigue)

---

### 2. HERO SECTIONS

#### Purpose
- First-time visitors scan (not read); the hero must capture and hold attention within seconds
- Apply F-Pattern and Z-Pattern reading flow to hero layout decisions

#### Hero Typography
- Title: **maximum 10 words** — concise, using H1 size
- Subtitle/description: H5 or H6 beneath the title
- Clear hierarchy between headline, subhead, and body text is mandatory

#### What Belongs in the Hero
- Brand identity: logo, brand name, slogan, company description, product images, or team photos
- **CTA button:** Primary focal point — directs users to core product/service
- Search (for sites with many categories/products — travel, booking, e-commerce)
- Subscription input (use responsibly — do not overwhelm with notifications)
- Social media links (typically at bottom)
- Download/Buy buttons (direct and fast conversion path)

#### Hero Design Rules
- **Do NOT fill the entire viewport** — reveal a portion of the next section to signal more content exists and encourage scrolling
- Background image must have sufficient resolution; add 50–80% black filter if text is overlaid
- Choose background images that evoke emotion (they are the user's first impression)

#### Hero Styles
- Background image (full width)
- Side image (half-width panel)
- Carousel (dynamic — fits more content without overwhelming)
- Background video (attention-grabbing; must have appropriate resolution)
- Blur/glassmorphism effect

---

### 3. FEATURES SECTIONS

#### Alignment Rules by Description Length
- **Short descriptions (≤2 lines):** Centre-align text — visually appealing and easy to read
- **Long descriptions (>2 lines):** Left-align text — user can follow comfortably through extended reading

#### Content Rules
- If descriptions are too long: condense while retaining core idea
- Do not use the full content width — leaves breathing room and improves aesthetics
- For short features (4–5 words): use **checkmarks instead of bullet points** — adds value, looks cleaner
- Icons in features: must align with the text they accompany — misaligned icons cause confusion

#### Feature Styles
- Minimalistic (text only)
- With icons (most common and effective)
- With logos (replaces icons when brand identity is the feature)
- With visual/image (photographic or illustrated)
- Linked (ensure links have appropriate contrast for readability)

---

### 4. CARDS

#### Visual Hierarchy Rules
- Critical content at **top of card** always
- Use typography weight + white space + contrast to emphasise priority information
- Visually separate content areas that require distinct treatment

#### Card Content Rules
- Keep content concise — never overcrowd with excessive information
- If additional text is needed, ensure it is well-structured within the card
- Use a **single clear link per card** — multiple links dilute purpose
- Primary and secondary buttons within cards must be visually distinguishable

#### Card Image Rules
- Maintain **consistent margins** on all sides of images within cards
- Image border-radius must be **smaller than the card's border-radius** (image lives inside the card, not equal to it)
- Raised images: include a few pixels of text margin to prevent optical misalignment

#### Card Consistency Rules
- Consistent framing across all cards in a grid — prevents content misalignment and visual disorder
- Inconsistent card framing = cluttered, disorganised appearance regardless of individual card quality
- Responsive: cards scale down to smaller screens and support vertical scroll (not horizontal swipe) on mobile

#### Card Types and Their Rules
- **Blog cards:** Consistent format with different images and font sizes; maintain cohesive structure across all posts
- **Booking cards:** Minimalistic — essential information only, clean and straightforward
- **Profile cards:** Avatar + name + social links only — detail goes on the profile page
- **Pricing cards:** Key elements are buy button, price, and features list — consistency in presentation is critical for comparison
- **Background cards:** Ensure sufficient contrast between background image and overlaid text
- **Cards with coloured shadows:** Adds depth and makes card stand out in a grid

---

### 5. CONTENT SECTIONS

#### Content-First Principle
- Consider content throughout every phase of the project (inception to completion), not just at visual design stage
- Typography must enhance content clarity; visual weight/hierarchy convey meaning

#### Line Height for Content Areas
- Body text at 16px: use **26px line height** in content sections
- Well-structured paragraphs are mandatory for content-rich sections

#### Text Size Limits
- Maximum **3 font sizes** per section for consistency
- Establish visual hierarchy using the typography scale; do not invent ad-hoc sizes

#### Specific Content Area Rules
- **Text + image sections:** Highlight CTAs with contrasting colours that pass accessibility standards
- **Articles:** Visual hierarchy via type scale; proper line-height throughout
- **Comments:** Post Comment button on the right — more intuitive user flow
- **Logos/trust marks:** Make them visible; prioritise feature titles over logo display

---

### 6. TEAM SECTIONS

- Use actual face photos — avoid abstract or artistic photos; faces convey authenticity
- Images must provide good contrast with background; add subtle shadows or filters if needed
- **Primary focus: names** (not position titles) — users want to know the people
- Profile photos: have a fallback design ready for cases where users don't have profile pictures

---

### 7. LOGO/TRUST AREAS

- Colourful logos: display exactly as brand guidelines specify
- Greyscale logos: acceptable when colourful doesn't fit; create by desaturating while preserving the concept
- Logo size: must be large enough to be visible — tiny logos defeat the purpose
- In review sections: use light grey rather than pure black for logos — avoids excessive contrast
- Trust sections should appear in: Hero, Jobs, Reviews, Footer (pre-footer area)

---

### 8. STATISTICS SECTIONS

- Use H1, H2, or H3 for numerical data — small text undermines the impact
- Include ample whitespace around numbers — too much data density loses clarity
- Icons in stats sections: **decorative only** — never replace number titles with icons
- Include text descriptions alongside numbers so users can read for context

---

### 9. CHARTS

#### Rules for Effective Data Visualisation
- **Readability first:** Charts must be understood effortlessly; no abstract/ornate styling
- **Do NOT use 3D effects on charts** — reserves visual complexity for virtual/AR applications; 3D distorts data perception
- **Grid lines:** Include to visually connect data points to their axis values
- **Legends:** Mandatory for charts with multiple data series — explains context and differentiation
- **Tooltips:** Valuable supplementary detail but never substitutes for essential chart elements; appear on hover only
- **Colour selection:** Use easily distinguishable colours with proper contrast; aids differentiation between data points
- **Never use Lorem Ipsum** or placeholder text in charts — design with real data to ensure logical structure
- For bar/column charts: include sort options (ascending/descending) to aid navigation
- Summary: prioritise legibility, precision, and practical significance

#### Table Design Rules
- **Left-align textual data** (matches natural left-to-right reading habit)
- **Right-align numeric data** (facilitates data comparison, improves readability of figures)
- **Centre-align icons and badges** (consistent sizing makes centring natural)
- **Optimal line height:** Never cram rows; overly tight spacing hinders reading
- Implement **pagination** for long tables — maintains clean, spacious appearance
- Add **interactive filters**, sort arrows in headers, and search inputs
- **Zebra stripes** (alternating row colours): use for dense data tables to help users track rows
- **Grid lines** (horizontal + vertical): use only for very complex data tables; overuse makes scanning harder

---

### 10. FAQ SECTIONS

#### Design Rules
- Adequate line height — FAQ sections are text-heavy; cramped type is fatiguing
- Ample whitespace between questions — enhances comprehension
- **Icons are mandatory** — signal to users that a section is expandable
- Optional: separator lines between questions for additional organisation
- Styles: Simple, Columns, Cards

---

### 11. CONTACT SECTIONS

- Provide multiple contact methods (phone, email, address, form) — different users prefer different channels
- **Contact form field count rule:** Do not overwhelm with too many fields — request only what is genuinely needed in initial contact
- Include placeholder text in all form fields
- For data-collecting forms: include Terms and Conditions checkbox

---

### 12. FOOTERS

- Footer is the "last resort" when users cannot find what they need elsewhere — make it comprehensive
- Present links in logical order with appropriate spacing
- Minimum link spacing: if spacing is too cramped, users miss important links
- Establish visual hierarchy within footer using different colours
- Always include: copyright year + copyright symbol (legal protection)
- Include social media links (despite concerns about users leaving — brand engagement benefits outweigh this)
- Consider: subscription CTA (users who reach the footer are highly engaged — prime moment for opt-in)
- Consider: localization settings (currency selector for e-commerce)

---

### 13. SIDEBARS (Dashboards)

- Default position: **left side** (aligns with left-to-right reading; right-to-left readers: use right side)
- Display main pages directly; nest secondary pages within expandable items
- Use multi-level dropdowns for complex sites with clear visual hierarchy indicators
- Sidebar must be **collapsible** (users need more content space on small screens)
- Icon treatment: slight tint of primary colour OR 60–70% opacity compared to text — icons must not overpower navigation text
- **Highlight active link** clearly — users must always know their location
- **Group related links** — creates hierarchy and improves scannability
- Integrate brand logo at top of sidebar as primary home link
- **Adequate padding** even for short menu items — enhances clickability area
- Maintain light and dark versions if the dashboard supports both themes

---

### 14. WIZARDS (Multi-Step Forms)

- Purpose: reduce errors by ensuring users follow a structured process
- **Fewer than 2 steps:** Wizard is unnecessary (too simple)
- **More than 10 steps:** Reconsider and streamline — overwhelming for users
- Visually number steps OR provide progress indicator so users understand where they are in the process
- Action buttons: use simple labels ("Previous" / "Next") — avoid descriptive titles
- **Gate progression:** Users can only advance after completing all mandatory inputs for the current step
- Include clear descriptions for each step so users understand what information is being requested

---

### 15. TESTIMONIALS AND REVIEWS

- **Star ratings:** 1–5 scale is universally understood; use one consistent star colour — multiple colours confuse
- Always have a fallback design for users without profile photos
- **Testimonials:** Use quotation marks (mandatory) + italic font style (optional but recommended)
- Include reviewer's company logo when available — significantly increases testimonial impact and official credibility
- Quotation marks create visual distinctiveness even when italic is not used

---

## PART V — Mobile Design

### Statistics
- ~54% of total web traffic originates from mobile devices
- More users access the internet via mobile/tablet than desktop globally

### Core Mobile Design Principles

1. **Thumb-friendly navigation:** Intuitive movement between screens; users should always know how to get where they need to go

2. **Touch target sizing:**
   - Minimum: **44×44px** for comfortable thumb tapping
   - Spacing between adjacent buttons: minimum **8–10px** to prevent accidental taps

3. **Thumb-friendly zones:** Design screen layouts with interactive elements in the natural thumb reach area (bottom portion of screen for single-hand use)

4. **Information clarity:** Never overwhelm with information; clean, clutter-free interfaces are not optional on mobile — they are survival requirements

5. **Readability on small screens:** Use larger text than on desktop; ensure content is consumable without zooming

6. **Touch vs click controls:** Mobile-specific touch controls must be used; do not repurpose web controls designed for mouse precision

7. **Simplified forms:** Minimise typing requirements; reduce form fields; leverage auto-fill where possible

8. **Cross-platform consistency:** If a service exists on both web and mobile, maintain consistent look and feel while adapting content for screen size

---

## PART VI — Page-by-Page Structural Recommendations

### About Us Page Structure
1. Hero: navbar + page title + brief description + CTA button
2. Logo area: partner/client logos (builds credibility)
3. Features: distinctive product/service attributes
4. Team: real face photos of team members
5. Stats: confidence-building numbers (H1/H2 size)
6. Projects/Portfolio: notable work
7. Footer: links + copyright

### Profile Page Structure
1. Hero: avatar + name + brief bio + follow/friend request button
2. Content: author's work (blog posts, images, products)
3. Customer reviews/testimonials
4. Contact form
5. Footer: social media links

### Blog Page Structure
1. Hero: logo/brand name + navigation + category links + search (**no auto-rotating carousel** — see design-system and page-builder mandatory ban; use static hero or user-controlled tabs instead)
2. Blog post list: featured/recent posts first; clear typography hierarchy; subscribe CTA
3. Content: include publication dates; implement pagination or infinite scroll
4. "Other Articles" section at end of each post
5. Footer: About Us, Contact, Privacy Policy, Terms of Use + newsletter input

### Product Page Structure
1. Hero: product name + price + stock availability + brief description
2. Features: delivery options, refund policy, tags/categories
3. Customer reviews and ratings
4. Related products
5. Pre-footer: subscribe for promotions/updates
6. Footer: language and currency selector

### Application (SaaS) Page Structure
1. Hero: navigation links + prominent CTA ("Get Started" / "Try for Free")
2. Features: descriptive headings + icons/images per feature
3. Integrations: platform logos + links for detail
4. Pricing: side-by-side plans + CTA per plan
5. Testimonials: static grid or user-controlled tabs (**no auto-rotating carousel** — banned by design-system and page-builder)
6. Footer: copyright + Privacy Policy + Terms + Contact

### Sign Up Page
- Two options: Classic (email/password + Terms checkbox) and Social (OAuth buttons)
- Real-time validation on email and password fields
- Clear link: "Already have an account? Sign In"

### Sign In Page
- Classic: email + password + "Remember Me" checkbox + prominent Sign In button
- Social: same as Sign Up social options
- Always include: "Don't have an account? Sign Up" link

### Legal Agreements Page
- Sidebar navigation with anchor links to each section (Cookies, License, etc.)
- Dynamic scrolling: clicking a section title scrolls to content AND highlights menu item
- Clear, readable typography with strong hierarchy

### Shopping Cart Page
- List items with product images, names, quantities, prices, subtotals
- Allow quantity changes with buttons/inputs
- Cart summary: total including taxes and shipping
- "Continue Shopping" button — reduces abandonment
- Product recommendations based on cart contents
- Footer: customer support contact + Privacy Policy + Terms

### Checkout Page
- Auto-fill and address suggestions to expedite completion
- Order summary visible during checkout
- "Proceed to Payment" button must be visually distinct and stand out

---

## PART VII — Outstanding Website Analysis (Design Pattern Reference)

### Stripe Design Patterns
- Dynamic gradient hero (creates depth and modernity)
- Mockup devices in hero (helps users visualise product in real-world context)
- Real data in stats sections (immediate credibility and value)
- Interactive globe for geographical data
- Carousel with progress loading bar (reduces impatience during transitions)
- Animated + duotone icons (dynamic, engaging, communicates information efficiently)
- Realistic two-layer shadows (creates genuine 3D depth perception)

### Vercel Design Patterns
- Bold typography + gradient text effects (strong visual impact + modern identity)
- Blur effect for visual hierarchy (foreground elements pop; guides eye to key content)
- Minimalist icons (clear, efficient information conveyance)
- Stats + interactive globe (compelling data presentation)
- Light/Dark mode support (accessibility + user preference customisation)

### Wope Design Patterns
- Title focus line in hero (visual path guiding gaze to headline)
- Animated primary button with dynamic border (interactive quality, encourages engagement)
- Paths with gradients creating 3D depth (sophistication without images)
- Cards: coloured elements + strategic shadows (hierarchy, scannable, depth)

### Diagram Design Patterns
- Animation in hero with centred logo focal point
- Blur effect in dark mode (sleek + modern + improves readability)
- Cards with hover-state interactive reveals (element changes on hover = delight and engagement)
- Heavy shadow use in dark mode (creates essential depth and contrast in low-light design systems)

---

## COGNITIVE AND PERCEPTUAL PRINCIPLES (Synthesised from the Book)

### Visual Processing Speed
- Humans process visual information in 1/10 of a second
- Images processed 60,000× faster than text
- 90% of absorbed information is visual
- Implication: icons, images, and visual hierarchy convey meaning before text is read

### Eye Movement Patterns
**F-Pattern:** Users scan horizontally across the top, then vertically down the left side, then across again (creating an F shape). Most critical information must be in the top-left to top-right area, with secondary information along the left margin.

**Z-Pattern:** Users scan diagonally across the page from top-left → top-right → bottom-left → bottom-right. Common on pages with minimal text and dominant visuals. Place primary CTA at end of the Z path (bottom-right).

### Colour Processing and Judgement
- First 90 seconds: users form quality judgements based primarily on colour
- Up to 90% of this snap judgement is colour-based
- Implication: colour is not decoration — it is the primary signal of quality and trustworthiness

### Rounded Corners Psychology
- Rectangular shapes with sharp corners direct attention outward (away from the element)
- Rectangles with rounded corners direct attention inward (toward the content)
- Rounded corners reduce cognitive effort required for visual processing
- Result: rounded corners increase focus on CTAs and labels; sharp corners reduce it

### Shadows and Depth Perception
- Humans are conditioned to perceive 3D through light/shadow since birth
- Flat designs with zero shadows lose realism and depth perception
- Proper shadow use (two layers: core + cast) creates genuine 3D feel
- Shadow position (never above an element) must match natural sunlight direction or users experience cognitive dissonance

### Spacing and Breathing Room
- Ample white space between elements = users can pause and process between sections
- Tight spacing between navigation links (under 16px) = user confusion
- Text blocks need space between them for comprehension
- White space is not empty space — it is structured pause for cognitive recovery

### Hierarchy and Scanning Behaviour
- Users scan, they do not read
- Visual hierarchy communicates importance before content is consumed
- Typography scale + white space + contrast must create unambiguous reading order
- Maximum 3 font sizes in any section — more creates noise, not hierarchy

---

## QUICK-REFERENCE RULES SUMMARY

### Grid
- 12 columns (desktop), 8pt grid (mobile), gutters 16px minimum, margins 16px mobile / 160–180pt desktop
- All element dimensions: multiples of 8

### Typography
- Body text: 16px / 26px line height
- Line height formula: font-size × 1.6
- Maximum 3 font sizes per section
- Left-align body text; centre only for 2 lines or fewer
- Never use script typefaces as primary text

### Colour
- 60-30-10 distribution rule
- Never pure black (#000000) — use dark grey
- Never white shadows in dark mode
- Semantic colours: Blue=info, Green=success, Yellow=warning, Red=danger

### Buttons
- Minimum touch target: 44×44px mobile
- Base padding: 12px; base font: 16px
- Rounded corners always (≥8px border radius)
- Forward actions: right. Back actions: left.

### Shadows
- Two layers: core shadow (narrow, dark) + cast shadow (wide, light)
- Shadow always below or beside the element — never above
- Shadow size proportional to element size

### Images
- Rule of Thirds: subject at intersection, not centre
- Text overlay: 50–80% opacity black filter required
- Compress before uploading

### Navigation
- Header max height: 80px
- Minimum link gap: 16px; standard gap: 24px
- Mobile tabs: maximum 5

### Forms
- Dropdown: use when >4 options
- Radio buttons: mutually exclusive single choice
- Checkboxes: multiple simultaneous selections
- Mobile checkbox area: minimum 48px

---

*Extraction complete. All 8 parts covered. Source: Elisa Paduraru / Creative Tim, 2024.*
