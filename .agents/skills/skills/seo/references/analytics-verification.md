---
title: Google Analytics 4 & Search Console Integration
---

# Google Analytics 4 & Search Console Setup Guide

## Google Analytics 4 via Partytown (Zero-Performance Impact)

### Why Partytown?
- Offloads GA4 script to Web Worker (separate thread)
- **Never blocks main thread** — no layout shift, no frame drops
- Maintains 95-100 Lighthouse scores even with full analytics
- 17KB additional JavaScript (only in production)

### Setup Steps

#### 1. Install Partytown
```bash
npm install @builder.io/partytown
```

#### 2. Update astro.config.mjs
```javascript
import { defineConfig } from 'astro/config';
import partytown from '@builder.io/partytown/astro';

export default defineConfig({
  integrations: [
    partytown({
      config: {
        forward: ["dataLayer.push"],
      },
    }),
    // ... other integrations
  ],
});
```

#### 3. Create .env with GA4 Measurement ID
```bash
# .env (gitignored)
PUBLIC_GA_MEASUREMENT_ID=G-XXXXXXXXXX
```

#### 4. Verify .env is Gitignored
In `.gitignore`:
```
.env
.env.local
.env.*.local
```

#### 5. Add GA4 Script to BaseLayout.astro

```astro
---
// In BaseLayout.astro head section
const gaID = import.meta.env.PUBLIC_GA_MEASUREMENT_ID;
const isProduction = import.meta.env.PROD;
---

<head>
  <!-- ... existing head content ... -->

  {isProduction && gaID && (
    <>
      <!-- Google Analytics via Partytown (Web Worker) -->
      <script type="text/partytown">
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '{gaID}', {
          'anonymize_ip': true,
          'allow_google_signals': false,
          'allow_ad_personalization_signals': false,
        });
      </script>

      <!-- GA4 Google Tag Script (async, deferred) -->
      <script async type="text/partytown" src="https://www.googletagmanager.com/gtag/js?id={gaID}"></script>
    </>
  )}
</head>
```

**Key details:**
- Only loads in production (`import.meta.env.PROD`)
- `anonymize_ip: true` — privacy by default
- `allow_google_signals: false` — disable demographic data
- `allow_ad_personalization_signals: false` — extra privacy

### Alternative: Direct Injection (Simpler but +28KB)

If Partytown setup seems complex:

```astro
<head>
  {isProduction && gaID && (
    <>
      <script async src={`https://www.googletagmanager.com/gtag/js?id=${gaID}`}></script>
      <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '{gaID}', {'anonymize_ip': true});
      </script>
    </>
  )}
</head>
```

**Trade-off**: Simpler, but adds ~28KB JavaScript to main thread. Lighthouse score drops 2-5 points.

### Privacy-Friendly Alternatives

If you prefer privacy-first analytics:

#### Plausible Analytics
- No cookies, GDPR-compliant by default
- $29/month, $290/year
- Real-time dashboard, no learning curve
- Privacy Policy: "We don't sell your data" (business model = subscriptions only)

```astro
<!-- Plausible (privacy-first) -->
<script defer data-domain="example.com" src="https://plausible.io/js/script.js"></script>
```

#### Umami Analytics
- Open-source, GDPR-compliant
- Self-hosted (privacy = yours alone)
- Free or $9/month for managed hosting
- Zero cookie tracking

```html
<!-- Umami (self-hosted or managed) -->
<script async src="https://analytics.example.com/script.js" data-website-id="12345678"></script>
```

#### Fathom Analytics
- Privacy-first, EU-hosted
- $14/month, €120/year
- GDPR/CCPA compliant by default
- Real-time, simple dashboard

```html
<script src="https://cdn.usefathom.com/script.js" data-site="YOUR_SITE_ID" defer></script>
```

### Verify GA4 Is Live

After deployment:

```bash
# 1. Check for gtag script in page source
curl https://yoursite.com | grep "googletagmanager"

# 2. Open browser DevTools
#    → Application tab
#    → Cookies
#    → Look for _ga, _gid cookies (GA4 sets these)

