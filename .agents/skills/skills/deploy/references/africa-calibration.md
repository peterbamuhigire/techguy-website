# Africa-Realistic Gate Calibration

The enforcement gates are only premium if they reflect the conditions the
site's actual users face. This reference is how the engine calibrates
Lighthouse budgets, network profiles, image budgets, and feature behaviour
for the African market. The full pattern library is in
`africa-excellence/SKILL.md`; this file is the calibration-specific subset
consumed by the Phase 10 gates.

## Network Profile

| Parameter | Value | Source |
|---|---|---|
| Downlink | 1638 Kbps (~1.6 Mbps) | African 3G median 2023-2025 telco data |
| Uplink | 750 Kbps | same |
| RTT | 300 ms | typical last-mile latency on African 3G |
| CPU slowdown (simulate) | 4x | Moto G4-class devices, still widespread in the region |

These values are committed to `performance-budgets.json` under
`network_profile`. The Lighthouse config uses the same profile.

Rationale: measuring on a Stockholm fibre connection gives scores that do
not predict actual user experience. A premium engine for Africa measures
on what users have.

## Weight Budget

Total per-route first-load budget: **350 KB** including HTML, CSS, JS, and
the largest above-the-fold image after compression. Inline breakdown:

- HTML: 30 KB gzip
- CSS: 30 KB gzip
- JS: 80 KB gzip (60 KB on `/`)
- Fonts: 80 KB total per page
- Above-fold image: 200 KB after compression (AVIF primary)
- Icons and remaining inline assets: 20 KB

`scripts/perf-gate.sh` enforces the weight budget at build time.

## Low-Bandwidth Fallback

Every interactive feature must degrade gracefully on a connection that
intermittently drops to 2G (256 Kbps). This is not hypothetical — mobile
network quality fluctuates across African markets, and a premium site
earns its reputation on the worst-case commute, not the studio wi-fi.

Required behaviours:

- Form submit retries transparently on network flap.
- Form content preserved on navigation.
- Non-critical images lazy-loaded with `loading="lazy"`.
- No feature *requires* a CDN asset to function; degraded state is never
  a white page.
- Progressive enhancement: every CTA that triggers JS also works via a
  server round-trip (form submit, full-page nav).

## Data-Cost Respect

Africa still prices data per-megabyte on many plans. The engine enforces:

- No autoplay video, muted or not, above the fold on mobile.
- No preload of non-critical assets.
- No unsolicited downloads (e.g. PDF brochures on hover).
- `Save-Data` header honoured: when present, the site serves a reduced
  asset variant (AVIF only, no webfont variants, no LQIP blur).

## Save-Data Header Handling

Astro/Nginx pattern:

```js
// Astro middleware
export async function onRequest({ request, locals }, next) {
  if (request.headers.get('save-data') === 'on') {
    locals.saveData = true;
  }
  return next();
}
```

When `locals.saveData` is true:

- Use `fetchpriority="low"` on hero images.
- Skip web-font loading; fall back to system stack.
- Serve smaller image variants.
- Render a lightweight hero (text + link, no media).

## Device Reality

Median African mobile device (2024-2025): mid-range Android, 4GB RAM,
4-8 core SoC from ~2020. The engine tests its visual output on:

- Chrome on Android (dominant)
- Samsung Internet (widespread on Samsung Galaxy devices)
- UC Browser on feature-class Android (for sites serving USSD-adjacent
  audiences)
- Safari on iPhone (SE and earlier iPhones still common)

Playwright covers Chromium + WebKit; real-device testing against BrowserStack
or a physical Samsung Galaxy A-series device is recommended for launch.

## Language and Locale

- Primary languages: English, French, Kiswahili, with project-specific
  additions (Luganda, Amharic, Yoruba, Hausa, Zulu, Arabic for North Africa).
- Font subsetting is critical. Arabic adds ~150 KB to a typical font; subset
  per language and do not ship a pan-African font bundle.
- Currency formatting must respect locale: UGX and KES have no decimals in
  many UI contexts; NGN has decimals but kobos are unusual in display.

## Trust Signals

Country-specific trust signals raise conversion and are enforced per sector
in `africa-excellence/references/africa-trust-signals.md`. Examples:

- Uganda: URSB registration number on footer, PDPO registration statement,
  mobile money logos on pricing pages.
- Kenya: KEBS certification (sector-dependent), ODPC compliance statement,
  M-Pesa logo on pricing.
- Nigeria: CAC number, NDPC compliance, payment-gateway logos (Paystack,
  Flutterwave).
- South Africa: Information Regulator statement, PAIA manual link,
  ZA payment logos (PayFast, Zapper).

## Gate Implications

The Phase 10 gates reference this calibration:

- `perf-gate.sh` → uses `performance-budgets.json` weight budgets and
  Lighthouse 3G throttling
- `a11y-gate.sh` → tests reading order in at least English and one other
  project language
- `visual-qa.sh` → captures at 375 wide (African mobile median) as the
  first baseline
- `security-gate.sh` → compliance matrix covers Uganda DPPA, Kenya DPA,
  Nigeria DPA 2023, POPIA, GDPR

## Calibration Review Cadence

Review this calibration annually or when any of the following changes:

- Median connection speed in the client's primary market shifts by more
  than 25%.
- A major device platform's market share crosses 10%.
- A new data-protection law is enacted in a target market.

Document revisions in `project-log/decisions/`.

## Reading

- GSMA Mobile Economy Report (latest annual).
- Opensignal Mobile Network Experience Report (latest annual).
- DataReportal Digital Reports for key countries (annual).
- `africa-excellence/references/low-bandwidth-patterns.md` — full pattern
  library.
- `performance-budgets.json` — machine-readable version of the budget.
