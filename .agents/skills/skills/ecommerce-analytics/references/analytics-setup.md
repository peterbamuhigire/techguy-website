# Analytics Setup Reference

## Tracking Stack

Minimum viable analytics stack for an ecommerce site:

| Tool | Purpose | Cost |
|------|---------|------|
| Google Analytics 4 | Sessions, conversions, funnel, acquisition | Free |
| Google Search Console | Organic keywords, impressions, CTR | Free |
| Meta Pixel | Facebook/Instagram retargeting, conversion tracking | Free |
| Hotjar or Microsoft Clarity | Heatmaps, session recordings, form analytics | Free tier available |
| Email platform (Mailchimp/Klaviyo) | Email analytics, segmentation, automation | Paid |

## GA4 Ecommerce Events to Implement

```javascript
// View product page
gtag('event', 'view_item', {
  currency: 'USD',
  value: 29.99,
  items: [{ item_id: 'SKU123', item_name: 'Product Name', item_category: 'Category', price: 29.99, quantity: 1 }]
});

// Add to cart
gtag('event', 'add_to_cart', {
  currency: 'USD',
  value: 29.99,
  items: [{ item_id: 'SKU123', item_name: 'Product Name', price: 29.99, quantity: 1 }]
});

// Begin checkout
gtag('event', 'begin_checkout', {
  currency: 'USD',
  value: 29.99,
  items: [{ item_id: 'SKU123', item_name: 'Product Name', price: 29.99, quantity: 1 }]
});

// Purchase
gtag('event', 'purchase', {
  transaction_id: 'ORDER-001',
  currency: 'USD',
  value: 34.99,
  shipping: 5.00,
  tax: 0,
  items: [{ item_id: 'SKU123', item_name: 'Product Name', price: 29.99, quantity: 1 }]
});
```

## Funnel Report Setup in GA4

1. Go to Explore → Funnel Exploration
2. Define steps:
   - Step 1: view_item (product page viewed)
   - Step 2: add_to_cart
   - Step 3: begin_checkout
   - Step 4: purchase
3. Set date range to rolling 30 days
4. Add segment: New Users vs. Returning Users

## Heatmap Priorities

Run heatmaps on these pages first (highest ROI):
1. Homepage (above fold — what do visitors click before scrolling?)
2. Product page (do they click Add to Cart? Do they read reviews?)
3. Checkout step 1 (where do they hesitate or exit?)
4. Cart page (what causes them to leave without proceeding?)

## CLV Calculation Worksheet

Step 1: Export all orders from the past 24 months
Step 2: Group by customer ID
Step 3: Calculate per customer:
  - First order date
  - Last order date
  - Total orders
  - Total spend

Step 4: Calculate averages:
  AOV = Total revenue / Total orders
  Avg Purchase Frequency = Total orders / Unique customers
  Avg Customer Lifespan = Average months between first and last order / 12

Step 5: CLV = AOV × Purchase Frequency × Lifespan
Step 6: CLV (gross margin adjusted) = CLV × Gross Margin %
Step 7: Max CAC = CLV (gross) / 3

## RFM Scoring — Spreadsheet Method

1. Export: customer_id, order_date, order_value for all orders
2. Calculate:
   - Recency = TODAY() minus MAX(order_date) per customer (lower = better)
   - Frequency = COUNT(orders) per customer (higher = better)
   - Monetary = SUM(order_value) per customer (higher = better)
3. Use PERCENTRANK to score each dimension 1-5 (5 = best)
4. Combine: RFM_score = R + F + M (max 15)
5. Segment: 13-15 = Champions, 10-12 = Loyal, 7-9 = Potential, 4-6 = At-Risk, 3 = Lost
