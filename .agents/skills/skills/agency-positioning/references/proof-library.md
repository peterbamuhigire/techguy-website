# Proof Library Structure

A central, reusable bank of proof components that feed every proposal, sales page,
case study, authority article, audit deliverable, and discovery call. The agency
does not write proof from scratch each time — it assembles proposals and pitches
from the library.

If the library is empty or stale, the agency cannot command premium fees. Proof is
the single input that moves a prospect from "interesting" to "can I have a
proposal." Guard it like the asset it is.

---

## Where the library lives

The proof library is maintained at the agency's own repository root in a folder
called `proof/`. Each component is a small markdown file so it can be pulled into
any downstream artefact with a single include.

```
proof/
├── README.md                     ← index, taxonomy, last-updated date
├── case-excerpts/                ← 150–400 word extracts from full case studies
│   ├── {client-slug}-strategic-frame.md
│   ├── {client-slug}-outcome-block.md
│   └── {client-slug}-before-after.md
├── testimonials/                 ← named quotes, tiered by length
│   ├── micro/                    ← 1 sentence (for CTAs, sales headers)
│   ├── short/                    ← 2–4 sentences (home page, services page)
│   └── long/                     ← 6+ sentences (case studies, proposals)
├── metrics/                      ← verified numeric proof points
│   ├── by-sector/
│   └── by-tier/
├── diagrams/                     ← reusable process, architecture, outcome visuals
├── checklists/                   ← launch checklists, QA checklists, audit checklists
├── process-snapshots/            ← screenshots of the work-behind-the-work (per Kleon)
├── video/                        ← short testimonial and process clips (30–90s)
└── rationale/                    ← design and strategic decision records
    └── {client-slug}-{decision}.md
```

Each file has YAML frontmatter so it can be queried and filtered.

```yaml
---
client: {anonymised or named}
client-approved: yes
sector: legal | health | financial | ecommerce | manufacturing | ngo | other
tier: foundation | growth | authority
year: 2026
language: en | fr | sw
tags: [positioning, conversion, seo, accessibility, ...]
length-words: 240
cite-as: "AcmeCorp legal firm, Kampala — Growth tier, 2026"
last-verified: 2026-04-14
---
```

---

## The eight component types

### 1. Case study excerpts

Short extracts from full case studies (see `case-study-template.md`). Each case
study produces 5 to 8 reusable excerpts:

- Strategic frame (100–150 words) — the diagnosis moment.
- Outcome block (80–150 words) — the numbers paragraph.
- Before/after scene-setter (150–250 words) — the "situation before" paragraph.
- Design rationale (100–200 words) — why this design decision, not another.
- Launch discipline (100–200 words) — how the build was delivered on time, on scope.
- Client's own language (50–100 words) — a paragraph of the client's diagnosis
  before we started, in their words.

