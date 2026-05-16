---
source: Designing Interfaces 3rd Ed (Tidwell, Brewer, Valencia — O'Reilly 2020)
chapters: Ch3 Navigation/Wayfinding, Ch6 Mobile Interfaces, Ch10 Forms and Controls
purpose: Reference for page-builder and form-ux-design skills
---

# Tidwell: Navigation, Mobile, and Form Patterns

## Ch3 — Navigation Patterns

### Clear Entry Points
Present only a few main entry points so users know where to start.
- First-time and infrequent users need "front doors" — 2-4 entry points maximum
- Label entry points using language users search for, not internal category names
- Visually emphasise entry points proportional to their importance
- Secondary navigation (global nav, utility links) must be smaller and less prominent than Clear Entry Points
- Contribute to Instant Gratification: users who match an entry point to their need can confidently begin immediately

### Escape Hatch
A clearly-labelled button or link that gets the user back to a known safe place.
- Every constrained navigation context (wizard, modal, limited nav page, 404) must have an Escape Hatch
- Clickable logo in the top-left serves as an escape hatch on every page
- Cancel buttons in dialogs serve as escape hatches — always present, always works
- 404 and error pages must have a prominent link to the home page
- Escape Hatches prevent users from closing the app/tab in frustration — they encourage exploration

### Progress Indicator (Breadcrumbs variant)
Show users "where they are" in a linear sequence or deep hierarchy.
- Progress Indicator: on each step page in a sequence, show a numbered map of all steps with "you are here" indicator
  - Label each step: "Step 2 of 4 — Shipping Details"
  - Allow backward navigation by clicking completed steps
- Breadcrumbs: for hierarchical sites more than 2 levels deep
  - Show: Home > Category > Subcategory > Current Page
  - Each item except the last is a clickable link
  - Use for sites with deep hierarchy; use Progress Indicator for linear sequences

### Sitemap Footer
A structured directory of links to all major sections, placed in every page's footer.
- Turns a multilevel site (where subpages are isolated) into a fully connected site
- Task-oriented header + sitemap footer is the proven two-part pattern: header answers "what can I do right now?" and footer answers "what else is on this site?"
- Include: major content categories, contact/about, support, legal (privacy, terms), and social links
- Footer must be visually distinct from the page body — different background colour
- Sitemap footer wins on accessibility over fat menus (no dynamic flyouts, no hover dependencies)

### Escape from Modal
Modals must always have clear exit routes:
- The "X" close button in the top-right corner (always present)
- Clicking the backdrop (dimmed area outside the modal)
- Pressing Escape key
- An explicit "Cancel" or "Close" button inside the modal
- On success: return user to where they were before the modal opened

### Navigation Design Rules (Keep Distances Short)
- Design flat information architecture: more items at the top level, fewer levels of hierarchy
- Elevate high-frequency actions to the global navigation, regardless of information hierarchy position
- Every page: can the user reach their most common goal in ≤2 clicks from here?
- Good signage at every decision point: no dead ends without guidance
- Logo in top-left = navigation convention so established it is invisible to users; violating it causes confusion

---

## Ch6 — Mobile Interface Patterns

### Vertical Stack (MANDATORY for mobile)
Order content in a single vertical column; no side-by-side layouts except for very short controls.
- Most important content in the first 100px of the screen — never waste with stacked logos, ads, nav
- **Layer cake anti-pattern:** logo + ad strip + 3-nav-tabs stacked = useful content pushed off-screen; fix by removing decorative layers
- Text elements line-wrap; screen scrolls vertically — this is the natural mobile behaviour; embrace it
- Put form labels ABOVE their inputs (not beside) to preserve horizontal space
- Side-by-side buttons only if text is very short and will never be subject to translation or font enlargement
- Thumbnail image + text list is acceptable (standard card pattern) — degrade gracefully at 320px widths

### Generous Borders (Touch Targets)
- Minimum touch target: **48×48dp** (Android) / **44×44pt** (iOS)
- Put space between touch targets to prevent accidental taps
- Make the entire row/label of a radio button or checkbox tappable — not just the control
- Mistakes on touch screens are 3× more likely in motion (bus, walking) — fat finger padding is mandatory
- Small, close-together targets cause repeated errors that erode user trust

### Bottom Navigation
- On mobile, push global navigation to the bottom of the screen
- Top of screen = most valuable real estate → content, not nav
- Users can scroll to the bottom when they need navigation links
- Keep footer navigation to 4-6 items maximum at mobile widths

### Touch Tools (Immersive Content)
- For video players, image galleries, or full-screen content: hide controls until user taps
- Show controls as a translucent overlay floating above content
- Remove controls after ~3-5 seconds of non-use
- Touch targets within touch tools must still meet 44px minimum

### Strip to Essentials (Mobile Design Principle)
- Mobile users: "I need this fact now" / "I have 2 minutes to spare" / "Where is X near me?"
- Remove: sidebars, pull quotes, secondary ads, social share rows, related-content panels, newsletter popups
- Reduce taps: every extra tap to complete a task is a conversion risk
- Eliminate typing where possible — prefer taps, prefills, autocomplete, geolocation
- Load time directly affects mobile conversion: compress images, minimise requests

### Loading Strategy for Mobile
- Show as much partial content as possible while remainder loads
- Animated placeholder (skeleton screen) where content is pending, not a blank space
- Show progress indicator in-situ (where the content will appear), not just a global spinner
- Full page loads > 3s on mobile: expect >40% abandonment

---

## Ch10 — Form Design Patterns

### Forgiving Format
Accept multiple input formats and normalise to the required format programmatically.
- Credit card: accept "4111 1111 1111 1111", "4111-1111-1111-1111", "4111111111111111" — all are the same
- Phone: accept +256700000000, 0700 000 000, 0700-000-000 — detect country code, strip non-digits
- Dates: accept 20/7, 7/20, 20/7/2025, Saturday 20/7, July 20 — parse and echo back in standard format
- Credit card type: detect from first digits (Visa=4, Mastercard=51-55, Amex=34/37) — never ask user
- Zip/postcode: accept with or without space (EC1A 1BB vs EC1A1BB)
- **Principle:** the computer should do the reformatting work, not the user

### Input Hints
Place a short example or explanatory note beside or below the text field (always visible, not on hover).
- Format hints (e.g., "DD / MM / YYYY") must be visible BEFORE the user focuses the field
- Hints should be small (2pt smaller than label) but readable
- Maximum 1-2 sentences — longer hints are ignored entirely
- Keep field blank (no placeholder text) — blank field forces conscious response; pre-filled placeholder = skipped field
- Good hint: "E.g., +256 700 123 456" next to a phone field

### Good Defaults and Smart Prefills
Pre-fill known data to minimise user effort.
- Use data the system already knows: if the user is logged in, pre-fill name, email, known address
- If Zip/postcode is known from IP geolocation, pre-fill city and region
- If a previous order exists, offer to pre-fill the shipping address ("Same as last time?")
- Good defaults reduce form length effectively — even a 4-field form feels shorter when 2 fields are pre-filled
- Defaults should clearly serve the user, not the business (e.g., pre-select the cheapest plan, not the most expensive)

### Autocompletion
As the user types, show a list of matching valid options they can select.
- Reduces typing on mobile dramatically — critical for search, city names, product names
- Match from anywhere in the string, not just the beginning
- Show max 5-7 options in the dropdown; more creates choice overload
- Highlight the matched characters in the dropdown options
- Allow keyboard navigation through the dropdown (arrow keys + Enter to select)
- Always allow free-text override — don't force selection from the list

### Form Error Recovery (Actionable Validation)
- Show which field is wrong + why + how to fix it, all in one error message
- Format: "[Field name] [what's wrong] — [how to fix it]"
- Example: "Your email address is missing the '@' sign — for example: name@example.com"
- After a failed submission: preserve ALL entered data; only highlight invalid fields
- Re-submission: scroll to and focus the first invalid field automatically
- Never: clear the form after a failed submission (this is the single most frustrating form error)

### Form Length Principle
- Minimise inputs ruthlessly. Every field is a transaction cost paid by the user.
- If you ask for US Zip Code, you can derive city and state — don't ask for both
- If email address functions as username, don't also ask for a separate username
- Consider: is this field required for the transaction, or just for your database?
- Optional fields genuinely optional: remove them entirely if conversion matters more than data completeness

### Gatekeeper Form Design
Any form that stands between the user and their goal (sign-up, checkout, inquiry) must:
- Be in Centre Stage — full-width, no distractions, minimal nav
- Or in a Modal Panel — focused, single task
- Strip away: site nav, sidebars, promotional banners, social proof carousels
- Keep: logo (trust), form title, progress indicator (multi-step), privacy reassurance, phone number
