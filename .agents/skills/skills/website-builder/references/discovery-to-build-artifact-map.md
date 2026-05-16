# Discovery-To-Build Artifact Map

This map turns discovery work into downstream production inputs. Its purpose is to
make handoffs explicit so strategy, design, copy, SEO, and build work do not start
from fragmented notes.

## Core Principle

Every downstream skill should consume an approved artifact, not a vague conversation.

## Artifact Handoff Table

| Discovery artifact | What it contains | Produced in Phase 2 | Consumed by | Why it matters |
|---|---|---|---|---|
| Website strategy brief | Business objective, audiences, decision logic, trust requirements, offer ladder, page architecture, SEO intent, visual constraints | Phase 3 | `design-reference`, `brand-alignment`, `content-writing`, `page-builder`, `seo`, `design-system` | Becomes the source of truth for the project |
| Discovery summary | Business model, audience, goals, constraints, risks, unknowns | Yes | `brand-alignment`, `design-reference`, `sector-strategies`, `content-writing`, `page-builder`, `seo` | Establishes the factual baseline |
| Positioning summary | Audience, value proposition, differentiation, trust stance | Yes or Phase 1 handoff | `brand-alignment`, `content-writing`, `page-builder` | Prevents generic messaging |
| Sitemap and page goals | Page list, page purpose, primary CTA by page | Yes | `page-builder`, `seo`, `content-writing` | Keeps structure tied to conversions |
| Offer and CTA hierarchy | Core offer, supporting offers, CTA priority, low-fit routes | Yes | `content-writing`, `page-builder`, `seo` | Keeps pages aligned to commercial intent |
| Style brief | Mood, colour direction, typography character, references, anti-patterns | Yes | `design-reference`, `design-system`, `page-builder` | Stops design drift |
| Content inventory | Existing copy, proof assets, gaps, missing owners | Yes | `content-writing`, `page-builder` | Exposes content risk before build |
| SEO brief | Keywords, page intent, local signals, technical SEO constraints | Yes | `seo`, `content-writing`, `page-builder` | Integrates SEO before launch |
| Launch checklist input | Domain, analytics ownership, redirects, legal pages, sign-off needs | Seeded in Phase 2 | `deploy`, later launch operations | Prevents late-stage launch chaos |
| QA matrix | Release verification across layout, content, links, performance, accessibility, SEO, analytics, forms, and browsers | Phase 6 | `deploy`, `page-builder`, `seo` | Defines the minimum launch quality bar |
| Pre-launch verification | Final release-readiness checks before production | Phase 6 | `deploy` | Stops uncontrolled launches |
| Deployment runbook | Hosting model, promotion path, env handling, DNS/SSL, validation | Phase 6 | `deploy` | Makes deployment repeatable |
| Rollback runbook | Known-good restoration steps and verification | Phase 6 | `deploy` | Prevents blind recovery during incidents |
| Post-launch review | Launch-day, 7-day, and 30-day checks | Phase 6 | `deploy`, `seo`, account operations | Keeps production stability visible |

## Required Handoff Sequence

1. Qualification approved
2. Discovery completed
3. Artifacts compiled
4. Strategy and proposal approved
5. Kickoff converts approved scope into production facts
6. Downstream skills begin

## Minimal Artifact Definition

### Discovery Summary

Must include:

- client background
- target audiences
- business objectives
- conversion goals
- major risks
- technical and compliance constraints
- open questions

### Website Strategy Brief

Must include:

- business objective
- priority audiences
- positioning statement
- trust requirements
- offer ladder
- CTA hierarchy
- page architecture
- SEO topic and intent map
- visual direction constraints

### Positioning Summary

Must include:

- who the site is for
- what problem is being solved
- why this client is credible
- why the offer is different
- tone and trust stance

### Sitemap And Page Goals

Must include:

- page list
- page owner
- audience intent
- primary CTA
- proof requirements per page

### Offer And CTA Hierarchy

Must include:

- main offer
- supporting offers
- lower-tier or referral routes
- primary CTA
- secondary CTA
- disqualifying CTA paths for low-fit leads

### Style Brief

Must include:

- mood direction
- visual references
- design constraints
- trust requirements
- accessibility or compliance flags

### Content Inventory

Must include:

- existing source files
- approved claims
- unavailable proof
- missing content owners
- content that blocks build progress

### SEO Brief

Must include:

- target keywords by page
- local SEO facts
- schema type assumptions
- metadata constraints
- analytics and tracking dependencies

### QA Matrix

Must include:

- responsive checks
- link integrity
- accessibility checks
- forms verification
- analytics verification
- browser coverage

### Deployment Runbook

Must include:

- target environment
- release steps
- post-deploy verification
- rollback readiness

## Stage-Gate Dependency

No skill work should begin until the corresponding artifact has cleared the right gate:

- `brand-alignment` after Strategy Approved
- `design-reference` after the strategy brief exists and the relevant market inputs are reviewed
- `design-reference` and `design-system` after Design System Approved
- `content-writing` and `page-builder` after Content and Page Structure Approved
- `deploy` after QA matrix, pre-launch verification, deployment runbook, and rollback runbook exist
- `seo` begins once sitemap and page goals are approved, then finalises during build

## Notes For Future Phases

Phase 3 should deepen the strategy artifact set.
Phase 4 should standardise how style briefs and design references become build-ready tokens.
Phase 5 should expand the SEO brief into production metadata and schema assets.
