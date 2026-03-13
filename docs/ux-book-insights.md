# UX/UI Design Insights: From Zero to UI/UX Hero
### Extracted from Conrad Bohnke's *From Zero to UI/UX Hero* (2024)
**Source:** Full book OCR extraction — 138 pages
**For:** Building better client websites and apps

---

## 1. Core UX Principles

### What UX Actually Is
UX design considers every aspect of the user's interaction with a product or service — from the physical feel to the simplicity of a checkout process. The goal is to make things easy, efficient, relevant, and enjoyable. Don Norman: *"User experience encompasses all aspects of the end-user's interaction with the company, its services, and its products."*

Dr Ralf Speth (CEO, Jaguar Land Rover): *"If you think good design is expensive, you should look at the cost of bad design."*

### The KISS Principle (Keep It Simple, Stupid)
The guiding star of UX. Every design decision should reduce complexity, not add it. Users are here to accomplish goals — make that happen as quickly as possible.

### Reduce Cognitive Load
Three types of cognitive load (Sweller's Cognitive Load Theory):
- **Intrinsic Load** — the inherent complexity of the content itself
- **Extraneous Load** — complexity caused by poor presentation (bad design increases this)
- **Germane Load** — productive mental effort that builds useful mental schemas (good design increases this)

Your mission: reduce intrinsic and extraneous load, boost germane load. Strategies:
- Simplify: remove anything that doesn't serve the user's goal
- **Chunking**: break information into small, digestible pieces
- **Signposting**: make the next step obvious at all times
- Adhere to time-tested conventions: familiar symbols, well-known patterns
- **Declutter**: minimal relevant graphics, organised symmetry
- **Help users decide**: group similar options, use collapsible menus to hide non-essential options
- Use imagery and examples to explain options

### The F-Pattern Reading Behaviour
Nielsen Norman Group research: users scan online pages in an F-pattern — they read the headline, glance at a few points beneath it, then move to the first subheading, with scanning becoming less focused as they go down. Users read only about 20% of text on a webpage.

**Implication:** Place the most important words and messages at the start of lines and paragraphs. Key information must stand out. Structure content for scannability.

### Inverted Pyramid Writing
Borrow from journalism: deliver the most critical information first, then important details, then background/context. Even if users don't read the full text, they still get the core message.

### Jakob's Law
Users transfer expectations built around familiar products to new ones they encounter. People like consistency and expect things to work as they expect.

**Takeaways:**
- Build on familiar mental models — let users focus on their tasks, not on learning your system
- Strive for consistency across your product
- If you must change things, change gently — give users the option to continue using the old way while they adapt (e.g., YouTube's Timeline rollout)

### Mental Models
Users form beliefs about how a system works based on past experiences with similar systems. Violating a user's mental model causes frustration.

**Rules:**
- Don't reinvent the wheel without solid reason
- Introduce new interaction patterns sparingly
- Conduct user research early (interviews, card sorting, usability tests) to understand existing mental models
- Study competitors to understand what users are already comfortable with

### Don Norman's Action Cycle
Two phases in every user interaction:

**Execution Phase:**
1. Forming the Goal (what does the user want to achieve?)
2. Forming the Intention (deciding on a course of action)
3. Specifying an Action (working out the exact steps)
4. Executing the Action (doing it)

**Evaluation Phase:**
5. Perceiving the System State (looking for feedback)
6. Interpreting the System State (understanding the feedback)
7. Evaluating the Outcome (did it work?)

The cycle is iterative. At every step, ask: are you helping the user, or blocking them?

---

## 2. Visual Hierarchy & Layout

### The 8px Design System (Google Material Design)
Use multiples of 8px for all spacing. This creates consistent harmony throughout your design.

**Spacing guidelines:**
- `8px` — closely related elements (e.g., icon next to nav text)
- `12px` — elements within CTAs or input fields (e.g., icon + text)
- `16px` — content that belongs closely together (e.g., two CTA buttons, title + subtitle)
- `32px` — distinct elements (e.g., title + body text, or nav items)
- `64px` — statistics or secondary content beneath main content
- `64px–160px` — between sections on a page

Between a title and body text, use 16px for a clear visual hierarchy. Be consistent: if you use 16px between body text and a title, do it throughout the entire design.

### The 60-30-10 Rule for Colour
- **60%** — dominant/background colour
- **30%** — secondary colour (provides contrast, good for text backgrounds)
- **10%** — accent colour (for CTAs, buttons, highlights)

Example: Deep brown (60%), light beige (30%), zesty orange for CTAs (10%).

### Grid Types and When to Use Them
- **Block grid** (single column): best for articles, blog posts, About pages — aids linear reading
- **Column grid**: for pricing tables, product listings, organised multi-element layouts. 12 columns on desktop, 8 on tablet, 4 on mobile. Gutters typically 20px
- **Modular grid**: for galleries, e-commerce products, app home screens — rows AND columns
- **Hierarchical (freestyle) grid**: for creative/portfolio sites — elements arranged dynamically, sized for emphasis

Standard column widths: 60–80px. Side margins: use multiples of 8px, adjusted per device.

### Visual Hierarchy Principles
- **Rule of Thirds**: Divide your canvas into a 3×3 grid. Place the most important elements at the intersections of the lines
- **Golden Ratio**: Width-to-height ratio of 1.618 (phi). Creates nested rectangles that feel naturally balanced
- **Symmetrical layout**: elements evenly distributed on either side of a central axis
- **Asymmetrical layout**: elements balanced by visual weight (size, colour, texture)
- Font size, weight, and style establish heading hierarchy: H1 → H2 → H3 → body

### Rudolf Arnheim's Structural Net
Every canvas has an inherent structure before any design elements are placed. Visual forces (tension lines, directional flow) guide viewer perception. Design elements must work within and with this structure.

**In practice:** Balance elements proportionally. Use whitespace, typography, and alignment to create rhythm and flow. Use contrast and emphasis to highlight crucial information. A harmonious design requires all elements to be "woven into a structural net."

### Shape of Element
Diagonals, lines, and axes within design elements guide the viewer's eye along a path. A diagonal banner from top-left to bottom-right naturally pulls the eye from logo to CTA. Use this intentionally to direct attention.

### Subject Matter (Visual Cues)
Use visual cues — extended hands, arrows, gazes, torchlight in photography — to direct the viewer's attention toward key information. A person in a hero image looking toward your CTA button will pull the user's eye there.

### Visual Tension
Strategic disruption of viewer expectations creates tension that captures attention and makes designs memorable. Three composition directions:
- **Horizontal**: calm, stable (e.g., meditation app)
- **Vertical**: bold, alert (e.g., leadership summit brochure)
- **Diagonal**: movement, action (e.g., tech startup, action-oriented brands)

---

## 3. Typography & Readability

### The Three Typeface Categories
- **Serif** (Times New Roman, Georgia, Baskerville, Garamond): traditional, formal, print materials, legal/academic sites, luxury brands
- **Sans-Serif** (Helvetica, Roboto, DM Sans, Open Sans, Lato, Inter, Poppins): modern, clean, digital materials, websites, apps, social media
- **Decorative/Script** (Brush Script, Lobster): branding, headlines only — never body copy

### Typeface Pairing Rules
- Use 1–3 typefaces maximum
- Choose pairs with clear contrast in style and visual weight
- One bold sans-serif for headers, light serif or sans-serif for body = works like tea and biscuits

**Proven pairings:**
1. Space Grotesk + Space Mono
2. Poppins + Roboto
3. Inter alone (works as both heading and body)
4. Inter + Lato
5. Arquivo + Inter

### The Type Scale System
- Base body text: **16px** (standard, legible)
- Line height: **1.2** (comfortable)
- Major Third scale (1.25 multiplier) between heading levels works well
- Use Google Material Type System as a starting point for beginners

**Heading sizes (H1–H6, body, captions):**
- Body text: 16px
- Subtitle/secondary: 14px
- Caption: 12px
- Overline: 10px

### Key Typography Terms
- **Kerning**: space between individual letters — affects readability
- **Leading** (line spacing): vertical space between lines — balance with font size
- **Typeface**: the family (e.g., Times New Roman)
- **Font**: a specific style within the family (e.g., Times New Roman Bold)

### Practical Rules
- Serif fonts = traditional, formal, luxury
- Sans-serif fonts = digital-first, modern, approachable
- Decorative fonts = headlines/callouts only
- Match typeface personality to brand personality (playful brand → playful font)
- Never use fonts so small they require squinting. Minimum readable body text: 16px

---

## 4. Colour Psychology

### Colour Associations (Universal Tendencies)
- **Red**: urgency, energy, hunger, passion (McDonald's, Coca-Cola). Also stress — avoid on exam-related or healthcare-calm contexts
- **Blue**: trust, professionalism, calm (Facebook, IBM, Ford, LinkedIn). Healthcare brands love it
- **Green**: growth, health, eco-consciousness, well-being
- **Purple**: luxury, wisdom, creativity — but subjective, can split audiences
- **Orange**: energy, enthusiasm, warmth — excellent for CTAs
- **Gold/Black/Brown + Cream**: luxury, opulence (Gucci, Louis Vuitton)
- **Vibrant multi-colour** (Google palette): innovation, cutting-edge

### Colour is Context-Dependent
What works for one brand/culture may not work for another. Cultural influences, personal experiences, and even the weather affect colour perception. Know your audience before choosing a palette.

### Colour Contrast (WCAG Requirement)
- Minimum contrast ratio: **4.5:1** between text and background (WCAG AA standard)
- Large text (18pt+): minimum **3:1**
- Test on different devices and in different lighting conditions
- Tools: Adobe Colour, Contrast Analyzer, realtimecolors.com

### Colour Models
- **HEX**: #RRGGBB — used for web, precise and reproducible
- **RGB**: Red/Green/Blue 0–255 values
- **HSL**: Hue/Saturation/Lightness — best for making subtle adjustments without changing core colour identity

### The 60-30-10 Rule
(See Visual Hierarchy section above — 60% dominant, 30% secondary, 10% accent)

### Tints, Tones, Shades
- **Tint**: hue + white → calmer, lighter
- **Tone**: hue + grey → dulled, sophisticated
- **Shade**: hue + black → deeper, more intense

---

## 5. Navigation & Information Architecture

### What Information Architecture (IA) Is
IA is the discipline of organising, structuring, and labelling content so users can find information and accomplish tasks. It shapes content strategy, UI design, and interaction design.

Three core systems (Rosenfeld & Morville):
- **Representation Systems**: how information is depicted
- **Navigational Mechanisms**: how users explore information
- **Discovery Systems**: how users search for information

The "information ecology" triangle: **Context** (business goals, constraints) + **Content** (types, volume, structure) + **Users** (tasks, behaviours, needs).

### Navigation Design Principles
- Navigation must communicate: where am I, where can I go, how do I get back?
- Navigation is more than a list of links — it is a critical part of the user experience
- A user who can navigate easily is more likely to stay and convert
- Test and refine navigation with real users as part of the iterative design process

### Law of Proximity
Items placed close together are perceived as a group. Items placed apart are perceived as distinct.

**In nav bar design:**
- Group all menu link items together
- Group the language switcher and primary CTA together (they're both action items) but separate from nav links
- Create clear visual distinction between navigation sections and action-oriented elements

### Card Sorting for IA
A participatory design technique — give users index cards (physical or digital), ask them to organise content into categories that make sense to them. Reveals the user's mental model of your content. Use the results to build navigation that matches how users think.

### Content Auditing
Before designing navigation, systematically review existing content — identify gaps, redundancies, and inconsistencies. Decide what to keep, revise, or remove.

### Competitive Analysis Frameworks
- **SWOT Analysis** (Strengths, Weaknesses, Opportunities, Threats): quick overview of product issues and course of action
- **BCG Growth-Share Matrix**: evaluates market position (Dogs, Cash Cows, Stars, Question Marks)
- **Porter's Five Forces**: competition analysis (buyers, suppliers, substitutes, rivalry, new entrants)
- **Perceptual Mapping**: visualises customer perception of your product vs competitors

---

## 6. Conversion & CTAs

### Button Anatomy
A button contains: Background, Border, Text, Icon (optional), Shadow (optional).

**Button types:**
- **Flat/Primary**: solid colour, no shadow — clean, minimalistic
- **Ghost**: transparent background + border — adds button without visual weight
- **Text button**: text only, no background — for tertiary actions or links
- **Floating Action Button (FAB)**: mobile apps only, circular, primary single action

### Button Text That Converts
- Keep text short, clear, and action-oriented
- Use verbs that match user desire: "Discover Now" over "Learn More"; "Find Out More" over "Click Here"
- The purpose of the button must be crystal clear
- Use the user's language and speak to their needs/desires

### Button Design Rules
- Use brand accent colour for primary CTA buttons
- Corner radius signals brand personality: **rounded (32–64px)** = playful/friendly; **sharp corners** = professional/formal/authoritative
- Spacing rule: **1x-2x rule** — 8px top/bottom, 16px left/right padding inside button
- **Hierarchy**: primary (accent colour filled) → secondary (ghost) → tertiary (text link)
- Only one primary CTA per section/page to avoid decision paralysis

### Button States (All Required)
1. **Default/Normal**: the resting state
2. **Hover** (web only): cursor rolls over — indicates interactivity
3. **Focus**: keyboard navigation (tab) — essential for accessibility
4. **Active/Pressed**: click/tap feedback
5. **Disabled**: unavailable action — always pair with tooltip explaining why
6. **Loading/Processing**: action taken, system is working — show progress feedback

### Hick's Law (Decision Speed)
The time to make a decision increases with the number and complexity of choices.

**Application:**
- **Minimise choices** — especially when response time matters
- **Highlight recommended options** — reduce the burden of choice
- Use **progressive onboarding** — introduce choices gradually, not all at once
- Keep it simple but don't oversimplify to abstraction
- Limit navigation items, form fields, and pricing options to essentials

### Von Restorff Effect (Make CTAs Stand Out)
The human brain remembers distinctive, unique items more easily than those that blend in.

**Application for CTAs:**
- Use a contrasting colour for primary CTA buttons (e.g., orange button on a blue-dominant site)
- Make the primary CTA larger than surrounding elements
- Use distinct shapes or bold typography for critical information
- Apply sparingly — too many "standout" elements cancel each other out and cause chaos

### Endowed Progress Effect (Increase Completion)
People are more motivated to complete tasks when they feel they've already made progress (even artificial progress).

**Applications:**
- Progress bars with an "artificial head start"
- Profile completion meters (LinkedIn-style)
- Gamification with bonus starting points
- Onboarding checklists with one item pre-checked
- Tutorial flows that start with easy wins

### Scarcity (Urgency)
"Only 2 items left" makes products more appealing. Limited availability nudges faster decisions. **Warning**: false scarcity backfires — use only when genuine.

### Social Proof
Testimonials, ratings, endorsements, user counts, case studies. If others are doing it, new users follow. Integrate throughout the page — not just on a single testimonials section.

### Authority
Credibility signals — certifications, trust badges, institutional endorsements, media logos, industry affiliations — reduce user hesitation. Place near conversion points.

### Reciprocity
Give value first (free tool, checklist, guide, insight). Users who receive value are more willing to reciprocate (sign up, share, purchase).

### Commitment and Consistency
Small commitments lead to larger ones. Get users to make a tiny positive action (tick a box, save a preference, answer a question) and they're more likely to continue engaging. Start with low-friction asks.

### Flow Theory (Keep Users Engaged)
Flow = the state of being so involved with a task that time disappears. Requires a balance between skill and challenge.

**"Flow is the space between boredom and anxiety."**

- Too easy → boredom → abandonment
- Too hard → anxiety/frustration → abandonment
- Sweet spot → deep engagement → conversion

**Design strategies for flow:**
1. **Clear goals**: every page, button, and action should have an obvious purpose
2. **Immediate feedback**: confirm every user action (Added to Cart, Form Submitted, etc.)
3. **Balance challenge and skill**: use progressive disclosure for complex interfaces
4. **Minimise distractions**: no intrusive pop-ups, excessive animation, or auto-playing media
5. **Give users control**: interactive tools, preference settings, self-paced journeys
6. **Seamless transitions**: each step should lead logically to the next

---

## 7. Trust Signals

### Aesthetic-Usability Effect
Users perceive aesthetically pleasing designs as more usable — even if both versions have identical functionality. Beauty creates positive emotions that make users more forgiving of minor usability issues.

**Key takeaways:**
1. A beautiful design leads users to believe the design works better
2. Users tolerate minor usability issues when the design looks good
3. BUT: a beautiful design can mask serious usability problems — don't let aesthetics hide broken UX
4. Balance visual appeal and functionality — prioritising appearance over function hinders long-term satisfaction

### The Prospect-Refuge Theory (Digital Safety)
Humans prefer environments that offer both discovery (prospect) and safety (refuge). Applied to digital design:

- **Prospect**: clear, explorable layout. Intuitive navigation. Open, visually uncluttered design
- **Refuge**: personal account pages, privacy settings, control options, clear data security indicators

**Applications:**
- Provide clear navigation paths (prospect)
- Offer privacy controls and customisation (refuge)
- Balance public spaces (forums, product pages) with private spaces (account, settings)
- In e-commerce: users need to feel confident about data security (refuge) while enjoying the shopping experience (prospect)
- Ensure accessibility (extends prospect while creating refuge for users with diverse needs)

### Persuasive Design Principles (Ethical Trust-Building)
These are from Cialdini's influence framework applied to UX:

1. **Reciprocity**: give before you ask
2. **Commitment & Consistency**: small actions lead to larger ones
3. **Social Proof**: testimonials, ratings, endorsements, user counts
4. **Scarcity**: limited availability creates urgency (use honestly)
5. **Authority**: certifications, expert endorsements, trust badges
6. Note: persuasive design is about guiding users toward beneficial actions — not manipulation

---

## 8. Mobile & Responsive Design

### Grid Columns by Device
- Desktop: **12 columns**
- Tablet: **8 columns**
- Mobile: **4 columns**

Column width: 60–80px standard. Gutters: 20px. Side margins: multiples of 8px.

### Icon Sizes
- Standard: **24px** (Google's preferred size, divisible by 8)
- Small UI element (chevron/dropdown): **16px**
- Large decorative icons (testimonials, hero sections): **32px–64px**
- Always use sizes divisible by 8 or at least 4 for consistent alignment
- Use vector (SVG) icons — scale without quality loss

### Touch Target Guidelines (Fitts's Law)
The time to tap/click a target is a function of its size and distance. Make targets large and close to where fingers already are.

- Primary CTAs and nav items: make them generously large
- Add to Cart buttons: prominently sized and easy to tap
- Avoid long drop-down menus (increase movement time)
- Right-click/contextual menus and short drop-downs: minimise travel distance

### Typography for Mobile
- Responsive type classes: scale from mobile to desktop
- Base body: 16px minimum on mobile
- Headings: scale up on wider viewports
- Line height 1.2+ for comfortable mobile reading

### White Space on Mobile
White space must scale appropriately. On mobile, slightly tighter spacing (4–8px base) but never so tight content feels cramped. Use 8px system — all spacing stays on the grid.

---

## 9. User Testing & Validation Methods

### Research Methods (The "Chef's Menu")
1. **In-depth interviews**: one-on-one, open-ended questions, reveal motivations and pain points
2. **Observational studies**: watch users use your product in their natural context (digital David Attenborough)
3. **Surveys**: gather quantitative data from many users, efficient for trend identification, but missing context
4. **Focus groups**: group discussion — rich, but watch for groupthink and dominant personalities
5. **Card sorting**: users organise content into categories that make sense to them — reveals IA mental models
6. **Usability testing**: watch users complete tasks — identifies friction points and usability issues
7. **User Acceptance Testing (UAT)**: end-users validate the product in real-world scenarios before launch

### Additional Testing Methods
- **A/B Testing**: two versions of a design element shown to different user halves — data-driven comparison
- **Heatmap Analysis**: shows where users click, scroll, and look
- **First-click Testing**: tests whether users can correctly identify where to start a task
- **Eye-tracking Studies**: maps the physical visual path across a page

Testing is not a one-time event — it's continuous and iterative.

### User Personas
A persona is a data-backed representation of a user segment.

**How to build one:**
1. Analyse research findings — look for patterns, trends, recurring themes
2. Identify core traits — demographics, goals, motivations, frustrations, tech-savviness
3. Craft their backstory — life context, work, hobbies, how they interact with your product
4. Share with the team — everyone must understand and use the same personas
5. Avoid stereotypes — base every trait on actual research data

**Example persona:** Max, 35-year-old software engineer, tech-savvy but time-poor, looking for a hiking app to plan weekend getaways.

### Wireframe Types (Use the Right Fidelity)
- **Low-fidelity**: quick, hand-drawn, layout + function only — rapid iteration, early feedback
- **Mid-fidelity**: clearer structure, still leaves room for change
- **High-fidelity**: detailed, includes interactions and visual specs — used for usability testing and stakeholder sign-off

Wireframes are shared with designers, developers, researchers, and investors to gain consensus before building.

### The Iterative Design Process
Sketch → prototype → test → refine → repeat. Each cycle moves closer to meeting real user needs. Don't aim for perfection on the first pass.

Low-fidelity prototypes: fast feedback on functionality.
High-fidelity prototypes: accurate reflection of the final experience.

---

## 10. Practical Checklists & Frameworks

### UI Design Quick Reference — The Magic Numbers
- **8** — the base unit for all spacing (use multiples of 8)
- **24px** — standard icon size
- **16px** — base body text size
- **1.2** — line height ratio
- **4.5:1** — minimum colour contrast ratio (WCAG AA)
- **12/8/4** — columns on desktop/tablet/mobile
- **20px** — standard gutter width
- **60/30/10** — colour distribution rule

### Typography Hierarchy (Material Design Defaults)
| Level | Size |
|-------|------|
| H1 | ~2.5× body (≈40px on 16px base) |
| H2 | ~2.0× body |
| H3 | ~1.6× body |
| H4–H6 | progressively smaller |
| Body | 16px |
| Subtitle | 14px |
| Caption | 12px |
| Overline | 10px |

### Icon Usage Checklist
- [ ] Size divisible by 8 (16px, 24px, 32px, 64px)
- [ ] Consistent icon style throughout (all filled OR all outlined — never mixed)
- [ ] Icons at least 16px (never smaller)
- [ ] Complex icons paired with text labels
- [ ] Icons relevant to content (no hat on a fish)
- [ ] High-quality SVG vectors (scale without loss)
- [ ] Not too many icons on a single screen

### Button Design Checklist
- [ ] Primary button uses brand accent colour
- [ ] Button padding: 8px vertical, 16px horizontal (1x-2x rule)
- [ ] Corner radius matches brand personality
- [ ] Text is action-oriented and concise
- [ ] All 6 button states designed (default, hover, focus, active, disabled, loading)
- [ ] Clear hierarchy: primary → ghost secondary → text tertiary
- [ ] Only one primary CTA per section

### White Space Checklist
- [ ] 8px: closely related elements
- [ ] 12px: within CTAs/inputs
- [ ] 16px: content that belongs together
- [ ] 32px: distinct elements
- [ ] 64px: secondary content beneath main
- [ ] 64–160px: between page sections
- [ ] No cramped sections; no over-padded empty sections

### UX Laws Quick Reference
| Law | Core Principle | Design Action |
|-----|---------------|---------------|
| **Miller's Law** | Working memory holds ~7 items | Limit nav items, form fields, choices to ≤7 |
| **Jakob's Law** | Users expect your site to work like others | Follow familiar conventions and patterns |
| **Hick's Law** | More choices = slower decisions | Reduce choices; highlight recommended option |
| **Law of Proximity** | Close = related | Group related items; space out unrelated ones |
| **Fitts's Law** | Larger/closer targets = faster interaction | Make CTAs big and near the action |
| **Weber's Law** | Change must be noticeable but not jarring | Make design changes gradually |
| **Aesthetic-Usability Effect** | Beautiful = perceived as more usable | Invest in visual quality |
| **Endowed Progress Effect** | Head start = more completion | Give artificial progress/pre-fill where possible |
| **Von Restorff Effect** | Distinctive = memorable | Use contrast to make CTAs and key info stand out |
| **Zeigarnik Effect** | Incomplete tasks are remembered | Use progress bars, incomplete state indicators, partial reveals |

### Navigation Design Checklist
- [ ] Users always know: where am I? where can I go? how do I get back?
- [ ] Related items grouped together (Law of Proximity)
- [ ] Card sorting performed with real users
- [ ] Navigation tested with real users before launch
- [ ] Content audit completed (gaps and redundancies removed)
- [ ] Maximum 7 top-level nav items (Miller's Law)
- [ ] Primary CTA visually distinct from nav links
- [ ] Mobile: hamburger menu with accessible keyboard navigation

### Persuasive Design Checklist (Ethical)
- [ ] Reciprocity: offer free value before asking for action
- [ ] Social proof: testimonials, ratings, user counts near CTAs
- [ ] Authority: trust badges, certifications near conversion points
- [ ] Scarcity: limited availability messaging (only when genuine)
- [ ] Progress indicators: show users how far they've come
- [ ] Commitment steps: micro-yes moments before major asks

### UX Writing Checklist
- [ ] Most important information comes first (Inverted Pyramid)
- [ ] Key messages placed at start of lines (F-pattern)
- [ ] Brevity: can 20% of the text carry the full message?
- [ ] Headlines that grab attention AND signal what follows
- [ ] Error messages: explain what went wrong and how to fix it
- [ ] Button labels: action verbs that speak to user needs
- [ ] Minimal jargon (unless specialised audience)
- [ ] Clarity over cleverness — always
- [ ] Tone matches brand and audience

### The Pre-Build Process (Full Workflow)
1. **Define goals** — what must this site achieve for the business?
2. **User research** — who are the users? What do they need?
3. **Competitive analysis** — SWOT, Perceptual Mapping, Porter's Five Forces
4. **Create personas** — data-backed, specific, shared with whole team
5. **Card sorting** — build IA from users' mental models
6. **Moodboard** (8–15 images) — visual direction, colour palette, aesthetic
7. **Wireframes** — low → mid → high fidelity
8. **Prototype** — interactive, realistic
9. **User testing** — usability testing, A/B tests, UAT
10. **Build** — design system, consistent components
11. **Test again** — heatmaps, analytics, ongoing iteration

### The Moodboard Rules
- 8–15 images (graphic design, photography, architecture, illustration)
- Include: colour palettes, aesthetic images, grid layout examples, animations (if needed), shapes
- Consistent style — no contradictions
- Always present 2–3 moodboard options to clients
- Accompany with written description explaining design direction
- Quality over quantity; allow 2–4 days for serious projects

---

## Key Quotes Worth Remembering

> *"If you think good design is expensive, you should look at the cost of bad design."*
> — Dr Ralf Speth, CEO, Jaguar Land Rover

> *"If you want to create a great product, you have to start by understanding the people who will use it."*
> — Don Norman, Co-founder, Nielsen Norman Group

> *"Every great design begins with an even better story."*
> — Conrad Bohnke

> *"Flow is the space between boredom and anxiety."*
> — Positive Psychology, University of Pennsylvania

> *"Everything should be made as simple as possible, but not simpler."*
> — Albert Einstein (cited in context of cognitive load)

---

*Extracted March 2026 via OCR from the full 138-page book. All insights are direct from the source text.*
