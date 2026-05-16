# Mapping Method Selector

Pick one map per goal. Mixing types in a single artefact dilutes decisions.

## Customer Journey Map (CJM)

- Use when the website must change behaviour during a defined buyer flow (request quote, book consultation, place first order, renew subscription).
- Lanes: stages, actions, thoughts, emotions, touchpoints, opportunities, metrics.
- Output drives: page sequence, primary CTA per stage, proof placement, form ask depth.

## Experience Map

- Use when the buyer experience spans multiple channels and the website is one of many touchpoints.
- Lanes: stages, channels, devices, content needs, pain points, opportunities.
- Output drives: which content lives on the website vs email, WhatsApp, sales calls, support, social.

## Service Blueprint

- Use when the website depends on backstage operations the agency or client must change (lead routing, fulfilment SLA, content production cadence).
- Lanes: customer actions, frontstage evidence, frontstage staff, backstage staff, support processes, systems.
- Output drives: SLA commitments shown on site, form fields collected, automated handoffs, internal handover docs.
- Hand the blueprint to the `service-blueprint-website-delivery` skill for execution.

## Ecosystem Map

- Use when multiple actors interact (B2B with procurement, finance, technical buyer, end user; or two-sided marketplace).
- Lanes: actors, value flows, channels, dependencies, friction.
- Output drives: separate paths per actor on the site, gated content, role-specific proof.

## Mental Model Diagram

- Use when the user task and the existing site structure are clearly mismatched (e.g. users think in tasks, site is organised by department).
- Output drives: information architecture rewrite, navigation labels, search synonyms, internal linking.

## Decision rule

- One business goal → one map.
- Two distinct goals (acquisition vs retention) → two maps, two future states.
- If the team cannot agree on the goal, run the alignment workshop on the goal first.

## Confidence rating

Rate each lane on the chosen map:

- High: at least five customer interviews or analytics datasets confirm the pattern.
- Medium: two to four sources or strong stakeholder consensus.
- Low: one source or assumption only — flag for paid discovery before design.

Pages built on Low-confidence lanes must carry an experiment hypothesis, not a final design claim.
