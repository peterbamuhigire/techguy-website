# Deploy Skill

Historical detailed guidance preserved from the pre-standardized version of the skill.
Use `deploy/SKILL.md` and the current deploy references first.

Build, verify, and prepare for deployment.

## Universal Guidelines Reference

Before and after deployment, review **Universal Design Guidelines** for:
- Core Web Vitals targets (LCP < 2.5s, FID < 100ms, CLS < 0.1)
- Performance monitoring and optimization
- Security maintenance checklist
- Analytics and monitoring setup
- Accessibility requirements verification
- Mobile-first responsive testing

Use these standards to verify deployment readiness.

## Step 1: Build

```bash
npm run build
```

Check exit code. If errors, fix them before proceeding.

## Step 2: Verify Output

### Multi-Language Build Verification

```bash
# Check language-specific directories exist
ls -la dist/
ls -la dist/en/
ls -la dist/fr/
ls -la dist/sw/

# Count HTML files per language
find dist/en -name "*.html" | wc -l  # English pages
find dist/fr -name "*.html" | wc -l  # French pages
find dist/sw -name "*.html" | wc -l  # Kiswahili pages

# Check sitemaps generated for all languages
ls -la dist/sitemap*.xml

# Check for broken image references in built HTML
grep -r "src=\"" dist/ | grep -v "data:" | grep -v "http" | head -20

# Check total build size
du -sh dist/
```

Verify:
- [ ] **Language directories exist:** dist/en/, dist/fr/, dist/sw/
- [ ] **Each language version complete:** Every page from docs/{lang}/pages.md has matching HTML in dist/{lang}/
- [ ] **Sitemaps generated:**
  - sitemap-index.xml (master index)
  - sitemap-en.xml (English pages)
  - sitemap-fr.xml (French pages)
  - sitemap-sw.xml (Kiswahili pages)
- [ ] **Hreflang tags:** Sample pages have correct hreflang links to all language versions
- [ ] **Language switcher:** Header includes language switcher on all pages
- [ ] **Images:** Present and optimized in dist/_astro/ (shared across languages)
- [ ] **No 404-producing links:** All internal links follow /en/, /fr/, /sw/ paths
- [ ] **Build size reasonable:** Under 5MB for typical site (shared images across languages)

## Step 3: Generate deploy.sh

```bash
#!/bin/bash
set -e

# Configuration — edit these
REMOTE_USER="your-user"
REMOTE_HOST="your-server.com"
REMOTE_PATH="/var/www/sitename"
BRANCH="main"

echo "=== Deploying website ==="

# Pull latest changes
git pull origin $BRANCH

# Install dependencies (if any changed)
npm ci --production

# Build
npm run build

# Copy dist to web root
rsync -avz --delete dist/ $REMOTE_PATH/

echo "=== Deploy complete at $(date) ==="
```

**Alternative: Deploy directly on the server (simpler)**

```bash
#!/bin/bash
set -e

# Run this ON the server
cd /var/www/sitename-source
git pull origin main
npm ci --production
npm run build
cp -r dist/* /var/www/sitename/

echo "Updated at $(date)"
```

## Step 4: Generate Nginx Config

Multi-language configuration that preserves the generated Astro root page so browser-language detection can run at `/`:

```nginx
server {
    listen 80;
    server_name example.com www.example.com;
    root /var/www/sitename;
    index index.html;

    # ===== ROOT PAGE PRESERVED =====
    # Do NOT redirect / at the server level.
    # Serve Astro's generated root index.html so the i18n script can
    # detect browser language and redirect client-side with no flash.
    location = / {
        try_files /index.html =404;
    }

    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;
    # ===== NEW: Crawler directive =====
    add_header X-Robots-Tag "index, follow" always;

    # Cache static assets aggressively
    location /_astro/ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # Cache images
    location ~* \.(jpg|jpeg|png|webp|avif|gif|svg|ico)$ {
        expires 30d;
        add_header Cache-Control "public";
    }

    # Cache fonts
    location ~* \.(woff|woff2|ttf|otf)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # ===== NEW: Sitemap handling =====
    location ~ ^/sitemap.*\.xml$ {
        expires 24h;
        add_header Cache-Control "public";
        try_files $uri =404;
    }

    # ===== NEW: Language-aware routes =====
    # All /en/, /fr/, /sw/ paths work with clean URLs
    location ~ ^/(en|fr|sw)/ {
        try_files $uri $uri/ $uri.html =404;
    }

    # Gzip
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml text/javascript image/svg+xml;
    gzip_min_length 1000;

    # Clean URLs (Astro generates /about/index.html → /about)
    location / {
        try_files $uri $uri/ $uri.html =404;
    }

    # Custom 404 pages per language
    # Users on /en/ see /en/404.html, /fr/ see /fr/404.html, etc.
    error_page 404 /en/404.html;
}
```

