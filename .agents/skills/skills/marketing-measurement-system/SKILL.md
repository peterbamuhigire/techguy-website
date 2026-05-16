---
name: marketing-measurement-system
description: End-to-end marketing measurement and loyalty system for premium websites — connects business outcome, customer insight, channel mix, content, conversion, retention, and brand health into one operating dashboard. Use to design KPI architecture, monthly evidence, and the loyalty loop that makes a website earn its premium fee over time.
---

# Marketing Measurement System
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when

- Defining the measurement architecture for a new premium website at proposal or kickoff stage.
- Auditing an existing site whose owners cannot say whether the website is working.
- Designing a retainer where the agency must show evidence of value monthly.
- Connecting brand-level marketing investment to digital evidence the website must capture.
- Building the loyalty layer (newsletter, customer portal, post-purchase, retention content) into the site, not bolted on afterwards.

## Do not use when

- The site has no commercial outcome to measure (rare, and usually a signal that the brief is wrong).
- The client refuses access to analytics and refuses to install measurement; route to renegotiation.

## Required inputs

- The business model and primary commercial outcome the website must move.
- The future-state experience map, sitemap, and conversion architecture.
- Existing analytics, CRM, advertising, email, and customer-data tools.
- Customer cohort data, lifetime value estimates, and known retention curves.
- Brand and communications context: campaigns, sponsorships, PR, content calendar.

## Workflow

1. Anchor on outcome. Write one sentence: "This website exists to [verb] [target group] so that [business outcome] increases."
2. Build the KPI tree. Top: business outcome. Middle: behavioural KPIs the website can move (qualified leads, conversion, retention, AOV, renewal rate). Bottom: leading indicators (traffic, intent search rank, completion, time-to-value).
3. Define the customer insight loop. Ratio of quantitative to qualitative is roughly 70/30. Decide how each is collected, on what cadence, by whom.
4. Map the channel mix to the website. For each channel (organic search, paid search, social, email, partner, referral, offline), define what the channel hands the site and what the site must hand back.
5. Specify events. Use the analytics event plan from `website-experience-mapping` and `map-to-sitemap-conversion`.
6. Specify experiments. Tie the experimentation backlog to the KPI tree and the discovery hypotheses.
7. Specify loyalty and retention. Define the post-conversion content, communication, and product moves the website must support.
8. Specify brand health. Define how brand metrics (awareness, consideration, sentiment) map to digital signals when budget allows direct measurement.
9. Build the monthly evidence pack. Hand to `monthly-report`.
10. Run the quarterly review. Update the KPI tree and the marketing plan based on what moved.

## Quality standards

- Every KPI on the dashboard has a definition, a source, an owner, a target, and a comparison period.
- Every event in the analytics plan has a stage on the experience map it serves.
- The dashboard fits on one page and is readable without analyst help.
- Loyalty and retention metrics are present from launch, not added six months later.
- Brand and performance metrics are tied — investment in awareness has a digital signal in search, direct, and engagement metrics.
- Quarterly reviews end in changed budget allocation, not a polite conversation.

## Anti-patterns

- Reporting "page views and bounce rate" as if they are KPIs.
- Treating the site as an island disconnected from email, CRM, paid media, and offline sales.
- Optimising the site to a vanity metric (engagement) at the cost of the business metric (qualified leads).
- Measuring conversion without measuring retention, when the business model depends on retention.
- Using "industry benchmarks" as targets when the agency could measure the client's own baseline.
- Hiding bad numbers. The premium agency surfaces them with a recovery plan.

## Outputs

- KPI tree (business → behavioural → leading) with definitions, owners, targets, comparison periods.
- Analytics event plan tied to the experience map.
- Experiment register tied to KPI movement.
- Loyalty and retention plan with website-side commitments.
- Monthly evidence template.
- Quarterly business review template.

## References

- `references/kpi-tree-and-definitions.md` — KPI tree pattern, definitions library, and target-setting rules.
- `references/customer-insight-loop.md` — quantitative and qualitative cadence; voice-of-customer pipeline.
- `references/loyalty-and-retention-plan.md` — post-conversion experience, retention content, churn detection.
- `references/quarterly-business-review.md` — quarterly review structure that drives budget reallocation.
