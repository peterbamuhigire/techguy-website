# Designing UX: Forms — Complete Extraction
**Author:** Jessica Enders | **Publisher:** SitePoint, 2016
**Subtitle:** Create Forms That Don't Drive Your Users Crazy

> Source: Jessica Enders, two decades of award-winning form design for PayPal, Mayo Clinic, Diabetes Australia, Sydney Water, Royal Melbourne Hospital.

---

## Core Framework: Three Dimensions of Every Form

Every form has three dimensions, ranked from most to least influential on UX:

1. **Words** — what you say in the form, and how you say it (MOST influential)
2. **Layout** — how things are presented visually
3. **Flow** — how the user moves through the form

> "A form is only as good as the knowledge you have about the specific needs and context of both your users and your organization."

### The Guiding Design Principle

> "Start with nothing. Then only add what's needed to communicate with the user."

Every single pixel you add should be necessary to guide the user experience. Every time someone asks you to put more in, ask: "Will this aid the user, and if so, how?" If it's solely for the organization's benefit, or doesn't tell the user anything new — don't include it.

---

## Chapter 3: Words (Most Influential Dimension)

### Words Matter More Than Layout

> "If the words are right, users can work around bad layout. But they cannot work around bad wording."

A text-driven interface lives or dies by its questions. Words — not visual design — are the most important part of form design.

---

### The Four-Stage Model for Question Answering (Tourangeau)

Every user goes through four cognitive stages when answering a question:

1. **Comprehension** — understanding words and meaning
2. **Retrieval** — searching memory, feelings, thoughts and sources
3. **Judgement** — checking answer suitability, making adjustments
4. **Answering** — physically providing the answer

Use this model as a checklist for every question you write. Apply it to:
- The label
- The question-level help
- The answer field design

---

### Stage 1: Comprehension

**Plain Language Rules:**
- Use shorter, simpler words
- Use shorter, simpler sentences (one idea per sentence)
- Use the active voice
- Use words that are familiar to YOUR specific user (not your internal jargon)

**Context-specific vocabulary:** "heart" for patients, "cardiac" for surgeons. For the general public, avoid legalese and jargon. For lawyers, legalese is fine. Match vocabulary to the audience.

**Reduce Ambiguity:**
- "Where do you work?" is ambiguous — users interpret it as organization, location, or description
- Improve: "In which town or city do you work most often?"
- Add a frame of reference to scope the answer: "In which town or city do you work most often?" or "In the last week, what towns and cities did you work in?"

**One Concept Per Question:**
- Never ask about multiple concepts in one question
- Splitting one complex question into two simple ones makes the form feel shorter and faster, even if it objectively isn't
- Mental effort uses cognitive glucose and makes time feel longer

**Summary — Comprehension Rules:**
1. Use appropriate vocabulary for your target audience
2. Reduce ambiguity with precise terms and frames of reference
3. Explore only one concept per question

---

### Stage 2: Retrieval

Users retrieve answers from: themselves, someone else, or something else.

**If information comes from a secondary source (bill, document, another person):**
- Warn users BEFORE the form starts that they'll need that document
- Allow time/save-and-return functionality
- Be explicit about exactly what is needed and where to find it

**Memory is unreliable. Humans tend to remember more accurately:**
- Conscious experiences (not sub-conscious habits)
- Emotional events (wedding day vs. brushing teeth two days ago)
- Essentials, not details
- First and last things (primacy/recency)
- Recent events more than distant ones
- Things that are highly associated with each other

**Implication:** Don't ask for precise details about forgettable, routine events (e.g., "How many times did you drink alcohol last Tuesday?").

---

### Satisficing — A Critical Form Design Concept

**Satisficing** (Herbert Simon, 1957): The brain makes do with "just enough." Users satisfice subconsciously — they stop reading a question as soon as they believe they have enough information to answer it.

**Defences against satisficing:**

1. **Put frames of reference at the START of the label, not the end.**
   - Bad: "Has your family name changed since your last notice of assessment?"
   - Good: "Since your last notice of assessment, has your family name changed?"
   - Reason: Users stop reading at "changed" and miss the time frame.

2. **Put critical information in the label, not in the help text.**
   - Help text suffers from satisficing even more than labels. If users think they can answer without reading help, they won't read it.
   - Bad: Label says "Number of children born", help text says "Include legal adoptions"
   - Good: Label says "Including legal adoptions, number of children born"

3. **Turn important instructions into questions.**
   - Most users will fill out the form without reading instructions — design for this
   - Bad: "Mailing address — [instruction: leave blank if same as above]" — users fill it in anyway
   - Good: "Is your mailing address different from your residential address? [Yes/No]"
   - Classic ecommerce example: "Is your billing address the same as your shipping address?"

4. **Don't overburden the user.**
   - Fatigue from too many questions guarantees satisficing and abandonment
   - Keep questions to a minimum and make each one as easy to answer as possible

