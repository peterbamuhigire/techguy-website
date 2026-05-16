# Ecommerce Analytics Skill

What you don't measure, you can't improve. Analytics is not a reporting exercise — it is the operating system of a profitable ecommerce business.

## The Analytics Value Chain (Phillips)

Seven sequential steps from data collection to business impact:

1. Identify Demand — What business questions need answers? Start with questions, not data.
2. Plan Analytics — Which metrics answer those questions? What tracking is required?
3. Activate Environment — Implement tracking (GA4, pixel, heatmaps, email platform).
4. Prepare Data — Ensure data quality, remove bots, de-duplicate, validate.
5. Analyse and Optimise — Find patterns, form hypotheses, test interventions.
6. Socialise Insights — Share findings with client in plain language, not raw data.
7. Communicate Economic Impact — Convert analytics findings into revenue impact (currency terms).

Never build a dashboard before completing Steps 1-2. Most ecommerce analytics fails because tracking is built first and questions are asked second.

## Core Metrics Framework

### The Three Growth Levers — Measured

Every ecommerce metric maps to one of three levers:

| Lever | Key Metrics |
|-------|-------------|
| More customers | Conversion rate, CAC, new visitor count, channel acquisition mix |
| Higher AOV | Average order value, units per transaction, attachment rate |
| Higher LTV | Repeat purchase rate, CLV, churn (subscriptions), referral rate |

Track one metric per lever as the North Star. Don't optimise all three simultaneously in early stage.

### Conversion Funnel Metrics

Track drop-off at each stage:

Sessions → Product Page Views → Add to Cart → Checkout Started → Purchase
100% → 45-60% → 8-15% → 5-10% → 2-4%

Industry baselines above are approximations. Establish your own baseline first, then optimise by identifying the worst drop-off point.

**Diagnosis by drop-off location:**
- Sessions to Product page (high bounce): landing page mismatch, slow load, unclear offer
- Product page to Add to cart (low): weak product copy, missing reviews, price anchoring issue
- Add to cart to Checkout started (high abandonment): delivery cost shock, forced account creation
- Checkout started to Purchase (drop): form friction, payment failure, trust deficit

### Revenue Metrics

| Metric | Formula | Target |
|--------|---------|--------|
| **Conversion Rate** | Orders / Sessions × 100 | 2-4% (industry avg) |
| **AOV** | Revenue / Orders | Category-dependent |
| **Revenue per Visitor** | Revenue / Sessions | CAC must be below this |
| **CLV** | AOV × Purchase Frequency × Customer Lifespan | Must exceed CAC × 3 |
| **CAC** | Total acquisition spend / New customers | Must be < CLV |
| **ROAS** | Revenue / Ad spend | Minimum 3x to be profitable |

---

## RFM Analysis — Customer Segmentation

RFM segments customers by purchase behaviour. It is the foundation of all retention marketing.

**Three dimensions:**
- **Recency (R):** How recently did they buy? (Days since last purchase)
- **Frequency (F):** How often do they buy? (Number of orders)
- **Monetary (M):** How much do they spend? (Total lifetime spend)

**Scoring:** Score each customer 1-5 on each dimension (5 = best). Combine into segments:

| Segment | R | F | M | Strategy |
|---------|---|---|---|----------|
| Champions | 5 | 5 | 5 | Reward, make brand ambassadors |
| Loyal Customers | 4-5 | 4-5 | 3-5 | Upsell, ask for referrals |
| Potential Loyalists | 3-4 | 1-2 | 2-3 | Nurture with relevant offers |
| At-Risk | 2 | 3-4 | 3-4 | Win-back campaign |
| Lost | 1 | 1-2 | 1-2 | Aggressive win-back or suppress |

**How to calculate RFM:**
1. Export all orders (order date, customer ID, order value)
2. Calculate days since last order (Recency)
3. Count total orders per customer (Frequency)
4. Sum total spend per customer (Monetary)
5. Score 1-5 within each dimension (quintile ranking)
6. Combine scores: RFM = R + F + M (max 15)

Run RFM quarterly. Customers who move down tiers need immediate attention.

---

## Cohort Analysis — Retention Over Time

Cohort analysis tracks groups of customers acquired in the same period to reveal retention decay.

**Structure:**
- Row = acquisition cohort (e.g., "All customers acquired in January")
- Column = time period (Month 1, Month 2, Month 3...)
- Cell = % of cohort still purchasing in that period

**Example cohort table:**

