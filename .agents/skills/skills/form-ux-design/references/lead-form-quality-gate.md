# Lead Form Quality Gate

A premium lead form is a conversation, not a database entry. Apply this gate before any lead, contact, quote, or booking form ships.

## Conversation rule

A form should read aloud like a polite request from a competent human. If the speaker would never ask "title (Mr/Mrs/Other)" before any other context, the form should not either.

## Field minimisation

- The form asks for the smallest set of fields that lets the next step actually happen.
- Each field's existence is justified by the next step. "Phone" exists only if someone will call. "Industry" exists only if it routes the lead.
- Default to optional. Make required only what would block the response.
- Replace dropdown questions with smart defaults wherever a sensible default exists.

## Question quality

- Questions are written in the buyer's words, not internal taxonomy.
- Yes/No questions become a clear pair, not "agree/disagree".
- Open questions ("how can we help?") are placed last and never required.
- No "title" field. Most premium markets do not need it; where one exists, it is optional and includes locally appropriate options.

## Layout and labels

- Top-aligned labels for unfamiliar fields and on mobile. Right-aligned only for short, scannable forms with predictable fields.
- Labels visible at all times. Inside-input labels disappear when typing and increase error rates.
- Field length matches expected input length. A postal-code field that holds 50 characters signals the form does not understand its own data.
- Required fields are marked once, consistently, with an explanation if any are required.

## Path to completion

- One column, mobile-first.
- Primary action is a verb that names what happens next ("Send my enquiry", "Book my call"). Generic "Submit" is forbidden.
- Secondary action (cancel, back) is visually de-emphasised.
- Progress indicators only on multi-step forms with three or more steps.
- The first viewport of the form shows the form purpose, the time it takes, what the user gets back, and the first field.

## Inline validation

- Validate after the user leaves the field, not while typing.
- Confirmation (green check, formatted preview) for fields where validity is hard to judge.
- Suggestions for fields where the input is fuzzy (city, industry).
- Error messages explain what is wrong and how to fix it. They never blame the user.
- Validate the email format, not whether the email is "real". A network round-trip on every keystroke is hostile.

## Errors and success

- Inline errors appear next to the relevant field, in plain language.
- A summary at the top is added only when there are multiple errors.
- Success states confirm the action, name the next step, and give a fallback contact route.
- No dead ends. If the form fails server-side, the page must give the user a way out (email, phone, retry).

## Trust signals

- One privacy line near the form: what the agency does with the data, who else sees it, how to ask for deletion.
- One credibility marker visible without scroll on the form page (named owner, certification, recent client, response-time SLA).
- For sensitive forms (contact a lawyer, request a quote), one specific reassurance about confidentiality.

## Local and regional rules

- Phone field accepts the local format and the international format both, normalises silently.
- Address fields match local conventions; do not force U.S. state into a country that does not have states.
- Currency and date defaults follow the buyer's locale.
- Where mobile money is the dominant payment, integrate it natively rather than retrofitted at the bottom.

## Measurement

For every lead form, track:

- Form starts (focus on the first field).
- Field-level abandonment.
- Submission attempts and validation errors.
- Successful submissions.
- Time to first response from the agency or client.
- Quality of the resulting lead (qualified or not, conversion to opportunity).

Measurement gaps are forms running blind. Forms running blind are silently broken.

## Hand-off

- Field design and validation patterns → `form-ux-design`.
- Lead routing and SLA → `service-blueprint-website-delivery`.
- Acknowledgement language → `customer-service-website-ops`.
- Form copy and labels → `content-writing` and `sales-copywriting`.
