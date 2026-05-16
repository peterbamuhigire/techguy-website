# Error Tracking

**Read this when**: wiring error tracking into a new client site or
investigating a persistent error signature.

**Purpose**: Define the Sentry (default) integration contract every
shipped site honours so JavaScript, network, and server-rendering errors
are visible on day one.

## Provider

Default: **Sentry** (self-hosted or hosted; SaaS plan chosen per client).

Approved alternatives (with decision entry): Rollbar, Bugsnag, Datadog
Error Tracking. The alternative must support:

- Project-scoped DSN
- Release tagging
- Private source-map upload in CI
- PII scrubbing via configurable rules
- Rate-alerting

Do not use browser-only stack trackers. Server-side errors are part of
the contract — static-site builders still have adapters and middleware
that fail.

## Project scoping

- One Sentry project per client project. No shared projects across
  clients; cross-client leakage is unethical and breaks the retention
  contract.
- DSN stored in environment variables, never committed.
- Environment tag set to `production` on the deployed site; `preview`
  on PR previews; `local` never reports.

## Release tagging

Every deploy tags a release. Release identifier format:
`<client-slug>@<commit-sha-short>`.

Without release tagging, alerts collapse into a wall of regressions and
nobody can identify the change that introduced a new signature.

## Source maps

- Source maps are built but **not** deployed publicly.
- CI uploads source maps privately to Sentry on every release.
- `security-gate` verifies no `.map` files are present in `dist/` at
  deploy time.

## Breadcrumbs

Default breadcrumb categories:

- `navigation` — route changes
- `http` — fetch / XHR requests
- `ui.click` — sampled click trail
- `console` — warnings and errors only; never log PII

Do not add custom breadcrumbs without reviewing the PII scrubbing rules.

## PII scrubbing

- No email addresses, phone numbers, national-ID numbers, or full names
  in breadcrumbs or extra context.
- Strip query strings from URLs before reporting (some clients include
  emails in URLs).
- The Sentry DSN config sets `sendDefaultPii: false`.

For forms with potentially sensitive fields, the form component must
explicitly opt into redacting values. See
`form-ux-design/references/data-privacy.md` for the contract.

## Rate limiting and alerting

Thresholds live in `alert-thresholds.md`. Summary:

- Any new error signature > 10 events/hour: warning.
- JS error rate > 1% of sessions over 24 h: blocking alert.
- Third-party script failure rate > 5%: warning.

## Install pattern (Astro example)

```js
// src/sentry.client.ts
import * as Sentry from '@sentry/astro';

Sentry.init({
  dsn: import.meta.env.PUBLIC_SENTRY_DSN,
  environment: import.meta.env.MODE,
  release: `${import.meta.env.PUBLIC_SITE_SLUG}@${import.meta.env.PUBLIC_COMMIT_SHA}`,
  sendDefaultPii: false,
  tracesSampleRate: 0.1,
  beforeSend(event) {
    if (event.request?.url) {
      event.request.url = event.request.url.split('?')[0];
    }
    return event;
  }
});
```

Server-side (Node adapter):

```js
// src/sentry.server.ts
import * as Sentry from '@sentry/node';
Sentry.init({
  dsn: process.env.SENTRY_DSN,
  environment: process.env.NODE_ENV,
  release: `${process.env.SITE_SLUG}@${process.env.COMMIT_SHA}`,
  sendDefaultPii: false
});
```

## CI source-map upload

In the canonical CI, add a post-build step (not a separate gate):

```yaml
- name: Upload source maps to Sentry
  if: github.ref == 'refs/heads/main' && github.event_name == 'push'
  env:
    SENTRY_AUTH_TOKEN: ${{ secrets.SENTRY_AUTH_TOKEN }}
    SENTRY_ORG: ${{ vars.SENTRY_ORG }}
    SENTRY_PROJECT: ${{ vars.SENTRY_PROJECT }}
  run: |
    npx @sentry/cli releases new "$SITE_SLUG@$GITHUB_SHA"
    npx @sentry/cli releases files "$SITE_SLUG@$GITHUB_SHA" upload-sourcemaps ./dist --url-prefix '~/' --validate
    npx @sentry/cli releases finalize "$SITE_SLUG@$GITHUB_SHA"
```

## Verification at launch

- Open the site in production and trigger a deliberate error in the
  browser console with the operator's debug helper; confirm it lands in
  Sentry with the correct environment and release tag.
- Confirm the source map resolves the error to the original file.
- Confirm PII is absent from the event.

## Incident response

When a blocking alert fires:

1. Check the release tag against the last deploy.
2. If regression is within 24 hours of deploy, consider rollback per
   `deploy/references/rollback-runbook.md`.
3. Otherwise, open an incident in `project-log/incidents/` and assign an
   owner.
4. Close the loop by adding a reference in the next monthly report.
