# Phase 1: Foundation & Measurement

## Score at Entry: 6.6/10 → Score at Exit: 7.0/10

Everything in this phase is either broken or absent. None of it requires strategic debate — these are fixes to structural problems that are actively hurting the site right now. Every item in this phase should be completed before any other improvement work begins.

---

## Skills Used in This Phase

- `seo-audit` — robots.txt, placeholder tokens, 404 page, hreflang
- `form-ux-design` — newsletter form submission, contact form audit
- `i18n` — hreflang language-region code correction
- `deploy` — verification of GA4 and GSC integrations

---

## Files in This Phase

| File | Description |
|------|-------------|
| `01-analytics-and-verification.md` | Replace GA4, GSC, and Bing placeholder tokens; connect measurement infrastructure |
| `02-hreflang-francophone-fix.md` | Change `hreflang="fr-FR"` to `hreflang="fr"` to target Francophone Africa correctly |
| `03-newsletter-form-connection.md` | Wire the blog newsletter form — currently `action="#"`, data is never collected |
| `04-404-page.md` | Create `src/pages/404.astro` — no 404 page currently exists on the site |
| `05-robots-and-api-security.md` | Add `Disallow: /api/` to robots.txt to block the CSRF endpoint from indexing |

---

## Prerequisites

None. This is Phase 1. No prior work required.

---

## Execution Order

Execute in file number order. The analytics fix (01) should be first because once GA4 is connected, it begins recording data that all future phases depend on.

| Step | File | Effort |
|------|------|--------|
| 1 | 01-analytics-and-verification.md | S — 2 hours |
| 2 | 02-hreflang-francophone-fix.md | S — 15 minutes |
| 3 | 03-newsletter-form-connection.md | S — 3 hours |
| 4 | 04-404-page.md | S — 2 hours |
| 5 | 05-robots-and-api-security.md | S — 15 minutes |

Total phase effort: approximately 8–10 hours.

---

## Score Impact by Dimension

| Dimension | Before | After | Change |
|-----------|--------|-------|--------|
| Trust and measurement maturity | 4.5 | 6.5 | +2.0 |
| Technical SEO | 6.5 | 7.0 | +0.5 |
| Internationalisation | 7.5 | 8.0 | +0.5 |
| CRO and lead generation | 5.5 | 5.8 | +0.3 |
| Overall | 6.6 | 7.0 | +0.4 |
