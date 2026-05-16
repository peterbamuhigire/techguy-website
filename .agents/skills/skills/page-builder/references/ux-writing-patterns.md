---
title: UX Writing Patterns — Microcopy for Every Interface State
description: Patterns and rules for all interface text — error messages, empty states, loading text, success messages, form labels, button copy, confirmation dialogs, help text, tooltips, and navigation labels. Every word in the UI is a design decision.
sources: pbakaus/impeccable "clarify" skill (2025) + Will Grant "101 UX Principles" (2018) + Lisandra Maioli "Fixing Bad UX Designs" (2018)
---

# UX Writing Patterns

Every word in the interface is a design decision. Bad microcopy creates friction, confusion, and distrust. Good microcopy is invisible — it guides without being noticed.

---

## CORE PRINCIPLES

1. **Specific over generic** — "Your message has been sent" not "Action completed successfully"
2. **Concise over complete** — say it in fewer words; users scan, they don't read UI text
3. **Active voice** — "We couldn't find that page" not "The page could not be found"
4. **Human tone** — write like a helpful colleague, not a robot or a legal document
5. **Helpful over clever** — clarity beats personality when the user needs guidance
6. **Consistent vocabulary** — pick one term and use it everywhere (don't alternate "remove/delete/discard")

---

## ERROR MESSAGES

### The 3-Requirement Rule

Every error message answers three questions:

| Requirement | Question | Example |
|-------------|----------|---------|
| **What** | What went wrong? | "This email address isn't valid" |
| **Where** | Where is the problem? | Field highlighted with red border |
| **How** | How to fix it? | "Check for typos (e.g., name@example.com)" |

### Error Message Patterns

**Form field errors:**
- "Enter a valid email address (e.g., name@company.com)"
- "Password must be at least 8 characters"
- "This field is required"
- "Phone number should include country code (e.g., +256 700 123456)"

**NOT:** "Invalid input" / "Error" / "Please check your entry" / "Validation failed"

**Network/server errors:**
- "We're having trouble connecting. Check your internet and try again."
- "Something went wrong on our end. We're looking into it."
- "This is taking longer than expected. You can wait or try again."

**NOT:** "Error 500" / "Server error" / "Something went wrong" / "An error occurred"

**Permission/auth errors:**
- "You need to sign in to access this page."
- "You don't have permission to view this. Contact your administrator."
- "Your session has expired. Please sign in again."

**NOT:** "Unauthorized" / "403 Forbidden" / "Access denied"

### Rules
- Place error text **directly below** the problem field, not in a banner
- Use red border + icon + text (never colour alone — colourblind users)
- Validate on **blur** (field exit), not on every keystroke
- After correction, show green border + checkmark (positive reinforcement)
- Jump to first error field after form submission (scroll + focus)

---

## EMPTY STATES

### Pattern: First-Time / Zero Data

```
[Illustration or icon — 64-96px, muted colour]

{What this area shows}
{Why it's empty + what to do}

[Primary CTA button]
```

**Examples by context:**

| Context | Heading | Body | CTA |
|---------|---------|------|-----|
| Blog (no posts) | "No articles yet" | "Published posts will appear here." | "Write your first article" |
| Gallery (no images) | "No photos uploaded" | "Add photos to showcase your work." | "Upload photos" |
| Testimonials (none) | "No testimonials yet" | "Client feedback will be displayed here." | "Request a testimonial" |
| Search (no results) | "No results for '{query}'" | "Try different keywords or check your spelling." | "Clear search" |
| Filtered list (empty) | "No items match your filters" | "Try adjusting or clearing your filters." | "Clear all filters" |

### Rules
- Empty states are **opportunities**, not dead ends — always include a CTA
- Use **specific copy per feature** — never generic "Nothing here" or "No data"
- Visual element prevents the "broken page" impression
- Make onboarding tips **dismissible** with one tap
- If an empty state needs extensive explanation, the UI is too complex — simplify

---

## LOADING STATES

### Text Patterns

| Duration | Text Pattern | Example |
|----------|-------------|---------|
| < 300ms | No text needed | — |
| 300ms–2s | Action verb + "..." | "Sending..." / "Loading..." |
| 2s–10s | Specific description | "Uploading your photo (2 of 5)..." |
| > 10s | Description + progress | "Processing images — 42% complete" |

### Button Loading Text
- "Send" → "Sending..."
- "Save" → "Saving..."
- "Upload" → "Uploading..."
- "Delete" → "Deleting..."
- "Submit" → "Submitting..."

**Rules:**
- Use the **same verb** as the button label, in present continuous
- Never use generic "Loading..." when a specific verb is available
- Never use clichéd "witty" loading messages — "Herding pixels," "Consulting the oracle," "Teaching hamsters to code" are recognisable AI slop
- Keep loading text **factual and brief**

---

## SUCCESS MESSAGES

### Toast Notification Text

```
[Checkmark icon]  {Action confirmed}
                  {Next step or reassurance}
```

**Examples:**

| Action | Primary Line | Secondary Line |
|--------|-------------|----------------|
| Contact form | "Message sent" | "We'll reply within 24 hours." |
| Newsletter | "You're subscribed" | "Check your email to confirm." |
| File upload | "Photo uploaded" | "It may take a moment to appear." |
| Settings | "Changes saved" | — (no secondary needed) |
| Booking | "Appointment booked" | "Confirmation sent to your email." |

### Rules
- Lead with **what happened**, not "Success!"
- Include next step or time expectation when relevant
- Auto-dismiss after **5 seconds** for success messages
- Keep to **2 lines maximum** — toast is a confirmation, not a conversation
- Never use "Successfully" — it's redundant ("Saved" not "Successfully saved")

---

## FORM LABELS AND INSTRUCTIONS

### Label Rules
- Labels go **above** the field (or to the left on wide desktop forms)
- Use the simplest term: "Email" not "Email Address" / "Phone" not "Phone Number"
- Mark optional fields "(optional)" — not required fields with asterisks
- Never use placeholder text as the label — it disappears on focus

### Help Text (Below Field)
- Use for format hints: "Format: DD/MM/YYYY" or "Include country code"
- Use for constraints: "Maximum 500 characters" with live counter
- Place **below** the field, in smaller muted text
- Keep to one line — if help text needs a paragraph, the field design is wrong

### Field-Specific Patterns

| Field | Label | Help Text |
|-------|-------|-----------|
| Full name | "Full name" | — |
| Email | "Email" | "We'll use this to reply to you" |
| Phone | "Phone" | "Include country code (e.g., +256)" |
| Message | "Message" | "Tell us how we can help" |
| Password | "Password" | "At least 8 characters" |
| Date | "Date" | "DD/MM/YYYY" |
| File upload | "Upload photo" | "JPG or PNG, max 5MB" |

---

## BUTTON AND CTA TEXT

### Rules
- Match the label to the element type: buttons name an action, links name a destination.
- **Action verb + object** — "Send message" not "Submit" / "Download brochure" not "Download"
- Use **specific verbs** — "Book appointment" beats "Continue" beats "Submit" beats "OK"
- Maximum **3–4 words** on a button
- Primary CTA: action verb. Secondary CTA: softer language ("Learn more," "See examples")
- Destructive buttons: use the specific destructive verb in red ("Delete account" not "Confirm")
- Label the outcome, not the mechanism. "Save changes" tells the user what will happen next; "Submit" does not.
- If the action is risky, name the risk directly: "Delete project", "Remove all members", "Cancel subscription".

### Button Copy Table

| Context | Primary CTA | Secondary CTA |
|---------|-------------|---------------|
| Contact form | "Send message" | "Call us instead" |
| Newsletter | "Subscribe" | "See past issues" |
| Service page | "Get a quote" | "Learn more" |
| Pricing | "Start free trial" | "Compare plans" |
| Blog | "Read article" | "Browse topics" |
| Portfolio | "View project" | "See all work" |
| About | "Work with us" | "Meet the team" |
| Download | "Download guide" | "Preview first" |

### Never Use
- "Click here" — meaningless out of context
- "Submit" — bureaucratic; always use a specific verb
- "OK" / "Yes" / "No" — ambiguous; use specific actions
- "Learn more" as the ONLY CTA — it's a secondary action, not a conversion
- "Continue" / "Next" / "Proceed" without the object when a more specific outcome is available

---

## CONFIRMATION DIALOGS

### Structure
```
[Icon — warning triangle for destructive, question for neutral]

{What will happen?}
{Consequence explanation — one sentence}

[Cancel]  [Specific Action Verb]
```

### Examples

| Action | Heading | Body | Buttons |
|--------|---------|------|---------|
| Delete item | "Delete this project?" | "This removes all project data permanently." | Cancel / Delete project |
| Leave page | "Leave without saving?" | "Your unsaved changes will be lost." | Keep editing / Leave page |
| Cancel subscription | "Cancel your subscription?" | "You'll lose access on {date}." | Keep subscription / Cancel |

### Rules
- **Undo > confirm** when possible — "Item deleted. [Undo]" disrupts less than a modal
- Destructive button on the **right**, safe button (Cancel) on the **left**
- Button text = **specific verb** matching the action, never "Yes" / "No" / "OK"
- Only use confirmation dialogs for **irreversible** actions — don't confirm "are you sure?" for routine operations

---

## NAVIGATION LABELS

### Rules
- **One word** when possible: "Services" not "Our Services" / "About" not "About Us"
- Use **user-task language**, not internal jargon: "Pricing" not "Rate Card" / "Help" not "Knowledge Base"
- Maximum **7±2 items** in primary navigation (Miller's Law)
- Active page must be visually unambiguous — users must always know where they are
- Breadcrumbs: "Home > Services > Web Design" — each except current is a link

### Standard Navigation Labels

| Page Type | Recommended Label | Avoid |
|-----------|------------------|-------|
| Homepage | (logo click) | "Home" in nav (wastes space) |
| About | "About" | "About Us" / "Who We Are" |
| Services | "Services" | "What We Do" / "Solutions" |
| Work/Portfolio | "Work" | "Our Projects" / "Portfolio" |
| Blog | "Blog" | "News" / "Insights" / "Resources" |
| Contact | "Contact" | "Get In Touch" / "Reach Out" |
| Pricing | "Pricing" | "Plans" / "Packages" |
| FAQ | "FAQ" | "Help Centre" / "Support" |

---

## HELP TEXT AND TOOLTIPS

### When to Use
- **Inline help** (below field): format hints, constraints, brief context
- **Tooltip** (on hover/focus): term definitions, icon explanations, additional context
- **Never:** tooltips for essential information — they're invisible on touch devices

### Tooltip Rules
- Maximum **1–2 sentences** (15–20 words)
- Plain language — if the user needs the tooltip, they're already confused
- Trigger on **hover AND focus** (keyboard accessible)
- Position: above or to the side, never covering the element it explains
- Dismiss: disappear on mouse leave / focus loss, or after 5 seconds

---

## VOICE AND TONE SCALE

Adjust tone based on the user's emotional state:

| Situation | Tone | Example |
|-----------|------|---------|
| Success | Warm, brief | "You're all set." |
| Neutral info | Clear, factual | "Your subscription renews on 15 March." |
| Warning | Direct, helpful | "Your session expires in 5 minutes. Save your work." |
| Error | Calm, solution-focused | "We couldn't process your payment. Please check your card details." |
| Frustration (repeated error) | Empathetic, specific | "Still not working? Try a different browser, or contact us for help." |

**Rule:** Never blame the user. "We couldn't find that page" not "You entered an invalid URL."

---

## INTEGRATION

Reference this file:
- During `page-builder` — for all interface text decisions
- During `form-ux-design` — for form labels, errors, help text, and buttons
- During `content-writing` — for consistency with page-level copy
- During `cro-audit` — microcopy quality affects conversion directly
