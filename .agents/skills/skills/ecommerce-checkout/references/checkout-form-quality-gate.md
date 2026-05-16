# Checkout Form Quality Gate

Checkout is where the website earns its fee. Apply this gate before any checkout, payment, or booking-payment flow ships.

## Strategic frame

Checkout is the last and most fragile mile. Every avoidable field, decision, or interruption costs revenue. The work is to remove friction and add trust at the same time.

## Path to completion

- Name the form what it is: "Checkout", "Place your order", "Complete your booking". No clever names.
- Single conversation, ideally one column.
- Three steps maximum: Information, Shipping/Delivery, Payment. More steps cost completion.
- Progress indicator visible across all steps.
- "Express" or "guest" path always offered. Forced account creation is a known revenue leak.

## Field discipline

- Pre-fill what can be pre-filled (country from IP, city from postal code).
- Single-field name where culturally appropriate; split first/last only where required by payment processor.
- Address auto-complete when locale supports it.
- "Billing same as shipping" enabled by default; expand only on user choice.
- No phone field unless required by carrier or fraud rules; explain why if shown.
- No "company name" required for B2C; offer optional for B2B.
- No "title", "fax", or vestigial fields.

## Payment

- Payment method choice surfaces the locally dominant method first (card, mobile money, bank transfer, COD where applicable).
- Fees are disclosed before the payment step, not at confirmation.
- Card brand auto-detect; format card number, expiry, and CVV on input.
- Show security signals near the card field: padlock, processor name, encryption note. Place once, not three times.
- Save-card option opt-in, not default. Local privacy norms vary.

## Errors and recovery

- Inline error messaging at the field level. No generic "errors on this page".
- Server-side errors do not wipe the form. Preserve all data and highlight the failed field.
- Stock or availability errors give an alternative path (back-order, similar product, notify when available).
- Payment failure messages name the cause when known and give a specific next step (retry, change method, contact support).
- Idempotent submission: double-clicks must not create duplicate orders.

## Trust at the moment of payment

- Real-time order summary visible throughout: items, quantities, fees, total.
- Estimated delivery date or service date shown, not "TBD".
- Refund and return policy linked from near the payment button.
- Support contact (chat, phone, email) accessible without leaving the page.
- One clear reassurance: who is taking the payment, where data is stored, what happens next.

## Confirmation

- Confirmation screen and confirmation email match.
- Order number, items, totals, expected timeline, and support contact in both.
- Next-step content: tracking link, account access, training video, what to expect tomorrow.
- Receipt printable and saveable.

## Mobile reality

- All input fields use the right keyboard (numeric for postal, email for email, tel for phone).
- Buttons are thumb-reachable; primary CTA stays visible while the keyboard is open.
- Page weight matches the locale's network reality. A 2 MB checkout on 3G is silently lethal.
- Image-heavy summary thumbnails are compressed and below-the-fold.

## Measurement

Required events:

- Checkout started.
- Field-level abandonment.
- Payment method chosen.
- Payment attempted.
- Payment failed (with reason).
- Order placed.
- Refund requested.

Funnel by device, locale, payment method, and acquisition channel. A 3% improvement on mobile checkout often outperforms a 30% improvement in homepage conversion.

## Local payment integration

- Mobile money (where applicable): native integration, not redirect-only. Show the prompt on the user's phone matches the order.
- Bank transfer: provide reference, exact amount, and turnaround SLA.
- Cash on delivery: clearly state the rules to avoid fraud cost.

Hand integration spec to `ecommerce`, fulfillment SLA to `service-blueprint-website-delivery`, post-purchase email to `email-sender`, and refund language to `customer-service-website-ops`.

## Anti-patterns

- "Just create an account first."
- "Apply your coupon code" hidden behind a link that empties the cart.
- A surprise shipping cost on the final step.
- Pop-up newsletter signup during checkout.
- Cross-sell modals that interrupt the path.
- Animated "trust badges" that increase page weight without measurable trust.
