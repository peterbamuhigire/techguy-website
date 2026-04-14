# 05 — Block /api/ Routes from Search Engine Crawling

## Skills Applied
- `seo-audit` — `references/audit-checklist.md` section 1 (Robots.txt) and section 9 (Security & Trust)

## Current State

`public/robots.txt` currently contains:

```
User-agent: *
Allow: /
Sitemap: https://techguypeter.com/sitemap-index.xml
```

The file is functional but minimal. It allows all user agents to crawl all paths, including `/api/`. The CSRF token endpoint at `/api/csrf-token.php` is currently crawlable by search engines. This endpoint returns a JSON object with a security token — it is not content, has no value as an indexed page, and should not appear in search results.

## Current Score

Technical SEO: **6.5/10** (incremental improvement after fix)

## Target State

- `/api/` is disallowed in `robots.txt`
- The `/_astro/` directory is also disallowed (hashed build assets regenerated each build, no SEO value)
- Aggressive crawlers (AhrefsBot, SemrushBot) are rate-limited to reduce server load
- The sitemap directive remains correct

## Target Score

Technical SEO: **7.0/10** (combined with fix 01)

## Why This Matters

The `seo-audit` checklist states: "Block admin, staging, and duplicate paths" and "Block `/_astro/` hashed assets (regenerated each build, no SEO value)." More specifically, the security checklist item states: "No exposed credentials, API keys, or sensitive data in page source." While the CSRF endpoint does not expose Peter's credentials, exposing it to search engine crawling creates two risks:

1. **Wasted crawl budget.** Google allocates a limited crawl budget to each site. Crawling `/api/` endpoints wastes that budget on non-content URLs.
2. **Indexation of JSON responses.** If a search engine indexes the CSRF token endpoint, it may appear in search results as a JSON page — a minor trust and presentation issue.

The `seo-audit` checklist also recommends rate-limiting aggressive crawlers: "Rate-limit aggressive crawlers (AhrefsBot, SemrushBot: 10s crawl-delay)." These crawlers from SEO tools can significantly increase server load.

## Step-by-Step Instructions

### Step 1: Edit robots.txt

Open `public/robots.txt`. Replace the entire file with:

```
User-agent: *
Allow: /
Disallow: /api/
Disallow: /_astro/
Disallow: /*?
Sitemap: https://techguypeter.com/sitemap-index.xml

# Rate-limit aggressive SEO crawlers
User-agent: AhrefsBot
Crawl-delay: 10

User-agent: SemrushBot
Crawl-delay: 10

User-agent: MJ12bot
Crawl-delay: 10
```

**Explanation of each directive:**

- `Disallow: /api/` — prevents crawling of all PHP API endpoints including `/api/csrf-token.php`, `/api/contact.php`, and `/api/newsletter.php`
- `Disallow: /_astro/` — prevents crawling of Astro's built asset directory (hashed JS/CSS chunks regenerated on every build)
- `Disallow: /*?` — prevents crawling of any URL with query parameters, which prevents duplicate content from query string variants
- `Crawl-delay: 10` — tells the specified bots to wait 10 seconds between requests, reducing server load from automated crawlers

**Important:** Do NOT add `Disallow: /` for Googlebot (a common mistake that blocks all crawling). The `Allow: /` directive for the wildcard user-agent covers Googlebot correctly.

### Step 2: Verify the File Does Not Block Critical Pages

Check that none of the `Disallow` directives accidentally block important pages. The site's key URL patterns are:
- `/en/` — English pages (not blocked)
- `/fr/` — French pages (not blocked)
- `/en/blog/` — Blog (not blocked)
- `/en/services/` — Services (not blocked)
- `/_astro/` — Build assets (correctly blocked)
- `/api/` — PHP endpoints (correctly blocked)

There are no query parameter URLs in the site's navigation, so `/*?` only affects any accidentally generated URLs with query strings.

### Step 3: Build and Verify

```bash
npm run build
```

After building, confirm that `dist/robots.txt` contains the updated content (Astro copies `public/robots.txt` to `dist/` during build).

Use the [Google robots.txt tester](https://www.google.com/webmasters/tools/robots-testing-tool) to verify:
- `https://techguypeter.com/en/` → Allowed
- `https://techguypeter.com/api/csrf-token.php` → Blocked
- `https://techguypeter.com/_astro/client.abc123.js` → Blocked

### Step 4: Submit Updated robots.txt to GSC

After deployment:
1. In Google Search Console, go to **Settings** → **robots.txt** (or use the Robots.txt tester in GSC).
2. Verify the updated file is visible.
3. Google will re-fetch the file within 24–48 hours automatically.

### Step 5 (Optional): Add Nginx-level Security for /api/

For an additional layer of protection, add to the Nginx configuration (on the production server):

```nginx
location /api/ {
    # Only allow POST requests to API endpoints
    limit_except POST {
        deny all;
    }
    # Add CORS headers
    add_header 'Access-Control-Allow-Origin' 'https://techguypeter.com';
    add_header 'Access-Control-Allow-Methods' 'POST, OPTIONS';
}
```

This is a server-level measure separate from robots.txt. robots.txt only instructs well-behaved crawlers; Nginx-level restrictions enforce access for all clients.

## Acceptance Criteria

- [ ] `public/robots.txt` contains `Disallow: /api/`
- [ ] `public/robots.txt` contains `Disallow: /_astro/`
- [ ] `dist/robots.txt` contains the same updated content after `npm run build`
- [ ] The Google robots.txt tester confirms `/en/` is allowed and `/api/` is blocked
- [ ] The sitemap directive `Sitemap: https://techguypeter.com/sitemap-index.xml` is present
- [ ] No important site pages are accidentally blocked
- [ ] `npm run build` completes without errors

## Effort

**S — 15 minutes** (file edit: 5 minutes; verification: 10 minutes)
