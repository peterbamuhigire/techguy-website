# 05 — Measurement Maturity: GA4 Events, Checklists, and Review Cadence

## Skills Applied
- `seo` — `references/seo-reference.md` (Analytics)
- `cro-audit` — `references/heuristic-checklist.md` (Section 8, Measurement)

## Current State

GA4 is connected (after Phase 1). Basic pageview tracking is running. No custom events are defined. No conversion goals are configured. No regular review cadence exists.

## Target State

A complete GA4 measurement framework with custom events, conversion goals, and a structured weekly/monthly/quarterly review process. The goal is a practice that makes decisions based on evidence, not intuition.

## GA4 Custom Events to Configure

### Event 1 — Contact form submission (most important)

**Event name:** `contact_form_submit`

**Where to trigger:** In the PHP form backend (`/api/contact.php`), add a server-side redirect to a thank-you page after successful submission. Create `src/pages/en/contact-thank-you.astro` with a GA4 event fired on page load.

**Method (client-side via the thank-you page):**
```html
<!-- On contact-thank-you.astro page load: -->
<script>
  window.dataLayer = window.dataLayer || [];
  dataLayer.push({
    'event': 'contact_form_submit',
    'form_type': 'contact',
    'qualification_score': document.referrer.includes('priority') ? 'high' : 'standard'
  });
</script>
```

Alternatively, configure in GA4 as a conversion event triggered by: `page_view` where `page_location` contains `/contact-thank-you/`.

**Mark as conversion:** Yes. This is the primary conversion event.

---

### Event 2 — Qualification flow completion

**Event name:** `qualification_flow_complete`

Add to the `QualificationFlow.astro` component (Phase 9, file 05) when the score is calculated:

```javascript
// In the Alpine.js calculateScore() function:
calculateScore() {
  this.score = Object.values(this.answers).reduce((sum, val) => sum + val, 0);
  // ... existing logic ...
  
  // GA4 event
  if (typeof gtag !== 'undefined') {
    gtag('event', 'qualification_flow_complete', {
      'qualification_score': this.score,
      'qualification_outcome': this.outcome
    });
  }
}
```

**Mark as conversion:** No. Use as a micro-conversion to understand qualification flow engagement.

---

### Event 3 — WhatsApp click

**Event name:** `whatsapp_click`

Add to all WhatsApp links on the site (contact page, footer, mobile header):
```html
<a
  href="https://wa.me/256784464178"
  onclick="gtag('event', 'whatsapp_click', {'method': 'website'});"
>
  WhatsApp
</a>
```

**Mark as conversion:** Yes (treat as equivalent to contact form submission).

---

### Event 4 — Pricing page view

**Event name:** `pricing_page_view`

**Where:** Automatically tracked as a pageview in GA4. Configure as a key event by going to GA4 → Configure → Events and marking `page_view` where `page_location` contains `/pricing/` as a key event.

---

### Event 5 — Article engagement (reading depth)

**Event name:** `scroll_depth`

GA4 tracks `scroll` events natively at 90% page depth. Confirm this is enabled:
- GA4 → Configure → Events → Enhanced Measurement → Scrolls should be toggled ON

This measures which articles readers finish vs. which they bounce from. Use to identify the highest-quality content.

---

### Event 6 — AI referral sessions (Phase 8 channel group)

Already configured in Phase 8, file 04. Confirm the custom channel group "AI Search" is live and reporting.

---

## GA4 Conversion Goals Summary

| Conversion | GA4 event | Value |
|---|---|---|
| Contact form submission | `contact_form_submit` | Primary |
| WhatsApp click | `whatsapp_click` | Primary |
| Qualification flow high-score | `qualification_flow_complete` (outcome=priority) | Secondary |
| Pricing page view | `page_view` (page=/pricing/) | Micro |

---

## Weekly Review Checklist (15 minutes)

Every Monday morning:

- [ ] GA4 → Reports → Realtime: any anomalies in the past 7 days?
- [ ] How many contact form submissions this week? (vs. previous week)
- [ ] How many WhatsApp clicks? (vs. previous week)
- [ ] Which landing pages received the most sessions this week?
- [ ] Did any new pages rank in Google Search Console this week? (GSC → Performance → Queries — sort by latest date)
- [ ] Any manual actions or coverage issues in Google Search Console?

---

## Monthly Review Checklist (1 hour)

First Monday of each month:

