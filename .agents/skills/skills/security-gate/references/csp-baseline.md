# Security Header and CSP Baseline

The engine's baseline for security headers on every shipped static site.
The canonical security gate validates the deployed site against this
baseline.

Headers are preferably set at the edge (Nginx vhost, Cloudflare Worker,
Caddy config). Framework middleware is acceptable when the project has no
edge, but edge is preferred for fastest response and for isolation from
the framework.

## Mandatory Headers

### `Strict-Transport-Security`

```
Strict-Transport-Security: max-age=63072000; includeSubDomains; preload
```

- `max-age=63072000` (two years).
- `includeSubDomains` unless a subdomain cannot support HTTPS (rare and a
  review flag).
- `preload` after verifying the domain is eligible at
  https://hstspreload.org/.
- Disabling HSTS for a migration requires a documented end date in
  `project-log/decisions/`.

### `X-Frame-Options`

```
X-Frame-Options: DENY
```

- `DENY` by default; `SAMEORIGIN` only when the site intentionally embeds
  itself (embed widgets).
- Superseded by the CSP `frame-ancestors` directive for modern browsers;
  both are set for defence in depth.

### `X-Content-Type-Options`

```
X-Content-Type-Options: nosniff
```

Always on. No exceptions.

### `Referrer-Policy`

```
Referrer-Policy: strict-origin-when-cross-origin
```

Default for marketing sites. Sites with unusually sensitive referrers (e.g.
health content) use `same-origin`.

### `Permissions-Policy`

```
Permissions-Policy: accelerometer=(), autoplay=(), camera=(), display-capture=(), fullscreen=(self), geolocation=(), gyroscope=(), magnetometer=(), microphone=(), midi=(), payment=(), picture-in-picture=(self), sync-xhr=(), usb=()
```

Enables only what the site actually uses. The default is deny-all; features
required by a page are opted in per-feature.

### `Content-Security-Policy`

See "CSP Baseline" below.

### `Cross-Origin-Opener-Policy`

```
Cross-Origin-Opener-Policy: same-origin
```

Protects against cross-origin popup attacks. Required.

### `Cross-Origin-Resource-Policy`

```
Cross-Origin-Resource-Policy: same-origin
```

Static marketing sites rarely need cross-origin embedding; same-origin is
the default.

### `Cross-Origin-Embedder-Policy`

Left unset for static marketing sites unless the site uses SharedArrayBuffer.
Setting `require-corp` breaks many legitimate embeds without benefit for
typical marketing content.

## CSP Baseline

```
Content-Security-Policy: default-src 'self'; \
  script-src 'self'; \
  style-src 'self'; \
  img-src 'self' data: https:; \
  font-src 'self' data:; \
  connect-src 'self'; \
  frame-src 'none'; \
  frame-ancestors 'none'; \
  form-action 'self'; \
  base-uri 'self'; \
  object-src 'none'; \
  upgrade-insecure-requests; \
  report-to csp-endpoint
```

Rules:

- **No `'unsafe-inline'` as a permanent position.** Transitional uses of
  `'unsafe-inline'` document the removal date in `project-log/decisions/`.
- **No `'unsafe-eval'` ever.** If a library requires it, the library is
  replaced.
- **Nonces over hashes for dynamic inline scripts.** Nonces are generated
  per response.
- **Report-only CSP in staging** with a broader allowlist so production CSP
  can be validated against real traffic before promotion.
- **Per-directive deliberate overrides**: when `img-src` must include
  `https://maps.googleapis.com`, the addition is documented with the
  third-party entry in `.third-party-allowed`.

### Report Endpoint

Set up `report-to` and `report-uri` so violations are captured:

```
Report-To: {"group":"csp-endpoint","max_age":10886400,"endpoints":[{"url":"https://<domain>/csp-report"}]}
```

Route `/csp-report` to a logger (self-hosted Sentry, lightweight PHP handler,
or a tiny edge function). Keep the data for 30 days minimum.

## Cookie Policy

- `SameSite=Lax` default; `Strict` for auth and session cookies.
- `Secure` on every cookie.
- `HttpOnly` on any cookie that is not read by client-side JavaScript.
- Max-age no longer than strictly required.
- Cookie names avoid PII; a session ID is opaque, not meaningful.

## Enforcement Paths

Two supported enforcement paths:

### A. Nginx (recommended for self-hosted deployments)

```nginx
server {
    add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload" always;
    add_header X-Frame-Options "DENY" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;
    add_header Permissions-Policy "accelerometer=(), autoplay=(), camera=(), display-capture=(), geolocation=(), microphone=(), payment=()" always;
    add_header Content-Security-Policy "default-src 'self'; script-src 'self'; style-src 'self'; img-src 'self' data: https:; font-src 'self' data:; connect-src 'self'; frame-ancestors 'none'; form-action 'self'; base-uri 'self'; object-src 'none'; upgrade-insecure-requests" always;
    add_header Cross-Origin-Opener-Policy "same-origin" always;
    add_header Cross-Origin-Resource-Policy "same-origin" always;
}
```

### B. Cloudflare (recommended for CDN-fronted deployments)

Use Transform Rules > HTTP Response Header Modification, or a Worker that
adds the same set of headers. Document the ruleset name in
`project-log/decisions/` and keep a copy of the rule JSON in the repo at
`deploy/references/cloudflare-security-rules.json` (if used).

## Verification

The canonical security gate runs `scripts/check-security-headers.sh` which
hits every primary route on the preview and asserts each header is present
with the expected value. In CI, the same check is also run against the
staging URL.

After deploy, `scripts/post-deploy-smoke.sh` re-checks headers on the
production URL.

## When a Header Cannot Be Set

Some shared-hosting environments disable header overrides. Before accepting
the constraint:

1. Escalate to the client with the security risk.
2. Evaluate moving to a static host that supports headers (Cloudflare
   Pages, Netlify, self-hosted Nginx).
3. If the constraint is accepted, document in
   `project-log/decisions/` with a review date.

## Reading

- OWASP Secure Headers Project: https://owasp.org/www-project-secure-headers/
- Mozilla Observatory: https://observatory.mozilla.org/
- *The Tangled Web* by Michal Zalewski — the foundational model this
  baseline is grounded in.
- `deploy/references/deployment-runbook.md` — where headers are actually
  configured per hosting path.