Excerpts are used in proposals (fit the excerpt to the prospect's sector/situation),
authority content ("here's how we did it at X"), and sales calls (pull up the
relevant paragraph live).

### 2. Trust metrics

Verified numeric proof. Never a vanity number, always attached to a measurement
method and a time window.

Required categories:

- **Delivery metrics** — projects shipped on time, projects shipped on scope,
  percentage of engagements with zero post-launch critical issues, average launch
  cycle per tier.
- **Outcome metrics** (per client, not aggregated) — traffic lift, lead-volume lift,
  conversion-rate lift, performance scores, ranking gains for target queries.
- **Retention metrics** — percentage of Growth+ clients who renew into a retainer,
  average retainer duration, referral rate.
- **Fee metrics** (for internal use only — do NOT publish) — average fee by tier,
  discount rate (target: 0%), write-off rate, gross margin by tier.

Format for published metrics:

> Over 14 sites shipped in 2025 and 2026, average Lighthouse performance score at
> launch was 97/100, with 100% passing Core Web Vitals in the field within 30 days.

Never:

> We ship fast, high-performing websites.

### 3. Testimonial snippets

Tiered by length. Capture once, edit into three lengths, tag by sector and use case.

**Micro (1 sentence, 8–15 words)** — for CTAs, pull-quotes, sales-page headers.

> "The clearest strategic thinking I have ever bought." — Named Person, Role,
> Company

**Short (2–4 sentences, 30–60 words)** — for home page, services page, sector
landing pages.

> "Before this engagement, we had four agencies on a shortlist. After the second
> call with {Agency}, we paid their retainer. Eight months later, we have the site
> we actually needed — not the site we thought we wanted." — Named Person, Role,
> Company

**Long (6+ sentences, 120–200 words)** — for case studies and proposals.

Capture testimonials in three formats per client:

1. Written (email or google doc).
2. 60–90 second video.
3. Audio-only version (extracted from video, for podcasts/sales calls).

Get client consent for all three at kickoff; re-confirm at testimonial capture.

### 4. Process diagrams

Annotated visuals that communicate a decision or a process in under 10 seconds.
Reuse these across proposals, the agency website, and authority content.

Standard diagram set every agency should maintain:

- **The engagement timeline** — weeks 0 through 14, with milestones, stakeholder
  checkpoints, and handoff moments.
- **The strategic discovery map** — the 5 questions answered during discovery.
- **The IA decision framework** — how the agency chooses a site architecture for a
  given sector and buyer journey.
- **The conversion funnel map** — how the agency's sites move a visitor from
  arrival to qualified enquiry.
- **The content engine diagram** — the Big 5 pillars plus the Selling 7 videos,
  showing the publishing rhythm.
- **The launch checklist visual** — the 40+ checkpoints that gate a launch.
- **The retainer rhythm** — monthly, quarterly, annual cycles.

Every diagram has:

- A one-sentence caption stating what decision it supports.
- A consistent visual style (agency palette, agency type, agency icon set).
- A source file (Figma / Excalidraw / SVG) under version control, so it can be
  updated when the process evolves.

Never a flowchart with 40 boxes and no reader. Kill a diagram the moment it stops
communicating.

### 5. Launch checklists

Pre-launch checklists published *publicly* serve three purposes: they are a lead
magnet, a proof of rigour, and a trust signal. See `premium-audit-offers.md` for
how these convert to audits.

Maintain three public checklists:

- **The 40-point launch checklist** — what every site must pass before we ship.
- **The 25-point SEO foundation checklist** — the SEO baseline, regardless of
  strategy.
- **The 20-point accessibility checklist** — WCAG 2.1 AA minimum.

These are updated as the agency's discipline evolves. Each item has a one-sentence
rationale. No item is "because best practice" — every item has a specific reason a
buyer can hear.

### 6. Proof of strategic rigour

The hardest proof to manufacture, and the most valuable. Show the *thinking*, not
just the output. Following Kleon's "show your work" principle, publish the
work-behind-the-work:

- **Sector research briefs** (partially redacted) — the 8-page research document
  the agency produces before every engagement.
- **Discovery call transcripts** (client-approved, redacted) — the real questions
  we ask and the real answers that shape strategy.
- **Strategy memos** (anonymised) — the internal document where the agency commits
  to a strategic bet and the rationale.
- **Design direction explorations** — the 3 directions considered for a client and
  why we rejected 2.
- **Post-launch retrospectives** — what we'd do differently next time. Showing
  this is a flex, not a weakness.

Prospects reading these think: *these people actually think*. That is the moat.

### 7. Founder story + authority assets

Assets that establish the senior person as an expert, not a vendor. See
`expert-authority-framework.md` for the underlying structure.

- **Founder origin story** (600–1200 words) — the epiphany-bridge narrative of why
  this agency exists.
- **Annual public talk** — one long-form talk recorded per year, published as
  video + transcript + article.
- **Opinion pieces** — 4 to 8 per year, staking a clear position on a sector
  issue.
- **Podcast appearances** — as a guest, not host. Collected on a "speaking" page.
- **Published manifestos** — the 5 commitments / 7 rules / 9 principles the agency
  operates by.

These are not self-promotion. They are category definition — the agency teaching
the market what a premium website system is, so that the market starts asking for
what the agency sells.

### 8. The Client Wall of Love

A single page on the agency site showing every testimonial collected, organised by
date. Not the first 3 curated testimonials — every single one, in chronological
order, with links to each case study.

The Wall of Love is a cumulative proof asset. It communicates:

- Duration — we have been doing this long enough to fill a page.
- Consistency — the quality of outcomes does not vary.
- Depth — clients say real things, not PR quotes.
- Breadth — multiple sectors and project sizes.

It is linked from the home page, the services page, the about page, and every
proposal.

---

## Taxonomy for retrieval

Every proof component is tagged with:

- **Sector** — legal, health, financial, ecommerce, manufacturing, ngo, other.
- **Tier** — foundation, growth, authority.
- **Use case** — positioning, conversion, seo, accessibility, launch, retention,
  rebuild, new-launch.
- **Year** — for retiring stale components (default: archive anything >3 years old
  unless it remains the best proof for a situation).
- **Language** — en, fr, sw, multilingual.

The README.md in `proof/` is the index. Maintain it. Do not let the folder become
a graveyard.

---

## How proof is assembled into artefacts

### In a proposal (see `proposal-positioning.md`)

- Section 3 (understanding the problem): quote the prospect's own words.
- Section 4 (recommended approach): reference 2 case excerpts from similar
  engagements.
- Section 5 (scope): link to 1 process diagram.
- Section 6 (fees): reference the delivery metrics and retention metrics.
- Section 7 (risks): reference the launch checklist and 1 post-launch
  retrospective.
- Section 8 (about us): 1 micro testimonial, 1 short testimonial, founder
  authority line.

A full proposal pulls 8 to 12 proof components. None are written from scratch.

### In a sales page

- Hero proof strip: 3 micro testimonials, 1 category claim.
- Midway proof: 1 long testimonial + video, 1 metric block.
- Case study carousel: 3 short excerpts linking to full case studies.
- Pre-CTA proof: the Wall of Love link.

### In authority content (blog, teardowns, guides)

- Sidebar: 1 relevant case excerpt.
- Inline: 2 metrics or checklists.
- Call to action: 1 testimonial + a strategic CTA ("we do this for $22k
  engagements" — not "book a free call").

### In a discovery call

- Before the call: pull 2 excerpts from the prospect's sector, have them open in
  tabs.
- During the call: screen-share a process diagram when explaining the approach.
- After the call: email 1 case study + 1 testimonial + 1 relevant authority
  article (Assignment Selling — see `they-ask-you-answer/references/`).

---

## Maintenance rhythm

Monthly:

- Review the `last-verified` field on published metrics. Anything older than 12
  months gets re-verified or archived.
- Collect any new testimonials from clients whose last engagement was in the
  previous quarter.
- Add any case studies shipped in the previous month.

Quarterly:

- Retire stale components. If a case study's technology, sector framing, or
  pricing no longer reflect the agency, archive it.
- Rebalance sector coverage. If we have 8 case excerpts for legal and 1 for health,
  and the following quarter's pipeline is 40% health, prioritise health case
  collection.
- Update the standard diagram set if process has evolved.

Annually:

- Full audit. Every component re-read. Broken links fixed. Screenshots refreshed.
- Refresh founder story and authority assets.
- Kill the Wall of Love entries where the client relationship has ended poorly
  (rare — more often, keep them but stop using in active proposals).

---

## Rules that prevent proof library rot

1. **Nothing goes in the library that is not client-approved in writing.**
2. **Nothing goes in the library that cannot be verified from source data.**
3. **No aggregated or averaged metrics without showing the underlying dataset.**
4. **No stock imagery, no AI-generated imagery, no borrowed case studies from
   other agencies' work.**
5. **No testimonial from "an anonymous CEO." Named people only.**
6. **Every component has a `cite-as` string so it can be attributed consistently
   across contexts.**
7. **Every component has a `last-verified` date. Reviewers reject components with
   dates older than a year.**
8. **Anonymisation is a last resort, not a default. A named mid-tier client beats
   an anonymised Fortune 500 every time.**
9. **The library is the single source of proof. Proposals and pages that invent
   proof bypass the library and must be rejected in review.**
10. **If a component cannot be turned into at least two different artefacts, it is
    too niche to belong in the library — archive it.**

---

## The three failure modes to watch for

- **Portfolio-as-proof.** Screenshots with no commercial context. A buyer needs
  outcomes, not aesthetics. Delete any proof component that is just a screenshot.
- **Generic metrics.** "40% lift in conversions" from an unnamed project with no
  time window. This reads as fabricated even when true. Always name the client or
  explain the anonymisation.
- **One-shot testimonial wonder.** 3 strong testimonials on the home page for 18
  months, then silence. The Wall of Love is the cure — the date stamps prove
  ongoing work.

If the library shows any of these failure modes, the fix is to capture more
proof, not to compensate with stronger copywriting.
