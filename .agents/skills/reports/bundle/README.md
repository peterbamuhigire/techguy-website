# reports/bundle/ — Canonical Bundle Analysis Output

This directory is the canonical destination for bundle-analysis artifacts emitted
by the performance gate. Every client project built on the website-skills engine
writes the same filenames here so the canonical CI pipeline can upload and diff
them consistently.

## Expected Contents

| File | Producer | Purpose |
|---|---|---|
| `bundle-size.json` | build step (e.g. Astro `astro build --analyze` or custom rollup plugin) | machine-readable totals per route and per chunk |
| `bundle-size.txt` | build step | human-readable summary for PR comments |
| `bundle-size.svg` | `rollup-plugin-visualizer` or equivalent | interactive treemap for debugging |
| `bundle-diff.md` | CI step | diff against the main branch, produced by the canonical CI workflow |
| `third-party-audit.txt` | `scripts/audit-third-party-js.sh` | per-build list of allowed vs blocked third-party hosts |
| `font-audit.txt` | `scripts/check-font-performance.sh` | font-display/preload/subsetting audit |

## Conventions

- All sizes are reported in both raw bytes and gzip-compressed bytes.
- Per-route totals must fit inside the budgets in `/performance-budgets.json`.
- Files are overwritten on every build; history lives in the CI artifact store.
- This directory is git-ignored by default (see `.gitignore` root).

## Writing a New Producer

Producers should:

1. Read `performance-budgets.json` from the repo root.
2. Emit both a JSON and a markdown version of the report.
3. Exit non-zero when a budget is breached so the CI step fails loudly.
4. Never assume a path other than `reports/bundle/` for output.

## Related

- `deploy/references/performance-gate.md` — rationale and commands
- `lighthouserc.json` — lighthouse thresholds
- `scripts/perf-gate.sh` — canonical gate runner
