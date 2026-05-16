---
name: security-gate
description: CI-time security and compliance gate. Owns dependency audit, security header validation, SRI on third-party assets, secrets scan, supply-chain scan, and the Africa + GDPR compliance matrix. Runs in the canonical CI pipeline as a hard gate; any high or critical finding blocks deploy.
---

# Security Gate
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- Every build of a client site, as a CI-time gate before deploy.
- Before accepting any new third-party dependency.
- Before launching a new jurisdiction (new regulator, new data-protection law).
- During a quarterly dependency and policy review.

## Do not use when
- Conducting a full penetration test — that is out of scope; commission a
  specialist engagement.
- Designing authentication or authorisation flows for a bespoke application —
  this gate audits static marketing sites.

## Core contract
Every primary build passes:
1. Dependency audit with zero "high" and zero "critical" findings.
2. Security header validation against the baseline in
   `references/csp-baseline.md` (HSTS, X-Frame-Options, X-Content-Type-Options,
   Referrer-Policy, Permissions-Policy, CSP).
3. Subresource Integrity (SRI) hash on every third-party asset that survived
   design review.
4. Secrets scan with zero findings; any API key, token, private key, or
   credential in the repository blocks the build.
5. Supply-chain scan: lockfile integrity, package-name typosquat check,
   install-script review.
6. Compliance matrix up to date for every jurisdiction the client operates in.

Any "high" or "critical" finding blocks deploy.

## Canonical Command

```bash
bash .Codex/skills/scripts/security-gate.sh
```

The command:
1. Runs `npm audit --audit-level=high --json`.
2. Runs `scripts/check-security-headers.sh dist` against the CSP baseline.
3. Runs `scripts/check-sri.sh dist .third-party-allowed`.
4. Runs `scripts/scan-secrets.sh` against the committed tree.
5. Runs `scripts/supply-chain-check.sh` against `package-lock.json`.
6. Writes machine-readable results under `reports/security/` and a summary
   at `reports/security/summary.md`.
7. Exits non-zero on any "high" or "critical" finding.

## Workflow

1. Build the site.
2. Run the canonical command.
3. For any blocking finding:
   - upgrade the offending dependency, or
   - remove or self-host the offending third-party asset, or
   - rotate the leaked credential and purge the history, or
   - strengthen the header at the edge (Nginx, Cloudflare Worker).
4. Complete the compliance review at launch using `references/compliance-matrix.md`.
5. File `project-log/launches/<project>/security-gate.md` with the result.

## Required inputs
- `package.json` and `package-lock.json` at repo root.
- A built static output at `./dist/`.
- A live edge-config declaration (Nginx vhost, Cloudflare Worker, equivalent)
  for header validation. If headers are served from a framework middleware,
  the middleware output goes to `dist/` and is audited from there.
- The jurisdiction list for the client (e.g. "Uganda, Kenya, Nigeria").

## Quality standards
- High/critical findings are non-negotiable; no suppression on severity grounds.
- A suppression is allowed only on a specific CVE with a documented
  non-applicable path (e.g. the vulnerable function is never called). Every
  suppression has a review date within 12 months.
- Headers are verified on the deployed site, not only in configuration.
- SRI hashes are regenerated on every build; stale hashes break by design.
- Compliance matrix entries are specific to the client, not copied generically.

## Anti-patterns
- Treating `npm audit` severity as advisory.
- Disabling HSTS during "migration" without a documented end date.
- Using `'unsafe-inline'` CSP as a permanent position.
- Hosting a payment widget via an inline script without SRI.
- Assuming GDPR coverage is sufficient in Africa; each jurisdiction has its
  own data-protection act with different requirements.
- Forgetting to rotate a leaked secret because "the repo is private".

## Outputs
- `reports/security/audit.json` — dependency audit output.
- `reports/security/headers.txt` — per-route header validation.
- `reports/security/sri.txt` — SRI check result.
- `reports/security/secrets.txt` — secrets scan findings (empty on success).
- `reports/security/supply-chain.txt` — supply-chain posture.
- `reports/security/summary.md` — CI-friendly summary.
- A signed compliance note per launch.
- A blocking CI status on any high/critical finding.

## References
- `references/csp-baseline.md` — the CSP and security-header baseline.
- `references/compliance-matrix.md` — jurisdiction rules for Uganda DPPA 2019,
  Kenya Data Protection Act 2019, Nigeria NDPR, South Africa POPIA, GDPR.
- `references/dependency-policy.md` — how dependencies are added, upgraded,
  and suppressed.
- `references/secrets-response.md` — rotation, revocation, and history-rewrite
  playbook.
- `references/supply-chain.md` — typosquat detection and install-script review.

## Notes
- This gate does not replace a specialist penetration test for authenticated
  applications. For static marketing sites, this gate is sufficient as the
  ongoing CI contract.
- Work in concert with `deploy/references/deployment-runbook.md` on where the
  edge-configured headers live.
- `policy-pages/SKILL.md` produces the public-facing privacy and terms pages;
  this gate audits that they exist and that the compliance matrix they
  describe is correctly enforced.

