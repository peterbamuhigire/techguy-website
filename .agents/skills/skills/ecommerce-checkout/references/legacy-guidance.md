# Ecommerce Checkout & Brand Skill

Most ecommerce failures are brand failures in disguise. Clients spend on traffic without a brand foundation, then wonder why CAC is high and repeat purchase rates are low. Build the brand first. Then optimise the checkout.

## The 7C Brand Framework (Verma)

Before designing any page, define these seven brand foundations. They inform every design decision, every word of copy, and every channel choice.

### 1. Core — Why You Exist
- Brand purpose: what problem does this business solve at a deeper level than "selling products"?
- Brand values: 3-5 non-negotiable principles that guide every decision
- Brand essence: one phrase that captures the spirit (not a tagline — an internal compass)

**Questions to ask the client:**
- Why did you start this? What frustrated you about what existed?
- What would you refuse to do even if it made you money?
- What do you want customers to feel, not just think?

### 2. Customer — Who You Serve
- Not demographics: psychographics, aspirations, and identity
- Help them become who they want to be — not just solve a problem
- The customer avatar's exact language must appear in all copy

**Key insight:** Customers don't buy products. They buy a better version of themselves.

### 3. Community — Your 1,000 True Fans
- 1,000 true fans (Kelly) — a business needs only 1,000 people who love it deeply, not millions who are indifferent
- Community creates defensibility: competitors can copy products, not communities
- Community touchpoints: Facebook group, Discord, loyalty programme, annual event, ambassador programme

### 4. Competition — Your Unique Point of View (Sole™)
- Not just "we're better" — a specific, defensible point of view on the category
- What do you believe that others in your category do not?
- Example: "Most protein supplements are engineered for bodybuilders. We believe everyday people deserve the same nutrition without the bro-culture."
- Your Sole™ is the foundation for all differentiation messaging

### 5. Creatives — Brand Identity Execution
- Name, logo, colour palette, typography, packaging — all must express the Core values
- Premium positioning = restraint (white space, mono palette, serif or geometric type)
- Value positioning = energy (contrast, bold type, product-forward imagery)
- Never choose fonts or colours in isolation — they must reinforce the brand's emotional positioning

### 6. Content — Brand Storytelling
- Four content types (in rotation):
  1. Brand stories: origin, values, team, behind-the-scenes
  2. Educational: how-tos, buying guides, industry insights, tutorials
  3. Social proof: customer stories, before/afters, case studies, UGC
  4. Promotional: product launches, limited offers, seasonal campaigns
- Story structure: customer as hero, brand as guide (not the other way around)

### 7. Channel — Where You Show Up
- Owned: email list, website, SMS — highest control, highest ROI
- Shared: social media, marketplaces, communities — reach, but platform-dependent
- Paid: ads — fast reach, requires margin to sustain
- Build owned channels first. Social platforms change algorithms; email lists are yours forever.

---

## EVP vs. UVP

Every product page needs both. Every checkout page needs the EVP reinforced.

**UVP (Unique Value Proposition) — functional**
- "What does it do better than alternatives?"
- Lives on: product pages, comparison sections, specs, feature lists
- Example: "Ships in 24 hours. 90-day returns. Free exchange."

**EVP (Emotional Value Proposition) — identity**
- "How does it make the customer feel? Who does it help them become?"
- Lives on: hero sections, brand story, checkout confirmation, packaging
- Example: "The kit that makes professional results feel personal."

EVP is what removes price sensitivity. Customers who connect emotionally do not comparison-shop.

**How to find the EVP:**
1. Ask: "What is the customer's life like 90 days after they buy?"
2. Ask: "What will they tell their friends?" (exact words)
3. Ask: "What do they feel in the moment they use this product?"

---

## Checkout UX Deep-Dive

The checkout is where revenue is won or lost. Every friction point costs money.

### Form Design Rules
- **Fields shown:** name, email, phone, shipping address, payment — nothing else
- **Never ask:** date of birth, gender, "how did you hear about us" (save for post-purchase survey)
- **Autofill:** enable browser autofill on all fields (`autocomplete` attributes)
- **Inline validation:** show errors as the user types, not on submit
- **Label position:** labels above fields (not placeholder text — placeholder disappears on focus)
- **Mobile keyboards:** use `type="email"`, `type="tel"`, `type="number"` for correct keyboard

