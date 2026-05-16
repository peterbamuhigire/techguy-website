# Project Artifact Standard

Every new client project should start with the same minimum operating structure.
This prevents missing inputs, hidden assumptions, and undocumented approvals.

## Canonical Project Folder Set

Use this structure inside a client project repository or private client workspace.

```text
client-project/
  docs/
    operations/
      qualification-notes.md
      discovery-summary.md
      website-strategy-brief.md
      positioning-summary.md
      sitemap-and-page-goals.md
      offer-and-cta-hierarchy.md
      style-brief.md
      content-inventory.md
      seo-brief.md
      kickoff-notes.md
      approvals-log.md
      launch-checklist.md
      qa-matrix.md
      pre-launch-verification.md
      deployment-runbook.md
      rollback-runbook.md
      post-launch-review.md
    references/
      raw-client-documents/
      competitor-notes/
      analytics-export/
  photo-bank/
    branding/
    team/
    services/
    locations/
    misc/
```

## Mandatory Artifacts

### 1. Discovery Summary

Purpose:

- produce the factual brief
- record the commercial problem being solved

Required fields:

- business model
- target audience
- goals
- constraints
- major risks
- open questions

### 2. Website Strategy Brief

Purpose:

- create the canonical source of truth before design begins
- unify business logic, audience logic, trust logic, page logic, and SEO intent

Required fields:

- business objective
- primary audience segments
- decision criteria and objections
- trust requirements
- offer ladder
- CTA hierarchy
- positioning statement
- page architecture
- SEO topic and intent map
- visual direction constraints

### 3. Positioning Summary

Purpose:

- capture market position and proof logic

Required fields:

- target buyer
- problem statement
- strategic promise
- differentiators
- trust signals

### 4. Sitemap And Page Goals

Purpose:

- define page architecture before writing or design

Required fields:

- page name
- audience
- objective
- CTA
- proof needed

### 5. Offer And CTA Hierarchy

Purpose:

- stop mixed messages and competing calls to action

Required fields:

- primary offer
- secondary offer
- low-fit route
- primary CTA
- secondary CTA

### 6. Style Brief

Purpose:

- convert verbal design preferences into build direction

Required fields:

- visual mood
- colour direction
- typography direction
- references
- do-not-do list

### 7. Content Inventory

Purpose:

- expose content gaps early

Required fields:

- existing sources
- approved claims
- proof assets
- missing content
- owner for each missing item

### 8. SEO Brief

Purpose:

- anchor page strategy in search demand and technical reality

Required fields:

- page-level keyword focus
- local SEO facts
- schema assumptions
- measurement requirements

### 9. Launch Checklist

Purpose:

- record all launch dependencies before build completion

Required fields:

- domain and DNS owner
- analytics owner
- redirects
- legal pages
- backup and rollback steps

### 10. QA Matrix

Purpose:

- define the minimum release-quality standard

Required fields:

- responsive checks
- content checks
- links
- performance
- accessibility
- SEO
- analytics
- forms
- browser coverage

### 11. Pre-Launch Verification

Purpose:

- confirm release readiness immediately before production

Required fields:

- build integrity
- approvals
- QA completion
- infrastructure readiness
- launch owner

### 12. Deployment Runbook

Purpose:

- make releases repeatable across supported hosting models

Required fields:

- target environment
- deployment method
- environment variables
- DNS/SSL steps
- verification sequence

### 13. Rollback Runbook

Purpose:

- restore a known-good state quickly if launch fails

Required fields:

- last known-good release
- rollback owner
- restoration steps
- post-rollback verification

### 14. Post-Launch Review

Purpose:

- check production stability and business-critical behavior after launch

Required fields:

- launch-day checks
- 7-day checks
- 30-day checks
- findings
- follow-up actions

## Artifact Standards

- Each artifact must name an owner.
- Each artifact must include a last-updated date.
- Each artifact must record approval status.
- Assumptions must be labelled, not buried in prose.
- The source of truth must be the artifact file, not messaging threads.

## Minimal Metadata Header

Use this at the top of each artifact file:

```yaml
title: Discovery Summary
client: Example Client
owner: Strategy Lead
status: Draft
last_updated: YYYY-MM-DD
approval_method: Email / Call / Meeting Notes / Signed Proposal
```

## Approval Log Requirement

Maintain `approvals-log.md` with one row per approval event:

| Date | Artifact | Approver | Method | Decision | Notes |
|---|---|---|---|---|---|

This protects the project from undocumented reversals later.
