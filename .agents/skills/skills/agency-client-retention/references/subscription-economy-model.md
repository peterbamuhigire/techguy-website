# Subscription Economy Model

The recurring-revenue financial and operating model for a premium website
agency, drawn from Tien Tzuo's *Subscribed* (Portfolio, 2018) and John
Warrillow's *The Automatic Customer* (Penguin/Portfolio, 2015).

The agency's commercial model is bimodal: $12k–$45k engagements (one-time)
plus $750–$3,000/month retainers (recurring). Retainer revenue is the
strategically more valuable line because it commands valuation multiples
that one-time revenue does not, smooths cash flow, and produces the
behavioural data that compounds over time.

This file establishes the operating model that runs the retainer side of
the business. It pairs with `retainer-package-catalog.md` (what we sell),
`expansion-offers-matrix.md` (how we grow accounts),
`post-launch-review-cadence.md` (the review rhythm), and
`okrs-and-client-reporting.md` (the measurement system).

---

## Part 1 — Why recurring revenue beats project revenue

### The valuation case (Warrillow)

Recurring revenue commands dramatically higher valuation multiples than
one-time revenue. Examples:

- **Home security** — acquirers pay $0.75 per $1 of installation revenue
  vs **$2 per $1 of monitoring revenue** (2.7x premium).
- **Mosquito Squad franchises** — sold for 3.7x pretax profit vs the
  small-business average of 2.6x — a 42% premium attributable purely to
  73% contract-renewal rates.
- **Subscription software** (Zane Tarence brackets):
  - 24–48x MRR (2–4x ARR) for sub-$5M ARR with 2–4% monthly churn.
  - 48–72x MRR (4–6x ARR) for $5M+ ARR with under 1.5% monthly churn.
  - 72–96x MRR (6–8x ARR) for over 50% growth with under 1% monthly churn.

Translated: a website agency with $360k of annual one-time project revenue
might sell for 1x to 2x revenue ($360k–$720k). The same agency with
$240k of annual retainer revenue and $120k of project revenue sells for
materially more — because the retainer line carries a 4x to 6x ARR
multiple while the project line carries 1x to 2x.

### The operational case (Tzuo)

> "We prefer outcomes over ownership."

In a subscription business, the customer — not the product — is the asset
on the balance sheet. Every function reorganises around keeping that
customer successful over time. Specifically:

- Revenue is not booked at the point of sale; value is earned across the
  life of the relationship.
- Behavioural data flows back into product, marketing, and pricing — the
  data is the moat.
- "The real work starts after the sale" (Tzuo).

For an agency, this reframes the website build entirely. The site is not
the deliverable; the client's commercial outcome is. The retainer is the
vehicle through which that outcome compounds.

### The eight reasons subscribers beat customers (Warrillow)

1. They increase the value of the company.
2. Massive lifetime value lift — H.Bloom's "$29 sale becomes a $4,524
   customer."
3. Smooth out demand — H.Bloom spoils 2% vs the flower-shop industry's
   30%–50%.
4. Free market research — Walmart ran Goodies Co. purely to mine snack
   preferences.
5. Paid automatically — no 60–120 day receivables, no deadbeats.
6. Customers become sticky — the price-shopping part of the brain "shuts
   down."
7. Subscribers buy more — H.Bloom earns $3 of one-shot orders per $10 of
   MRR.
8. Recession-proof — Tri-State Elevator survived 2008 on maintenance
   revenue after new installs collapsed.

---

## Part 2 — The PADRE operating model (Tzuo)

PADRE is Tzuo's replacement for the traditional functional org chart.
Each stage is a subsystem with its own metrics, owned cross-functionally.

| Stage | Purpose | Where leverage sits | Where leakage happens |
|-------|---------|---------------------|------------------------|
| **P — Pipeline** | Build awareness, translate into demand | Clear narrative; positioning | Vague category, generic message |
| **A — Acquire** | The buyer's journey | Alignment of incentives ("better they do, better we do") | Chasing anything with a pulse — "cats dragging strange things to your doorstep" |
| **D — Deploy** | Get the subscriber integrated and live fast | Set expectations *before* signature; ruthless onboarding-step elimination | "Did you wear your Fitbit for a couple of days and then forget about it?" |
| **R — Run** | Daily/weekly success | Behavioural monitoring; Customer Success function | Silent decay; account is "fine" until renewal |
| **E — Expand** | Retention, growth, advocacy | Cross-sell to ~1/3 of customers (McKinsey) | Treating expansion as "next year's problem" |