---

### Stage 3: Judgement

A form is a conversation between two parties. Context changes what's appropriate:
- Date of birth on a tax form: comfortable
- Date of birth on a guest ecommerce checkout: many users will not comply or will provide false information

**Rule:** If you must ask a sensitive question, add question-level help explaining WHY the information is needed.

**Precision in answer options:**
- Vague frequency terms ("regularly", "rarely") force users to interpret and guess
- Better: ask for actual hours per day or days per week
- Always be precise about: time frames, weights, dollar values, edge cases, definitions

**Answer options shape question interpretation:**
- The options you provide tell users how you're interpreting the question
- Same label + different answer options = different questions in practice

---

### Stage 4: Answering

**Open vs. Closed Questions:**

Closed questions (choose from options) are ideal when:
- You know all the possible correct options
- Options can be researched and validated

Only make a question closed if you can reasonably provide — and actually know — the right set of answer options. Guessing creates errors.

**Six Characteristics of Usable Closed Answer Fields:**

1. **Appropriate** — options cover main answers, from reputable/relevant sources, not too detailed or too broad, reviewed regularly
2. **Complete** — there must be an option for EVERY user; include "Other", "Don't know", "None of the above", "N/A"; continuous scales must have open ends (e.g., "More than 12 months ago")
3. **Mutually exclusive** — options must not overlap
4. **Self-explanatory** — users should understand all options without effort
5. **Appropriately sorted** — logical/natural order; alphabetical only when there's no better order and terms are universally known
6. **Unbiased** — options must not skew in one direction

**Alphabetical order rule:** Only use alphabetical order if:
- There's really only one term used for each option
- Users know those terms well
- There's no other more suitable order

Satisfaction ratings in alphabetical order (Agree, Disagree, Neither…) is wrong. US states in alphabetical order is fine.

---

### Deciding What Questions to Ask

**Begin with the end in mind.** Imagine the form is filled out and examine how the data will be used. Every additional question:
- Reduces completion rates
- Reduces data quality
- Increases error rates

**Only ask questions if the data can be answered accurately.** Questions that yield poor-quality data are worse than no data — they can steer decisions in the wrong direction or undermine the organization.

Bad example: "How did you hear about us?" — users can't accurately remember, and most satisfice by choosing any option.

**Form length rule:** There is no "right" length. Perceived length matters more than objective length. Test whether the length of your specific form matches the expectations of its specific users in its specific context.

Evidence that fewer fields improve conversion:
- Marketo: 3 fields instead of 5 lifted conversion 25% and cut cost-per-lead 25%
- Formisimo: removing one field increased sign-ups 16%
- Imagescape: 4 fields instead of 11 increased conversions 160%

---

### Common Questions — Best Practice Defaults

**Title field:**
- Avoid if at all possible — title always fails for some users
- Alternative: ask "How would you like to be addressed?" (free text)
- If required: make it optional and use a free text field
- Never use title as a proxy for sex/gender/marital status — the correlation is unreliable

