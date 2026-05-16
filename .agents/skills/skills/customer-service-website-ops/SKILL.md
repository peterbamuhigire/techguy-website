---
name: customer-service-website-ops
description: Post-launch customer service operations for premium website agencies — language, escalation, recovery, retention, and the operating discipline that protects premium reputation when something goes wrong. Use to design service SOPs, train support staff, write customer-facing recovery messages, and convert incidents into trust.
---

# Customer Service Website Ops
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when

- Designing or upgrading the support layer attached to a premium website or retainer.
- Writing customer-facing language for triage, recovery, refunds, escalations, or churn risk.
- Training a small agency team or a client's internal team to handle service interactions consistently.
- Converting recurring complaints into structural fixes via the service blueprint.
- Re-engaging a client after a missed SLA, a bug, an outage, or a public mistake.

## Do not use when

- The interaction is a sales conversation, not a service one. Use `premium-sales-conversation`.
- The work belongs to the client's existing customer service team and they have a stronger SOP.
- The complaint is legal in nature and must be routed to counsel before any agency response.

## Required inputs

- The service blueprint and SLA matrix for the engagement.
- The recent ticket and complaint history, if any.
- The client's brand voice and service tone.
- The retainer scope and exclusion list.
- The internal escalation matrix and on-call rota.

## Workflow

1. Triage the interaction. Identify whether it is a question, a defect, a service breach, an escalation, a churn risk, or a hostile interaction.
2. Match the interaction to the SLA target. State the target back to the customer in the first reply.
3. Use the service language pattern: acknowledge → be specific about what happened → state the next step → commit to a time → name a person.
4. Resolve at the lowest competent level. Escalate only when SLA is at risk or scope is unclear.
5. Close the loop in writing. Send the resolution summary even when the interaction was verbal.
6. Log the interaction with the structural cause. Patterns route to the service blueprint for permanent fix.
7. Run a recovery gesture only when the breach was real and customer trust is at risk; never as a default discount.
8. Feed retention data to `agency-client-retention` and `monthly-report`.

## Quality standards

- Every customer-facing message identifies a person, a next step, and a time.
- Apologies are specific and one-time. They do not repeat in the same thread.
- "Sorry" is followed by "what we are doing", not by another "sorry".
- Service language is plain, accountable, and locally appropriate. Avoid corporate softening that hides the agency.
- Recovery gestures are proportional and tracked. Default discounts erode margin and train poor behaviour.
- Internal handoffs are written, not verbal. The customer must not have to re-explain the issue at each step.
- Recurring complaints become structural changes within one quarter or are escalated to leadership.

## Anti-patterns

- "We are sorry for any inconvenience this may have caused" — generic, passive, low-trust.
- Apology spirals where the customer is asked to forgive without any concrete action.
- Letting one "loud" customer dictate scope changes that violate the contract.
- Treating support tickets as a queue to clear instead of signal to act on.
- Hiding bad news behind delay. Premium agencies surface issues before the customer reports them.
- Punishing whistle-blowing customers by treating them as a problem instead of as a service-recovery opportunity.

## Outputs

- Service triage matrix with SLA per interaction type.
- Customer-facing message templates: acknowledgement, holding update, resolution, recovery, escalation, exit.
- Internal escalation matrix and on-call rota.
- Monthly service report covering volume, SLA compliance, structural fixes shipped, and trust signals.
- Updated service blueprint cells where structural fixes were made.
- Recovery and retention gestures tracked with cost and outcome.

## References

- `references/service-language-patterns.md` — phrasing for acknowledgement, holding, resolution, recovery, escalation, refund, and exit.
- `references/triage-and-escalation-matrix.md` — interaction types, SLAs, and ownership.
- `references/recovery-and-retention-gestures.md` — proportional recovery, when to use, when to refuse.
- `references/post-launch-support-runbook.md` — first 90 days after launch, the period premium relationships are won or lost.
