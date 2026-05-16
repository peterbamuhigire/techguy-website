# Project Runbook Template

**Read this when**: starting a new client project or reviewing an
existing project's alerting and incident readiness.

**Purpose**: Every shipped project has a one-page runbook that names
owners, probes, alert routing, and the first step for each alert. This
file is the template; the real runbook lives at `project-log/runbook.md`
in the client project.

## Template

Copy the block below into `project-log/runbook.md` and fill it in before
the site launches. Without a filled runbook, the project does not ship.

```markdown
# Runbook — <Client Name>

**Domain**: https://<site>
**Slug**: <client-slug>
**Environment**: production
**Last reviewed**: YYYY-MM-DD

## Owners

- **On-call operator**: <name> (<contact>)
- **Backup on-call**: <name>
- **Programme lead (escalation)**: <name>
- **Founder (escalation)**: Peter Bamuhigire

## Providers and accounts

| Service | Account | DSN/Key location | Retention |
|---|---|---|---|
| RUM endpoint | <self-hosted/provider> | env `PUBLIC_RUM_ENDPOINT` | 90 days |
| Sentry | <org>/<project> | env `SENTRY_DSN` | 30 days |
| Plausible | <hostname>.plausible.io | env `PLAUSIBLE_API_KEY` | 24 months |
| Uptime | <provider> | env `UPTIME_TOKEN` | 30 days |

## Probes

- **Homepage uptime**: every 5 min, alerts after 2 failures.
- **Contact uptime**: every 5 min, alerts after 2 failures.
- **Form E2E**: daily synthetic submission; alerts on any failure.

## Alerts and first actions

| Alert | Threshold | First action |
|---|---|---|
| LCP regression > 200 ms | Blocking | Check last deploy; rollback if < 24 h old. |
| INP regression > 50 ms | Blocking | Check third-party scripts, main-thread work. |
| CLS regression > 0.05 | Blocking | Check font loading, image dimensions. |
| JS error rate > 1% | Blocking | Check new Sentry signatures against last release. |
| New Sentry signature > 10/h | Warning | Ticket QA operator. |
| Homepage down | Blocking | Check DNS, CDN, origin; open incident file. |
| Form probe fail | Blocking | Check mail transport, CRM API. |
| Plausible unreachable at report time | Blocking (report) | Verify API key, provider status. |

## Rollback

Rollback command and trigger condition are in
`deploy/references/rollback-runbook.md`. The on-call operator authorises;
the founder may veto.

Last known-good pointer location: <provider/path>.

## Incident procedure

1. Acknowledge the page within 15 minutes.
2. Open an incident file at `project-log/incidents/YYYY-MM-DD-<slug>.md`.
3. Update the file every 30 minutes until resolution.
4. Close the loop by summarising in the next monthly report.

## Monthly verification

At month-end, the on-call operator runs through this checklist:

- [ ] All providers reachable.
- [ ] No suppressed alerts.
- [ ] Release tags up to date.
- [ ] Runbook re-read and any changed detail updated (plus change entry
      in `project-log/CHANGELOG.md`).
```

## Rules

- A runbook that has not been reviewed in the last 90 days is treated
  as stale and fails the quarterly documentation audit.
- The runbook names humans, not roles. If a named on-call operator
  leaves, the runbook is updated the same day.
- Every alert row cites the file that defines the threshold; thresholds
  are never copy-pasted into runbooks.
