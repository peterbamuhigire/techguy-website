# Fail Point and Recovery Playbook

Every promise has a fail mode. Premium service shows up most clearly when something breaks. This playbook tells the team what to detect, how fast, and what to say.

## Identify fail points

Walk the blueprint and mark every cell where:

- A handoff can drop (form submitted but not triaged).
- A timer can expire (SLA missed).
- A dependency can fail (third-party tool down, content not delivered).
- A person can be unavailable (sick, leave, leaving the company).
- An assumption can be wrong (wrong owner, wrong contact, wrong scope).

## Detection contract

For each fail point, define:

- Detection signal: alert, dashboard threshold, missing confirmation, customer message.
- Detection time target: how long before someone notices.
- Detection owner: a person, not a queue.

Detection without an owner is a guarantee of silent failure.

## Recovery script

Each fail point gets a short customer-facing script. Tone is direct, accountable, specific.

Pattern: acknowledge → name what went wrong → state what will happen now → commit to a time → offer the fallback.

Example for a missed contact-form reply:

"Thank you for getting in touch on [date]. Our reply did not reach you in our usual one-business-day window. The reason is [brief honest reason]. [Name] from our team will personally call you on [date and time]. If that does not work, please reply with a better time and we will adjust. We are sorry for the delay."

Avoid:

- Passive voice that hides the agency.
- Generic apologies with no commitment.
- Service-recovery language that overpromises and creates a second fail point.

## Recovery SLAs

| Fail mode | Target detection | Target first response | Target full resolution | Customer compensation rule |
|---|---|---|---|---|
| Form submission unrouted | 1 hour | 4 business hours | 1 business day | Personal call from account lead |
| Site down (5xx, full outage) | 5 minutes | 15 minutes | 1 hour | Public status update + RCA within 5 days |
| Performance regression | 1 day | 2 business days | 1 week | Optimisation report + retainer credit if SLA breached |
| Content schedule missed | 1 day | Same day | Replacement within 5 business days | Pro-rated retainer adjustment |
| Security event | 15 minutes | 30 minutes | Within 24 hours | Incident report + remediation plan |

Adjust thresholds to the contract. Publish them internally; share the relevant ones in proposals so the buyer sees the discipline.

## Escalation matrix

For each fail mode, list:

- L1 — first responder.
- L2 — escalates after the L1 SLA breaches.
- L3 — agency principal, called when the customer relationship is at risk.

Route every escalation through a written handoff. No verbal-only escalations.

## Postmortem rules

- Every Tier 1 or Tier 2 incident gets a written postmortem within 5 business days.
- Postmortem identifies what failed, why it failed, who was affected, what changed, and how detection improved.
- Postmortems are blameless on people but specific on systems and processes.
- The fix lands in the blueprint, not just the ticket.
