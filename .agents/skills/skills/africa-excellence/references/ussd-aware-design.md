# USSD-Aware Design

**Read this when**: the client's service has a USSD counterpart for
feature-phone users, or the target audience routinely moves between
web and USSD.

**Purpose**: Define when a web flow must parallel a USSD counterpart,
how the parallel is maintained, and the design rules that keep the
two surfaces consistent.

## When USSD-awareness matters

Not every site. The cases that matter:

1. **Financial services** — microfinance, banking, insurance, mobile
   money top-up. Feature-phone users are a real segment; the web is a
   secondary channel, not the primary.
2. **Government and utility** — water, power, tax payments, school
   fees. USSD is often the canonical channel; the web must not
   contradict it.
3. **Agricultural and rural commerce** — mobile-money-mediated bulk
   ordering, cooperatives, savings groups. USSD is how the user
   confirms; the web is how the user researches.
4. **Logistics and boda/moto delivery** — the field worker uses USSD;
   the customer uses web/app.

If the client is a pure consumer SaaS with no USSD flow, this
reference does not apply.

## The parallel principle

When a web flow has a USSD counterpart, the two must:

- Use the **same terminology**. A "paybill" on USSD is not a "merchant
  ID" on web. Call it the same thing on both.
- Use the **same reference numbers**. The same transaction ID works on
  both channels.
- Use the **same step order**. If USSD goes Account → Amount → PIN →
  Confirm, the web goes the same.
- Respect the **same limits**. If USSD rejects an amount, web rejects
  the same amount.

Divergence confuses users who move between channels. Users **do** move
between channels; field research confirms it consistently.

## Design rules

### 1. Name the USSD code

Where USSD exists and a user might need it, show the code with a
one-sentence explanation and a copy button.

Example:

> **Prefer feature phone?** Dial `*123*456#` and follow the prompts.
> Use account `ACME-2026-0001`.

Do not hide the USSD code behind a "more options" modal. For many
users it is the primary channel.

### 2. Mirror the menu structure

If USSD has four top-level options (Pay, Check balance, Statement,
Help), the web's equivalent menu uses the same four options in the
same order. The web can add more, but the four must be prominent and
recognisable.

### 3. Reference numbers are shared

A reference generated on USSD is retrievable on web. A reference
generated on web is quotable on USSD support lines.

### 4. State consistency

If the user completes a step on USSD (e.g. opens an account), the web
reflects that state within 30 seconds. Reconciliation back-ends are
often queued; the web must show a "processing" state, not a stale
"account closed" state, while the queue flushes.

### 5. Amount formatting matches

If USSD displays `KSh 1,200`, the web does not display `KES 1200`.
Match both the abbreviation and the separator the user sees on the
phone.

### 6. Error codes are parallel

USSD errors are often numeric ("Error 03"). Where the web surfaces the
same failure, it surfaces the same code alongside the human text:
"Account inactive (Error 03)". Users who called support will quote
the number.

### 7. Language parity

The USSD menu's language set determines the web's minimum language
set for the same feature. If USSD supports English, Kiswahili, and
Luganda, the web feature does too.

## Form design for mixed users

- Short-code inputs support the USSD PIN length (typically 4 or 5
  digits). Don't require 8-character passwords where USSD accepts a
  PIN.
- Phone-number inputs accept the local format without a country code
  when the user is on the local market, and the local plus-prefix
  format when not.
- Do not require an email for actions a feature-phone user could
  complete on USSD. Email is a web-only signal; do not let it become
  a blocker for an offline-completable transaction.

## Documentation

Every project with a USSD counterpart maintains a one-page "USSD vs
Web parity" table in `docs/` of the client project:

- Feature name
- USSD code/step
- Web path
- Any intentional divergence
- Last verified date

Intentional divergences require a decision entry.

## Testing

- At launch, verify three transactions end-to-end on each channel.
- Confirm a transaction started on USSD is visible on the web within
  30 seconds.
- Confirm a transaction started on web is queryable by phone support
  using the web reference.
- Run the "explain to my parent" test: can a user who uses USSD
  primarily describe the web screen to a friend and get to the same
  outcome?

## Common failure modes

- **Web uses "dashboard"; USSD uses "main menu".** Rename the web
  surface.
- **Web requires email; USSD does not.** Make email optional or
  remove.
- **Web shows hyper-precise timestamps; USSD shows "just now".**
  Match the USSD convention on the web when the USSD user will read
  the web view.
- **Web has a "logout" button; USSD has no session.** Hide the
  web logout from users on mixed rails, or move it to a settings
  panel.
