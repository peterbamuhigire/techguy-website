# RUM Implementation

**Read this when**: adding real-user monitoring to a new client site or
auditing an existing implementation.

**Purpose**: Define the exact Real User Monitoring (RUM) contract every
shipped site must honour: library, metrics, endpoint shape, sampling, and
Africa-calibration handling.

## Library

Use [`web-vitals`](https://github.com/GoogleChrome/web-vitals) (npm
package). The version is pinned at the client-project level; upgrades are
decision entries.

Do not roll a bespoke RUM collector. Drift from the engine's analytics
event contract is the primary risk.

## Metrics collected

Baseline contract — every site reports these four:

1. **LCP** (Largest Contentful Paint)
2. **INP** (Interaction to Next Paint)
3. **CLS** (Cumulative Layout Shift)
4. **navigation-type** (from `PerformanceNavigationTiming.type`)

Extended contract — retainer clients additionally report:

5. **TTFB** (Time to First Byte)
6. **FCP** (First Contentful Paint)

Do not report a custom field without adding it to the endpoint schema
and the analytics-event-map.

## Endpoint contract

Payload shape (JSON POST):

```json
{
  "site": "<site-slug>",
  "route": "/<route>",
  "metric": "LCP",
  "value": 2250,
  "rating": "good",
  "id": "<web-vitals id>",
  "navigation_type": "navigate",
  "connection": "3g",
  "save_data": false,
  "ts": "2026-04-16T12:34:56Z"
}
```

- `site` is the client slug; must match the project's slug in the
  scorecard.
- `route` is the path, not the full URL; strip query strings.
- `connection` is taken from `navigator.connection.effectiveType`; may be
  absent on some browsers.
- `save_data` is `navigator.connection.saveData`.

## Self-hosted vs provider

Default: self-hosted endpoint at the agency's observability host. Benefits:
no per-pageview cost, full control of data retention, Africa-friendly
latency.

Provider alternatives (allowed with a decision entry): Datadog RUM,
SpeedCurve LUX, Cloudflare Web Analytics. The provider must expose the
payload through an API the `monthly-report` skill can query.

## Sampling

- Default sampling rate: **100%** for sites under 100k pageviews/month.
- Above 100k: sample 50%, upper-sampling the long tail by prioritising
  `save_data: true` sessions at 100%.
- Never sample lower than 50%. Africa traffic is long-tail; aggressive
  sampling hides the population the engine exists to serve.

## Save-Data handling

When `navigator.connection.saveData === true`:

- Still report RUM metrics (these sessions are the most valuable
  signal).
- Disable any non-RUM third-party script that adds weight.
- Defer analytics-event firing to page-idle to avoid competing with
  content.

## Consent

- In jurisdictions where analytics consent is required (EU, UK, and
  Nigeria NDPR for personal data), wire consent through the analytics
  provider's built-in banner.
- RUM payload does not include PII by default; it is metric data only.
  Confirm with the client's legal position before shipping.
- The `policy-pages` skill owns the privacy page language.

## Install pattern

Minimal JS in the client project (adapt framework):

```js
import { onLCP, onINP, onCLS, onTTFB, onFCP } from 'web-vitals';

const send = (metric) => {
  const body = JSON.stringify({
    site: import.meta.env.PUBLIC_SITE_SLUG,
    route: location.pathname,
    metric: metric.name,
    value: Math.round(metric.value),
    rating: metric.rating,
    id: metric.id,
    navigation_type: metric.navigationType,
    connection: navigator.connection?.effectiveType,
    save_data: !!navigator.connection?.saveData,
    ts: new Date().toISOString()
  });
  if (navigator.sendBeacon) {
    navigator.sendBeacon(import.meta.env.PUBLIC_RUM_ENDPOINT, body);
  } else {
    fetch(import.meta.env.PUBLIC_RUM_ENDPOINT, { method: 'POST', body, keepalive: true });
  }
};

[onLCP, onINP, onCLS, onTTFB, onFCP].forEach((fn) => fn(send));
```

Notes:
- Use `sendBeacon` where available; it survives page unload.
- `PUBLIC_RUM_ENDPOINT` is set per project in environment.
- Do not report on file-system builds or in preview environments unless
  the operator has opted in for debugging.

## Verification at launch

Post-deploy smoke must confirm:

1. At least one LCP report lands within 60 seconds of the smoke visit.
2. The `site` slug matches the scorecard entry for this project.
3. No PII fields present.
4. Endpoint returns 204 for healthy posts.

If any of the above fails, the launch is not complete.

## Monthly audit

At month-end:

- Confirm the scorecard row reflects data from the full month.
- Identify routes with < 100 reports (coverage gap) and either increase
  traffic (SEO work) or drop the route from the scorecard baseline.
- Confirm no unexpected fields are appearing in the payload
  (schema-drift indicator).
