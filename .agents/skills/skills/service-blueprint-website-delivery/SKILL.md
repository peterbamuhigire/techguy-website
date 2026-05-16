---
name: service-blueprint-website-delivery
description: Service blueprint for premium website agency delivery — frontstage evidence, frontstage staff, backstage staff, support processes, and systems across discovery, design, build, launch, and retainer. Surfaces the operational commitments the website makes and ensures the agency can keep them. Use during proposal scoping, kickoff, and any retainer review.
---

# Service Blueprint Website Delivery
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when

- Pricing or scoping a premium engagement and the operational cost of delivery must be visible.
- A website's promise depends on backstage operations the agency or client must change to honour.
- Retainer or maintenance commitments need explicit SLAs, evidence, and recovery procedures.
- Onboarding a new client and the operating rhythm must be agreed before design starts.
- A delivery is at risk and the cause is operational, not design or technical.

## Do not use when

- The work is a single deterministic implementation with no ongoing service component.
- The client refuses to discuss operations and expects the agency to absorb unbounded service work.

## Required inputs

- The future-state customer experience map or proposal scope.
- Agency capacity, roles, and rates.
- Client side decision rights, content owners, and approval cadence.
- SLAs implied by the website (response time on contact form, quote turnaround, support window, refund policy).
- Tooling and systems for project management, content review, deployment, monitoring, and support.

## Workflow

1. Lay out the lanes: customer actions, frontstage evidence (what the customer sees), frontstage staff (agency + client people the customer meets), backstage staff (people who never appear), support processes, systems.
2. Walk the engagement phases across the lanes: discovery, strategy, content, design, build, QA, launch, observability, retainer.
3. Identify each website promise and trace it to the lane that must keep it. Examples: "We respond within one business day" depends on a backstage triage rota; "Photos of real projects" depends on a photo production pipeline.
4. Add fail points and recovery: where can a promise break, who notices first, what is the recovery script and SLA.
5. Cost the operations honestly. If the cost exceeds the price, raise the price or remove the promise.
6. Convert the blueprint into delivery artefacts: kickoff agreement, content production plan, review SLA, retainer scope, support runbook, escalation matrix.
7. Re-read the blueprint at every stage gate. Update before launch, after launch, and at every retainer renewal.

## Quality standards

- Every promise on the website is traceable to a lane that owns it.
- Every fail point has a named owner, recovery time, and customer-facing language.
- The blueprint distinguishes work the agency does from work the client does, with sign-off rights for each.
- Retainer hours match the blueprint, not a guess. Hidden work is named and either priced or removed.
- The blueprint is shared with the client and signed; it is not an internal document only.

## Anti-patterns

- Selling premium response times when the agency has no rota or backup.
- Showing case study photos the agency does not have rights to use.
- Promising "weekly content" without a content production capacity plan.
- Letting unwritten "founder mode" service hide future scope creep.
- Treating the blueprint as a one-time document instead of a living operating system.

## Outputs

- Service blueprint diagram or table covering customer actions, frontstage evidence, frontstage staff, backstage staff, support processes, systems.
- Promise-to-lane traceability list.
- Fail-point and recovery register.
- Operations cost estimate and resulting price floor.
- Kickoff and retainer agreements aligned to the blueprint.
- Escalation matrix and on-call rota where applicable.

## References

- `references/agency-delivery-blueprint.md` — full lane templates for discovery, build, launch, and retainer phases.
- `references/promise-to-operations-traceability.md` — turn website claims into operational commitments.
- `references/fail-point-recovery-playbook.md` — recovery scripts, SLAs, and escalation rules.
- `references/retainer-and-support-design.md` — designing retainer scope, hours, and renewal rules.
