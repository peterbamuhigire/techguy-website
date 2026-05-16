# Interaction Design Principles for Static Websites

Seven ISO 9241-110 interaction principles applied to static website design. Use as a checklist when building every page.

Source: Benjamin Franz, "Usability and User Experience Design" (2025); Russ Unger, "A Project Guide to UX" (2024).

---

## 1. Task Suitability

Every page must support the user's actual task — not showcase the business.

**Rules:**
- Display as little information as possible, as much as necessary for the current task
- Homepage task = understand what this business does + find the right next page
- Service page task = understand if this service solves my problem + contact/buy
- Blog post task = learn something useful + find related content
- Smart defaults: pre-select the most common option (e.g., local currency, local language)
- Hide information not relevant to the page's primary task — don't overload with everything
- Automate steps that add no value to the user (auto-detect language, auto-format phone numbers)

**Anti-patterns:**
- Homepage that requires scrolling to understand what the business does
- Service page that describes features without connecting to user problems
- Contact page with 15+ form fields when 4 would suffice

---

## 2. Self-Descriptiveness

The website must explain itself without instructions — every element's purpose must be immediately obvious.

**Rules:**
- Navigation labels use plain words the target audience recognises (not internal jargon)
- Breadcrumbs show current position on every page below the homepage
- Active navigation item is visually highlighted so users always know "where am I?"
- CTAs describe what happens when clicked ("Get a Free Quote" not "Submit")
- Form fields have visible labels (not just placeholder text that disappears on focus)
- Progress indicators for multi-step processes (Step 2 of 3)
- Most-used controls always visible — never hidden behind hamburger menus on desktop

**Self-description test:** Can a first-time visitor complete their task without asking anyone for help?

---

## 3. Conformity with User Expectations

The website must behave the way users expect based on every other website they've used.

**Rules:**
- Logo top-left, links to homepage (Jakob's Law)
- Primary navigation horizontal on desktop, hamburger on mobile
- "Contact" in the last position of the main navigation
- Footer contains: company info, sitemap links, social icons, legal links
- Clicking external links opens new tab; internal links stay in same tab
- Underlined coloured text = link (never style non-links this way)
- Blue = default link colour (or the site's interactive colour used consistently)
- Search icon = magnifying glass; home = house; menu = hamburger
- Feedback for every action: button state change on click, form submission confirmation
- If something takes noticeably longer than expected, show a loading indicator

**Conformity test:** Would someone who has never seen this site before know exactly what to click to accomplish their goal?

---

## 4. Learnability

First-time visitors must grasp the site's structure within seconds. Repeat visitors must find content faster each time.

**Rules:**
- Dedicated entry points for the most important user tasks (not buried in submenus)
- Structure information by user interests and goals, not by internal org chart
- Multiple access paths to key content (navigation + search + internal links + footer links)
- Related content suggestions ("You may also be interested in...")
- Consistent page layouts — once a user learns one service page, all service pages work the same
- Visual hierarchy teaches priority: users learn that the largest element is most important

**For static websites specifically:**
- Service pages follow identical structure (problem → solution → proof → CTA)
- Blog posts follow identical layout (hero → body → related posts → CTA)
- Language switcher in same position on every page

---

## 5. Controllability

Users must feel in control of their experience — never forced, rushed, or trapped.

**Rules:**
- Users control scroll speed — no auto-advancing content, no timed carousels
- No auto-playing media (video or audio) — user initiates playback
- Back button always works (no trapping users with history manipulation)
- Forms: users choose field order; all fields accessible without completing previous ones
- Mobile: user controls zoom level; never disable pinch-to-zoom
- Cookie consent: clear accept/reject options (not dark-pattern "accept all" prominence)
- Users can dismiss any overlay, popup, or notification easily

**Controllability test:** At any point, can the user stop what they're doing, go somewhere else, and come back later?

---

## 6. Error Robustness

Prevent errors before they happen. When they do happen, help users recover gracefully.

**Prevention rules:**
- Contact forms: validate input in real-time (email format, required fields)
- Show only valid options (e.g., calendar date pickers instead of free text for dates)
- Auto-format inputs (phone numbers, postcodes)
- Confirm potentially destructive actions before executing

**Tolerance rules:**
- Allow users to continue filling a form even if one field has an error
- Auto-correct obvious typos but allow override (Google search model)
- Preserve form data if page reloads or navigation occurs accidentally

**Recovery rules:**
- Error messages must state: what went wrong + why + how to fix it
- "The email address format is invalid. Please enter a valid email (e.g., name@example.com)."
- Never: "An error occurred." or "Error 422."
- Highlight the specific field with the error, not just a banner at the top
- Jump to the error field so users don't have to search for it
- 404 pages: include search, navigation, and link to homepage — never a dead end

---

## 7. User Engagement

The website must motivate users to stay, explore, and return.

**First impression rules (50ms judgement):**
- Professional visual design matching the desired brand associations
- Clear value proposition visible without scrolling
- No visual clutter competing for attention

**Trust-building rules:**
- Display trust signals near conversion points: certifications, client logos, testimonials, security badges
- Transparent policies: privacy, terms, return/refund (accessible from footer)
- Real team photos and company information (not stock photos of handshakes)
- Contact information visible on every page (at minimum in header or footer)

**Engagement patterns:**
- Polite, respectful microcopy ("Thank you for your message" not just "Submitted")
- Confirm successful actions prominently (not just a subtle colour change)
- Anticipate needs: FAQ sections answer questions before users need to ask
- Subtle scroll-triggered animations reward exploration (but never distract from content)

**Engagement test:** After visiting the site, would the user recommend it to a colleague?

---

## The Usability Test Pyramid

When evaluating a finished website, apply these tests in order:

1. **5-Second Test** — Show page for 5 seconds. Can users say what the business does and what they should do next? If not, fix the visual hierarchy.
2. **Task Completion Test** — Give 5-8 users a specific task. Can they complete it without hints? Track where they get stuck (3-level prompt system: no help → hint → direct answer).
3. **Issue Severity Assessment** — Rate each problem by: consequences (how bad?), recoverability (can they recover?), frequency (how many users hit it?), rational cause (understandable mistake?).

**Findings framework:** What we set out to learn → What we learned → Key insights → Recommendations.

**Critical rule:** Always include positive findings. Reports that are purely negative disengage the team. Highlighting what works motivates improvement.
