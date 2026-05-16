# Map to Sitemap Conversion

Turn a future-state experience map into a sitemap, page goals, and a measurement plan.

## Step 1: Stage-to-page table

For every stage on the map, create one row:

| Stage | Buyer goal at this stage | Search intent | Required page type | Primary CTA | Proof element | Analytics event |
|---|---|---|---|---|---|---|

Rules:

- Every stage gets at least one page or one component on a shared page. No orphan stages.
- A stage may collapse into a section on another page if the buyer does not arrive at this stage independently.
- A stage that earns its own organic traffic must earn its own page with metadata, schema, and internal links.

## Step 2: Decide page archetype

Map each stage's required page type to one of these archetypes. The archetype controls layout, depth, and proof load.

- Awareness page (educational): primary intent is to answer a question or explain a category. Owns long-form content, FAQ schema, internal links to consideration pages.
- Consideration page (service or product): primary intent is to compare. Owns proof, pricing or pricing logic, objection handling, secondary CTA.
- Decision page (offer or contact): primary intent is action. Owns short copy, single CTA, trust badges, form, fallback contact.
- Confirmation page (post-action): primary intent is reassurance and next step. Owns thank-you message, expected timeline, what to do next, support route.
- Trust page (case studies, team, credentials, policies): owns proof depth and standards.

## Step 3: CTA ladder

A premium site never offers a single binary "buy or leave". For each page, define:

- Primary CTA: the one action the page is built to drive.
- Secondary CTA: low-commitment next step (download, watch, save, ask).
- Tertiary CTA: ambient navigation to the next logical page in the journey.

Forbid: generic "Learn more" without a destination promise; multiple equal-weight CTAs on the same viewport.

## Step 4: Proof placement

For every consideration and decision page, place proof in this priority order before scrolling:

1. Specific outcome with number, date, and name.
2. Recognisable client, partner, or sector.
3. Independent third-party signal (certification, regulator, press, award).
4. Photo of real people, real place, real work.

If none are available, route to the agency's `agency-positioning` skill before publishing the page.

## Step 5: Form depth per stage

Form fields must match commitment level on the map:

- Awareness stage: zero or one field (email).
- Consideration stage: 3–5 fields, justified by what the buyer gets back.
- Decision stage: full intake, with explicit explanation of what each field unlocks.

Any extra field needs a one-line answer to "what does the buyer get for this?". Hand to `form-ux-design` for layout.

## Step 6: Measurement plan

Per row of the stage-to-page table, add:

- Event name (verb_noun, lowercase, snake_case).
- Trigger (page view, click, form submit, scroll depth, video watch).
- Outcome KPI it feeds (lead, qualified lead, booking, sale, retention).
- Owner (who reads the dashboard).

Hand the plan to `observability` for instrumentation and `experimentation` for the next test cycle.

## Step 7: Backstage routing

Any stage that requires a non-website change goes to `service-blueprint-website-delivery`:

- Quote turnaround, lead routing, fulfilment SLA.
- Content production cadence, photographer or video shoots.
- Customer service scripts and recovery commitments.
- Internal training so staff match what the site promises.

Do not paper over backstage gaps with copy.
