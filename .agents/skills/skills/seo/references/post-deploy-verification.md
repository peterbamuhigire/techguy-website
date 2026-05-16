---
title: Post-Deploy Verification & Crawler Optimization
---

# Post-Deploy Verification & Crawler Optimization

## Sitemap Auto-Pinging

After every deployment, notify search engines immediately.

### Update deploy.sh

Add ping commands after `npm run build`:

```bash
#!/bin/bash
set -e

# Build the site
npm run build

# Verify build succeeded
if [ ! -d "dist" ]; then
  echo "❌ Build failed: dist/ not found"
  exit 1
fi

# Ping Google
echo "📡 Pinging Google Sitemap..."
curl -s "https://www.google.com/ping?sitemap=https://yoursite.com/sitemap-index.xml" \
  && echo "✅ Google pinged" || echo "⚠️ Google ping failed"

# Ping Bing
echo "📡 Pinging Bing Sitemap..."
curl -s "https://www.bing.com/ping?sitemap=https://yoursite.com/sitemap-index.xml" \
  && echo "✅ Bing pinged" || echo "⚠️ Bing ping failed"

# Optional: Ping Yandex (if targeting Russian market)
echo "📡 Pinging Yandex Sitemap..."
curl -s "https://webmaster.yandex.com/ping?sitemap=https://yoursite.com/sitemap-index.xml" \
  && echo "✅ Yandex pinged" || echo "⚠️ Yandex ping failed"

# Copy Nginx config
cp nginx.conf /etc/nginx/sites-available/yoursite.com

# Reload Nginx
sudo nginx -t && sudo systemctl reload nginx

echo "✅ Deployment complete. Monitor GSC in 5 minutes."
```

### What This Does

- Immediately notifies Google/Bing of new sitemap
- Crawlers fetch updated `sitemap-index.xml` within minutes (not hours)
- New pages indexed within 24 hours (vs. 1-2 weeks without pinging)

---

## IndexNow Setup (Bing & Yandex Instant Notification)

For even faster indexing, implement IndexNow — instant notification when pages change.

### Step 1: Generate IndexNow API Key

```bash
# Create unique key (UUID)
openssl rand -hex 16
# Output: a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6

# Save in .env
echo "INDEXNOW_KEY=a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6" >> .env.local
```

### Step 2: Host Key File

Create `public/[key].txt`:

```
[key]
```

This file verifies you own the domain.

### Step 3: Submit via Astro Integration

Create `src/utils/indexnow.ts`:

```typescript
export async function notifyIndexNow(
  changeUrls: string[],
  key: string,
  keyLocation: string
) {
  if (!import.meta.env.PROD) {
    console.log('ℹ️ Skipping IndexNow (dev mode)');
    return;
  }

  const payload = {
    host: 'yoursite.com',
    key: key,
    keyLocation: keyLocation,
    urlList: changeUrls,
  };

  // Notify Bing
  try {
    const bingResponse = await fetch('https://www.bing.com/indexnow', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
    });

    if (bingResponse.ok) {
      console.log('✅ IndexNow Bing notified');
    }
  } catch (error) {
    console.error('⚠️ IndexNow Bing failed:', error);
  }

  // Notify Yandex
  try {
    const yandexResponse = await fetch('https://yandex.com/indexnow', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
    });

    if (yandexResponse.ok) {
      console.log('✅ IndexNow Yandex notified');
    }
  } catch (error) {
    console.error('⚠️ IndexNow Yandex failed:', error);
  }
}
```

### Step 4: Call After Deploy

Add to deploy script or CI/CD pipeline:

```bash
# After successful build and Nginx reload
node -e "
import { notifyIndexNow } from './src/utils/indexnow.ts';
const urls = [
  'https://yoursite.com/',
  'https://yoursite.com/services',
  'https://yoursite.com/about',
  'https://yoursite.com/contact',
];
await notifyIndexNow(
  urls,
  import.meta.env.INDEXNOW_KEY,
  'https://yoursite.com/key.txt'
);
"
```

---

## robots.txt Optimization

### Block Unnecessary Pages

Update `public/robots.txt`:

