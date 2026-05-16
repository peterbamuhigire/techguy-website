# Deployment Runbook

Use this runbook as the standard deployment model for agency websites.
It is designed for safe, repeatable releases without unnecessary enterprise complexity.

## Supported Hosting Patterns

These are the standard models the agency should actively support:

### 1. Static Hosting Platform

Examples:

- Netlify
- Cloudflare Pages
- Vercel for static output

Use when:

- site is fully static
- forms are handled by provider, API, or third-party endpoint
- deployment should be simple and fast

### 2. VPS Or Dedicated Server With Nginx

Use when:

- client requires server ownership or custom routing
- agency needs tighter control of headers, redirects, and deployment layout
- forms or integrations require custom server handling

### 3. Managed Object Storage Plus CDN

Examples:

- S3 compatible object storage plus CDN

Use when:

- a static site needs explicit infra ownership
- client requires stricter control over deployment and caching

## Standard Deployment Sequence

1. Confirm Gate 7 is ready
2. Confirm the target environment and release version
3. Create or verify backup of current live state
4. Run production build
5. Run pre-release smoke verification on the artifact
6. Promote to staging if applicable
7. Run staging verification
8. Promote to production
9. Run post-launch validation
10. Start review window monitoring

## Environment Variable Management

- Keep production secrets outside version control
- Use environment-specific variables for analytics, forms, APIs, and feature flags
- Maintain a source-of-truth variable checklist per project
- Verify production values before the release window opens

## DNS And SSL Checklist

- Domain owner confirmed
- DNS access owner confirmed
- Current DNS records exported or screenshotted before change
- SSL issuance path confirmed
- Redirects from old hostnames prepared
- Canonical primary domain agreed

## Staging To Production Promotion

The preferred release path is:

1. Build once
2. Promote the same artifact forward
3. Avoid rebuilding different artifacts for staging and production when possible

Reason:

- reduces drift
- increases release confidence
- supports cleaner rollback

## Deployment Verification

Immediately after deployment verify:

- homepage loads
- primary navigation works
- primary CTA works
- core form submits successfully
- analytics loads as expected
- sitemap and robots are reachable
- no obvious console errors appear on priority pages

## Change Log Entry Template

```md
# Deployment Record

Project:
Environment:
Version:
Date:
Deployment owner:

## Included changes
- 

## Preconditions checked
- 

## Post-deploy verification result
- 

## Rollback status
- Not needed / Prepared / Executed
```

## Anti-Patterns

- launching directly from a developer's local machine without a repeatable record
- changing DNS without a rollback idea
- verifying only the homepage
- rebuilding different artifacts at each stage without reason
- discovering missing secrets during the launch window