### Trust Hierarchy at Checkout
Place trust signals exactly where anxiety peaks:

| Anxiety Point | Signal to Show |
|---------------|----------------|
| Before entering card details | SSL badge, payment logos, padlock icon |
| After entering address | "Your information is encrypted and never shared" |
| Before clicking Pay | Order summary with full total (no surprise costs) |
| After clicking Pay | Loading indicator + "Processing securely..." |

### Payment Method Priority (East Africa)
Order payment options by regional prevalence:
1. M-Pesa / MTN Mobile Money (highest adoption)
2. Visa / Mastercard debit cards
3. PayPal (diaspora customers)
4. Bank transfer (B2B clients)
5. Cash on delivery (where operationally possible)

Never offer only credit cards in markets where debit and mobile money dominate.

### Step Count and Progress
- Maximum 3 steps: Cart → Details → Payment
- Show a progress indicator at top (Step 1 of 3)
- Allow back navigation without losing entered data
- Single-page checkout preferred where technically feasible

### Order Summary Persistence
- Visible at all times during checkout (right column on desktop, collapsible accordion on mobile)
- Must show: each item, quantity, individual price, subtotal, delivery cost, total
- Edit cart link without losing checkout progress

---

## Customer Journey Mapping (7-Day Arc)

Understanding when decisions happen shapes where to invest in trust-building.

| Day | Stage | Customer Activity | Your Response |
|-----|-------|-------------------|---------------|
| 1 | **Problem Awareness** | Realises they have a need | Content marketing, SEO |
| 2 | **Solution Awareness** | Discovers category/solutions exist | Ads, influencer content |
| 3 | **Brand Discovery** | Finds your store | Landing page, brand story |
| 4-5 | **Consideration** | Compares options, reads reviews | Product pages, reviews, guarantees |
| 6 | **Purchase Decision** | Ready to buy | Checkout UX, trust signals, payment options |
| 7 | **Post-Purchase** | Evaluates decision | Confirmation email, shipping update, onboarding |

Most stores over-invest in Day 6 (checkout) and under-invest in Days 1-5 (awareness and consideration). Reduce drop-off by building trust early — not just at checkout.

---

## Post-Purchase Sequence

The 72 hours after purchase are the most important for LTV.

### Thank-You Page (immediately after payment)
Must include:
1. Order confirmation with reference number
2. Expected delivery date (be specific — not "5-7 business days")
3. Review invite: "You'll receive an email to review your purchase. Your feedback helps other customers."
4. Cross-sell: one complementary product (not a full catalog)
5. Social invite: "Join [X] customers in our community: [link]"

### Transactional Emails (automated)
| Email | Timing | Content |
|-------|--------|---------|
| Order confirmation | Immediately | Order details, reference, expected delivery |
| Shipping confirmation | When dispatched | Tracking link, delivery date |
| Delivery confirmation | On arrival (if carrier API available) | "Your order arrived!" + review request |
| Review request | Day 7 post-delivery | Simple 1-click star rating + optional written review |

---

## DTC Growth Levers

Every checkout optimisation maps to one of three levers:

| Lever | Checkout Application |
|-------|---------------------|
| **More customers** | Reduce friction → more complete checkouts. Improve trust → more first-time buyers. |
| **Higher AOV** | Order bump on checkout page. Free shipping threshold. Bundle suggestions in cart. |
| **Higher LTV** | RIC offer post-purchase. Community invite. Indoctrination email sequence. |

Optimise for all three simultaneously. A checkout that converts once but never retains is a leaky bucket.

## Integration

- **ecommerce** — base UX, CLICK system, trust signals, product pages
- **ecommerce-funnel** — post-checkout sequences, upsells, customer lifecycle
- **ecommerce-analytics** — measures checkout conversion rate, drop-off by step, AOV trends
- **design-system** — brand identity execution (colours, type, visual hierarchy)
- **sales-copywriting** — EVP copy, headline formulas, CTA wording
- **i18n** — multi-language checkout, locale-specific payment methods, currency display
