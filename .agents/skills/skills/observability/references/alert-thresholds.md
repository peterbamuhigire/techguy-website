# Alert Thresholds

**Read this when**: configuring alerts for a new project or auditing the
alert set for an existing project.

**Purpose**: Define the canonical alert set that every shipped site must
honour. These thresholds are tuned for Africa-realistic traffic patterns
and for the Phase 10 performance gate.

## Rule of thumb

- **Blocking alerts** page a named on-call operator.
- **Warning alerts** file a ticket; no page.
- **Digest alerts** are collected for the weekly quality scorecard.

If an alert does not have a named owner, do not configure it.

## RUM regression alerts

All RUM regressions are computed against a 7-day rolling baseline per
route at the 75th percentile.

| Metric | Threshold | Severity | Action |
|---|---|---|---|
| LCP regression | > 200 ms | Blocking | Page on-call; investigate recent changes; rollback if regression within 24 h of deploy. |
| INP regression | > 50 ms | Blocking | Same as LCP; INP regressions frequently indicate main-thread contention from third-party scripts. |
| CLS regression | > 0.05 | Blocking | Check font loading, image dimensions, ad placement. |
| TTFB regression | > 300 ms | Warning | Check CDN, origin, and regional routing. |

## Error-rate alerts

| Metric | Threshold | Severity | Action |
|---|---|---|---|
| JavaScript error rate > 1% of sessions | 24-hour window | Blocking | Page on-call. |
| New error signature > 10 events/hour | rolling | Warning | Ticket to QA operator. |
| Third-party script failure rate > 5% | 24-hour window | Warning | Investigate integrity hash, CSP, and the provider's status page. |

## Availability alerts

| Probe | Threshold | Severity | Action |
|---|---|---|---|
| Homepage uptime check (5-minute cadence) | 2 consecutive failures | Blocking | Page on-call; open incident in `project-log/incidents/`. |
| Contact page uptime check | 2 consecutive failures | Blocking | Same. |
| Form-submission end-to-end probe (daily) | 1 failure | Blocking | Same; verify mail transport and CRM ingestion. |

## Analytics-source reachability

The `monthly-report` skill pre-flights these:

| Check | Threshold | Severity | Action |
|---|---|---|---|
| Analytics API reachable | 1 failure at render time | Blocking | Report refuses to render; operator investigates provider or credentials. |
| Event-map coverage drift | Any event in map not fired in last 30 days | Warning | Ticket to SEO operator; either fire or remove from map. |

## Security alerts (cross-reference)

Security-specific alerts (secret exposure, SRI failure, dep advisory) live
in `security-gate/references/dependency-policy.md`. Do not duplicate.

## Conversion-rate alerts (for retainer clients)

| Metric | Threshold | Severity | Action |
|---|---|---|---|
| Primary-CTA conversion rate regression | > 20% drop over 7-day rolling | Warning | Ticket to Strategist; experimentation skill may open an investigative test. |
| Bounce rate regression | > 10 percentage points over 7-day rolling | Warning | Ticket to SEO operator. |

## Ownership

- On-call owner is named per project in the project runbook at
  `project-log/runbook.md`.
- Escalation: on-call → programme lead → founder. Never skip a level.
- Monthly rotation if the client's retainer justifies more than one
  operator.

## Suppression

An alert can be suppressed only via a decision entry that names the
expiry date. Silent suppression is drift. Every suppression appears in
`dashboards/quality-scorecard.md`.

## Runbook line

Every alert here has a one-line runbook entry in
`references/runbook-template.md`. If it does not, file that before the
alert is wired.