Plus three back-office subsystems: People, Product, Money (PPM). Tzuo's
discipline at Zuora: every week the management team gets an 8-slide deck
(one per subsystem) with red/amber/green flags; every quarter they
deep-dive into one subsystem.

### Agency translation of PADRE

| PADRE stage | Agency translation |
|-------------|--------------------|
| Pipeline | Agency website, case studies, signature talk, podcast appearances, Dream 100 |
| Acquire | Engagement sale → retainer pre-sold during build discovery |
| Deploy | 30-day onboarding protocol post-launch (access handover, reporting cadence, goals agreed, analytics instrumented) |
| Run | Monthly cadence — one report, one strategic call, rolling backlog |
| Expand | Quarterly business review = expansion moment (tier upgrade or adjacent retainer) |

The key insight: **the build is the Acquire/Deploy event. The retainer
is where PADRE actually runs.** A client engaged through a $22k Growth
build but not transitioned into the Run/Expand discipline of a retainer
is a one-time customer with extra steps.

---

## Part 3 — The subscription P&L (Tzuo)

Traditional GAAP P&L misleads in subscription businesses because S&M
spend this quarter creates ARR that recurs across future quarters.
Tzuo's reformulation:

```
ARR                            $100
(Churn)                         (10)
Net ARR                          90
 Recurring costs
   COGS                         (20)
   G&A                          (10)
   R&D                          (20)
 Recurring profit                40
 (Sales & marketing)            (30)
Net operating income             10
 New ARR (ACV)                   30
Ending ARR                     $120
```

Key reframing:

- **Above-the-line = what it costs to *service* existing ARR.** COGS,
  G&A, R&D are pulled above the line.
- **Below-the-line = what it costs to *grow* ARR.** S&M is isolated as a
  growth investment.
- **Everything is expressed as a percentage of ARR.** Every department
  head knows the fastest way to grow their budget is to grow ARR.
- **Recurring profit margin** is the number you can safely reinvest.

### Agency P&L reframed

Internal monthly P&L for the agency:

```
Retainer ARR (active retainer count × annual fee)     $X
(Retainer churn, annualised)                          (Y)
Net Retainer ARR                                       Z

Recurring delivery cost
  Senior team capacity allocated to retainers        (A)
  Tooling, hosting, software per client              (B)
  Account ops & reporting time                       (C)
Recurring delivery margin                             D    (target: 60%+)

(Sales & marketing — agency's own engine)            (E)
Recurring net operating income                        F

New retainer ARR added this period                   +G
Net new ARR                                          ±H
Ending Retainer ARR                                   I

Plus: project revenue (build engagements, expansion offers)  J
Plus: project margin                                          K
Total revenue                                          I + J
Total margin                                           D + K
```

The board-level question shifts from "how much did we bill this month?"
to "how much retainer ARR did we add this quarter, and what is the
expected lifetime of it?"

---

## Part 4 — The agency's recurring-revenue dashboard

The founder reads these metrics on the cadences indicated. This is the
master view of the agency-as-subscription-business.

