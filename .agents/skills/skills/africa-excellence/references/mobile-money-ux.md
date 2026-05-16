# Mobile Money UX

**Read this when**: building or reviewing any African-market site that
collects money — checkout, invoicing, donations, subscription billing,
or retainer payment.

**Purpose**: Define the regional mobile-money providers by market, the
three transaction patterns a site must handle, and the reconciliation
and UX standards that keep African payment flows reliable.

## Regional providers by market

| Market | Primary providers | Secondary / aggregator |
|---|---|---|
| Kenya | M-Pesa (Safaricom) | Airtel Money; Flutterwave, Paystack aggregators |
| Tanzania | M-Pesa (Vodacom), Tigo Pesa, Airtel Money | Selcom aggregator |
| Uganda | MTN MoMo, Airtel Money | Flutterwave, Paystack, Pesapal aggregators |
| Rwanda | MTN MoMo, Airtel Money | Flutterwave, Pesapal |
| Ghana | MTN MoMo, AirtelTigo Money, Vodafone Cash | Flutterwave, Paystack |
| Nigeria | Paystack, Flutterwave (card + bank + Opay/Kuda) | USSD *737# (direct bank) |
| Cameroon | MTN MoMo, Orange Money | Flutterwave |
| Senegal | Wave, Orange Money | Flutterwave |
| Côte d'Ivoire | Wave, Orange Money, MTN MoMo | Flutterwave |
| South Africa | SnapScan, Zapper, Payfast (card + EFT) | Yoco, Peach Payments |
| Ethiopia | Telebirr, M-Pesa (newer) | Chapa, ArifPay |

Every market has at least two viable providers. A checkout that offers
one provider forces users onto the wrong rail.

## The three transaction patterns

A site must handle each pattern where the provider supports it.

### 1. STK push (Sim Toolkit push)

User provides phone number; site POSTs to the aggregator; the user
receives a PIN prompt on their phone; confirmation returns to site.

UX requirements:

- Show the phone-number input with clear country code.
- Validate the number format per market before sending.
- After sending, show a **pending** state with:
  - The amount and provider clearly named.
  - A 60-second countdown.
  - A "Didn't receive the prompt?" fallback showing the manual paybill.
- On success: confirmation screen with reference number.
- On timeout or failure: clear retry with the same details pre-filled
  and the manual fallback visible.

### 2. USSD prompt

User dials a code; site shows the code and expected flow. Confirmation
is either polled (user pings "Done") or via webhook.

UX requirements:

- Show the exact USSD code for the user's provider.
- Show the amount and reference to type.
- Show the steps in order (screenshots optional; text is essential on
  low bandwidth).
- Poll every 5 s for up to 2 minutes before declaring failure.

### 3. Manual paybill / merchant code

User copies a paybill number and account reference into their mobile
money menu; site reconciles on webhook or manual confirmation.

UX requirements:

- Show paybill number with a copy button.
- Show account reference with a copy button.
- Show the amount.
- Show a "Paid? Enter reference number" field for manual
  reconciliation.
- Clear that delivery or activation happens after confirmation.

## Reconciliation and retry

- Every transaction has a unique reference the user can screenshot.
- The pending state persists across page reload (local storage with
  a TTL).
- A duplicate-payment protection exists: if a webhook arrives for an
  already-reconciled reference, the site responds with the existing
  result, not a duplicate receipt.
- Failed transactions include a human-readable reason code; not a raw
  aggregator error.
- Support contact is visible on every failure screen, with copyable
  reference.

## Currency formatting

Use ISO-4217 codes explicitly. Never show a bare number prefixed with
"$" in an African market.

| Currency | Code | Example | Rule |
|---|---|---|---|
| Uganda Shilling | UGX | UGX 12,000 | No decimal; thousands-separator required. |
| Kenya Shilling | KES | KES 1,200 | No decimal. |
| Tanzania Shilling | TZS | TZS 12,000 | No decimal. |
| Rwanda Franc | RWF | RWF 1,200 | No decimal. |
| Nigeria Naira | NGN | ₦ 1,200.00 or NGN 1,200 | Decimal optional; ₦ glyph acceptable if typeface supports. |
| Ghana Cedi | GHS | GHS 12.00 | Decimal required. |
| Central African Franc | XAF | XAF 1,200 | No decimal. |
| West African Franc | XOF | XOF 1,200 | No decimal. |
| South African Rand | ZAR | ZAR 1,200.00 or R 1,200.00 | Decimal required. |
| Ethiopian Birr | ETB | ETB 1,200.00 | Decimal required. |

Rules:

- Thousands-separator: comma (English) or period (French) depending on
  the locale. Match the page locale.
- No leading zeros. "UGX 00,020,000" is an ambiguity trap.
- Never abbreviate amounts ("12k"). Show the full amount.
- For recurring payments, show the currency and frequency: "KES 2,500
  / month".

## Amount input and display

- Input fields for amounts restrict to digits and the locale's
  decimal separator.
- On blur, reformat to the canonical display.
- Display the currency label before the number (Ugandan convention)
  or after, depending on the market norm.

## Tax and VAT

- Include tax lines as a separate row.
- Show VAT-inclusive totals where legally required (EAC countries have
  varied rules; check each market).
- Label clearly: "All prices include 18% VAT" or "VAT excluded; adds
  UGX X,XXX at checkout".

## Ethical considerations

- **Disclose fees.** If an aggregator charges the user a processing
  fee, show it as a line item.
- **Never surprise.** A payment page that shows one amount and charges
  another is a compliance issue.
- **Test failure modes.** Pull the plug mid-flow on a test device and
  confirm the user is told what happened.

## Verification at launch

For each provider in scope, on a real device:

- Complete a successful transaction end-to-end.
- Complete a cancelled transaction (decline on phone).
- Complete a timeout (let the prompt expire).
- Trigger a duplicate webhook and confirm no duplicate charge or
  duplicate fulfilment.

## Aggregator choice

Do not directly integrate with every provider when an aggregator
covers them. Flutterwave and Paystack both cover most East and West
African mobile-money rails and are usable from static sites via their
hosted-checkout pages. Direct integration is justified only when:

- The aggregator's fee structure is unacceptable at the client's
  volume.
- A specific provider feature (recurring STK push, for example) is not
  available via aggregator.

The decision is filed in a decision entry.
