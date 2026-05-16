# Pre-Launch Verification Checklist

Run this immediately before production launch.
This checklist exists to verify release readiness, not to discover strategy problems late.

## 1. Scope And Approval

- [ ] Final launch scope matches approved scope
- [ ] Client launch approval is recorded in writing
- [ ] Known issues list exists and is accepted
- [ ] No unresolved blockers remain

## 2. Build Integrity

- [ ] Production build completes successfully
- [ ] No broken build warnings are ignored without review
- [ ] Static assets resolve correctly
- [ ] Environment variables needed for production are present

## 3. Content Readiness

- [ ] Priority pages are final
- [ ] Contact details are accurate
- [ ] Team, proof, and case-study content are current
- [ ] Legal pages are present where required
- [ ] Placeholder content has been removed or explicitly accepted

## 4. QA Completion

- [ ] QA matrix completed
- [ ] Core browser checks completed
- [ ] Core device checks completed
- [ ] E2E smoke checks passed
- [ ] Forms verified end to end

## 5. SEO And Analytics

- [ ] Titles and descriptions present on priority pages
- [ ] Canonicals and indexation rules reviewed
- [ ] Sitemap and robots configuration reviewed
- [ ] Schema present where required
- [ ] Analytics base tracking is live in the production build
- [ ] Core conversion events verified

## 6. Infrastructure And Domain

- [ ] DNS changes prepared or completed
- [ ] SSL certificate active or issuance confirmed
- [ ] Redirect plan prepared
- [ ] Staging and production targets clearly distinguished
- [ ] Backup of previous live state exists

## 7. Communications And Timing

- [ ] Launch owner assigned
- [ ] Launch window agreed
- [ ] Rollback owner assigned
- [ ] Client communication drafted
- [ ] Post-launch review dates scheduled

## Release Rule

If any of these fail:

- production build
- core form delivery
- rollback readiness
- DNS/SSL readiness
- client approval

the launch stops.
