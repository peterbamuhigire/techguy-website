# Analytics Integration

**Read this when**: provisioning analytics for a new client site or
auditing an existing implementation.

**Purpose**: Define the Plausible and GA4 integration patterns that every
shipped site uses, the event taxonomy contract, and the rules that keep
the `monthly-report` skill trustworthy.

## Provider choice

Default: **Plausible** (self-hosted or hosted).

- Lightweight (~1 KB script), cookie-less, GDPR/NDPR-friendly by default,
  good fit for Africa-calibrated performance budgets.

Allowed alternative: **GA4** when the client needs Google Ads
attribution or has an existing GA property. Configure for cookieless
mode where the jurisdiction requires.

Banned: Facebook Pixel as primary analytics. Remarketing pixels, if
required, are added after consent and are not the source of truth.

Either way, the provider choice is captured in a decision entry.

## Event taxonomy — the contract

The event set every site must implement is defined in
`seo/references/analytics-event-map.md`. The observability skill does
not define events; it enforces that the implementation matches the map.

Baseline events (every site):

- `pageview` — automatic; not emitted manually.
- `primary_cta_click` — the single most important CTA per route.
- `secondary_cta_click` — secondary CTAs.
- `form_submission_start` — the user begins the primary form.
- `form_submission_success` — the primary form submitted successfully.
- `form_submission_failure` — validation or server error.
- `outbound_link` — clicks that leave the domain.
- `file_download` — PDFs, brand assets, etc.

Retainer-client extensions: lead-scoring events, segment events, custom
goals. Always added to the event map first, then implemented.

## Plausible install

```html
<script defer
        data-domain="example.co.ug"
        data-api="/api/event"
        src="/js/script.js"></script>
```

Notes:
- Self-host the `script.js` and `/api/event` endpoint to keep the site
  on the agency's privacy posture and reduce third-party weight.
- `data-domain` must match the production hostname, not staging.

Custom-event firing:

```js
window.plausible?.('primary_cta_click', {
  props: { location: 'hero', variant: 'default' }
});
```

## GA4 install

```html
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXX', {
    anonymize_ip: true,
    allow_google_signals: false,
    allow_ad_personalization_signals: false
  });
</script>
```

Custom-event firing:

```js
gtag('event', 'primary_cta_click', {
  location: 'hero',
  variant: 'default'
});
```

## Consent handling

- EU and UK: consent required before GA4; Plausible is consent-free.
- Nigeria NDPR: consent required for personally identifiable processing;
  Plausible without custom props is consent-free.
- Kenya (DPA 2019), Uganda (DPA 2019), South Africa (POPIA): consent
  required for tracking that identifies individuals; aggregate analytics
  with no PII is exempt per local precedent — see
  `policy-pages/references/privacy-content.md`.

When consent is required:
- Default-off. Events fire only after consent is granted.
- Consent banner from the `policy-pages` skill; analytics skill does not
  own the banner copy.

## Campaign tracking

- UTM parameters are respected but never stored in analytics extras
  that could identify a person.
- Referrer is stripped of query strings before being reported.
- Cross-domain tracking is off by default; only enabled by decision
  entry.

## Verification at launch

- Fire every event in the analytics-event-map manually on the
  production site; confirm each appears in the provider dashboard.
- Confirm the primary-CTA event fires once per click, not twice.
- Confirm outbound-link tracking does not double-fire on middle-click
  or keyboard-activated navigation.

## Source reachability for monthly-report

The `monthly-report` skill pre-flights the analytics source before
rendering. Each provider exposes the check differently:

- Plausible: hit `/api/v1/stats/aggregate` with the site API key; 200
  on success.
- GA4: run a minimal Analytics Data API query with the service account;
  200 on success.

If pre-flight fails, the report refuses to render. This is by design.

## Retention

- Plausible: retention defined at provisioning; default 24 months.
- GA4: default 14 months; may be extended per client contract.
- Every retention decision is logged in a decision entry.

## Cross-reference

- `seo/references/analytics-event-map.md` — event contract.
- `alert-thresholds.md` — analytics source reachability.
- `policy-pages/references/privacy-content.md` — privacy page language.