**Key Changes for Multi-Language:**
1. **Root page preserved:** `/` serves Astro's generated root page so browser-language detection can run there
2. **Language routing:** Explicit location blocks for /en/, /fr/, /sw/ paths
3. **Sitemap handling:** Caches language-specific sitemaps (sitemap-en.xml, sitemap-fr.xml, sitemap-sw.xml)
4. **Crawler directive:** X-Robots-Tag allows all language versions to be indexed
5. **Language-specific 404:** Users see 404 in their language

Save as `nginx.conf` in the project root for reference.

## Step 5: SSL Note

Remind the user:
```
If this is a new domain, set up SSL with:
  sudo certbot --nginx -d example.com -d www.example.com

If you're already managing SSL on this server, just update
your existing nginx config with the root path above.
```

## Step 6: .gitignore

Ensure .gitignore includes:
```
node_modules/
dist/
.astro/
.DS_Store
*.log
```

The `dist/` folder is NOT committed — it's built on the server after pull.
The `photo-bank/` folder CAN be committed (original assets) or gitignored if too large.

## Step 7: Final Checklist

Output this checklist for the user:

```markdown
## Deployment Checklist

### Before Going Live

#### Multi-Language Verification
- [ ] All languages enabled and complete (check docs/i18n-config.md)
- [ ] All content translated: docs/en/, docs/fr/, docs/sw/
- [ ] In-country reviewers approved French and Kiswahili content
- [ ] Language switcher visible on all pages
- [ ] Hreflang tags present in page source (inspect all 3 language versions)
- [ ] Language-specific sitemaps generated:
  - sitemap-en.xml
  - sitemap-fr.xml
  - sitemap-sw.xml
  - sitemap-index.xml (master)

#### General Pre-Flight
- [ ] All placeholder images replaced (check _catalog.json for placeholder: true)
- [ ] Company contact info verified in docs/{lang}/company-profile.md (all languages)
- [ ] All links working and using correct language paths (/en/, /fr/, /sw/)
- [ ] Favicon uploaded to public/favicon.svg
- [ ] Every page has a unique OG image (≥1200x630px) — no page uses default fallback
- [ ] HD images (*-HD.jpg) from photo-bank prioritised for OG where available
- [ ] Fallback OG image uploaded to public/og-image.png (1200x630px) — emergency default only
- [ ] Meta descriptions set for all pages in all languages

### Server Setup
- [ ] Git repo cloned on server
- [ ] Node.js installed (v18+)
- [ ] npm install completed
- [ ] Nginx configured with:
  - Root path `/` serving Astro's generated redirect page (no nginx redirect)
  - Language-aware routing for /en/, /fr/, /sw/
  - Sitemap caching rules
- [ ] SSL certificate installed
- [ ] DNS pointing to server

### Go Live
- [ ] Run `npm run build` on server
- [ ] Test all pages in all languages in browser
- [ ] Test language switcher (navigate between /en/, /fr/, /sw/)
- [ ] Test on mobile device (all languages)
- [ ] Root domain (/) serves the generated Astro redirect page and sends visitors to the correct language
- [ ] Run Lighthouse audit for each language (aim for 95+ all categories)
- [ ] Submit ALL sitemaps to Google Search Console:
  - sitemap-index.xml (primary)
  - sitemap-en.xml
  - sitemap-fr.xml
  - sitemap-sw.xml
- [ ] Test hreflang tags work (use Google's Rich Results Test)

### Ongoing Updates
- Edit content in docs/{lang}/*.md (match language)
- Replace photos in src/assets/images/ (shared across languages)
- Translate updates to all enabled languages before committing
- git commit & push
- On server: git pull && npm run build
```

## Git Workflow for Updates

The beauty of this setup: updating the site is just:

```
Local:  Edit docs/ or images → git push
Server: git pull → npm run build → done
```

No CMS, no database, no server-side runtime. Just static files served by Nginx.
