---
name: observability
description: Canonical telemetry layer. Owns the RUM, error-tracking, analytics, and alerting contract every shipped site must honour so that the quality scorecard and monthly report run on live data rather than operator narration. Feeds `dashboards/quality-scorecard.md` weekly and the `monthly-report` skill on demand.
---

# Observability
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- Shipping a new client site — observability must be live on day one.
- Adding a new primary template, route, or interactive feature — update
  the event map and RUM coverage.
- Investigating a performance, error, or conversion regression.
- Before running the `monthly-report` skill — confirm the analytics source
  is reachable and the event contract matches.

## Do not use when
- Running a one-time audit; use `seo-audit` or the Phase 10 gates for that.
- Teaching operators how to instrument craft; that guidance lives in
  `seo`, `page-builder`, and `deploy` references. This skill governs
  operational telemetry, not authoring.

## Core contract

Every shipped site must have, on day one:

1. **RUM** — LCP, INP, CLS, and navigation type reported via `web-vitals`
   to a centralised endpoint (self-hosted or a chosen provider). No site
   ships without RUM live.
2. **Error tracking** — Sentry (or an operator-approved equivalent) with
   project-scoped DSN, release tagging, and source-map upload in CI.
3. **Analytics** — Plausible or GA4, project-scoped, with the event
   taxonomy in `seo/references/analytics-event-map.md` honoured exactly.
4. **Alerting** — thresholds from `references/alert-thresholds.md`
   configured at the provider; alerts route to a named on-call operator
   per project.
5. **Source reachability** — every configured source exposes a health
   endpoint or documented probe that the `monthly-report` skill checks
   before rendering.

A report that runs without these inputs is not a report; it is an
operator narration and is not permitted.

## Canonical workflow (per project)

1. **Decide providers.** Default stack: `web-vitals` → self-hosted
   endpoint; Sentry; Plausible. Alternatives allowed but must be recorded
   as a decision entry in `project-log/decisions/`.
2. **Provision accounts.** Create or link project-scoped accounts. Never
   share credentials across projects.
3. **Implement RUM.** Add the RUM snippet per
   `references/rum-implementation.md`. Ship behind a `Save-Data` check.
4. **Implement error tracking.** Add Sentry init per
   `references/error-tracking.md`. Source-maps upload in CI.
5. **Implement analytics.** Add provider per
   `references/analytics-integration.md`. Fire every event in the
   analytics-event-map.
6. **Wire alerts.** Configure alerts per
   `references/alert-thresholds.md`.
7. **Dashboard.** Add the project to the agency dashboard set; contribute
   its weekly roll-up into `dashboards/quality-scorecard.md` via the
   generation script (Phase 11 or later — initial roll-ups are committed
   manually).
8. **Verify.** Before launch, run the post-deploy smoke and confirm at
   least one real pageview appears in RUM, analytics, and error
   breadcrumbs within 60 seconds.

## Required inputs
- Deploy host and primary domain.
- Named on-call operator for this project.
- `seo/references/analytics-event-map.md` — the event contract for this
  site.
- Access to the agency's self-hosted RUM endpoint or provider.
- A decision entry if deviating from default providers.

## Quality standards
- No pageview is counted unless the RUM payload succeeds. A silent-drop
  pipeline is not acceptable.
- Every primary route is measured.
- Every alert has a named owner and a runbook line in
  `references/alert-thresholds.md`.
- Source-maps for production JavaScript are uploaded privately to the
  error tracker; they do not ship on the site.
- Data retention is defined at provisioning time per client contract;
  retention decisions are logged.

## Anti-patterns
- Shipping analytics without error tracking. You will see the traffic
  but not the breakage.
- Shipping error tracking without release tagging. Every alert becomes a
  wall-of-regressions.
- Using the same analytics property across multiple clients. Cross-client
  data pollution is unethical and breaks the retention policy.
- Alert thresholds that nobody looks at. If an alert does not page an
  owner, it is decoration.
- RUM sampling so aggressive that the long tail is invisible. Africa
  traffic is long-tail by construction; sample ≥ 50% by default.

## Outputs
- Live telemetry on every shipped site (RUM + errors + analytics +
  alerts).
- A project row in `dashboards/quality-scorecard.md` updated weekly.
- A monthly source-reachability confirmation recorded in
  `project-log/CHANGELOG.md` at month-end.

## References
- `references/rum-implementation.md` — `web-vitals` integration, endpoint
  contract, sampling, Save-Data handling.
- `references/error-tracking.md` — Sentry setup, release tagging, source
  maps, PII scrubbing.
- `references/analytics-integration.md` — Plausible and GA4 setup, event
  firing, consent handling.
- `references/alert-thresholds.md` — the canonical alert set.
- `references/runbook-template.md` — one-page runbook per project.

## Notes
- This skill replaces ad-hoc setup per project with a single contract.
- The `monthly-report` skill refuses to render a report if the analytics
  source is unreachable at render time.
- The Phase 10 performance gate tests synthetic performance. RUM is the
  real-user counterpart; both must be green.

