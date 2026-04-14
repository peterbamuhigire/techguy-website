# 01 — Connect GA4, Google Search Console, and Bing Webmaster Tools

## Skills Applied
- `seo-audit` — `references/audit-checklist.md` section 14 (SEO Measurement)
- `seo-audit` — `references/seo-measurement-guide.md` (KPI Framework)

## Current State

`src/layouts/BaseLayout.astro:169–182` contains three placeholder tokens that have never been replaced:

```html
<!-- TODO: Replace G-XXXXXXXXXX with your real Measurement ID -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script is:inline>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
<meta name="google-site-verification" content="REPLACE_WITH_GSC_TOKEN" />
<meta name="msvalidate.01" content="REPLACE_WITH_BING_TOKEN" />
```

Every page on the site fires a request to Google's GTM servers with the placeholder ID `G-XXXXXXXXXX`. This sends meaningless data and wastes bandwidth. No conversion events can be tracked. No search performance data is available. No index coverage data is available.

## Current Score

Trust and measurement maturity: **4.5/10**
Technical SEO: **6.5/10**

## Target State

- GA4 Measurement ID (`G-XXXXXXXXXX`) replaced with Peter's real GA4 property ID
- Google Search Console HTML verification tag (`REPLACE_WITH_GSC_TOKEN`) replaced with the real token
- Bing Webmaster Tools meta tag (`REPLACE_WITH_BING_TOKEN`) replaced with the real token
- Five GA4 conversion events configured: contact form submit, newsletter subscribe, CTA button click, blog read >3 minutes, case study view
- Sitemap submitted to both GSC and Bing Webmaster Tools

## Target Score

Trust and measurement maturity: **6.5/10**
Technical SEO: **7.0/10**

## Why This Matters

The `seo-audit` skill's checklist section 14 states: "Google Analytics 4 (GA4) tracking code installed and verified working" and "Bing Webmaster Tools set up (critical — powers most AI search platforms)." Without this, every other optimisation in this plan is unmeasurable. The `seo-measurement-guide.md` states that Bing organic traffic specifically indicates AI search platform visibility (ChatGPT, Perplexity, Claude all use Bing's index). Connecting Bing Webmaster Tools is therefore not optional for a site targeting AI search readiness in Phase 7.

## Step-by-Step Instructions

### Step 1: Create the GA4 Property

1. Go to [analytics.google.com](https://analytics.google.com).
2. Click **Admin** (cog icon, bottom-left).
3. Click **Create Property**.
4. Property name: `techguypeter.com`
5. Reporting time zone: **East Africa Time (EAT)**
6. Currency: **USD**
7. Click **Next**. Select **Business type**: Professional services.
8. Select **Business size**: Small.
9. Click **Create**.
10. When asked "How do you want to collect data?", select **Web**.
11. Website URL: `https://techguypeter.com`
12. Stream name: `techguypeter.com`
13. Click **Create stream**.
14. Copy the **Measurement ID** — it will look like `G-XXXXXXXXXX` but with real characters (e.g., `G-4B7RMNK291`).

### Step 2: Create the GSC Property

1. Go to [search.google.com/search-console](https://search.google.com/search-console).
2. Click **Add property**.
3. Select **URL prefix**.
4. Enter `https://techguypeter.com/`.
5. Click **Continue**.
6. Under verification methods, select **HTML tag**.
7. Copy the `content` attribute value from the meta tag shown. It will look like: `content="abc123def456_AbCdEfGhIjKlMnOpQrStUvWxYz123456789"`.

### Step 3: Create the Bing Webmaster Tools Property

1. Go to [bing.com/webmasters](https://www.bing.com/webmasters).
2. Sign in with a Microsoft account.
3. Click **Add a site**.
4. Enter `https://techguypeter.com/`.
5. Select verification method: **Meta tag**.
6. Copy the `content` value from the meta tag shown.

### Step 4: Update BaseLayout.astro

Edit `src/layouts/BaseLayout.astro`, lines 169–182. Replace the entire analytics block with:

```html
<!-- Google Analytics 4 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=YOUR_REAL_GA4_ID"></script>
<script is:inline>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'YOUR_REAL_GA4_ID', {
    'send_page_view': true
  });
</script>

<!-- Search Console & Bing Webmaster Verification -->
<meta name="google-site-verification" content="YOUR_REAL_GSC_TOKEN" />
<meta name="msvalidate.01" content="YOUR_REAL_BING_TOKEN" />
```

Replace `YOUR_REAL_GA4_ID`, `YOUR_REAL_GSC_TOKEN`, and `YOUR_REAL_BING_TOKEN` with the values obtained in Steps 1–3.

### Step 5: Configure GA4 Conversion Events

After deploying, go to GA4 → Admin → Events → Create event. Create the following five conversion events:

| Event name | Trigger condition | Description |
|------------|------------------|-------------|
| `contact_form_submit` | When contact form submits successfully | Primary conversion |
| `newsletter_subscribe` | When newsletter form submits | Lead capture |
| `diagnostic_cta_click` | Click on "Book a 30-minute ICT diagnostic" button | Mid-funnel CTA |
| `blog_read_3min` | Engagement time >180 seconds on blog articles | Content engagement |
| `case_study_view` | Session visits `/en/case-studies/` | Trust content view |

For `contact_form_submit`: in the contact form Alpine.js success handler (`contact.astro`, the `@submit` handler's success branch), add:

```javascript
if (typeof gtag !== 'undefined') {
  gtag('event', 'contact_form_submit', {
    'event_category': 'conversion',
    'event_label': this.formData.service
  });
}
```

Mark all five events as **conversions** in GA4 → Events → toggle "Mark as conversion."

### Step 6: Submit Sitemaps

After GSC is verified:
1. In GSC, go to **Sitemaps** (left nav).
2. Enter `sitemap-index.xml`.
3. Click **Submit**.

In Bing Webmaster Tools:
1. Go to **Sitemaps**.
2. Submit `https://techguypeter.com/sitemap-index.xml`.

### Step 7: Verify the Build

```bash
npm run build
npm run preview
```

Open the preview in a browser and check the browser console. There should be no errors referencing `G-XXXXXXXXXX`. Open the Network tab and confirm requests to `googletagmanager.com` include the real measurement ID.

## Acceptance Criteria

- [ ] `G-XXXXXXXXXX` does not appear anywhere in `src/layouts/BaseLayout.astro`
- [ ] `REPLACE_WITH_GSC_TOKEN` does not appear anywhere in the built output
- [ ] `REPLACE_WITH_BING_TOKEN` does not appear anywhere in the built output
- [ ] GSC property shows as "Verified" within 24 hours of deployment
- [ ] Bing Webmaster Tools property shows as "Verified" within 24 hours
- [ ] GA4 real-time report shows visitors when the site is browsed
- [ ] All five conversion events are configured and marked as conversions in GA4
- [ ] Sitemaps submitted and confirmed in both GSC and Bing
- [ ] `npm run build` completes without errors

## Effort

**S — 2 hours** (setup of each platform ~30 minutes each; code change 15 minutes; verification 15 minutes)
