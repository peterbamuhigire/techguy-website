---
source: Designing Interfaces 3rd Ed (Tidwell, Brewer, Valencia — O'Reilly 2020)
chapters: Ch1 Cognition Patterns, Ch4 Layout, Ch5 Visual Style, Ch8 Actions
purpose: Reference for ux-psychology and design-system skills
---

# Tidwell: Cognition, Visual, and Action Patterns

## Ch1 — Cognition Patterns (Behavioral Foundations)

### Safe Exploration
"Let me explore without getting lost or getting into trouble."
- Every destructive action must be reversible or require confirmation
- Multilevel Undo and the Back button must work reliably and predictably
- Auto-save so exploration costs nothing; any wrong turn is recoverable
- Extra windows, pop-ups that hijack Back, or irreversible clicks break this pattern

### Instant Gratification
"I want to accomplish something now, not later."
- Predict the first thing a new user will do; make that action stunningly easy
- Do not block the first action behind registration, long instructions, slow loads, or ads
- Provide value before asking for something valuable (email, payment)
- Show partial results as they load; a blank screen for >200ms damages confidence

### Satisficing
"This is good enough; I don't need to find the best option."
- Users stop at the first plausible choice — so put the right choice first in every list
- Labels must be short and scannable; users guess rather than read
- Use calls to action: "Type here," "Tap to begin" — direct users to the most likely first step
- Visual layout communicates meaning faster than labels; use it to guide first-click behaviour

### Changes in Midstream
"I changed my mind about what I was doing."
- Preserve form state across page refreshes, navigation, and device sleep/wake
- Multi-step flows: allow backwards navigation without data loss (reentrance)
- Session persistence: returning after 30+ minutes should restore where the user was

### Deferred Choices
"I don't want to answer that now; just let me finish."
- Clearly distinguish required vs optional fields; don't make non-critical fields required
- Use Good Defaults so skipped fields don't create broken states
- Allow completion of a purchase/registration without answering optional questions
- A message like "You can change this later in Settings" reduces the anxiety of deciding now

### Incremental Construction
"Let me change this. That's better. Let me change it again."
- Support frequent small saves; never require a complete form before any save is possible
- Show the work-in-progress state continuously; feedback during creation is essential
- Fast preview/compile cycles reduce interruptions to creative flow (Csikszentmihalyi)

### Habituation
"That gesture works everywhere else; why doesn't it work here?"
- Consistent placement of navigation, actions, and labels is the most critical usability rule
- After first use, help text is invisible — layout must self-explain to returning users
- Announce layout changes explicitly: "We've updated our navigation" prevents disorientation

### Microbreaks
"I've just come back to this. Where was I?"
- Page titles and section headings must convey full context without requiring body text
- Re-entering a multi-step flow mid-way must clearly show completed steps
- "Where was I?" must be answerable at a glance from the current page state

### Spatial Memory
"I remember where things were on the screen."
- Never move navigation items between pages — users remember locations, not labels
- Pin primary actions to consistent screen positions (top-right on desktop, bottom on mobile)
- If layout must change (responsive breakpoint), animate the transition so users can follow elements

### Prospective Memory
"I was going to do something next — remind me what it was."
- Breadcrumbs, progress steps, and section titles remind users where they are
- After a page load, visible context must make the current task obvious
- Email/notification reminders for deferred actions reduce abandonment

---

## Ch4 — Layout Patterns

### Visual Framework
Shared visual identity across all pages: consistent header, footer, navigation, and spacing system.
- Every page shares: logo position, primary nav, utility nav, footer treatment, font hierarchy, colour use
- The frame is constant; the centre-stage content changes — users notice what changes, not what stays
- Implement via a single layout template/CSS system — separate style from content

### Center Stage
The primary task or content occupies the largest, most visually dominant area.
- Centre stage must be at least twice as wide/tall as any surrounding panel
- Headlines and high-contrast type anchor the viewer's eye to the start of the primary content
- Toolbars, sidebars, and related content are subordinate — never let them compete visually

### Grid of Equals
Equal-weight items (services, products, features, team members) displayed in a consistent grid.
- Every item uses the same template: same dimensions, same image aspect ratio, same text hierarchy
- Visual inequality in a "grid of equals" implies ranking where none is intended
- Highlight one item deliberately (featured, larger) to signal it is special — not as a default

### Titled Sections
Every major content block has a short, memorable title.
- Titles must be scannable: "What we do" beats "A comprehensive suite of end-to-end solutions"
- Use visual distinction for titles: bolder weight, larger size, contrasting colour, or background strip
- Whitespace between sections (not dividers) is cleaner; boxes add noise if too numerous
- If you can't title a section concisely, the content grouping is probably wrong — reorganise first

### Module Tabs
Tabbed content within a page — not page-level navigation.
- Maximum ~8 tabs per group; fewer is better; never double-row the tabs
- Selected tab must be unambiguously indicated (visual connection to content panel, not colour alone)
- Only use tabs when: modules are similar in length, users need only one at a time, set is fairly static
- If tab labels don't fit in a single row at narrow widths, use a dropdown selector instead

### Accordion
Collapsible content panels in a vertical stack — sections can open and close independently.
- Use when users may need multiple sections open at once (differs from tabs)
- First section should default-open (most important/most common)
- Section headers must be full-width clickable (44px min height) with a visible expand/collapse indicator
- Never accordion primary navigation — only secondary/supplementary content

### Responsive Enabling
Enable UI elements only when their prerequisite is satisfied.
- Grayed-out = "this is possible but not yet available" — always add tooltip explaining why
- Never silently hide actions; either disable with explanation or show as inactive

### Progressive Disclosure
Show only what's needed for the current task. Reveal detail on demand.
- Tier 1: essential information — visible by default
- Tier 2: supporting detail — revealed on expand, tab, or click
- Tier 3: edge cases and advanced options — help overlay, separate page
- Forcing all users to process Tier 3 information is a cognitive tax on the majority who never need it

---

## Ch5 — Visual Style Rules

### Preattentive Variables
Detected in <200ms before conscious reading: colour, size, shape, orientation, motion.
- Use preattentive variables to guide the eye to priority content (CTA, error state, headline)
- Desaturate design in grayscale to test whether hierarchy survives colour removal
- Colour alone is insufficient: 10% of men have some form of colorblindness — always pair colour with shape + text

### Colour Psychology
- Warm colours (red, orange, yellow, brown): energy, warmth, urgency
- Cool colours (blue, green, purple, gray): calm, trust, professionalism
- High saturation = vivid, daring, eye-catching — use sparingly for CTAs and alerts only
- Low saturation = calm, muted — use for backgrounds and body content areas
- Dark backgrounds: feel premium, edgy, or dramatic — intentional choice, not a default
- Bright complementary colours together (e.g., blue + red) cause visual fatigue — avoid

### Typography for Screens
- Sans serif body text outperforms serif at small pixel sizes — pixels can't render tiny serifs cleanly
- Left-align most text; centre-align only for short text (≤2 lines); never justify narrow columns
- Maximum 10–12 words per line for comfortable reading
- All-caps body text is significantly harder to read — use only for very short labels (badges, tags)
- Avoid italics, cursive, or ornamental fonts for body text — unreadable at small sizes
- Font pairing: pair serif heading with sans serif body (or vice versa); never two similar typefaces
- Within a family, differentiate by weight/style (bold, italic), not a second similar font

### Spaciousness vs Crowding (Intentional Choice)
- Generous whitespace = openness, calm, premium, dignity
- Tight/crowded = urgency, density, activity, energy
- Visual tension is created when elements collide against borders or each other — use intentionally
- The right amount of space is not about aesthetics alone: it signals information relationships

### Angles, Curves, and Motion
- Straight lines + right angles = calm, stable, still
- Diagonal lines = energy, motion, direction — use to guide eye toward CTAs
- Curves = flow, warmth, liveliness
- Focal points form at angle intersections and line convergences — place these where you want attention

### Photography Rules
- Subject's gaze direction controls viewer eye movement — model facing CTA directs viewer to CTA
- Avoid stock clichés: happy diverse team, road winding to horizon, handshake, sunset
- Custom photography > stock for establishing brand voice
- Decorative images in functional GUIs are distracting — use sparingly

### Icon Standards
- Icons must share consistent visual style: all filled OR all outline; same stroke weight
- Never use icon alone — pair with text label for maximum comprehension
- Follow established conventions: magnifying glass = search, envelope = message, house = home
- Creating new icon language requires onboarding — prefer established metaphors

---

## Ch8 — Action Patterns

### Button Groups
Group related actions together; separate unrelated actions.
- Same graphic treatment within a group (same height, border, colour, icon style)
- Primary action: stronger visual treatment than secondary (larger, brand colour)
- Destructive actions must be visually separated from primary actions — never adjacent
- Place button groups to the left or right of what they act upon (proximity principle)

### Hover Tools (Mouse-Only)
Show action buttons on hover to keep UI clean; hide them otherwise.
- Never use hover tools as the ONLY way to access an action on touch screens — no hover state exists
- Respond to hover immediately; no animated transition to show/hide hover tools
- Never rearrange page layout on hover — lightweight reveal only
- For touch: show tools in a pop-up panel when the item is tapped

### Prominent Done / Next Button
Every screen must have a single most-obvious "what do I do next" action.
- Primary action button: most visually prominent interactive element on the page
- Secondary action: ≤30% visual weight of primary (less colour, less size, less padding)
- One primary CTA per screen — two equal-weight CTAs create paralysis

### Preview Before Commit
Show the result before a costly or irreversible action is taken.
- Photo/file uploads: show thumbnail preview before saving
- Bulk operations: show count + list before "Confirm delete" dialog
- Email sends, payments, and publication actions benefit from a review step

### Spinners and Loading Indicators
- <300ms: no indicator needed
- 300ms–3s: spinner or determinate progress bar
- >3s: progress bar with estimated time + cancel option
- Full-page loads: use skeleton screens (content placeholders), not spinners
- Never leave a blank white space where content is loading

### Cancelability
Any operation taking >2 seconds must be stoppable.
- Show Cancel button adjacent to the progress indicator
- On cancel: restore prior state fully — no partial data left behind
- For expensive operations: "Cancel this? You'll lose your progress" confirmation before aborting
