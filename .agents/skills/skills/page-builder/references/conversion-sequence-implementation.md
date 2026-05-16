# Conversion Sequence Implementation

Use this reference when building pages that must express a clear value proposition, support a CTA ladder, or participate in a launch sequence.

Primary upstream skills:

- `sales-copywriting`
- `launch-campaigns`

## Core rule

The built page must preserve the persuasion logic decided upstream.
Do not let implementation flatten the message into a generic hero, generic cards, or generic buttons.

## Hero implementation contract

Every important page should implement these elements in the first screen or first scroll:

- specific headline
- qualifying subhead
- one primary CTA
- one proof signal
- one audience cue

If space is tight on mobile, compress. Do not delete the logic.

## CTA implementation rules

- One visually dominant primary CTA per section.
- Secondary CTA must sit one rung lower in commitment.
- Button labels must preserve the reward and next-step meaning from copy strategy.
- Reassurance microcopy belongs near the CTA when friction is high.

Examples:

- `Book your diagnostic` + `30 minutes. No obligation.`
- `Join the waitlist` + `We will only email launch updates.`
- `See plans and pricing` + `Best fit for firms ready to invest from X.`

## Sequence-aware page states

When a page belongs to a launch or campaign, the implementation should support stage changes without redesigning the whole page.

Typical stage swaps:

- teaser state -> waitlist CTA
- open state -> apply/book/pricing CTA
- closing state -> deadline reminder + strongest proof
- closed state -> waitlist or next-cohort CTA

Build modules so these swaps are easy:

- announcement bar
- hero CTA block
- proof strip
- FAQ block
- final CTA section

## Cluster-aware internal linking

When building article templates, resource hubs, or service clusters:

- include related-content blocks
- include next-step CTAs
- link cluster posts back to the pillar
- link pillar pages to service or conversion pages where appropriate

Do not leave high-traffic informational pages as dead ends.

## Component checklist

For any CTA-bearing component, verify:

- button text is specific
- surrounding copy explains why to act
- analytics event can distinguish the component and page section
- focus, hover, active, loading, and success states are designed
- mobile layout does not hide or crowd the CTA

## Anti-patterns

- generic `Learn more` buttons everywhere
- identical CTA copy across different buyer stages
- proof isolated in one carousel far from the claim
- launch messaging hardcoded into components that should be reusable
- article templates with no mid-article or end-of-article next step