| Cohort | M1 | M2 | M3 | M6 | M12 |
|--------|----|----|----|----|-----|
| Jan | 100% | 35% | 22% | 15% | 11% |
| Feb | 100% | 38% | 25% | 17% | — |
| Mar | 100% | 41% | 28% | — | — |

**Reading the table:**
- If M2 retention is improving cohort-over-cohort: product/onboarding is getting better
- If M6 retention is flat: customers buy once, then stop — address with win-back and lifecycle emails
- If a specific cohort underperforms: that acquisition channel may attract low-quality buyers

**Retention benchmark by category:**
- Fashion: 20-30% annual retention
- Consumables (supplements, coffee): 40-60%
- Electronics: 15-20% (long repurchase cycles)
- Subscription boxes: target >90% month-over-month

---

## Attribution Modelling

Attribution assigns revenue credit to the marketing touchpoints that led to a sale.

| Model | How it works | Best for |
|-------|-------------|----------|
| **Last-click** | 100% credit to the final touchpoint | Understanding what closes sales |
| **First-click** | 100% credit to the first touchpoint | Understanding what generates awareness |
| **Linear** | Equal credit across all touchpoints | Understanding the full journey |
| **Time-decay** | More credit to recent touchpoints | Understanding what accelerates decisions |
| **Data-driven** | ML-based credit allocation | Mature businesses with high data volume |

**Practical guidance:**
- For budget decisions: use first-click to value awareness channels fairly
- For optimisation: use last-click to identify what converts
- For full picture: compare first vs. last-click. Big differences = multi-stage customer journey.

**Attribution window:**
- Fashion/impulse: 1-7 days
- Considered purchases (electronics, furniture): 30-90 days
- B2B services: 90-180 days

---

## CLV Calculation

Customer Lifetime Value is the maximum you can afford to spend acquiring a customer.

**Simple CLV formula:**
CLV = AOV × Purchase Frequency (annual) × Customer Lifespan (years)

**Example:**
- AOV = $50, Frequency = 4x/year, Lifespan = 2 years
- CLV = $50 × 4 × 2 = $400

**Gross margin adjustment:**
CLV (gross) = CLV × Gross Margin %
If gross margin is 40%: CLV (gross) = $400 × 0.40 = $160

**Maximum CAC rule:** CAC should not exceed 1/3 of gross CLV. In this example: CAC ≤ $53.

**How to improve CLV:**
1. Increase AOV: bundles, upsells, free shipping thresholds
2. Increase frequency: replenishment reminders, subscription offers, new product launches
3. Increase lifespan: community, loyalty programme, consistent brand experience

---

## A/B Testing Framework

Test one variable at a time. Measure statistical significance before declaring a winner.

**Testing priority (by revenue impact):**
1. Checkout CTA button (text, colour, size)
2. Product page headline
3. Product price display (charm pricing, anchoring)
4. Email subject lines
5. Ad creative
6. Product image (lifestyle vs. product-only)
7. Delivery cost display position

**Test structure:**
- Control (A): current version
- Variant (B): single changed element
- Traffic split: 50/50
- Duration: minimum 2 weeks, minimum 100 conversions per variant
- Significance threshold: 95% confidence before declaring winner

**Do not test:**
- Multiple variables simultaneously
- During unusual periods (holidays, PR spikes)
- With sample sizes below 100 conversions per variant

---

## RASTA Reporting Model (Phillips)

Structure client dashboards and reports using RASTA:

- **R — Relevant:** Only include metrics that drive decisions. No vanity metrics.
- **A — Accurate:** Data quality verified before reporting. No bots, no test orders.
- **S — Simple:** One chart per insight. No data walls.
- **T — Timely:** Reports delivered when decisions are made, not on arbitrary schedules.
- **A — Actionable:** Every metric must have a "so what" — what action does this trigger?

**Monthly report structure:**
1. Executive summary (3 bullets: what's up, what's down, what we're doing about it)
2. Revenue overview (total, vs. last month, vs. last year)
3. Three lever metrics (acquisition, AOV, retention)
4. Funnel drop-off (where are we losing customers?)
5. Top and bottom performing products
6. Recommended actions (prioritised by revenue impact)

## Integration

- **ecommerce** — tracks conversion rate, trust signal effectiveness, cart abandonment rate
- **ecommerce-funnel** — measures funnel conversion at each stage, email open/click rates, CLV by segment
- **ecommerce-checkout** — tracks checkout step drop-off, payment method success rates, form error rates
- **seo-audit** — organic search metrics, landing page performance, keyword-driven conversion rates
- **blog-writer** — measures content-to-conversion path (blog → product → purchase)
