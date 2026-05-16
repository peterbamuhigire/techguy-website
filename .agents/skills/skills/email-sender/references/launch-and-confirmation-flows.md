# Launch And Confirmation Flows

Use this reference when the email layer supports more than a basic contact form.
Apply it to:

- waitlists
- event registration
- application flows
- campaign enquiries
- launch notifications

## Core rule

The email flow is part of the conversion experience.
Do not send the same generic confirmation message for every form type.

## Supported flow types

### Contact enquiry

User email should confirm:

- message received
- expected response time
- what happens next

### Waitlist join

User email should confirm:

- they are on the list
- what kind of updates they will receive
- when they can expect the next meaningful message

### Event or webinar registration

User email should confirm:

- event name
- date and time
- attendance method or access details
- reminder expectation

### Application or diagnostic request

User email should confirm:

- request received
- review timeline
- any preparation needed

## Form-type aware handling

The backend should be able to distinguish the form type and choose:

- subject line
- admin template
- user confirmation template
- analytics event name
- thank-you page destination

Recommended field:

- `form_type` with a strict allowlist

## Confirmation email rules

- Repeat the user's action in plain language.
- Name the next step clearly.
- Keep the primary CTA relevant to the flow.
- Do not overload confirmations with generic sales copy.

Good CTA examples:

- `Add the event to your calendar`
- `Read what happens next`
- `See the launch brief`

## Launch-window safeguards

When the form supports a timed campaign:

- confirm the current state accurately
- do not promise access if the window has closed
- switch closed flows to waitlist behavior
- make deadlines date-specific in the email copy when known

## Admin notification rules

Admin emails should include:

- form type
- page source or campaign source
- language
- timestamp
- key qualifiers submitted by the user

This makes triage and follow-up faster during a launch.

## Thank-you page contract

Use a dedicated thank-you page per flow when practical:

- `/contact/thanks`
- `/waitlist/thanks`
- `/event/thanks`
- `/apply/thanks`

That improves analytics accuracy and lets the page reinforce the next step.

## Anti-patterns

- same email template for contact, waitlist, and event forms
- vague `We'll be in touch soon` with no timeline
- generic CTA that does not fit the form type
- hardcoded launch copy that becomes stale after the campaign closes

