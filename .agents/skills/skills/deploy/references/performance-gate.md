# Performance Gate — Reference

Canonical reference for the performance enforcement layer introduced in Phase 10
Workstream 1 of the website-agency-engine roadmap. The gate is the only
machine-enforceable answer to the question "is this site fast enough to ship?"

## Canonical Command

```bash
# From a client project root with .claude/skills/ submodule
bash .claude/skills/scripts/perf-gate.sh
```

The script:
1. Starts a static preview on `:4321` against `./dist/`.
2. Runs Lighthouse CI with `lighthouserc.json`.
3. Asserts route weight against `performance-budgets.json`.
4. Writes machine-readable results under `reports/lighthouse/` and `reports/bundle/`.
5. Exits non-zero on any failure; the deploy job must depend on `perf-gate`.

## Thresholds That Block Deploy

| Category | Threshold | Applies to |
|---|---|---|
| Performance | >= 95 | every primary route |
| Accessibility | >= 95 | every primary route |
| Best Practices | >= 95 | every primary route |
| SEO | = 100 | every primary route |
| LCP | <= 2.0s | simulated 3G mobile |
| INP | <= 200ms | every interactive route |
| CLS | <= 0.1 | every route |
| JS (gzip, first load) | <= 80 KB | per route (60 KB for `/`) |
| CSS (gzip, first load) | <= 30 KB | per route |
| Above-fold image | <= 200 KB | after compression |
| Total page weight | <= 350 KB | per route on 3G first load |
| Third-party runtime JS | 0 KB | unless explicitly allowlisted |

## Network Profile

All measurements run on a simulated profile representative of African mobile
network conditions: **1.6 Mbps down, 750 Kbps up, 300 ms RTT, 4x CPU slowdown**.
This matches the `network_profile` block in `performance-budgets.json`.

Rationale: a site that scores 95 on a Stockholm fibre connection but collapses
on a Kampala 3G phone is not acceptable on a premium Africa-targeted engine.
See `africa-excellence/references/low-bandwidth-patterns.md` for the full
performance pattern library.

## Bundle Analysis Output

The build step writes the files listed in `reports/bundle/README.md`. The CI
workflow uploads them as artifacts so reviewers can diff bundle size on every
pull request.

## Third-Party JS Audit

```bash
bash .claude/skills/scripts/audit-third-party-js.sh dist .third-party-allowed
```

Default allowlist is empty. Any host that genuinely needs runtime third-party
code (analytics, map tiles) must be added to `.third-party-allowed` with a
one-line reason on the same line. Unreviewed additions are blocked.

## Font Performance

```bash
bash .claude/skills/scripts/check-font-performance.sh dist
```

Enforces:
- `font-display: swap` (or `optional`/`fallback`) on every `@font-face`
- `<link rel="preload" as="font">` on every HTML page that loads a web font
- woff2 only; no TTF/EOT/OTF in production
- total font weight under the budget in `performance-budgets.json`

## CI Integration

The canonical workflow at `templates/ci/website.yml` runs `perf-gate.sh` after
the build and before deploy. If any gate fails, deploy is skipped and the pull
request is blocked.

## When Thresholds Change

Thresholds are part of the engine contract, not project-level tuning. Do not
relax them inside `lighthouserc.json` to paper over a regression. If a new page
genuinely requires a higher budget (e.g. a map-heavy page), add a route entry to
`performance-budgets.json` with justification in the same file.

## Failure Triage

| Symptom | First place to look |
|---|---|
| LCP regression | above-fold image size, preload tags, CSS blocking |
| Bundle overshoot | route-level chunks in `reports/bundle/bundle-size.json`, unused imports |
| CLS regression | images without `width`/`height`, late-loaded fonts, injected banners |
| INP regression | hydration cost, input handler complexity, third-party scripts |
| SEO score dropped | missing meta, duplicate titles, `hreflang` gaps |

Full triage playbook: `deploy/references/ci-troubleshooting.md`.

## Related Reading

- *High Performance Browser Networking* by Ilya Grigorik — network reality and budget derivation.
- *Web Performance in Action* by Jeremy Wagner — budget enforcement in practice.
- `africa-excellence/references/low-bandwidth-patterns.md` — the patterns the gate validates.