# 3. Check Google Analytics dashboard
#    → Realtime report
#    → Refresh site in another tab
#    → Should see 1 active user
```

If no cookies appear:
- Check `PUBLIC_GA_MEASUREMENT_ID` in `.env`
- Verify `import.meta.env.PROD` is true (check Astro build output)
- Check browser console for errors: `gtag is not defined`

---

## Google Search Console Verification

### Method 1: HTML Meta Tag (Recommended)

Automatic verification from `docs/seo.md`.

1. **Get verification code from GSC:**
   - Go to: https://search.google.com/search-console
   - Add property → Enter site URL
   - Select "HTML tag" method
   - Copy the `content` value from the meta tag

2. **Add to docs/seo.md:**
```markdown
google_site_verification: "abcd1234xyz5678"
```

3. **Read by SEO skill:**
```astro
<!-- In BaseLayout.astro -->
{googleSiteVerification && (
  <meta name="google-site-verification" content={googleSiteVerification} />
)}
```

4. **Verify in GSC:**
   - Back to GSC property setup
   - Click "Verify" button
   - GSC crawls site, finds the meta tag within 1-2 hours

### Method 2: HTML File Upload (Manual Backup)

If meta tag doesn't work:

1. **Download HTML file from GSC**
   - File name: `google[randomstring].html`

2. **Place in public/ directory:**
   ```
   public/
   └── google[randomstring].html
   ```

3. **Commit and deploy**
   - File is now at: `https://yoursite.com/google[randomstring].html`

4. **Verify in GSC**
   - GSC crawls the file
   - Verification completes

---

## Post-Launch Monitoring

### Week 1-2 Checklist

- [ ] **Google Search Console:**
  - [ ] Verify site ownership (meta tag or HTML file)
  - [ ] Submit sitemap: `https://yoursite.com/sitemap-index.xml`
  - [ ] Request indexing for key pages (homepage, services, about)
  - [ ] Check Coverage report for crawl errors

- [ ] **Google Analytics 4:**
  - [ ] Dashboard shows real users (Realtime report)
  - [ ] Events are tracking (scroll events, click events)
  - [ ] Conversion goals set up (contact form submission, etc.)

- [ ] **Mobile Usability:**
  - [ ] GSC shows "No issues" in Mobile Usability report
  - [ ] Run PageSpeed Insights on homepage

### Ongoing Monitoring (Monthly)

| Check | Frequency | Where |
|-------|-----------|-------|
| Core Web Vitals | Weekly | GSC → Experience → Core Web Vitals |
| Search traffic | Weekly | GSC → Overview → Top queries |
| Crawl errors | Weekly | GSC → Coverage |
| GA4 goal completion | Weekly | GA4 → Conversions → Goals |
| Lighthouse score | Monthly | PageSpeed Insights (manual) |
| Backlink profile | Monthly | Ahrefs / SEMrush (external tools) |

### Red Flags (Action Required)

| Issue | Action |
|-------|--------|
| High crawl error rate | Check robots.txt, fix broken links |
| Pages not indexed | Submit to GSC, check canonical URLs |
| Low CLS score | Identify cumulative layout shift (images, fonts) |
| 404 errors in GSC Coverage | Fix broken internal links |
| Low search click-through rate | Review titles/descriptions in search results |

---

## Common GA4 Troubleshooting

### "gtag is not defined" error
- **Cause:** GA4 script not loaded or Partytown not configured
- **Fix:** Check `.env` has `PUBLIC_GA_MEASUREMENT_ID`, verify `import.meta.env.PROD` in build

### No GA4 cookies visible
- **Cause:** Site not in production or analytics blocked
- **Fix:** Check Network tab in DevTools — `gtag/js` request should return 200
- Check browser privacy settings not blocking GA4

### Lighthouse score dropped after adding GA4
- **Cause:** Using direct injection instead of Partytown
- **Fix:** Switch to Partytown setup (or use privacy-first alternative like Plausible)

### GSC verification meta tag not found
- **Cause:** BaseLayout not reading from docs/seo.md or meta tag syntax wrong
- **Fix:** Verify docs/seo.md has `google_site_verification` key, check page source HTML

---

## Security Notes

- **Never commit .env** — keep `PUBLIC_GA_MEASUREMENT_ID` in `.env.local` (gitignored)
- **API keys:** If using Umami/Fathom with API, store in `.env` (not in code)
- **Partytown config:** Forward only necessary functions; default is safe for GA4

---

## Performance Impact Summary

| Method | JS Size | Core Web Vitals | Privacy | Setup Time |
|--------|---------|-----------------|---------|-----------|
| **Partytown (Recommended)** | +17KB | 95-100 | Medium | 15 min |
| Direct Injection | +28KB | 93-97 | Medium | 5 min |
| Plausible | +1KB | 95-100 | ✅ Excellent | 2 min |
| Umami (self-hosted) | +3KB | 95-100 | ✅ Excellent | 30 min |
| Fathom | +2KB | 95-100 | ✅ Excellent | 2 min |

**Recommendation:** Use Partytown for full Google Analytics with zero performance loss. Use Plausible/Fathom/Umami if privacy is priority.
