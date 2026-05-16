# Dependency Policy

How dependencies are added, reviewed, upgraded, and suppressed. The canonical
security gate enforces what this file describes.

## Addition Gate

A new production dependency requires:

1. A named owner (the operator adding it) and a one-line rationale in the PR.
2. A review of:
   - last release date (abandoned projects are blocked)
   - release cadence (unpredictable cadence is a flag)
   - number of maintainers (single-maintainer packages are a flag)
   - download count (low-download packages are checked against typosquat lists)
   - install scripts (any `preinstall`, `install`, or `postinstall` script is
     reviewed; most should be rejected)
3. An SCA report: `npm view <package> --json` and `osv-scanner` pass.
4. A size check: does the package meet the perf budget delta for its use?

Development dependencies are lower-risk but follow the same checklist.

## Upgrade Cadence

- **Security advisories (high/critical)**: upgrade within 7 days or document
  a risk acceptance in `project-log/decisions/`.
- **Minor and patch upgrades**: weekly automated PR via Dependabot or
  Renovate. Accepted after CI runs green.
- **Major upgrades**: quarterly review; each major upgrade is a separate PR
  with its own changelog review.

## Severity Handling

`npm audit` classifies findings as info / low / moderate / high / critical.

| Severity | Action |
|---|---|
| critical | block deploy |
| high | block deploy |
| moderate | warn; fix within sprint; if blocked, document in `project-log/decisions/` |
| low / info | fix opportunistically |

No automated suppression. Suppressions are human decisions documented per
CVE.

## Suppression Policy

A suppression requires:

- CVE or GHSA identifier.
- Evidence the vulnerable path is not exercised (e.g. the vulnerable function
  is not called in our code path).
- A review date within 12 months.

Stored in `.audit-suppress.json`:

```json
[
  {
    "id": "GHSA-xxxx-xxxx",
    "package": "some-pkg",
    "version": "1.2.3",
    "reason": "Vulnerable function parse() is never called; we only use render().",
    "added_by": "peter",
    "added_on": "2026-04-16",
    "review_on": "2026-10-16"
  }
]
```

The gate reads this file and suppresses the named finding only. Unknown
suppressions are ignored.

## Lockfile Discipline

- `package-lock.json` is committed.
- Lockfile integrity is verified in CI (`npm ci` refuses to install if the
  lockfile disagrees with `package.json`).
- No `yarn.lock` and no `pnpm-lock.yaml` in the same repo; one lockfile only.
- Lockfile regenerated only for intentional upgrades; never regenerated to
  work around an install error.

## Dual-Ownership for Ecosystem-Critical Packages

When a dependency is load-bearing (> 5% of bundle size, or provides the
framework), the upgrade PR requires two reviewers.

## Reading

- OWASP Dependency Check: https://owasp.org/www-project-dependency-check/
- OSV Scanner: https://google.github.io/osv-scanner/
- GitHub Advisory Database: https://github.com/advisories
- npm security advisories: https://github.com/advisories?query=ecosystem%3Anpm
