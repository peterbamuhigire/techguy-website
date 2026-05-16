# Project Log — {Client Name}

**Location:** this file lives at `project-log/CHANGELOG.md` in every client project, alongside `docs/` and `photo-bank/`.

**Purpose.** A single append-only record of every change, update, decision, incident, and metric snapshot for this website. The `monthly-report` skill reads this file (and the monthly roll-ups in `project-log/monthly/`) to generate the client's monthly report. Without this log, the monthly report is guesswork.

**How to use.**

- Every time work is done on the site — design change, copy edit, SEO update, bug fix, deploy, content publish, retainer activity, incident — add an entry here the same day.
- Newest entries go at the top.
- Dates are absolute (YYYY-MM-DD), never relative.
- Entries are short but specific. Name the page, the feature, the metric. Avoid "updated stuff" or "minor fixes."
- If the same day has multiple entries, group them under one date heading.
- At the end of each month, create or update `project-log/monthly/YYYY-MM.md` with the roll-up (the `monthly-report` skill can help generate this).

---

## Directory structure

```
client-project/
├── project-log/
│   ├── README.md              ← this file, copied from templates
│   ├── CHANGELOG.md           ← append-only running log, newest first
│   ├── decisions/             ← significant decisions with rationale
│   │   ├── 2026-04-12-switch-to-topical-hubs.md
│   │   └── ...
│   ├── incidents/             ← outages, security events, rollbacks
│   │   └── 2026-03-18-form-failure.md
│   └── monthly/               ← monthly roll-ups (source for monthly reports)
│       ├── 2026-04.md
│       └── ...
├── docs/
├── photo-bank/
└── src/
```

Only `CHANGELOG.md` is mandatory. The subdirectories are used when there is material to put in them.

---

## Entry format

```markdown
## 2026-04-14

### Changed
- Homepage hero rewritten to lead with enterprise-track value prop (replaces generic agency headline)
- Services navigation collapsed from 3-tier to 2-tier (reduces nav load, matches buyer journey)

### Added
- New case study: Acme Corp rebrand (docs/en/case-studies/acme-corp.md)
- Published blog post: "How We Ran the Q1 Repositioning" (docs/en/blog/q1-repositioning.md)
- OG images added to all service pages

### Fixed
- Mobile nav overlap on 375px devices (missing safe-area padding)
- Broken redirect from /services to /en/services

### SEO
- Added FAQ schema to 5 service pages
- Internal linking pass: services ↔ case studies ↔ blog
- Submitted new sitemap entries to Google Search Console

### Retainer activity
- 2 × 45-min strategy calls (content planning for Q2)
- Responded to 3 content edit requests from client

### Metrics snapshot (pulled 2026-04-14)
- Sessions (last 30 days): 4,521 (+18% MoM)
- Lead form submissions: 34 (+9 vs. previous 30 days)
- Average engagement time: 1:42
- Organic search clicks: 2,103 (+22% MoM)
- Top new keyword: "regional compliance consulting uganda" (position 6)

### Notes
- Client mentioned planning a September rebrand. Log for retainer upsell discussion in August.
```

Section headings are flexible. Common ones:

- **Changed** — modifications to existing pages, copy, design
- **Added** — new pages, posts, features, assets
- **Removed** — deleted pages, deprecated sections, retired content
- **Fixed** — bug fixes, QA issues, accessibility corrections
- **SEO** — SEO-specific changes (schema, internal linking, metadata, redirects)
- **Content** — editorial activity (posts, case studies, updates)
- **Performance** — speed, Core Web Vitals, image optimisation
- **Security** — patches, access changes, SSL, backups
- **Retainer activity** — meetings, ad-hoc requests, strategic work
- **Incidents** — downtime, form failures, security events (cross-link to `incidents/`)
- **Decisions** — significant choices (cross-link to `decisions/`)
- **Metrics snapshot** — key numbers with date pulled

Use only the headings that have entries for that day. Don't ship empty headings.

---

## Monthly roll-up format

At the end of each month, create `project-log/monthly/YYYY-MM.md` by consolidating the daily entries into a report-ready summary. The `monthly-report` skill can generate this file from the daily log.

Template:

```markdown
# {Client Name} — {Month YYYY}

## Executive summary
[2-3 sentences: the headline of the month]

## What we did
- [Consolidated list from daily entries, grouped by theme]

## Metrics
- [End-of-month snapshot of all tracked metrics with MoM deltas]

## Wins
- [Specific wins client should know about]

## Issues and resolutions
- [Anything that broke and how it was handled]

## Next month plan
- [3-5 priorities for the following month]

## Notes for the team
- [Internal-only notes that inform retainer strategy]
```

---

## Decision log entries

For significant decisions — architecture choices, messaging changes, strategy pivots, retainer scope changes — create a file in `decisions/`:

**Filename:** `YYYY-MM-DD-short-decision-name.md`

**Body:**

```markdown
# {Decision title}

**Date:** 2026-04-12
**Decided by:** {names}
**Status:** {proposed | accepted | rejected | superseded}

## Context
What was the situation that required a decision?

## Decision
What was decided?

## Rationale
Why this option over the alternatives considered?

## Consequences
What does this mean for future work? What trade-offs did we accept?

## Supersedes / Superseded by
Links to earlier or later decisions, if any.
```

Adapted from the ADR (Architecture Decision Record) format.

---

## Incident log entries

For anything that broke — downtime, broken forms, security events, rollbacks — create a file in `incidents/`:

**Filename:** `YYYY-MM-DD-short-incident-name.md`

**Body:**

```markdown
# {Incident title}

**Date:** 2026-03-18
**Severity:** {critical | major | minor}
**Duration:** {detected → resolved, with UTC timestamps}
**Reported by:** {client | monitoring | self-observed}

## What happened
Plain description of the incident.

## Impact
Who was affected? What didn't work? What revenue or leads may have been lost?

## Root cause
The actual underlying cause, not just the symptom.

## Resolution
What fix was applied? Who applied it?

## Follow-up actions
- [ ] {specific actions with owners and dates}

## Lessons
What we learned, what we'd do differently.
```

---

## Rules

1. **Log the same day.** A log written a week later is a guess. Today's work, today's entry.
2. **Name specifics.** Page paths, feature names, metric numbers, client quotes. No "various updates."
3. **Never delete entries.** This is an append-only log. If something is wrong, add a correcting entry dated today.
4. **Metrics snapshots use a stated source.** "Sessions: 4,521 (GA4, 2026-04-14)" — so the monthly report can cite provenance.
5. **Keep client-readable.** The daily log may later be read by the client via the monthly report. Write as if it will be.
6. **No sensitive data.** Never log credentials, payment details, or anything confidential. Use references ("renewed the API key in the password manager") rather than values.

---

## First entry

When the project starts, seed the log with a kickoff entry:

```markdown
## 2026-04-14

### Added
- Project kicked off (tier: Growth Website Offer)
- Signed proposal filed: proposals/2026-04-signed.pdf
- Kickoff meeting held, attendees: {names}
- Project-log initialised

### Decisions
- Launch target: 2026-07-15
- Weekly working call: Wednesdays 10:00 EAT
- Primary point of contact (client side): {name, role, email}

### Notes
- Client's commercial priority: unlock enterprise accounts for Q4
```

This becomes the anchor entry for everything that follows.
