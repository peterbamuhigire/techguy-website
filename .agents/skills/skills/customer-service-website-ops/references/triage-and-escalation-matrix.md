# Triage and Escalation Matrix

Every interaction lands in one of seven types. Triage in under 15 minutes.

## Interaction types

1. Question — the customer wants to know how something works. Resolution: answer + link to documentation.
2. Defect — the website is not behaving as agreed. Resolution: reproduce, fix, document.
3. Change request — the customer wants new behaviour. Resolution: route to change-request gate.
4. Service breach — the agency missed an SLA. Resolution: acknowledge, recover, fix structurally.
5. Escalation — the customer wants leadership involvement or has lost trust. Resolution: senior owner, written next step.
6. Churn risk — the customer is signalling they may leave. Resolution: structured retention conversation.
7. Hostile interaction — abusive, threatening, or bad-faith. Resolution: document, brief leadership, continue contract.

## SLA targets

| Type | First response | Resolution | Owner |
|---|---|---|---|
| Question | 4 business hours | 1 business day | Support lead |
| Defect — minor | 4 business hours | 5 business days | Engineering on-call |
| Defect — blocking | 30 minutes | 1 business day | Engineering lead |
| Change request | 1 business day | Routed via gate | Account lead |
| Service breach | 30 minutes | 1 business day | Account lead |
| Escalation | 1 business hour | 2 business days | Agency principal |
| Churn risk | 1 business day | 5 business days | Account lead + principal |
| Hostile | 1 business hour acknowledgement | Variable | Agency principal |

Adjust to the contract. Publish targets so the customer can hold the agency to them.

## Severity definitions

- Sev-1 (blocking, public): site down, payment broken, public-facing error visible to all users.
- Sev-2 (blocking, partial): a journey is broken but workaround exists.
- Sev-3 (degraded): performance, single page issue, non-critical bug.
- Sev-4 (cosmetic): visual or copy issue, not affecting function.

Sev-1 triggers immediate escalation regardless of business hours. Sev-2 within business hours.

## Escalation rules

- Auto-escalate when first-response SLA breaches by 50%.
- Auto-escalate any service breach involving public visibility.
- Auto-escalate any churn signal (cancellation language, "looking at alternatives", repeated unanswered questions).
- Manual-escalate when the support lead does not have decision rights to resolve.

## Handoff discipline

Each escalation handoff includes a written summary:

- What the customer asked.
- What the agency has tried.
- What the agency knows is true.
- What the agency suspects.
- What the customer expects next.

The customer must not have to re-explain the situation when the case escalates. If they do, the agency owes a recovery gesture.

## On-call rota

- One named on-call engineer for Sev-1 outside business hours.
- One named on-call account lead for service breaches and escalations.
- Backup name for each, in case the primary is unavailable.
- Public status page or shared channel for Sev-1 events lasting more than 30 minutes.

## Closing the loop with operations

For every Sev-1, Sev-2, or service breach, write a 5-day postmortem and update:

- The service blueprint cell that owns the failed promise.
- The SLA matrix if reality and target are out of step.
- The customer-facing language if a message did not land well.
- The training material for the team.

Repeated failures without structural change are leadership accountability, not team accountability.
