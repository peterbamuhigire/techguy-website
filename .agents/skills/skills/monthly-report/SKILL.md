---
name: monthly-report
description: Generate a complete professional monthly client report from raw data. Use when producing monthly reports for website design and SEO clients. Codex gathers data through a structured interview, writes plain-English commentary on every metric, drafts the Executive Summary, What We Did, and Next Month Plan sections, then outputs a formatted markdown report ready to copy into a PDF or email. Integrates with agency-client-retention (template and rhythm), ecommerce-analytics (metrics framework), and seo-audit (SEO commentary).
---

# Monthly Report
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- The task matches this domain: Generate a complete professional monthly client report from raw data. Use when producing monthly reports for website design and SEO clients. Codex gathers data through a structured interview, writes plain-English commentary on every metric, drafts the Executive Summary, What We Did, and Next Month Plan sections, then outputs a formatted markdown report ready to copy into a PDF or email. Integrates with agency-client-retention (template and rhythm), ecommerce-analytics (metrics framework), and seo-audit (SEO commentary).
- The user needs domain-specific strategy, writing, or planning in this area.

## Do not use when
- Another skill is clearly narrower and better matched to the request.
- The task is unrelated to this domain or needs direct implementation instead.

## Required inputs
- Business context, target audience, and the artifact or decision being developed.
- Any existing materials, constraints, or supporting references already available.

## Workflow
1. Confirm the target month with the user (default: calendar month just ended).
2. **Pre-flight the live telemetry sources.** Per
   `observability/references/analytics-integration.md`, confirm the
   analytics provider is reachable and the RUM endpoint is responding.
   If any source is unreachable, **refuse to render** — do not fall back
   to operator-narrated metrics. File an incident and resolve before
   running the skill.
3. Read `project-log/CHANGELOG.md` and filter entries to the target month. If the log
   does not exist or the month has no entries, stop and follow the recovery rules in
   `references/project-log-integration.md` — never fabricate activity.
4. Read every file in `project-log/decisions/`, `project-log/incidents/`,
   and `project-log/experiments/` dated inside the target month. Read the
   prior month's `project-log/monthly/YYYY-MM.md` if present.
5. Generate the monthly roll-up at `project-log/monthly/YYYY-MM.md` using the format in
   `templates/project-log-template.md`. This is the raw material for the report.
6. Generate the client-facing report from the roll-up using `commentary-formulas.md` for
   plain-English translation of metrics. Every metric cites the live
   source that produced it. Apply `report-qa-checklist.md` before delivery.
7. Output as markdown ready for PDF export or email. Confirm every metric in the report
   traces back to a log snapshot dated inside the target month **and** to
   a live telemetry source named in the project runbook.

## Quality standards
- Outputs must be specific, usable, and grounded in the available evidence.
- Recommendations should support follow-on execution instead of staying abstract.
- The result should remain consistent with the broader repository system.

## Anti-patterns
- Do not produce generic framework dumps with no decision made.
- Do not invent facts to complete the output.
- Do not ignore the actual audience, offer, or business constraints.
- Do not render a report when a telemetry source is unreachable. A report
  with narrated metrics in place of live data is drift; refuse and file an
  incident.
- Do not re-run the analysis of an experiment. Surface the decided result
  from the experiment logbook; the `experimentation` skill owns analysis.

## Outputs
- Strategy notes, writing deliverables, framework outputs, or implementation-facing recommendations.

## References
- `references/project-log-integration.md` — the contract between this skill and the client project's `project-log/` directory. Start here.
- `references/commentary-formulas.md` — plain-English translation patterns for metrics.
- `references/report-qa-checklist.md` — pre-delivery quality gate.
- `references/legacy-guidance.md` — preserved detailed instructions from the previous skill version.
- `templates/project-log-template.md` (repo root) — the log format this skill reads from.
- `observability/references/analytics-integration.md` — source-reachability
  pre-flight contract.
- `observability/references/alert-thresholds.md` — the thresholds that
  become the month's narrative when an alert has fired.
- `experimentation/references/experiment-logbook-template.md` — the
  experiment log the report surfaces decisions from.
- This skill has no bundled scripts. Execution is documentary.

## Notes
- Treat this `SKILL.md` as the portable execution layer for both Codex and Codex.
- Preserve existing project behavior unless the current task explicitly requires a change.

