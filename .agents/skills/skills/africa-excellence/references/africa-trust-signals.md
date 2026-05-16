# Africa Trust Signals

**Read this when**: selecting, placing, or auditing trust signals for
an African-market site. Also consulted at design-quality-score time
for the rubric's trust-signal placement category.

**Purpose**: Market-specific regulator, association, payment-provider,
and certification badges that genuinely signal trust in each African
market, plus the cultural display conventions that make them credible.

## Kenya

### Regulator and association signals
- **Communications Authority of Kenya (CA)** — for telco-linked
  services.
- **Central Bank of Kenya (CBK)** — banking, mobile-money-facing
  fintech, SACCO-linked services.
- **Capital Markets Authority (CMA)** — investment, securities.
- **Kenya Revenue Authority (KRA) PIN visible** — standard trust
  signal on B2B services.
- **Private Sector Alliance (KEPSA)** — business membership.
- **Nairobi Securities Exchange listing** — where applicable.
- **Kenya ICT Action Network / KICTANet membership** — tech sector.

### Payment provider badges
- M-Pesa (Safaricom logo; licensed use only — confirm with Safaricom).
- Airtel Money.
- Pesapal, Flutterwave, Paystack aggregator badges where used.

### Display conventions
- Badges near the primary CTA, not only in the footer.
- KRA PIN in the footer with the company name.
- Address with pin location; Kenyan buyers expect a specific street
  address, not only a PO box.

## Uganda

### Regulator and association signals
- **Uganda Communications Commission (UCC)** — telco, broadcasting.
- **Bank of Uganda (BoU)** — banks and mobile-money-facing fintech.
- **Uganda Revenue Authority (URA) TIN visible** — standard on B2B.
- **Uganda Law Society** — for legal services.
- **Uganda Medical and Dental Practitioners Council** — health.
- **Private Sector Foundation Uganda (PSFU)** — business membership.
- **National Information Technology Authority (NITA-U)** — tech and
  data-handling services.

### Payment provider badges
- MTN MoMo.
- Airtel Money.
- Pesapal, Flutterwave where used.

### Display conventions
- TIN in the footer.
- Physical address with plot/street number.
- If ISO-certified, the ISO mark with year and standard.

## Nigeria

### Regulator and association signals
- **Central Bank of Nigeria (CBN)** — banking, fintech, payments.
- **Securities and Exchange Commission (SEC Nigeria)** — capital
  markets.
- **National Information Technology Development Agency (NITDA)** —
  data-handling, NDPR compliance.
- **Nigeria Communications Commission (NCC)** — telco.
- **Corporate Affairs Commission (CAC) registration number** — every
  legitimate business should display this.
- **Nigerian Bar Association** — legal.
- **Medical and Dental Council of Nigeria** — health.

### Payment provider badges
- Paystack.
- Flutterwave.
- Interswitch (Verve card network).
- Bank card networks (Visa, Mastercard) where applicable.

### Display conventions
- CAC registration number in the footer.
- NDPR data-handling statement linked from the footer.
- Clear separation between Lagos, Abuja, Port Harcourt and other
  regional presence.

## Ghana

### Regulator and association signals
- **Bank of Ghana (BoG)**.
- **National Communications Authority (NCA)**.
- **Ghana Revenue Authority (GRA)** TIN visible.
- **Data Protection Commission** registration.

### Payment provider badges
- MTN MoMo, AirtelTigo Money, Vodafone Cash.
- Flutterwave, Paystack.

### Display conventions
- Ghana Digital Address (the GhanaPostGPS code) alongside the street
  address when in-person presence matters (clinic, clinic-like
  services, physical retail).

## Rwanda

### Regulator and association signals
- **National Bank of Rwanda (BNR)**.
- **Rwanda Utilities Regulatory Authority (RURA)** — telco and
  broadcasting.
- **Rwanda Revenue Authority (RRA)** TIN.
- **Private Sector Federation (PSF)** membership.

### Payment provider badges
- MTN MoMo, Airtel Money.
- Flutterwave, Pesapal.

### Display conventions
- Kigali's orderly street numbering means specific addresses are
  credible; use them.

## Tanzania

### Regulator and association signals
- **Bank of Tanzania (BoT)**.
- **Tanzania Communications Regulatory Authority (TCRA)**.
- **Tanzania Revenue Authority (TRA)** TIN.

### Payment provider badges
- M-Pesa (Vodacom), Tigo Pesa, Airtel Money.
- Selcom aggregator.

## South Africa

### Regulator and association signals
- **South African Reserve Bank (SARB)**.
- **Information Regulator (POPIA)**.
- **Financial Sector Conduct Authority (FSCA)**.
- **Companies and Intellectual Property Commission (CIPC)** number.
- **B-BBEE level certificate** — where the buyer's procurement rules
  require it.

### Payment provider badges
- Payfast, Peach Payments, Yoco.
- SnapScan, Zapper.
- Card networks (Visa, Mastercard).

### Display conventions
- CIPC registration number in the footer.
- POPIA compliance statement linked from the footer.

## Ethiopia

### Regulator and association signals
- **National Bank of Ethiopia (NBE)**.
- **Ethiopian Communications Authority**.

### Payment provider badges
- Telebirr.
- Chapa, ArifPay aggregators.

## General display rules (across markets)

- **Real, not decorative.** Every badge links to the regulator or
  provider's site where a public register exists.
- **Current.** A 2019-dated certificate on a 2026 page is drift;
  renew or remove.
- **Proportional.** Badges are ~40–60 px tall on desktop, not hero-
  sized.
- **Clustered.** Trust signals live in at least two places: above the
  fold (abstract — "Regulated by X") and near the primary CTA
  (specific — badges, testimonials).
- **No generic "SSL" badges.** TLS is table-stakes; do not badge it.
- **No "As seen on" without the link.** If the publication is named,
  the link is real.

## Cultural trust patterns

Some markets respond more strongly to these than to regulator badges:

- **Family-business longevity.** "Since 1987" or "Third-generation"
  reads strongly in much of the region; display prominently if true.
- **Named founder with photo.** Buyers in Uganda, Kenya, Nigeria,
  Ghana expect to see the person. Namelessness reads as a scam.
- **Known-associate testimonials.** A testimonial from a named
  business the buyer recognises is stronger than a star rating.
- **Community endorsement.** In many markets, a church/mosque
  leader, a university, or an NGO endorsement signals more than a
  trade association.

Apply these per `cultural-patterns.md`; they are market-specific.

## Rule of currency

Never ship an African site without:

- The company registration number (local equivalent of CAC/CIPC/URSB/etc.).
- The tax number (TIN, PIN, or equivalent).
- A physical street address or pin location.
- A phone number that works (tested).
- A human email address that works (tested).

Missing any of these silently signals "not a real company."