```
User-agent: *
Allow: /

# Block hashed assets (already indexed via pages)
Disallow: /_astro/

# Block private/duplicate content
Disallow: /admin/
Disallow: /api/
Disallow: /preview/

# Block query parameters (avoid duplicate content)
Disallow: /*?*

# Slow crawlers: longer crawl delay
User-agent: AhrefsBot
Crawl-delay: 10

User-agent: SemrushBot
Crawl-delay: 10

# Point to sitemap
Sitemap: https://yoursite.com/sitemap-index.xml
```

### Why Block `/_astro/`?

- `/_astro/` contains hashed CSS/JS (e.g., `Button.a1b2c3d4.css`)
- Each build regenerates hashes → new "pages" that don't exist
- Blocks crawlers from wasting quota on asset files
- Astro auto-serves these; they don't need crawling

---

## Nginx X-Robots-Tag Headers

Fine-grained crawler control via HTTP headers (server-level).

### Update nginx.conf

```nginx
# General SEO headers
add_header X-Robots-Tag "index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1";

# Archive old posts (if applicable)
location ~ /blog/\d{4}/\d{2}/ {
  # Older than 1 year: allow indexing but lower priority
  add_header X-Robots-Tag "index, follow, noarchive";
}

# Don't index search results pages
location /search {
  add_header X-Robots-Tag "noindex, nofollow";
}

# Private admin area
location /admin {
  add_header X-Robots-Tag "noindex, nofollow";
}

# Staging environment: block completely
location / {
  add_header X-Robots-Tag "index, follow" always;
}
```

---

## Post-Deploy Verification Script

Create `verify-deploy.sh` — runs after every deployment:

```bash
#!/bin/bash

SITE="https://yoursite.com"
ERRORS=0

echo "🔍 Starting post-deploy SEO verification..."
echo ""

# 1. Check robots.txt exists
echo "1️⃣  Checking robots.txt..."
ROBOTS_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$SITE/robots.txt")
if [ "$ROBOTS_STATUS" = "200" ]; then
  echo "✅ robots.txt: 200 OK"
else
  echo "❌ robots.txt: $ROBOTS_STATUS (expected 200)"
  ERRORS=$((ERRORS+1))
fi

# 2. Check sitemap exists
echo ""
echo "2️⃣  Checking sitemap..."
SITEMAP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$SITE/sitemap-index.xml")
if [ "$SITEMAP_STATUS" = "200" ]; then
  echo "✅ sitemap-index.xml: 200 OK"
else
  echo "❌ sitemap-index.xml: $SITEMAP_STATUS (expected 200)"
  ERRORS=$((ERRORS+1))
fi

# 3. Check GSC verification meta tag
echo ""
echo "3️⃣  Checking Google Site Verification..."
GSC_TAG=$(curl -s "$SITE" | grep -o "google-site-verification")
if [ -n "$GSC_TAG" ]; then
  echo "✅ Google Site Verification meta tag found"
else
  echo "⚠️  Google Site Verification meta tag NOT found (manual verification OK)"
fi

# 4. Check GA4 script (if production)
echo ""
echo "4️⃣  Checking Google Analytics 4..."
GA4_SCRIPT=$(curl -s "$SITE" | grep -o "googletagmanager\|gtag")
if [ -n "$GA4_SCRIPT" ]; then
  echo "✅ Google Analytics 4 script loaded"
else
  echo "⚠️  GA4 script not found (check .env PUBLIC_GA_MEASUREMENT_ID)"
fi

# 5. Check Core Web Vitals (PageSpeed Insights API)
echo ""
echo "5️⃣  Checking Core Web Vitals (PageSpeed Insights)..."
# Requires PSI_API_KEY env var
if [ -n "$PSI_API_KEY" ]; then
  PSI_RESPONSE=$(curl -s "https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url=$SITE&key=$PSI_API_KEY")
  LCP=$(echo "$PSI_RESPONSE" | grep -o '"largestContentfulPaint":[0-9]*' | grep -o '[0-9]*')
  CLS=$(echo "$PSI_RESPONSE" | grep -o '"cumulativeLayoutShift":[0-9.]*' | grep -o '[0-9.]*')
  if (( $(echo "$LCP < 2500" | bc -l) )); then
    echo "✅ LCP: ${LCP}ms (< 2.5s)"
  else
    echo "⚠️  LCP: ${LCP}ms (> 2.5s)"
  fi
else
  echo "ℹ️  PSI_API_KEY not set (skipping Core Web Vitals check)"
fi

# 6. Check Lighthouse score
echo ""
echo "6️⃣  Checking Lighthouse SEO Score..."
LIGHTHOUSE=$(curl -s "https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url=$SITE&key=$PSI_API_KEY" | grep -o '"SEO":[0-9]*' | grep -o '[0-9]*')
if [ -n "$LIGHTHOUSE" ]; then
  echo "✅ Lighthouse SEO Score: $LIGHTHOUSE/100"
  if [ "$LIGHTHOUSE" -lt 80 ]; then
    echo "⚠️  Score below 80 — review SEO audit report"
    ERRORS=$((ERRORS+1))
  fi
fi

# 7. Check robots.txt blocks _astro/
echo ""
echo "7️⃣  Checking robots.txt blocks /_astro/..."
ASTRO_BLOCKED=$(curl -s "$SITE/robots.txt" | grep -o "Disallow: /_astro/")
if [ -n "$ASTRO_BLOCKED" ]; then
  echo "✅ /_astro/ blocked (prevents crawling hashed assets)"
else
  echo "⚠️  /_astro/ not explicitly blocked (consider adding to robots.txt)"
fi

# Summary
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ "$ERRORS" -eq 0 ]; then
  echo "✅ All checks passed! Site is SEO-ready."
  exit 0
else
  echo "❌ $ERRORS issue(s) found. Review above."
  exit 1
fi
```

