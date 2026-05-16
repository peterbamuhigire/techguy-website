---
name: deploy
description: Builds multi-language Astro site, verifies output for all language versions, generates deployment scripts and Nginx configuration with language-aware routing. Supports English, French, Kiswahili. Use after all pages are built, as the final step.
---

# Deploy
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- The task matches this domain: Builds multi-language Astro site, verifies output for all language versions, generates deployment scripts and Nginx configuration with language-aware routing. Supports English, French, Kiswahili. Use after all pages are built, as the final step.
- The user needs an implementation-facing skill rather than a general discussion.

## Do not use when
- The prerequisite upstream context is missing and the task is not yet execution-ready.
- Another narrower skill is the clear better fit for the exact subtask.

## Required inputs
- Project context, current files, and any constraints that affect implementation.
- Upstream artifacts produced by earlier skills when this skill is part of a pipeline.

## Workflow
1. Read only the relevant project inputs and preserved guidance before acting.
2. Choose the smallest set of references needed for the current job.
3. Produce the implementation, configuration, or guidance this skill owns.
4. Validate that the result stays compatible with the rest of the repository workflow.

## Quality standards
- Outputs must be implementation-ready and internally consistent.
- Preserve existing behavior unless the task explicitly requires a change.
- Avoid host-specific path assumptions so the skill remains portable.

## Anti-patterns
- Do not hardcode `.Codex/skills` or another single install path.
- Do not skip validation against upstream or downstream dependencies.
- Do not generate generic output that ignores the actual project context.

## Outputs
- Implementation guidance, configuration, generated artifacts, or concrete follow-on steps.

## Canonical CI Pipeline

Every project launched through this skill must run the canonical CI pipeline
at `templates/ci/website.yml`. Install it with:

```bash
bash .Codex/skills/scripts/install-canonical-ci.sh <project-path>
```

The pipeline runs 15 ordered steps (install → lint → unit → build → e2e
smoke → metadata audit → perf gate → a11y gate → visual QA → security gate
→ drift check → design quality score → deploy → post-deploy smoke →
rollback-ready hook). Any failure blocks deploy.

Troubleshooting: `references/ci-troubleshooting.md`.

## Launch Decision Record

Every launch records an explicit decision on:

1. **Observability** — per `observability/SKILL.md`, RUM, error tracking,
   analytics, and alerts are live; the project runbook at
   `project-log/runbook.md` names the on-call operator.
2. **Experimentation infrastructure** — a decision under
   `project-log/decisions/` captures whether experimentation is enabled
   for this client, which platform is provisioned, and the quarterly
   cadence commitment. An answer of "no experiments yet" is acceptable
   and must still be recorded; silence is drift.
3. **Design quality score** — every primary template has a filed report
   under `reports/design-quality/` and the aggregate is ≥ 8/10.
4. **Runbook review** — the runbook has been reviewed in the last 90
   days and lists the current on-call operator and escalation path.

A launch without these four recorded is not permitted to ship.

## References
- Start with `references/legacy-guidance.md` when you need the preserved detailed instructions from the previous skill version.
- Use `references/qa-matrix.md` for the minimum launch QA standard across responsive behavior, content, links, performance, accessibility, SEO, analytics, forms, and browsers.
- Use `references/pre-launch-verification-checklist.md` immediately before production release.
- Use `references/deployment-runbook.md` for supported hosting patterns, env management, DNS/SSL, and promotion flow.
- Use `references/rollback-runbook.md` to prepare and execute rollback safely.
- Use `references/observability-baseline.md` for uptime, form delivery, analytics, and issue-detection expectations.
- Use `references/post-launch-review-checklist.md` for launch-day, 7-day, and 30-day review windows.
- Use `references/launch-communication-template.md` to standardize live-site notifications and internal launch comms.
- Use `references/performance-gate.md` for the canonical performance enforcement layer and its thresholds.
- Use `references/ci-troubleshooting.md` for the step-by-step triage of the 15-step canonical pipeline.
- Use `references/africa-calibration.md` for the 3G network profile, weight budget, and data-cost rules the gates apply.
- Read only the specific files under `references/` that match the current task instead of loading the whole directory.
- Use `templates/playwright-starter/` when a project needs a minimal E2E baseline for smoke, navigation, and form coverage.
- Use `templates/ci/website.yml` (via install-canonical-ci.sh) as the inherited CI pipeline; edit the canonical file, never the downstream copy.

## Notes
- Treat this `SKILL.md` as the portable execution layer for both Codex and Codex.
- Preserve existing project behavior unless the current task explicitly requires a change.

