# 02 — Social Proof Library: Structure, Templates, and Collection System

## Skills Applied
- `brand-storytelling` — `references/story-templates.md` (Testimonial formats)
- `cro-audit` — `references/heuristic-checklist.md` (Section 4, Social Proof)

## Current State

Two anonymous testimonials exist on the homepage. Phase 4 specified upgrades — testimonial request emails, interim placeholders, and the `TestimonialCard` component. This file builds the systematic structure for ongoing proof collection: a folder, a collection template, and a populated library of the proof that exists or is pending.

## Target State

A structured proof library that:
1. Is stored in `docs/social-proof/` — accessible, not buried
2. Has a standard format for each proof element
3. Distinguishes between confirmed proof (authorised, attributable) and pending proof (awaiting authorisation)
4. Is referenced by the implementation files when adding proof to the site

## Folder Structure

```
docs/social-proof/
  README.md                    — this file (index and usage guide)
  _template.md                 — blank template for new proof entries
  confirmed/
    dynapharm-africa.md        — Dynapharm Africa proof elements (authorised)
    excelsis-hotels.md         — Excelsis Garden Hotels (pending)
    birdc.md                   — BIRDC (pending)
    eficon-consult.md          — EFICON Consult (pending)
  pending/
    [empty until responses arrive]
```

**Note:** Create this folder structure in the filesystem. `docs/social-proof/` does not currently exist.

## Standard Proof Entry Format

**File:** `docs/social-proof/_template.md`

```markdown
# [Client Name] — Proof Entry

## Status
- [ ] Pending (request sent, awaiting response)
- [ ] Confirmed (authorised, attributable, cleared for publication)

## Permission granted for
- [ ] Organisation name in public reference
- [ ] Individual name and role
- [ ] Individual photograph
- [ ] Specific metrics / outcome data
- [ ] Direct quote

## The organisation
**Name:** [Full legal name]
**Sector:** [Industry]
**Geography:** [Country/countries]
**Contact:** [Name, role — not published, internal reference only]

## The engagement
**Type:** [ICT Consulting / Software Development / Website / Business Planning]
**Period:** [Year range]
**Scope:** [2-3 sentences describing what was delivered]

## The outcome (in Peter's words — for reference only)
[What actually changed. Use as basis for the client quote request.]

## The client quote (pending/confirmed)
**Status:** [Pending request / Received / Approved for publication]
**Quote text:**
> [Quote text exactly as authorised]

**Attributed to:**
Name: [Full name as authorised]
Role: [Job title as authorised]
Organisation: [Organisation name as authorised]
Photo: [Link to photo file in photo-bank/testimonials/ — or "not yet received"]

## Specific metrics (confirmed)
[List only metrics the client has explicitly authorised for use]

## Usage on site
- Homepage testimonials section: [ ] Not used / [x] In use
- ICT Consulting service card: [ ] Not used / [x] In use
- Portfolio card: [ ] Not used / [x] In use
- Contact page case excerpt: [ ] Not used
- About page philosophy section: [ ] Not used

## Notes
[Any additional context — restrictions, preferred phrasing, follow-up required]
```

## Populated Library Entry — Dynapharm Africa

**File:** `docs/social-proof/confirmed/dynapharm-africa.md`

```markdown
# Dynapharm Africa — Proof Entry

## Status
- [x] Confirmed (organisation name and outcome facts are confirmed; individual name and photo pending)

## Permission granted for
- [x] Organisation name in public reference
- [ ] Individual name and role (pending)
- [ ] Individual photograph (pending)
- [x] Specific metrics / outcome data (geography and scope confirmed)
- [ ] Direct quote (awaiting confirmed attribution)

## The organisation
**Name:** Dynapharm Africa
**Sector:** Pharmaceutical distribution
**Geography:** Sierra Leone, Senegal, Uganda (Guinea also served)
**Contact:** [Internal reference — not for publication]

## The engagement
**Type:** ICT Consulting + ERP Implementation
**Period:** 2010-2014 (Sierra Leone), 2019-2022 (Regional — Sierra Leone, Senegal, Guinea)
**Scope:** Management of complete ICT function across multiple West African countries. ERP system implementation, unification, and staff training in English and French.

## The outcome (in Peter's words — for reference only)
ERP systems across Sierra Leone, Senegal, and Uganda unified into one integrated platform. Bilingual (EN/FR) staff training programme delivered on-site in each country. ERP deployed on schedule. Regional ICT governance framework established. Vendor contracts renegotiated at reduced cost.

## The client quote
**Status:** Pending — testimonial request sent per Phase 4, file 01

**Interim quote in use (composite placeholder — not attributable to any individual):**
> "Peter unified our ERP systems across three countries and delivered bilingual training for our staff in French and English."

**Attribution pending:** Senior Manager, Dynapharm Africa

## Specific metrics (confirmed)
- 3 countries covered (Sierra Leone, Senegal, Uganda)
- Bilingual implementation (English and French)
- Deployed on schedule (timeline confirmed)

## Usage on site
- Homepage testimonials section: [x] In use (interim placeholder)
- ICT Consulting service card: [x] In use (CaseSnippet)
- Portfolio card (Longhorn ERP): [x] In use (CaseSnippet)
- Contact page case excerpt: [x] In use (proof element)
- About page philosophy section: [ ] Not used
```

---

## Proof Collection System — The Cadence

**Immediately after project completion:**
1. Create a new proof entry in `docs/social-proof/pending/`
2. Record the outcome in Peter's own words (internal reference only)
3. Send the testimonial request email (template in Phase 4, file 01)
4. Set a follow-up reminder for 14 days

**On receipt of testimonial:**
1. Move the entry from `pending/` to `confirmed/`
2. Update the permission checkboxes
3. Add the confirmed quote text
4. Add the photo to `photo-bank/testimonials/Client-[Name].jpg`
5. Update the `_catalog.json` in `src/assets/images/`
6. Update the relevant site pages to use the confirmed quote

**Quarterly proof audit:**
1. Review all `pending/` entries — have any been waiting more than 90 days?
2. For entries over 90 days: send a final follow-up, then move to `confirmed/` with the anonymised sector-descriptor version
3. Review all `confirmed/` entries — are they being used on the site? If not, add them.

## Proof Priority — Where to Add Next

When new confirmed proof arrives, add in this priority order:

1. **Homepage testimonials** — highest visibility, highest impact
2. **ICT Consulting service card** — beside the most revenue-generating service
3. **Contact page** — highest-intent page, proof here directly reduces form-submission anxiety
4. **Portfolio cards** — proof beside each major deliverable
5. **About page philosophy section** — proof that validates the philosophy claims
6. **Geo landing pages** — proof beside geographic claims

## Acceptance Criteria

- [ ] `docs/social-proof/` directory created
- [ ] `docs/social-proof/_template.md` created with the standard format
- [ ] `docs/social-proof/confirmed/dynapharm-africa.md` created and populated
- [ ] Empty entries created for Excelsis Hotels, BIRDC, and EFICON in `docs/social-proof/pending/`
- [ ] Quarterly proof audit date added to the editorial calendar (Phase 7, file 05)
- [ ] Proof collection workflow documented and operational

## Effort

**S** — 2 hours (structure + population of existing entries)
