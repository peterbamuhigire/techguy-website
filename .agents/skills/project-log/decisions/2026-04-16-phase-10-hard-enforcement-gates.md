# Decision: Phase 10 — Hard Enforcement and Visual QA Gates

**Date**: 2026-04-16
**Status**: Implemented (repository deliverables)
**Phase**: 10 of 12 (website-agency-engine roadmap)
**Evaluation driver**: 2026-04-12 evaluation dimension "Performance and
Accessibility Enforcement" 7.3/10 → target 9.2+.

## Summary

Converted the engine's standards from social to machine-enforced. Six
workstreams shipped:

1. Performance gate (Lighthouse CI + route weight budgets)
2. Accessibility gate (axe-core + manual + screen reader + WCAG 2.2 AA)
3. Visual QA (Playwright screenshot diff + structural + AI-slop scan)
4. Canonical CI pipeline (15 ordered steps, inheritance via
   install-canonical-ci.sh)
5. Security + compliance gate (dep audit, headers, SRI, secrets,
   supply-chain, Africa + GDPR compliance matrix)
6. Africa-realistic calibration (3G profile, 350 KB weight budget, data-cost
   respect, Save-Data handling)

## Deliverables

### New Skills
- `accessibility-audit/SKILL.md` + 5 references
- `visual-qa/SKILL.md` + 5 references
- `security-gate/SKILL.md` + 5 references

### Canonical Configs
- `lighthouserc.json` (3G-throttled, perf/a11y/BP ≥ 95, SEO = 100)
- `performance-budgets.json` (global + per-route budgets, Africa 3G network
  profile)

### CI Template
- `templates/ci/website.yml` (15-step pipeline)
- `scripts/install-canonical-ci.sh` (bootstrap)

### Canonical Scripts (10)
- `scripts/perf-gate.sh`
- `scripts/a11y-gate.sh`
- `scripts/visual-qa.sh`
- `scripts/security-gate.sh`
- `scripts/audit-third-party-js.sh`
- `scripts/check-font-performance.sh`
- `scripts/check-security-headers.sh`
- `scripts/check-sri.sh`
- `scripts/scan-secrets.sh`
- `scripts/supply-chain-check.sh`
- `scripts/metadata-audit.sh`
- `scripts/post-deploy-smoke.sh`
- `scripts/rollback.sh`

### References
- `deploy/references/performance-gate.md`
- `deploy/references/ci-troubleshooting.md`
- `deploy/references/africa-calibration.md`

### Contracts
- `reports/bundle/README.md` (bundle-analysis output contract)
- `tests/visual/baseline/README.md` (visual baseline directory contract)

### Skill Updates
- `deploy/SKILL.md` (canonical CI section, references added)
- `website-builder/SKILL.md` (build contract with 7-gate requirement)

## Thresholds Chosen

| Gate | Threshold | Rationale |
|---|---|---|
| Lighthouse Performance | ≥ 95 | Premium positioning requires premium scores. |
| Lighthouse Accessibility | ≥ 95 | Floor above baseline; axe catches residue. |
| Lighthouse SEO | = 100 | No excuse for missing meta on static sites. |
| LCP | ≤ 2.0s on 3G | African mobile-market reality, not Stockholm fibre. |
| INP | ≤ 200ms | Google INP Core Web Vital threshold. |
| CLS | ≤ 0.1 | Same. |
| JS (gzip, first load) | ≤ 80 KB | 60 KB on `/` for hero responsiveness. |
| Total page weight | ≤ 350 KB | Data-cost respect on metered connections. |
| a11y serious/critical | 0 | Non-negotiable; see remediation playbook. |
| Visual diff | 0.1% | Below typical anti-aliasing noise. |
| npm audit high/critical | 0 | Suppressions per-CVE with review date only. |

## Why Enforcement Matters Now

The 2026-04-12 evaluation flagged "insufficient hard validation" as the
first bottom-line limiter. Standards that exist socially cannot survive at
multi-operator scale. A senior operator can hold the line for one project;
ten projects shipped by three operators cannot without mechanical gates.

## Risks Accepted

- **Slower CI runs.** The full pipeline runs 10–15 minutes on a typical
  project. Premium positioning earns the cost.
- **Initial operator friction.** Operators will hit gates they haven't
  before. Phase 11 addresses this with the certification programme.
- **Baseline management overhead.** Visual baselines require discipline.
  The baseline-management reference documents the lifecycle.

## External Work Not Done In This Session

Marked for operator execution:

- Running the canonical pipeline on three existing client projects to
  validate the inheritance contract.
- Staging-environment header validation (vs local-preview) against real
  Nginx/Cloudflare configs.
- First baseline capture on a real-built project.
- CSP report-endpoint deployment and consumption.

## Cross-References

- Plan: `docs/plans/website-agency-engine/phase-10-hard-enforcement-and-visual-qa-gates.md`
- Evaluation driver: `docs/evaluation/2026-04-12/`
- Next phase: Phase 11 — World-Class Operating Discipline.