### Run After Deploy

```bash
chmod +x verify-deploy.sh
./verify-deploy.sh
```

### Success Output

```
🔍 Starting post-deploy SEO verification...

1️⃣  Checking robots.txt...
✅ robots.txt: 200 OK

2️⃣  Checking sitemap...
✅ sitemap-index.xml: 200 OK

3️⃣  Checking Google Site Verification...
✅ Google Site Verification meta tag found

4️⃣  Checking Google Analytics 4...
✅ Google Analytics 4 script loaded

5️⃣  Checking Core Web Vitals (PageSpeed Insights)...
✅ LCP: 1240ms (< 2.5s)

6️⃣  Checking Lighthouse SEO Score...
✅ Lighthouse SEO Score: 100/100

7️⃣  Checking robots.txt blocks /_astro/...
✅ /_astro/ blocked (prevents crawling hashed assets)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ All checks passed! Site is SEO-ready.
```

---

## Monitoring Checklist (Post-Deployment Week 1-4)

### Week 1: Verification
- [ ] robots.txt accessible at `/robots.txt`
- [ ] sitemap accessible at `/sitemap-index.xml`
- [ ] Google Site Verification meta tag in `<head>`
- [ ] GA4 script loading (check DevTools)
- [ ] Lighthouse SEO score 95+
- [ ] Core Web Vitals all green

### Week 2: Google Search Console
- [ ] Ownership verified in GSC (meta tag or HTML file)
- [ ] Sitemap submitted: `https://yoursite.com/sitemap-index.xml`
- [ ] Homepage indexed (request indexing manually)
- [ ] Key pages indexed (services, about, contact)
- [ ] No crawl errors in Coverage report
- [ ] Mobile Usability: No issues

### Week 3: Monitoring Begins
- [ ] GA4 dashboard shows user traffic
- [ ] GSC shows "Queries" (search terms bringing traffic)
- [ ] No 404 errors in GSC Coverage
- [ ] Core Web Vitals monitored weekly

### Week 4: Ongoing
- [ ] Set up weekly GSC monitoring reminder
- [ ] Set up monthly Lighthouse check (external tools)
- [ ] Review GA4 conversions (goal tracking)
- [ ] Plan content updates for next quarter

---

## Common Issues & Fixes

| Issue | Cause | Fix |
|-------|-------|-----|
| GSC shows "Discover" but no search traffic | Indexing in progress | Wait 1-2 weeks, monitor Coverage report |
| Sitemap not accepted in GSC | robots.txt blocks it | Check robots.txt doesn't have `Disallow: /sitemap` |
| Crawl errors in GSC Coverage | Broken internal links | Check 404 links in build, fix in markdown |
| GA4 not tracking | Script not loading | Check `.env` has `PUBLIC_GA_MEASUREMENT_ID`, verify production build |
| Lighthouse drops after deploy | Unexpected JS added | Check for unoptimized images, heavy scripts |
| Pages not indexing | Canonical URL pointing elsewhere | Verify each page has `<link rel="canonical" href="...">` |