| Metric | Definition | Target | Cadence |
|--------|------------|--------|---------|
| **Active retainer count** | Number of paying retainers | Grows quarter-over-quarter | Weekly |
| **Retainer MRR** | Sum of all monthly retainer fees | Grows | Weekly |
| **ARR** | MRR × 12 | Grows | Monthly |
| **Logo churn** | Retainers cancelled this month / total active | <5% per quarter | Monthly |
| **Revenue churn** | $ ARR cancelled / starting ARR | <5% per quarter | Monthly |
| **Net retention (NRR)** | (Starting ARR + expansion − churn) / starting ARR | >=110% | Quarterly |
| **Gross retention (GRR)** | (Starting ARR − churn) / starting ARR | >=90% | Quarterly |
| **ARPA** | Average revenue per account = MRR / active retainers | Trends up annually | Quarterly |
| **CAC** | S&M spend (own marketing) / new retainers acquired | <retainer ARR × 0.5 | Quarterly |
| **LTV** | (Avg monthly retainer × avg retention months × gross margin) | LTV:CAC >=3:1 | Quarterly |
| **CAC Payback** | S&M spend / (new MRR × gross margin) | <12 months for SMB | Quarterly |
| **CUF:CAC** (Warrillow) | Cash up front / CAC | >=1:1 | Quarterly |
| **GEI** (Tzuo) | $ S&M required to produce $1 new ARR | <$1.50 | Quarterly |
| **Recurring profit margin** | (ARR − recurring costs) / ARR | 60%+ | Monthly |
| **Net new ARR per quarter** | New ARR added − ARR churned | Set quarterly target | Quarterly |
| **% revenue from 12-month contracts** (Roetzer) | 12-month retainer ARR / total revenue | 50%+ Year 1, 80%+ Year 3 | Quarterly |
| **Largest client % of revenue** (Roetzer) | Largest client revenue / total revenue | <20% | Quarterly |
| **Number of clients on 2+ retainers** | Count | Trends up | Quarterly |
| **Annual retainer renewal rate** | % of retainers that renew at 12-month mark | >=90% | Annually |

---

## Part 5 — Churn types and reduction (Tzuo + Warrillow)

### The four faces of churn

- **Voluntary churn** — the subscriber cancels. Root causes: lack of
  adoption, broken value, pricing mismatch, competitor win.
- **Involuntary churn** — payment failure, expired card, fraud block.
  Entirely fixable with dunning, account-updater services, and local
  payment methods.
- **Logo churn** — count of accounts lost.
- **Revenue churn** — ARR lost. Can diverge sharply from logo churn if
  small accounts leave while big accounts stay (or vice versa).

### Net churn — the holy grail

**Net Churn = Gross Churn − Upgrade/Expansion Revenue**

When expansion exceeds churn, **net churn goes negative** — the existing
account base grows faster than new accounts churn out. Wild Apricot's 25%
annual growth was achieved at ~0.5% net churn. This is the metric that
decides whether the agency compounds or treads water.

### Tzuo's churn reduction playbook (5 moves)

1. Face the "Oh Shit Moment" head-on. Every subscription business hits a
   quarter where churn exceeds adds. Don't panic — diagnose. Are there
   customers we should *not* be pursuing? Customers we should *fire*?
2. Diagnose adoption vs value vs packaging. Salesforce's churn crisis was
   *adoption*; Netflix's (Qwikster) was packaging.
3. Cross-sell to one-third of the base (McKinsey benchmark for the
   $25M–$75M subscription companies with the lowest churn).
4. Contract length helps but never outweighs "an utterly maniacal focus
   on keeping customers happily surprised on a regular basis."
5. For involuntary churn: fix the payment infrastructure.

### Warrillow's nine churn-reduction tactics

1. **Be a Rogue Jet.** Insert yourself in the subscriber's daily flight
   path. Salesforce <1% monthly churn because teams customise it into
   daily workflow.
2. **Watch the 90-day onboarding clock.** "By day 90, lifetime value and
   profitability are practically set in stone" (Harland Clarke study).
   First 30 days is the cross-sell window; after that it shuts.
3. **Reduce Time to Wow.** Constant Contact reversed onboarding from
   "who (upload contacts)" to "what (design campaign)." Friction step
   moved out of the critical window.
4. **Charge up front.** Customers who prepay annually commit more effort
   to learning the tool. Skok: "Charging up front actually *reduces*
   churn at the one-year point."
5. **Communicate like a giddy lover early; quieter later.** JD Power
   2014: satisfaction *peaks at 5 to 6 contacts in year one*; drops at
   7. Heavy early; steadier after day 90.
6. **Drop "happiness bombs."** BarkBox dedicates 2 of 40 employees to
   spontaneous gifts — 504 sent in a single month with handwritten
   notes.
7. **Target larger businesses.** Self-employed buyers churn when the job
   market shifts; mid-market and enterprise are stickier.