**Name:**
- Best default: single text field + precise label ("Your full name, exactly as shown on your driver's license")
- If split: use "Given name(s)" (not "First name") and "Family name" (not "Last name" or "Surname")
- Accept all special characters: apostrophes (O'Donnell), diacritics (Renée), hyphens (Jean-Paul), spaces, non-Latin characters

**Address:**
- Never just "Address" — specify type: home, postal, billing, shipping
- Accept apostrophes and hyphens
- Best default: single text field + auto-suggest from a relevant database (like Google Maps)
- If multi-field: research which geographies you need to support

**Email:**
- Label: "Email address" (not just "Email")
- Single text field
- Make optional if some users may not have email addresses
- Add help text if users need to know WHY you're collecting it
- Accept generous character limits (email addresses can be very long)
- Avoid complex validation — only require one character before "@" and one after (international spec is complex)
- Use HTML5 type="email" for mobile keyboards

**Phone:**
- Specify which number: home, work, daytime, mobile, etc.
- Single text field (default)
- Accept hyphens, dashes, periods, parentheses, spaces
- Use HTML5 type="tel" for mobile keyboards

**Date of Birth:**
- Avoid asking for date of birth at all — it's personal and used for identity verification
- Ask instead: age range, or simple age confirmation ("Are you over 18?")
- If DOB is required: text input is fastest and most accessible
- Use three separate text boxes (day, month, year) with format hints (DD / MM / YYYY)
- Or single text box if you can handle multiple formats
- NEVER three dropdowns for DOB — laborious and inaccessible
- Use HTML5 type="date" for mobile date pickers
- Any date picker must be OPTIONAL, never the only method

**Sex and Gender:**
- Avoid unless you actually need it (can be illegal to ask)
- Sex: radio buttons with "Female / Intersex / Male / Prefer not to say / None of the above" in alphabetical order (minimizes perception of discrimination)
- Gender: free text field (there is no single accepted list of genders)
- Both should be optional or include "prefer not to say"

**Credit Card:**
- Detect card type computationally from first digits — never ask user to choose card type
- Single text box for card number (no forced chunking)
- Ask only: card number, name on card, expiry, security code
- Display accepted payment methods: in site header, site footer, at each major purchase decision point, and at point of payment

---

### Other Words in Forms

**Form Title:**
- Every form MUST have a title, visible on every screen
- Brief: 5 words or fewer
- Unique within your organization
- Descriptive
- Never include: "form", "online", "web", "a", "the", "for"
- Examples: "Personal Loan Application", "Motorcycle Insurance Quick Quote", "Enroll to Vote"

**Section Headings:**
- Start without section headings — only add if they deliver real value
- Section headings can make a form appear longer and more burdensome
- Warning: users decide whether a section applies to them based on the heading — headings must be accurate
- Never use a question as a section heading — questions posed as headings often go unseen

**Step Headings (multi-step forms):**
- Always include a step heading (communicates place, like a form title)
- Brief, unique, descriptive — no redundant words like "information" or "details"
- "Step" keyword is optional; step numbers are optional (avoid if large number of steps, as it draws attention to length)

**Button Labels:**
- Brief and descriptive — users must understand them without effort
- Always contain an action word (call to action)
- Good labels: Add to cart, Apply now, Back, Buy now, Cancel, Continue, Create account, Download, Get quote, Log in, Next, Pay, Place order, Previous, Save, Search, Sign up
- Avoid "Submit" — it's jargon that doesn't describe what submitting means
- Always use the right label at the right time ("Done" implies finished, don't use it when more steps follow)

**Error Messages:**
Every error message must do three things in a polite, non-accusatory tone:
1. Convey that an error has occurred
2. Be clear about exactly what and where the error is
3. Tell the user what they need to do to correct or move past the error

Use plain language: NOT "Required field" — YES "This question must be answered"
Be specific: NOT "You must provide a valid answer" — YES "Your email address is missing an '@'"
Never blame the user or be rude.

**General Instructions:**
- Research consistently shows most users don't read general instructions
- Design so the form can be completed WITHOUT reading any instructions
- Start without general instructions and only add them if absolutely needed
- Turn critical instructions into questions (see satisficing section)
- Instructions that apply at section or form level should be brief and not a barrier to completion

**Pronouns (Your / My):**
- Start WITHOUT possessive pronouns — they add workload and get repetitive fast
- "My" works when the user is logged in (My dashboard, My saved forms)
- "Your" works when the form/organization needs to speak to the user
- When three parties exist: use "Your" for user, descriptive terms for other parties

---

## Chapter 4: Layout

### The Layout Mantra

> "The best forms strike a balance between user experience and aesthetics."

The goal: lay out forms so they can be filled out quickly, easily, and accurately — while still looking good.

---

### Field Types: The Core Three

The three native, always-reliable field types:
1. **Checkboxes** — choose none, one, or many
2. **Radio buttons** — choose none or one
3. **Text boxes** — type an answer

These are preferred because:
- Universally familiar (even to paper form users)
- Work on all screen sizes including mobile
- Built into HTML specification
- Accessible by default
- Simple to design and develop

All other field types are "enhancements" — and most of them make UX worse, not better.

---

### Dropdowns — "The Devil Is in the Dropdown"

**Problems with dropdowns:**
- Many users don't know how to use them (no real-world equivalent)
- Many users can't navigate with keyboard (forces keyboard-to-mouse switching)
- Options are initially hidden
- Often can't see all options at once
- Common options often at the end of very long lists
- Require at least twice as much interaction (click to open, then select)
- Terrible on touch devices

**When to use dropdowns:**
- Only when the list is too long for radio buttons AND users won't know the options without seeing them
- When you cannot build a custom widget

**What to use instead:**
- For short lists (under ~20 options): radio buttons (single choice) or checkboxes (multiple choice)
- For long lists where users know the options: text box with auto-suggest
- For long lists where users need to see options: custom widget (last resort — expensive to build and test)

**UK Government Digital Service data:** Users struggle when there are more than ~20 options in a list. Auto-suggest eliminates this problem.

**Radio button enhancements for touch:**
- When coded properly, the option label is clickable, not just the tiny circle
- Add shading around each option to show the tap area
- "Button-style" radio buttons (styled as large buttons) are valid

---

### Segmented Controls and Switches — Avoid

- Not part of HTML5 standard (custom widgets)
- Hard to see which option is selected (especially two-option segmented controls)
- Switches indicate on/off, not a choice between two options
- Many users won't know how they work (unfamiliar UI patterns)
- Use radio buttons instead

---

### Date Pickers — Rules

> "Never ask people to input a date of birth via only a date picker, or three dropdowns."

Problems with date pickers:
- Most are badly designed, hard to use, or inaccessible
- Navigation one month at a time is torture for dates far in the past/future
- Scrolling on mobile is extremely laborious for historical dates

**Date picker rules:**
- Always provide text boxes as an alternative (or primary) input method
- If you include a date picker, make it OPTIONAL
- Never rely on date picker alone
- If included, it should: default to an appropriate date, allow direct month/year selection (not just month-by-month navigation), display months as words (not numbers — avoids international confusion), disable nonsensical dates, still allow typing

**International date issues:**
- US: month/day/year (5/7/1998 = May 7th)
- UK/Australia: day/month/year (5/7/1998 = July 5th)
- US calendars start week on Sunday; UK/Australia start on Monday
- Never use "5" as example date format hint; use "DD/MM/YYYY" (letters, not example digits)

**Best date of birth field:** Three text boxes (day, month, year) with format hints above each

---

### Sliders and Steppers — Avoid

**Sliders:**
- Fiddly to operate, especially for exact values
- Nearly impossible to set a precise number like $235
- HTML5 slider input is missing value display and end-point display
- "Fun in restaurants, painful in forms"
- Use a text box instead

**Steppers:**
- Minor improvement for small-increment changes
- Custom widget (expensive)
- Use a text box instead, or radio buttons if range is small

---

### Single Checkboxes — Replace with Radio Buttons

Single checkboxes require mental calculation to link checked/unchecked state to question wording. Problems multiply with negatively-worded questions.

Replace single checkboxes with explicit Yes/No radio buttons:
- Bad: [  ] Send me marketing emails (single checkbox)
- Good: Can we send you marketing emails? (  ) Yes  (  ) No

---

### Alignment — Vertical Path to Completion

**Core rule:** Vertically line up all form fields and the primary action button.

This creates a straight, unobstructed vertical path to completion. Benefits:
- Objectively faster to fill out
- Makes the form FEEL faster (perceived length matters more than actual length)
- Looks neater and simpler

**Never put questions side-by-side:**
- Interrupts smooth flow
- Users don't see questions on the right (human focus is ~9 characters wide)
- Prevents seamless responsiveness across screen sizes

**Answer field alignment exception:** For 3 or fewer options with short labels, horizontal alignment is acceptable (e.g., Yes/No radio buttons or day/month/year date fields). Large sets of radio buttons or checkboxes must always be vertically aligned.

---

### Label Placement — Responsive Rule

**Rule:** Labels must be responsive to screen size:
- Large screen: labels to the LEFT of fields (form appears shorter, more scannable)
- Small screen: labels ABOVE fields (label always visible when user types)

This is the correct resolution of the "Penzo eyetracking study" debate — above vs. left depends on screen size. On mobile, labels to the left disappear when the input is focused. On desktop, labels above create needlessly long forms.

**Gutter prevention (labels to left):**
- Short labels: set flush RIGHT so they're adjacent to their fields
- Long labels: set flush LEFT with zebra striping (faint alternating row shading to help eye trace label to field)

---

### Spacing — Proximity Principle

**Related elements must be close; unrelated elements must have space between them.**

Apply to:
- Parts of a question (label, help text, answer field) — keep close together
- Between questions — keep far enough apart that boundaries are clear

**Question-level help placement:**
- Formatting instructions (DD MM YYYY): place ABOVE the field
- Other help text: place BELOW the label (not to the right of the field — right side is outside visual focus)
- Never hide help behind icons or show it only on hover (hover doesn't exist on touch)
- Always show help right there on the form

**Always Show Question-level Help:**
Do NOT hide help behind tooltip icons, question marks, or hover states. Problems:
- Extra effort required to see it
- Won't be seen by most users
- Hover doesn't exist on touch devices
- No real space savings (space is still needed for the icon)

---

### Text Box Widths

- Text box width communicates expected answer length
- Make width proportional to the typical answer (not all the same)
- Example: "First name" = medium width; "Date day" = narrow; "Email" = wider
- Visual width ≠ character limit (an email field looks medium but accepts 256 chars)

---

### No Background Color in Fields

- Background color in fields makes them look like buttons
- Buttons without background color look like fields
- Use a simple 4-sided border to show where to type
- Make sure the border is visible (light grey borders are often invisible)

---

### No Placeholder Text Inside Fields

> "Never include text inside your fields. The only text that should appear inside a field is the user's answer."

Placeholder text causes:
- Users think the question is already answered → skip it → triggers errors
- Users leave placeholder text in the field → corrupts data
- Placeholder disappears while typing (users watching keyboard miss it)
- Not all text is visible (limited by field width)
- Users forget what label said
- Users forget what help text said
- Often too small to read
- Prevents reviewing answers
- Makes errors harder to correct
- Often inaccessible (not consistently supported by screen readers or browsers)

**Float labels are also wrong:**
- Field still looks filled initially → users miss answering it → errors
- Floated label too small to read
- Space isn't actually saved (field must be taller)
- Requires animation (increases page size, may not work)
- Can't be used for checkboxes/radio buttons
- Long labels don't work

Place label BESIDE or ABOVE the field, and leave it there.

---

### Color — Use Sparingly

> "The more color you use, the less it succeeds in making things stand out."

Color should be reserved for:
- Primary action button (brand color)
- Error messages (red)
- Warning messages (orange)
- Success messages (green)
- Information messages (blue)
- Links (blue)
- Progress indicators (differentiate past/current/future)
- Headings (optional)
- Branding elements

**Never use color as the ONLY indicator of something** — 4-10% of users have color vision deficiency (most common: red-green). Add icons/symbols and background shading in addition to color.

**Contrast:** Dark grey or black text on white background is the safe default. Light grey on white is nearly unusable despite being trendy.

**Error messages must use:** light red background + exclamation mark icon + error text positioned BEFORE the corresponding question.

---

### Required vs. Optional Fields

**Problem with red asterisks (*):**
- Abstract symbol (layer of indirection)
- Disproportionately visually prominent for low-priority information
- Most users don't look for required indicators (majority of questions must be answered anyway)
- Hard to find optional fields among many required ones (shown by absence)
- Not always accessible

**Better approach:**
1. Instruction at TOP of each screen: "All questions must be answered, unless marked (optional)."
2. Add "(optional)" to end of label for every optional question
3. No visual markers on required fields

If most questions are optional (reverse situation):
1. Instruction: "All questions are optional, unless marked (required)."
2. Add "(required)" to labels of required questions

---

### Buttons

**Action hierarchy:**
- Primary action: highest visual prominence (strong background color, large text, bold or caps, more whitespace)
- Secondary action(s): lower prominence (subtle background color)
- Tertiary action(s): even lower (link style)

**Do NOT include a reset/clear button.** Reset buttons are vestigial from early electronic forms. Too often forms are cleared instead of submitted, causing massive user frustration.

---

### Typography

**Typeface:**
- Choose fonts that read well at small and large sizes
- System typefaces (Georgia, Verdana) are reliable
- Web fonts: use with care — many designed for informational pages (lots of body text), not forms (mostly short labels)
- Avoid italics/oblique text — hard to read on screen
- Save bold for headings and emphasis
- Minimum text size: 10px

**Question-level help:** Slightly smaller or lighter than label text to visually distinguish it.

**Case:**
- **Sentence case** everywhere by default — most familiar, fastest to read
- Title Case acceptable for headings/titles
- ALL UPPERCASE: avoid entirely (harder to read, feels like shouting)
- All lowercase: only if organization style requires it

**Line length:**
- General reading: 60-75 characters optimal
- Form labels (mostly short): 25-35 characters
- Mobile: 100% of available width

---

### What to EXCLUDE from Form Layout

Remove:
- Main site navigation
- Fat footers
- Other distracting, superfluous elements
- Jumbled, crowded, inconsistent mix of visual styles
- More branding than is needed to give user a sense of place

> Luke Wroblewski: "Any visual element that is not helping your layout ends up hurting it."

---

### Contact Information on Forms

**Include your organization's contact phone number on every screen of the form.**

Organizations that hide contact details to prevent call volume increase are wrong. If people need help, they will find a way. Hidden contact details just ensure they're more frustrated by the time they get through — increasing call handle time and errors.

Include a contact number prominently. It both reassures users and provides an escape hatch.

---

### Touch Design Rules

- Text boxes and buttons: minimum **2.75 rems** high (≈ 44px)
- Touch area around each radio button or checkbox: minimum 2.75 rems high
- Minimum touch target: 7mm = 44px
- No hover interactions (hover doesn't exist on touch)
- Fewer taps are better (arms, wrists, hands tire)
- Touch can appear on ALL screen sizes — don't use screen size as proxy for touch

---

## Chapter 5: Flow

### Question Order — Five Principles

Think of your form as a conversation. What order would a face-to-face conversation take?

**Principle 1: Follow How the User Thinks**
- Order should match how things flow in the user's mind
- Only user research can tell you what this order is

**Principle 2: Core Before Supplementary**
- Collect central information first, supplementary last
- Most important data captured when user is freshest and most engaged

**Principle 3: Easy Before Difficult**
- Simple, non-intrusive questions before complex, sensitive questions
- Eases users in; ensures commitment before presenting questions that might cause abandonment

**Principle 4: Related Together**
- The more related questions are, the closer they should appear
- Group all contact info together, all financial info together, etc.
- Apply to answer fields too (don't swap yes/no order between questions)

**Principle 5: Be Consistent**
- Don't change the order of questions from one part of the form to another
- Don't swap the order of "Yes"/"No" options partway through

**These are principles, not rules** — they will sometimes conflict. User research resolves conflicts.

---

### Tab Order

Some users navigate forms keyboard-only (no mouse, assistive tech, developer preference).

Set tab order to exactly match the visual order of questions and buttons. A misaligned tab order can cause users to click the wrong button.

---

### Number of Screens

**Decision formula:**
1. Find the most common screen sizes for your audience (used by at least 60% of users)
2. If form fits on 3 or fewer screenfuls of those sizes → use one screen
3. Otherwise → break into multiple screens (one step per screen)
4. **Maximum: 7 screens**

**What constitutes a step:** Let questions define it. Look for natural groupings and topic changes.

**One question per screen:** Can help focus low-literacy or small-screen users. But: increases load times, worse for performance, worse completion times. Use only if you have resources to test it properly.

---

### Progress Indicators

**Minimum requirements:**
- Show which step the user is on
- Show total number of steps
- Format: "Step 2 of 5" (simple and works well on mobile)

**Fuller progress indicators (large screens):**
- Visually distinguish: past steps, current step, future steps
- Step names must exactly match the headings shown on each screen

**Never use percentage-based progress indicators.** They seem precise but contain less information:
- What does the percentage measure — time? steps? effort?
- Inconsistent step sizes make percentages meaningless
- Non-linear navigation breaks percentages

**Progress indicator honesty:** Never pretend there are 3 steps when there are 5. Deceptive indicators increase abandonment, dissatisfaction, and distrust.

**Recent research (UK GDS):** Progress indicators may not always be necessary — consider testing your form without one.

---

### Modal Windows — Minimize

Problems with modals in forms:
- Users (especially those with cognitive disabilities) struggle to know where they are
- Often don't work on mobile
- Can disappear off screen on small devices
- May not be seen by screen magnifier users
- May not be announced by screen readers

---

### Gateway Screen (Before the Form)

Most simple forms (search, sign up/log in, contact us, simple checkout) don't need a separate gateway screen.

For longer/more complex forms, gateway screen should:

**Content:**
- Explain what and who the form is for
- Warn about external information needed (passport, bills, other people)
- Warn about equipment needed (printer, credit card)
- Share average completion time (if known)
- Tell users if they can save and return (if form takes more than 5-10 minutes)
- Provide summary of legal considerations (privacy, T&C) with links to full detail

**Function:**
- Include a prominent CTA button ("Start now", "Begin application")
- Be indexed and appear in search results (the form itself should NOT appear)
- Be part of website navigation
- Be the single URL all references link to
- NOT be counted in the progress indicator

---

### Confirmation Screen (After the Form)

Every form needs a confirmation screen telling users:

1. That they have finished filling out the form
2. That submission was successful
3. Their receipt/reference number (if relevant)
4. Whether a confirmation email has been sent to them
5. What happens next
6. How to track processing or get further info
7. What further actions they need to take (if any)
8. Where to go next (don't leave as a dead end)

**Emotional design:** Thank users for their effort. Create a sense of reward. MailChimp is the classic example of delightful confirmation screens.

**Feedback collection:** The confirmation screen is the ideal place to collect form-filling feedback. Ask the Single Ease Question (SEQ): "Overall, how would you rate the difficulty of this task?" (7-point scale). Make answering optional.

**Email confirmation:** If you collected email address, send a copy of the confirmation to that email for permanent reference.

---

### Review Screen

Consider adding a review screen for:
- Forms where submission has significant consequences (e.g., money deducted)
- Multi-step forms

The review screen:
- Appears just before the confirmation screen
- Shows all questions, sections, steps, and the user's answers
- Presents everything in the same order as the form
- Includes "Change" / "Edit" links for each section or question

---

### Validation

**Two types of errors:**

1. **Errors of omission** — required question not answered
2. **Errors of commission** — answer provided but not valid

**Errors of omission:** Straightforward — check and report which required questions have no answer.

**Do NOT disable the primary action button until required fields are filled:**
- A disabled button doesn't tell users what's wrong or how to fix it
- May not be visible if grey is used for other elements
- Always keep the button enabled; report errors when submit is attempted

**Errors of commission:** The challenge is finding the right level of validation:
- Too little → organization must follow up post-submission
- Too much → expensive to build; burdens users; flags valid-but-unanticipated answers as errors

**Sweet spot:** Check obvious/disastrous errors (email without "@") but not much more.

**International formats:** Phone numbers have 40+ variations within a single country. Dates differ by region. Validation must accommodate user variation, not force a single format. Accommodating user input format is a design responsibility, not "lazy" to accept multiple formats — requiring one format is lazy coding.

---

### Inline Validation — Use With Caution

**When inline validation works:** Very short forms (fewer than 10 questions) where the vast majority of validation can be checked inline.

**Problems with inline validation on longer forms:**
- Most common bug: validation fires TOO EARLY (user is still typing)
- Forces repeated switching between "filling mode" and "error-fixing mode" → increases cognitive effort
- Hard to validate everything inline — server-side checks required anyway
- Mixed inline + server-side validation creates false sense of security
- Facebook removed inline validation from sign-up after trying it
- Users watching keyboard won't see inline validation at all

**If you use inline validation:**
- Apply all error message rules
- Give users time to finish typing before validating
- Do NOT use the inline validation built into HTML5 (poor UX)
- Read: "Inline validation in forms—designing the experience" (Mihael Konjević)

**Always include server-side validation regardless** — client-side validation is trivially defeated.

---

### Error Messages — Presentation

**Positioning rules:**
- Error message must be close to the corresponding question (NOT at the top of form only)
- Error message must come BEFORE (above) the corresponding question, not after
- Do NOT put error messages to the right of fields (outside visual focus area)
- Do NOT use popups/tooltips for errors (inaccessible, often not visible)
- Do NOT rely only on color (use icon + color + background shading)

**Visual design of error messages:**
- Light red background shading on the entire question (works for all field types)
- Exclamation mark icon ("!")
- Error message text positioned just before the corresponding question

**For long forms on large screens:**
- Summarize ALL errors at the TOP of the page
- Include anchor links from each summary item to the corresponding error in the form
- If no summary: scroll screen automatically to the first error

**Time investment:** Design and develop error messaging with almost as much time as you spend on layout. Validation as afterthought is why most error UX is terrible.

---

### Warnings

- Warnings = user can proceed without changing answers (less serious than errors)
- Common warnings: session timeout, weak password
- Visual design: same technique as errors but with ORANGE instead of red
- Make warning and error styles clearly distinguishable from each other

**Session timeout rules:**
1. Time limit must be at least 20 minutes
2. Give warning well before time runs out
3. Always allow time extension of at least the original limit's duration
4. In multi-step forms: count from each step load, not from start of form

---

### System Processing

When form is processing after submission:
- Show a repeating animation (communicates "something is happening")
- Prevent user from interacting with form (prevent double submission)
- Always disable the primary action button during processing

Options: spinner overlay on top of form, or animation with text ("Processing your order...").

---

### Reducing Workload — Advanced Techniques

**Touch keyboard optimization:**
Use HTML5 input type attributes to trigger the right keyboard on mobile:
- `type="tel"` → telephone keyboard
- `type="email"` → email keyboard (@ visible)
- `type="url"` → URL keyboard
- `type="cc-number"` → credit card keyboard
- `type="number"` → numeric keyboard

**Double entry — Do Not Use:**
Do NOT ask users to enter email or password twice. Problems:
- Users copy-paste (defeating the purpose)
- If copy-paste disabled: password managers break, autofill breaks
- When entries don't match: user must re-enter both (no indication which is correct)
- Patronizes users

Instead: single entry + easy reset/reminder flow. Optionally: send email to validate.

**Show/Hide Password:**
Provide a "show"/"hide" toggle next to password field:
- Always start with password hidden
- Use words ("show"/"hide"), not just icons
- Allows users on private devices to verify their password without double-entry

**Pre-population:**
- Connect databases so known information is pre-filled
- Let users update pre-populated data (looks like normal form field with answer in it)
- If data cannot be changed: remove field border/styling to indicate non-editable

**Defaults — Use Sparingly:**
Defaults are pre-selected "most likely" answers. Problems:
- Users subconsciously skip answered fields (satisficing)
- Default errors can't be caught by validation
- Data quality problems discovered long after submission

Only use defaults if:
- You have HIGH CERTAINTY data that tells you the likely answer
- The impact of a missed default change is minimal

If defaults are used, the user MUST be able to modify them.

---

### Conditional Questions

**The power of web forms over paper:** Hide irrelevant questions.

When a trigger question determines whether other questions are shown/hidden, those dependent questions are conditional questions.

**Rules:**
- Identify all questions that only apply to some users
- Find a reliable trigger question for each
- Be very careful that trigger logic is right — don't lock users out of applicable questions or show irrelevant ones to others
- Answer OPTIONS can also be conditional (e.g., car model options depend on make and year)

---

### Eligibility Questions

If some users aren't eligible for the form at all:
- Screen them out via eligibility questions (placed between gateway screen and main form)
- Tell users IMMEDIATELY when their answer means they're ineligible
- When ineligible: make it impossible to proceed WITH a clear explanation of why
- Better for user than: letting them complete the whole form, then rejecting at the end

---

## Accessibility — Integrated Throughout

The book treats accessibility as a design-by-default concern, not an add-on:

**Key accessibility rules:**
- Labels must be programmatically associated with their fields (not just visually close)
- Never use color alone to communicate anything — add icons, background shading, or symbols
- Question-level help should always be visible, not hover-triggered (hover doesn't work with assistive tech)
- Tab order must match visual order
- Screen readers consistently use the `<label>` element — placeholder text historically broke this
- Error messages announced to screen readers must be positioned correctly
- Modal windows may not be announced by screen readers — minimize use
- Single checkboxes with negative wording create cognitive burden — replace with radio buttons
- Buttons and touch targets: minimum 2.75rem height
- Minimum text size: 10px
- Dropdowns are less accessible than radio buttons/checkboxes
- Custom widgets (sliders, segmented controls, switches) require significant accessibility engineering

---

## Trust Signals in Forms

Trust is built and destroyed through form design. Key trust signals:

1. **Explain WHY you need sensitive information** — question-level help for date of birth, phone, email ("We need your email address to send you a booking confirmation")
2. **Display accepted payment methods early** — in header, footer, at purchase decision points, and at checkout (not just at the last step)
3. **Be honest with progress indicators** — never misrepresent how many steps remain
4. **Confirmation screen** — immediately and clearly confirms submission success + reference number
5. **Email confirmation** — sends copy to user's email for permanent reference
6. **Contact phone number on every screen** — reassures users help is available
7. **Privacy/legal summary on gateway screen** — with links to full policies
8. **Never use dark patterns** — deceptive wording, hidden pre-checked boxes, misleading options
9. **Show/hide password** — treats users as capable adults managing their own security
10. **Pre-population** — shows the organization already knows and values the user's information

---

## Cognitive Load Reduction — Summary Rules

1. One concept per question (never combine two questions)
2. Plain language (short words, short sentences, active voice, familiar vocabulary)
3. Precise terms and frames of reference (eliminate ambiguity)
4. Frames of reference at START of label (prevent satisficing)
5. Critical information in label, not help text
6. Turn instructions into questions
7. Minimum necessary questions (every extra question reduces completion + data quality)
8. Vertical path to completion (no side-by-side questions)
9. No placeholder text in fields (field should look empty)
10. No required field asterisks (visual noise; mark optional instead)
11. No reset button (too easy to accidentally clear form)
12. Touch keyboard type hints (`type="tel"`, `type="email"`, etc.)
13. Conditional questions (hide irrelevant questions)
14. Pre-population (don't ask for known information)
15. No double entry for email/password
16. Sensible defaults only with supporting data
17. Auto-suggest for long lists (countries, categories) — not dropdowns
18. Save and return for forms > 5-10 minutes
19. Review screen for consequential submissions
20. Feedback collection via Single Ease Question (optional)

---

## Multi-Step Forms — Complete Checklist

1. Maximum 7 screens
2. One step/topic per screen
3. Let natural question groupings define screen breaks
4. Step heading on every screen (brief, unique, descriptive)
5. Step headings in progress indicator must exactly match screen headings
6. Progress indicator: step-based (not percentage); show current + total; distinguish past/current/future
7. Gateway screen: explain form purpose, warn of info/equipment needed, show time estimate, explain save-and-return if available
8. Previous/Next buttons: either left-aligned with fields OR previous-left / next-right (test with your audience)
9. On mobile: stack buttons, primary on top, full width
10. Review screen before confirmation (for consequential forms)
11. Confirmation screen: success confirmation, reference number, what happens next, email sent notice, next steps
12. Email confirmation sent to user
13. Tab order follows visual order
14. Time limits: ≥ 20 min, warning before expiry, extension available, timer resets per step

---

## Forms Documentation: QxQ (Question by Question)

For any non-trivial form, create a QxQ document recording for each question:

- Proposed label + question-level help + answer field design
- Required or optional?
- Open or closed?
- If closed: field type, answer options with order, whether standard-based, multiple selections allowed, "other" write-in option
- If open: min/max characters, accepted characters, HTML5 type attribute
- Eligibility determinant: yes/no
- User research notes and rationale for wording choices
- Validation rules (min/max values, date constraints)
- Relationship to other questions (conditional/trigger)
- Which users the question applies to
- Who uses the data and how
- Relevant history of changes

**Why QxQ is worth the investment:**
- Separates content from code (each can evolve independently)
- Preserves organizational knowledge across team changes
- Streamlines development by answering developers' questions upfront
- Creates an audit trail for question changes

---

## Key Quotes to Remember

> "Words, not layout, make this form hard to fill out."

> "The devil is in the dropdown."

> "It's not as simple as 'fewer questions = better form' — subjective length matters more than objective length."

> "Design your form so it can be completed without reading any instructions, because that's what most users will do."

> "Never include text inside your fields. The only text that should appear inside a field is the user's answer."

> "Any visual element that is not helping your layout ends up hurting it." — Luke Wroblewski

> "Start with nothing. Then only add what's needed to communicate with the user."

> "Forms are a conversation between two parties." — Caroline Jarrett & Gerry Gaffney

> "The test of the goodness of a thing is its fitness for use." — Frank Pick (1916)
