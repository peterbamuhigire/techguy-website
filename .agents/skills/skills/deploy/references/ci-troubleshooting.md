# CI Troubleshooting — Canonical Pipeline

Playbook for the 13-step canonical pipeline at `templates/ci/website.yml`.
Organised by the step that surfaced the failure. When a step fails, start
here before opening the reports or rerunning.

## Pipeline at a Glance

1. install — dependencies
2. lint — lint + type-check
3. unit — unit tests
4. build — produce `dist/`
5. e2e-smoke — Playwright smoke (homepage, services, contact, sitemap)
6. metadata-audit — title, description, og, hreflang
7. perf-gate — Lighthouse + budgets
8. a11y-gate — axe-core
9. visual-qa — screenshot diff + structure + slop
10. security-gate — dep audit, headers, SRI, secrets, supply-chain
11. drift-check — documentation drift
12. design-quality-score — rubric (advisory on PR, blocking on main)
13. deploy — main only, all gates green
14. post-deploy-smoke — verify production URL after deploy
15. rollback-ready — triggered on failure after deploy

## Step 1 — Install

| Symptom | Cause | Fix |
|---|---|---|
| `npm ci` fails on peer deps | lockfile drift | `rm package-lock.json && npm install`, commit the new lockfile |
| `npm ci` slow | cache miss | check cache key includes `package-lock.json`; Lighthouse CI and Playwright caches are distinct from npm |
| submodule not populated | `submodules: recursive` missing | confirm workflow `checkout@v4` uses `submodules: recursive` |
| LFS content missing | `lfs: true` missing from checkout | add `lfs: true` to the relevant jobs (build, visual-qa) |

## Step 2 — Lint / Type-check

| Symptom | Fix |
|---|---|
| TS errors in files the author did not touch | run `tsc --noEmit` locally; a dependency bump likely widened the strict surface |
| ESLint config extends a missing preset | confirm the preset is in dependencies, not devDependencies on npm publish |
| Prettier disagrees with ESLint on formatting | decide one wins; this is a project decision, not a CI decision |

## Step 3 — Unit

| Symptom | Fix |
|---|---|
| `Cannot find module '@/...'` | tsconfig/test-config path alias mismatch |
| Flake in snapshot | run twice locally; if reproducible, the snapshot is hiding a real regression |

## Step 4 — Build

| Symptom | Fix |
|---|---|
| Build OOM | increase node heap: `NODE_OPTIONS=--max-old-space-size=4096` |
| Missing env var at build time | set in workflow env block; never hardcode secrets |
| Bundle exceeds budget early | build passes, perf-gate will fail later; check `reports/bundle/` |

## Step 5 — E2E Smoke

Playwright smoke covers: `/`, `/services/`, `/contact/` (submit empty + submit valid), `/sitemap.xml`.

| Symptom | Fix |
|---|---|
| `browserType.launch: Executable doesn't exist` | `npx playwright install --with-deps chromium` in the step |
| Timeout on page load | increase timeout only after confirming the build is actually served on the port the test expects |
| Cookie banner blocking interaction | dismiss the banner in a before-each hook; do not hack it out of the build |

## Step 6 — Metadata Audit

| Symptom | Fix |
|---|---|
| Missing `<title>` on a route | fix in the layout for that route, not per-page |
| Duplicate `<title>` across routes | regenerate from the SEO skill |
| Missing `hreflang` on a multi-language site | `i18n` skill output is wrong; regenerate locales |
| Missing `og:image` | add default `og:image` in head layout; per-page overrides preferred |

## Step 7 — Perf Gate

| Symptom | Fix |
|---|---|
| LCP over 2s | above-fold image too large, blocking CSS, late-loaded font |
| CLS over 0.1 | set `width`/`height` on images; reserve space for banners and fonts |
| JS budget exceeded | open `reports/bundle/bundle-size.json`, split or remove the offending chunk |
| Lighthouse runs but no report emitted | confirm `./dist` has an `index.html` the static server can serve at `/` |
| Third-party JS flagged | add an entry to `.third-party-allowed` with a documented reason, or remove the asset |

Full reference: `deploy/references/performance-gate.md`.

