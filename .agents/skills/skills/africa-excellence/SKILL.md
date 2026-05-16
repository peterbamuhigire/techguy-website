---
name: africa-excellence
description: Canonical Africa-realistic excellence layer. Owns the low-bandwidth, mobile-money, USSD-aware, multilingual, country-trust, and cultural-pattern standards that every African-market site is built and reviewed against. Global defaults are the floor; this skill raises the ceiling for Africa.
---

# Africa Excellence
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- Any project for an African client, regardless of which African market.
- Any project whose primary audience uses African mobile-money rails,
  3G networks, African languages, or lives in an African trust
  ecosystem.
- When reviewing a built site against Africa-calibrated standards before
  launch.
- When auditing a site that was built against global defaults and needs
  an Africa-specific upgrade.

## Do not use when
- The project's primary audience is not in an African market and will
  not encounter African mobile-money, USSD, or language contexts. Use
  sector-strategies and design-system defaults instead.
- Working on infrastructure that is shared globally and Africa
  calibration is already applied (the Phase 10 3G performance profile
  is an example — that is owned by `deploy/references/africa-calibration.md`
  and does not need duplication here).

## Core contract

Every site in scope is built and reviewed against six standards owned
by this skill:

1. **Low-bandwidth performance** — beyond the global defaults; AVIF
   first, font-subsetting per language, aggressive critical-CSS,
   Save-Data honouring. See `references/low-bandwidth-patterns.md`.
2. **Mobile-money UX** — if the site takes money, it meets the regional
   mobile-money provider patterns (M-Pesa, MoMo, Airtel Money, Orange
   Money, Wave, Flutterwave, Paystack) and formats currency without
   ambiguity. See `references/mobile-money-ux.md`.
3. **USSD-aware design** — where a feature has a USSD counterpart for
   feature-phone users, the web flow parallels and respects the USSD
   flow. See `references/ussd-aware-design.md`.
4. **Multilingual depth** — beyond "English + French"; Kiswahili,
   Luganda, Amharic, Yoruba, Hausa, Zulu, Twi, Wolof, Arabic, and
   Tifinagh are treated as first-class when the market requires. See
   `references/african-language-pack.md`.
5. **Country-specific trust signals** — regulator badges, association
   memberships, payment provider badges, and local certifications per
   market. See `references/africa-trust-signals.md`.
6. **Cultural patterns** — hierarchy of testimonials, family/community
   framing, photography conventions, and market-specific formality vs
   warmth. See `references/cultural-patterns.md`.

## Workflow

1. **Classify the market.** Identify the primary country and any
   secondary markets. Record in the strategy brief.
2. **Apply the six standards** to the design-system, page-build, SEO,
   and deploy work. Each reference states how the standard flows into
   the respective build skill.
3. **Review against references** at visual-QA and design-quality-score
   time. The rubric's category 6 (trust-signal placement) and category
   7 (section originality) take their Africa-specific instantiation
   from this skill.
4. **Verify at launch** on a real throttled 3G device or emulated
   profile in at least one African market on a local mobile-money
   provider rail (where payments are in scope).
5. **Document variance.** Where a client requires deviation from an
   Africa-excellence pattern (e.g. a global SaaS targeting African
   enterprise buyers who use cards, not mobile money), record the
   deviation in a decision entry.

## Required inputs

- Primary and secondary African markets.
- Payment rails in scope.
- Primary and secondary languages.
- Feature-phone relevance (does a USSD counterpart exist?).
- Client's sector and regulatory posture.

## Quality standards

- 3G-throttled profile loads the primary route under the 350 KB budget
  and LCP ≤ 2.5 s. The Phase 10 performance gate enforces this; this
  skill raises the bar where the gate permits.
- AVIF is the first image format; WebP the fallback; JPEG only when
  forced.
- Critical CSS is inlined; all other CSS is lazy.
- Fonts are subsetted per language actually shipped on the site.
- Currency formatting uses the ISO-4217 code (UGX, KES, NGN, GHS, ZAR,
  RWF, TZS, XOF, XAF) with no leading-zero ambiguity.
- Mobile-money UX surfaces provider choice before payment prompt and
  handles STK push, USSD prompt, and manual paybill flows distinctly.
- Trust badges are real and current; regulator badges link to the
  regulator.
- Testimonials prefer community framing where the market responds to
  community over individual testimony.

## Anti-patterns

- Using global SaaS visual defaults (purple-to-blue gradient,
  diverse-office-stock photos) for African clients. These fail the
  design-quality rubric's originality category.
- Shipping a mobile-money-enabled flow that only covers one provider
  when the market has several large providers.
- Assuming "English" is sufficient language coverage in markets where
  the buyer or end-user primarily operates in another language at home
  or at work.
- Ignoring feature-phone users in markets where smartphone penetration
  is < 70%. The site may not reach them, but the flow should not break
  when a feature-phone user is on the call with a smartphone user.
- Copy-pasting a Kenyan-market site into a Ugandan-market site without
  revisiting trust signals and currency.
- Applying a Lagos cultural-tone template to a Kampala build or vice
  versa without verification.

## Outputs

- Every primary template reviewed against the six references before
  launch.
- A recorded Africa-excellence audit line in the project's launch log.
- A decision entry for any deviation from the references.
- Inputs to the design-quality-score rubric categories 6 and 7
  (trust-signal placement, section originality) that reflect the
  market.

## References

- `references/low-bandwidth-patterns.md` — performance patterns beyond
  the global defaults.
- `references/mobile-money-ux.md` — regional mobile-money providers,
  STK push / USSD / manual flows, reconciliation UX, currency
  formatting.
- `references/ussd-aware-design.md` — when and how the web flow must
  respect a USSD counterpart.
- `references/african-language-pack.md` — the 10 first-class African
  languages: font support, expansion ratios, RTL rules.
- `references/africa-trust-signals.md` — regulator, association,
  payment-provider, and cultural trust signals per market.
- `references/cultural-patterns.md` — testimony hierarchy, photography
  conventions, formality vs warmth by market.

## Notes

- This skill composes with `sector-strategies` (sector rules) and
  `design-system` (visual tokens), not instead of them. Global defaults
  still apply; this skill adds and sometimes overrides.
- The Phase 10 performance gate and this skill share a heritage but
  have different scopes: the gate enforces a numeric threshold; this
  skill defines pattern practice.
- The benchmark library (Phase 12) will include at least one site per
  major African sub-region against this skill.

