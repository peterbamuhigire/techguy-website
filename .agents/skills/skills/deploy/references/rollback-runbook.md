# Rollback Runbook

Use this when a release degrades a live site's core experience or business-critical flows.
Rollback planning is mandatory before launch, not after failure.

## When To Roll Back

Rollback if any of these occur after release:

- critical form failure
- widespread navigation breakage
- missing or corrupted core pages
- severe performance regression on core pages
- incorrect redirects or domain routing
- broken analytics or consent logic where contractually required
- release artifact mismatch or deployment corruption

## Rollback Principles

- Keep the procedure simple
- Prefer restoring a known-good artifact
- Record the decision and reason
- Stabilize first, investigate second

## Required Rollback Inputs

- last known-good release identifier
- deployment target details
- access credentials already available
- DNS or server configuration snapshot if relevant
- rollback owner

## Standard Rollback Procedure

1. Declare rollback decision
2. Pause further changes
3. Restore the last known-good artifact or hosting target
4. Verify the core flows on the restored version
5. Notify stakeholders
6. Open incident review notes

## Static Hosting Rollback

Typical options:

- restore previous deployment in the provider dashboard
- re-promote previous artifact
- flip alias from current deployment to previous stable deployment

## VPS Or Nginx Rollback

Typical options:

- switch symlink to previous release directory
- restore previous build output and reload Nginx
- restore previous config if the failure is routing-related

## DNS Rollback

If DNS changes caused the issue:

- restore previous records
- reduce TTL in advance for future changes where possible
- verify propagation path and current authoritative records

## Verification After Rollback

- homepage loads correctly
- service page loads correctly
- primary CTA works
- form submission works
- redirects behave as expected
- analytics and monitoring return to normal

## Incident Notes Template

```md
# Rollback Record

Project:
Date:
Incident owner:
Rollback owner:

## Trigger
- 

## Impact
- 

## Restored version
- 

## Verification completed
- 

## Follow-up actions
- 
```

## Rule

If the team cannot name the last known-good release, the release process is not ready.