8. **Focus on Net Churn.** Not gross churn alone.
9. **Reduce Logo Churn by cross-selling.** Three retainers in one client
   = three chances to keep the logo.
10. **Go evergreen.** Negative-option renewal unless actively cancelled.
    End-dated subscriptions bleed renewals.

### Per-stage churn drivers

- **Days 1–30:** product complexity, bad onboarding, "who before what"
  friction. Fix with time-to-wow + heavy comms.
- **Days 30–90:** value not realised, habit not formed. Fix with
  use-not-buy onboarding, 90-day markers, happiness bombs.
- **Months 3–12:** over-communication, "paying for something I don't
  use" perception. Fix with quieter cadence, use-based nudges.
- **Anniversary:** renewal friction. Fix with evergreen, annual prepay.
- **Year 2+:** competitiveness. Fix with continuous service investment.

---

## Part 6 — Pricing and packaging (Tzuo + Warrillow)

### Pricing rules

- **Re-price at least annually.** ProfitWell data Tzuo cites: average
  management team spends <10 hours/year on pricing. The single highest-
  leverage lever.
- **Tiered pricing with explicit upgrade path.** Wild Apricot:
  $25 → $50 (Community) → $100 (Professional) → $200/month. Upgrades
  offset gross churn.
- **Annual prepay with discount.** 10–16% off is typical. Wild Apricot:
  52% of customers prepay annually, directly reducing 90-day churn.
- **Setup / onboarding fees** as disguised CUF booster. HubSpot disguises
  a $2,000 setup fee as an "Inbound Marketing Success Training package"
  to lift CUF:CAC from 0.084 to 0.37.
- **Raise prices as proof develops.** DanceStudioOwner.com went $97 →
  $187/year at the 200-member mark without losing growth.
- **Evergreen (auto-renew) default** for SMB tiers. Fixed 12-month terms
  for enterprise (procurement requirement).
- **10× not 10%.** A subscription-weary buyer ignores a 10% discount but
  commits for 10× value. Lead with 10× framing whenever there's an easy
  one-shot alternative.

### Two primary growth levers (Tzuo's SEI data)

Every pricing/packaging move is classified as either:

- **ARPA-growing** (avg revenue per account up — tier upgrades, add-ons,
  usage charges).
- **Account-growing** (more accounts — competitive pricing, freemium
  funnel, free trials).

Mature companies alternate: prioritise account-growth with competitive
pricing, then switch to ARPA-growth with upsells.

---

## Part 7 — Selling the subscription (Warrillow)

### The seven psychological moves

1. **Think 10× vs 10%.** New Masters Academy: $29/mo for 350 hrs vs
   $600–800/day in-person classes.
2. **Appeal to the rational side** for B2B. H.Bloom sells flowers like a
   logistics lecture: farm-to-vase in 48 hours vs 10–14 days, no retail
   markup.
3. **Give an ultimatum.** Subscribe or no deal. Warrillow's first
   conversion failed because he offered subscription *alongside* one-shot
   consulting — clients cherry-picked one-shot. Second attempt: subscribe
   or no business. Most converted.
4. **Freemium.** A free taste with temptations behind the curtain.
   Mequoda: 3%–30% of free-email subscribers convert.
5. **Free trial.** Osler Bluff $2,500 trial → 90%–100% convert to $57,500
   full membership. Zendesk's 5-video trial focuses on use, not
   purchase.
6. **Gift subscriptions** — top-up only. Renewal rates for gifts are
   catastrophic (Nicely Noted: 2-3 of 100 gift subs renew). Never build
   primary growth on gifts.
7. **Set fire to the platform.** Time-limited price break for prospects
   already 95% decided. Never publicise.

### The pre-sale nobody talks about

> "Your first sale needs to be to your employees and partners, to explain
> the benefits they will enjoy from moving to a subscription model."