**Traffic:**
- [ ] Total sessions this month vs. last month vs. same month last year
- [ ] Sessions by channel: Organic Search, Direct, Referral, AI Search (custom channel)
- [ ] Sessions by country: Uganda, Kenya, France (check if Francophone Africa traffic is growing)
- [ ] Top 10 landing pages by sessions

**Conversions:**
- [ ] Total contact form submissions this month
- [ ] Total WhatsApp clicks this month
- [ ] Qualification flow completion rate (completions ÷ starts)
- [ ] Qualification flow outcome distribution (resources vs. standard vs. priority)
- [ ] Conversion rate: sessions to contact form submission (target: 1-3%)

**Content:**
- [ ] Which articles drove the most sessions?
- [ ] Which articles had the longest average engagement time? (GA4 → Engagement → Pages)
- [ ] Which articles had the lowest engagement time? (candidates for improvement)
- [ ] Did this month's new article(s) drive any sessions?

**Search:**
- [ ] GSC: top 20 queries by impressions — any new queries appearing?
- [ ] GSC: which queries have high impressions but low CTR? (title/meta optimisation opportunity)
- [ ] GSC: are the geo pages appearing for their target keywords?
- [ ] GSC: any Core Web Vitals issues?

**Action:**
- [ ] Record key metrics in a simple spreadsheet (see template below)
- [ ] Identify one priority action for the coming month

---

## Monthly Metrics Spreadsheet Template

Create a simple spreadsheet with these columns, updated monthly:

| Month | Sessions | Organic | Direct | Referral | AI Search | Form subs | WA clicks | Conversion rate | Top article | Top landing page | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|

---

## Quarterly Review Checklist (2 hours)

Every 3 months (January, April, July, October):

**Search Engine Rankings:**
- [ ] Check target keyword rankings in Google Search Console (Performance → Queries — filter by each target keyword)
- [ ] Target keywords to check: "IT consultant Uganda", "software developer Uganda", "website developer Uganda", "consultant informatique Afrique", "développeur logiciel Afrique"
- [ ] Are geo pages appearing on page 1 for target keywords? If not, review Phase 5 and Phase 6.

**Competitor benchmarking:**
- [ ] Search each target keyword in incognito mode — who is ranking above the site?
- [ ] Review top-ranking competitor pages — what do they have that the site does not?
- [ ] Identify one content or technical improvement to close the gap

**Content audit:**
- [ ] Review editorial calendar (Phase 7, file 05) — are articles publishing on schedule?
- [ ] Which articles are underperforming? Identify 2-3 to update or expand.
- [ ] Are case study articles published? (Phase 7, file 04 — require client approval)

**Social proof:**
- [ ] Review `docs/social-proof/` — any pending entries over 90 days old? (Phase 10, file 02)
- [ ] Send follow-up to outstanding testimonial requests
- [ ] Have any new proof elements been added to the site this quarter?

**Retainer health:**
- [ ] How many active retainer arrangements? (Phase 9)
- [ ] Are retainer clients receiving consistent value? (Technology Care, SEO Foundation, Content Growth, CRO, ICT Manager)
- [ ] Is there an opportunity to upgrade any retainer client to a higher tier?

---

## Annual Review Checklist (half day)

January of each year:

- [ ] Review all 10 improvement plan phases — which acceptance criteria are still outstanding?
- [ ] Update all blog articles with year references (pricing data, etc.)
- [ ] Update the `ItemList` schema on blog.astro to include all articles published in the past year (Phase 10, file 03)
- [ ] Renew Google Business Profile — check NAP consistency, update photos, refresh description
- [ ] Review all schema blocks — are they accurate? Have circumstances changed?
- [ ] Review the social proof library — which pending proofs can be finalised?
- [ ] Set annual targets: sessions, conversions, retainer clients, new articles
- [ ] Record the annual score across all dimensions (reference the scoring framework from the original analysis)

---

## Acceptance Criteria

- [ ] GA4 `contact_form_submit` event configured and verified (submit test form, confirm event appears in GA4 real-time)
- [ ] GA4 `whatsapp_click` event configured on all WhatsApp links
- [ ] `qualification_flow_complete` event fires when qualification flow is completed
- [ ] Pricing page view configured as a key event in GA4
- [ ] All four conversion events marked as conversions in GA4
- [ ] Weekly review checklist saved and scheduled (recurring Monday calendar event)
- [ ] Monthly review checklist saved with first review date set
- [ ] Monthly metrics spreadsheet created with baseline data
- [ ] Quarterly review scheduled (recurring January, April, July, October)
- [ ] Annual review date set (January)

## Effort

**S** — 2 hours (GA4 event configuration + checklist setup)
