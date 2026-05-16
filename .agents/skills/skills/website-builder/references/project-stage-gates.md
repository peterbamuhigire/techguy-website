# Project Stage Gates

These gates are the operating pause points for premium website projects.
No project should move forward because someone is in a hurry.

The goal is not bureaucracy. The goal is to catch the few critical failures that
cause expensive rework, weak websites, and scope conflict.

## Gate Design Rules

- Each gate has one owner.
- Each gate requires named artifacts.
- Each gate records the approval method.
- Each gate defines what happens if requirements are incomplete.
- If approval is verbal, it must be written into the approvals log the same day.

## Stage-Gate Table

| Gate | Owner | Required artifacts | Approval method | Rollback rule if incomplete |
|---|---|---|---|---|
| 1. Qualified Lead | Sales lead | Qualification notes, scorecard, routing decision | CRM note or internal review | Do not open proposal work; route to decline, referral, or paid discovery |
| 2. Paid Discovery or Signed Proposal | Sales lead | Signed proposal or paid-discovery invoice, initial intake file | Signed document or paid invoice | Stop strategy and scheduling until commercial commitment exists |
| 3. Strategy Approved | Strategy lead | Discovery summary, website strategy brief, positioning summary, sitemap and page goals, offer and CTA hierarchy | Strategy review call plus written confirmation | Return to discovery and strategy; no design work starts |
| 4. Design System Approved | Design lead | Style brief, approved references, design direction summary | Annotated review or written sign-off | Return to design direction; no build styling starts |
| 5. Content And Page Structure Approved | Content lead | Final page structure, content inventory, priority page copy plan, SEO brief draft | Document approval or review meeting | Return to content planning; no production page build begins |
| 6. Build Approved For QA | Production lead | Implemented pages, component checks, technical checklist, tracked known issues, QA matrix draft | Internal QA handoff note | Return to build; no client QA or launch preparation |
| 7. Launch Approved | Project lead | QA completion, pre-launch verification, launch checklist, deployment runbook, redirect plan, analytics verification, rollback runbook | Launch sign-off in writing | No deployment |
| 8. Post-Launch Measurement Active | Growth / account lead | Analytics access confirmed, Search Console confirmed, KPI dashboard or reporting baseline, post-launch review plan | Internal verification note | Project remains operationally incomplete until measurement is live |

## Gate Checklists

Keep each gate checklist short. Focus on the few dangerous misses.

### Gate 1 - Qualified Lead

- [ ] Scorecard completed
- [ ] Decision-maker access confirmed
- [ ] Commercial fit confirmed
- [ ] Route selected

### Gate 2 - Paid Discovery Or Signed Proposal

- [ ] Commercial commitment received
- [ ] Scope basis documented
- [ ] Primary contacts named
- [ ] Kickoff can be scheduled

### Gate 3 - Strategy Approved

- [ ] Business goals are explicit
- [ ] Audience is defined
- [ ] Strategy brief is complete
- [ ] Offer hierarchy is agreed
- [ ] Sitemap is approved
- [ ] Major assumptions are visible

### Gate 4 - Design System Approved

- [ ] Style direction approved
- [ ] Trust and compliance constraints reflected
- [ ] Visual anti-patterns documented
- [ ] Design references accepted or rejected explicitly

### Gate 5 - Content And Page Structure Approved

- [ ] Priority pages are locked
- [ ] Missing content owners are named
- [ ] SEO intent is aligned to page structure
- [ ] CTA hierarchy is unchanged or formally updated

### Gate 6 - Build Approved For QA

- [ ] Core pages are implemented
- [ ] Responsive checks passed
- [ ] Known defects are logged
- [ ] Internal review completed
- [ ] QA matrix is ready for execution

### Gate 7 - Launch Approved

- [ ] Analytics installed
- [ ] Forms route correctly
- [ ] Redirects prepared
- [ ] Legal/compliance pages present
- [ ] Backup and rollback path recorded
- [ ] Pre-launch verification completed
- [ ] Deployment and rollback runbooks are ready

### Gate 8 - Post-Launch Measurement Active

- [ ] KPI baseline captured
- [ ] Search Console ownership confirmed
- [ ] Reporting owner assigned
- [ ] First review date scheduled
- [ ] Post-launch review plan exists

## Approval Recording Template

```md
# Stage Gate Approval

Gate:
Date:
Owner:
Approver:
Method:
Decision: Approved / Approved with conditions / Not approved

Required artifacts checked:
- 

Conditions or rollback actions:
- 

Next stage:
```