## Step 8 — A11y Gate

| Symptom | Fix |
|---|---|
| `color-contrast` serious | measure in-context; adjust design-system token, never per-page |
| `landmark-one-main` | page has zero or more than one `<main>` |
| `label` serious | placeholder-as-label; add proper `<label for>` |
| `link-name` | icon-only link, add `aria-label` |
| Custom rule load failure | confirm `accessibility-audit/references/custom-checks.js` exists or delete the rule file |

Full reference: `accessibility-audit/SKILL.md`.

## Step 9 — Visual QA

| Symptom | Fix |
|---|---|
| Diff over threshold | open `reports/visual/diff/<route>/<vp>.diff.png`; fix regression or update baseline via PR |
| Structural assertion failure (heading, overflow, empty-section) | see `visual-qa/references/hierarchy-overflow-checks.md` |
| Slop-scan blocked | see `visual-qa/references/slop-rules.md` |
| Baseline not found | initial baselines not captured; run `npx playwright test --update-snapshots` on a clean local build and commit |

## Step 10 — Security Gate

| Symptom | Fix |
|---|---|
| `npm audit` high | upgrade the transitive dep; if no fix exists, document the risk in `project-log/decisions/` and pin to a safe minor |
| Missing security header | set in edge config (Cloudflare Workers, Nginx) or in the Astro middleware |
| Secret detected | rotate the credential immediately; rewrite history only if the exposure window warrants it |
| SRI failure | external script or style changed; verify with upstream, recompute hash, or move to self-hosted |

Full reference: `security-gate/SKILL.md`.

## Step 11 — Drift Check

| Symptom | Fix |
|---|---|
| Dead internal link | fix the link at the source |
| Reference to a renamed skill | update the reference; skills are renamed through `docs/deprecation-policy.md` |
| Terminology inconsistent with glossary | choose one canonical term, update the text |
| SKILL.md over 500 lines | refactor into the SKILL.md + references split |

Full reference: `docs/doc-style-guide.md`.

## Step 12 — Design Quality Score

| Symptom | Fix |
|---|---|
| Score < 8 on main | block on main (main is world-class contract); open an issue with the scorecard breakdown |
| Score < 8 on PR | advisory only; reviewer decides whether to merge |
| Rubric item flagged as subjective | the rubric is the gate, not taste; see `design-quality-score/references/scored-examples.md` |

## Step 13 — Deploy

| Symptom | Fix |
|---|---|
| SSH connection refused | host whitelist wrong; check `DEPLOY_HOST` DNS and firewall |
| `Permission denied (publickey)` | `DEPLOY_KEY` secret is missing or the public key is not in the target server's `authorized_keys` |
| Rsync writes but site does not update | atomic swap not implemented; see `deploy/references/deployment-runbook.md` |

## Step 14 — Post-deploy Smoke

Performs a minimal HTTPS GET against `PRODUCTION_URL/` and asserts:
- HTTP 200
- `<title>` present
- `<link rel="canonical">` points to the expected domain
- response time < 3s over a non-CDN path (uncached hit)

Failure triggers step 15.

## Step 15 — Rollback

Triggered on failure of deploy or post-deploy smoke. Runs
`scripts/rollback.sh`, which:
1. SSHes to the deploy host
2. Flips the `current` symlink to the previous release
3. Reloads the web server
4. Logs to `reports/deploy/rollback.log`

Full runbook: `deploy/references/rollback-runbook.md`.

## When to Open a Decision Entry

Any of these warrants an entry under `project-log/decisions/`:

- A gate threshold is adjusted for a project.
- A rule is suppressed.
- A baseline is updated for a reason other than an approved design change.
- A third-party asset is added to the allowlist.
- A deploy or rollback is executed manually.

## Getting Help

- `deploy/references/deployment-runbook.md` — deploy-specific help
- `deploy/references/rollback-runbook.md` — rollback-specific help
- `deploy/references/performance-gate.md` — perf-gate reference
- `accessibility-audit/SKILL.md` — a11y-gate reference
- `visual-qa/SKILL.md` — visual QA reference
- `security-gate/SKILL.md` — security gate reference