Andrew Gray's accountancy partners resisted fixed-fee retainers because
hourly billing was their industry credential. Lead with the *stability*
benefit (predictable workload, no peaks/valleys), not margin improvement
(which is an owner's argument).

For our agency: brief the team on why we move clients to retainer post-
launch. The retainer is a delivery discipline, not just a revenue line.

---

## Part 8 — Customer Success as a function (Tzuo)

Salesforce invented the role; Marc Benioff named it "Customer Success
Manager" against fierce internal resistance. It is now a profession.

What it is:

- Daily/weekly login and usage monitoring.
- Adoption coaching ("we had to teach our customers how to get their
  people to use the product" — Salesforce's fix for its churn crisis).
- Feature gap and feedback loops back into product.
- Upsell/cross-sell identification.
- Incident learning.

What it isn't:

- Support (reactive — tickets, bugs).
- Account management in the classical sense (quota-bag chasing renewal
  signatures).
- Sales (closes; CS makes the close stick).

### When to instrument Customer Success in the agency

Below 12 retainer clients: the founder + senior strategist hold the role
informally. Above 12: hire a dedicated Client Success Lead. Their
scorecard:

- Logo retention.
- Revenue retention.
- NRR.
- Expansion bookings.
- 90-day onboarding completion rate.
- Quarterly business review attendance and quality.

The role is decisively *not* sales. The Client Success Lead is paid for
retention, not new logos.

---

## Part 9 — The 9 subscription business models mapped to our retainers

Warrillow names nine subscription business models. Multiple models stack
within a single retainer. Mapping:

| Retainer | Primary model | Secondary models | Sales narrative |
|----------|---------------|------------------|-----------------|
| Care & Maintenance | Simplifier | Peace-of-Mind, Front-of-the-Line | "You put your feet up; we handle the 100-point inspection" (Hassle Free Home Services framing) |
| SEO Foundation | Simplifier | Membership Website, All-You-Can-Eat Library | "73% of next year's organic pipeline locked in" (Mosquito Squad) |
| Content Growth | All-You-Can-Eat Library | Membership Website, Simplifier, Surprise Box | "$8k/mo content marketer + $2k editor + $3k strategist for $2.5k" |
| CRO | Peace-of-Mind | Front-of-the-Line, Membership Website | "We're watching your conversion rates while you sleep" (Site24x7) |
| Technical Support | Front-of-the-Line | Peace-of-Mind, Simplifier | Salesforce Mission Critical Success — published priority tiers |

### The clearest single precedent

**Kirkpatrick & Hopes accountancy (Andrew Gray, Reading UK)** — converted
hourly-billing accountancy to monthly retainer model. Result:

- 70% of monthly £75,000 revenue from subscribers at avg £375/mo.
- Annual churn near zero.
- Cash windfall = 3 months of sales at conversion.
- Fewer fee disputes that "used to damage the working relationship."

The internal-resistance pattern Gray faced is exactly what a website
agency moving from project-heavy to retainer-heavy will encounter. Sell
internally first (predictable workload, not margin), then ultimatum-style
to clients ("we'd love to continue working with you — under the retainer
model").

---

## Part 10 — Founder behaviour (the dashboard the founder reads)

Daily, weekly, monthly, quarterly, annual rhythms applied to the agency
as a subscription business:

### Daily
- Inbound lead flow (build + retainer enquiries).
- New retainer activations.
- Cancellations (with reason).

### Weekly
- Active retainer count and MRR.
- Cohort behaviour: % of last-90-days' retainer cohort hitting 90-day
  markers.
- Onboarding funnel drop-offs.
- Project pipeline value (90 days of capacity always covered).

### Monthly
- MRR.
- Logo and revenue churn (gross and net).
- Upgrade revenue.
- CAC by channel (own marketing, referrals, inbound from authority
  content).
- 90-day-marker completion rate per retainer cohort.
- NPS of 90-day cohort.
- Logo-churn count + reasons.
- Recurring profit margin.

### Quarterly
- LTV:CAC by retainer type, segment, channel.
- CUF:CAC.
- Cohort LTV curves.
- Pricing tests (freemium conversion, trial conversion, upgrade rates).
- Service usage → churn correlation.
- NRR, GRR.
- ARPA trend.
- GEI.
- % revenue from 12-month contracts.

### Annual
- Per Tarence's brackets — what MRR multiple would the agency fetch
  today?
- Renewal rate at 12-month mark.
- Average client lifetime in months.
- Largest client % of revenue.

The cohort dashboard is the single most important artefact. Waiting years
for LTV truth is fatal. **90-day markers** (e.g., "did the client embed
the new dashboard in their sales meeting?", "did they action the first
two recommendations?") are leading indicators you can tune onboarding
against.

---

## Part 11 — The 8 growth levers (Tzuo)

Mature subscription businesses are working two or three of these at any
given time:

1. **Acquire the right first cohort** — "you become your customers."
2. **Reduce churn** — face the Oh Shit Moment.
3. **Hybrid sales model** — self-service for entry tier, assisted for
   upgrades.
4. **Upsell and cross-sell** — McKinsey: lowest-churn $25M–$75M
   subscription companies cross-sold to 1/3 of base.
5. **New segments** — by size, vertical, or geography.
6. **International** — "the boundary is language, not country."
7. **Acquisitions** — past 70% market share; requires cash and
   integration plan.
8. **Pricing and packaging** — the lever behind the other seven.

For a website agency in years 1 to 3 of building the retainer book,
focus on levers 1, 2, 4, and 8. Levers 3, 5, 6 emerge in years 4+.
Lever 7 is far away.

---

## Part 12 — Anti-patterns

From both books, the failure modes named explicitly:

1. **Running subscription and one-shot models in parallel without
   ultimatum.** Customers default to one-shot.
2. **Measuring subscription P&L with traditional GAAP framing.** S&M
   spend looks catastrophic; founders panic and retreat.
3. **Ignoring employee resistance.** The team must be sold first.
4. **Letting a legacy project-era sales force sell the subscription.**
   They prefer the big boxed ticket and will kill the nascent
   subscription service.
5. **Going broad before churn is tamed.** Scaling sales while net
   subscribers shrink digs the hole faster.
6. **Chasing anything with a pulse on the first cohort.** Wrong-fit
   customers warp the service roadmap and pricing permanently.
7. **Underinvesting in pricing.** <10 hours/year is industry average.
8. **Postponing international.** "Companies typically wait too long."
9. **Confusing support with customer success.** Support closes tickets;
   CS grows the account.
10. **Ignoring payment infrastructure.** Involuntary churn from expired
    cards is entirely fixable.
11. **Depending on gift subscriptions.** 2%–3% renewal rate is a trap.
12. **Ignoring the 90-day window.** Lifetime value is set in 90 days.
13. **Over-communicating after day 90.** Beyond 6 contacts in year one,
    satisfaction drops.
14. **Selling expertise at commodity prices.** The subscription is the
    on-ramp, not the destination.
15. **The Treadmill to Nowhere.** New MRR = Churn × MRR. At the point
    you can't acquire faster than churn removes, you stall.

---

## Direct quotes for retainer-selling conversations

Tzuo:

1. *"We prefer outcomes over ownership."*
2. *"The real work starts after the sale."*
3. *"Subscriptions are the only business model that is entirely based on
   the happiness of your customers."*
4. *"Pricing is the key growth lever behind the other seven."*

Warrillow:

5. *"Subscribers are better than customers."*
6. *"By the time the clock has ticked for 90 days, the customer's
   lifetime value and profitability will have been practically set in
   stone."* (Harland Clarke study)
7. *"Charging up front actually reduces churn at the one-year point."*
   (David Skok)
8. *"Your first sale needs to be to your employees and partners."*
9. *"Churn is directly related to use: the more your subscribers use your
   service, the less likely they are to churn."*

Andrew Gray (Kirkpatrick & Hopes accountancy, in Warrillow):

10. *"We had a windfall of cash coming into the business equal to about
    3 months' sales when we switched."*

---

## Sources

Tzuo, Tien with Gabe Weisert. *Subscribed: Why the Subscription Model
Will Be Your Company's Future — and What to Do About It.* Portfolio,
2018. Extract at `C:/temp/books/subscribed.txt`.

Warrillow, John. *The Automatic Customer: Creating a Subscription
Business in Any Industry.* Portfolio/Penguin, 2015. Extract at
`C:/temp/books/automatic-customer.txt`.
