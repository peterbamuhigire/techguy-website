# Ecommerce Funnel Skill

Build the hidden 2/3 of ecommerce success: the customer journey, funnel architecture, and retention systems that turn one-time buyers into long-term revenue.

## The Iceberg Effect (Larsson)

Visible ecommerce (the site, the catalog, the traffic) is 1/3 of what drives success. Hidden below the surface:
- Customer psychology and avatar depth
- Funnel architecture (separate from the storefront)
- Retention mechanics and lifecycle management
- Data infrastructure and testing culture
- Team alignment on brand and positioning

Build the hidden layers before spending on traffic.

## Step 1: Customer Avatar Framework

Before building any funnel, define the customer avatar. Funnels built for "everyone" convert no one.

**Demographics (minimum):**
- Age range, gender, location
- Income bracket and spending patterns
- Job/role and daily schedule constraints

**7 Emotional Questions:**
1. What do they lie awake worrying about at night?
2. What do they deeply desire but feel embarrassed to admit?
3. What do they resent in their current situation?
4. What do they fear most about making the wrong purchase decision?
5. What does success look like to them 90 days after buying?
6. Who do they aspire to become?
7. What language do they use to describe their problem (exact words, not marketing speak)?

**10 Behavioural Questions:**
1. Where do they spend time online?
2. What content do they consume (YouTube channels, blogs, podcasts)?
3. What do they buy repeatedly in this category?
4. What have they tried before that didn't work?
5. What objections do they have before buying?
6. How do they research purchases? (reviews, experts, friends, specs)
7. What triggers the decision to buy now vs. later?
8. How price-sensitive are they?
9. What competing products have they considered?
10. How did they first hear about this category?

Use the avatar's exact language in headlines, product descriptions, and email subject lines.

## Step 2: Traffic Temperature

Not all visitors are equal. Messaging must match the visitor's relationship with the brand.

| Temperature | Who They Are | What They Need | What to Show |
|-------------|--------------|----------------|--------------|
| **Cold** | No brand awareness | Reason to trust | Value-first content, brand story, proof of credibility |
| **Warm** | Aware, considering | Reason to choose you | Differentiation, comparison, reviews, guarantees |
| **Hot** | Past buyers, cart abandoners | Reason to return | Personalised offers, loyalty rewards, win-back campaigns |

**Traffic sources by temperature:**
- Cold: social ads to new audiences, SEO, influencer reach
- Warm: retargeting (pixel-based), email list (leads not yet bought), lookalike audiences
- Hot: post-purchase email sequences, SMS, loyalty programme, retargeting past buyers

Never send cold-traffic messaging to hot-traffic audiences. They already know you — skip the introduction.

## Step 3: Funnel Architecture

The funnel runs parallel to the main storefront. It is a focused, sequential conversion path.

```
[Traffic Entry] → [Front-End Offer] → [Order Bump] → [Upsell] → [Downsell] → [RIC Offer]
```

**Front-End Offer:**
- Low-price, high-perceived-value product (tripwire or loss leader)
- Goal: convert a stranger into a buyer. Even a small purchase changes psychology.
- Must deliver genuine value — this is the trust-builder.

**Order Bump:**
- Shown on the checkout page, before payment is submitted
- Complementary product: "Add [X] to your order for just [price]" with a checkbox
- Should feel like an obvious upgrade, not a hard sell
- Target: 20-35% of buyers take the order bump

**Upsell (OTO — One Time Offer):**
- Shown immediately after purchase confirmation, before the thank-you page
- Higher-value version, bundle, or logical next product
- "Since you just bought X, you can add Y at a special price — this offer expires when you leave this page"
- Target: 15-25% uptake

**Downsell:**
- Shown if upsell is declined
- Smaller version of the upsell at a lower price, or a payment plan option
- "Not ready for the full bundle? Get just [core component] for [lower price]"

**Recurring Income Core (RIC):**
- Subscription, membership, or replenishment offer
- Highest lifetime value mechanism in ecommerce
- Can be front-loaded (subscribe to get the deal) or back-loaded (offered after initial purchase)

## Step 4: Three Customer Tiers

Not all buyers are equal. Identify and treat each tier differently.

| Tier | Who They Are | Strategy |
|------|--------------|----------|
| **Repeat Buyers** | Bought 2+ times | Loyalty programme, early access, VIP offers |
| **Continuity** | Active subscribers | Retention emails, usage tips, community access |
| **Whales** | 10x+ average order value | Personal outreach, bespoke bundles, premium service |

Whales are rare (2-5% of customers) but can represent 20-40% of revenue. Identify them early via purchase data and treat them accordingly.

## Step 5: Customer Lifecycle Management

Every customer moves through stages. Each stage needs different messaging.

```
New → Active → At-Risk → Lapsed
```

**New (0-30 days post-purchase):**
- Indoctrination email sequence (see references/email-sequences.md)
- Welcome to the brand, set expectations, deliver value immediately
- Introduce community, content, or loyalty programme
- Invite first review

**Active (regular purchasers):**
- Bucket promotions (seasonal, event-driven)
- Cross-sell and upsell based on purchase history
- Basket analysis: identify products frequently bought together and recommend proactively

**At-Risk (purchase frequency dropping):**
- Trigger: no purchase in [category-average interval × 1.5]
- Re-engagement offer: exclusive deal, new product launch, personal note
- Survey: "We miss you — what can we do better?"

**Lapsed (inactive beyond threshold):**
- Win-back campaign: compelling offer with time limit
- If no response after 3 win-back attempts: move to suppression list (do not spam)

## Step 6: RIC Metrics — Measuring Subscription Health

If the funnel includes a recurring offer, track these three metrics monthly:

| Metric | Formula | Target |
|--------|---------|--------|
| **Churn Rate (CR)** | Cancellations ÷ Active subscribers | Under 5%/month |
| **Customer Count Retention (CCR)** | Active subscribers this month vs. last | Growing or stable |
| **ASRC** | Total subscription revenue ÷ Active subscribers | Trending up |

Churn above 10%/month means the product or delivery experience has a fundamental problem. Fix before scaling.

## Integration

- **ecommerce** — base skill for product page UX, trust signals, cart, mobile
- **ecommerce-checkout** — brand foundation and checkout UX that feeds into the funnel
- **ecommerce-analytics** — measures funnel performance, cohort retention, CLV
- **sales-copywriting** — PASTOR and 4P's frameworks for funnel page copy
- **email-sender** — technical implementation of PHP + PHPMailer for transactional emails
