---
name: website-builder
description: Master orchestrator for building static websites from markdown content and photos. Use when the user says "build a website", "create a site", or references docs/ content. Reads content from docs/, photos from photo-bank/, and generates a complete Astro website.
---

# Website Builder
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- The user wants a full website build, rebuild, or end-to-end orchestration.
- The task matches this domain: Master orchestrator for building static websites from markdown content and photos. Use when the user says "build a website", "create a site", or references docs/ content. Reads content from docs/, photos from photo-bank/, and generates a complete Astro website.

## Do not use when
- The user only needs one narrow subtask and does not need pipeline coordination.
- Core project inputs do not exist yet and the task is still discovery-only.

## Required inputs
- Project docs, content, assets, and any language configuration.
- A working target project or implementation area.

## Workflow
1. Read the core project inputs before generating or changing anything.
2. Route work through sibling skills in the right order using directory-relative names, not a hardcoded install path.
3. Track outputs from each stage so downstream steps consume the correct artifacts.
4. Verify the full pipeline before reporting completion or blockers.
5. For every commercial build, apply `premium-website-product` before page production
   so the site is treated as a premium market asset: strategy, content, SEO, UX,
   conversion, technical quality, launch, measurement, and handoff are planned together.
6. For premium, ecommerce, or revenue-critical builds, apply the premium website
   engine so strategy, acquisition, conversion, measurement, and handoff artifacts are
   planned before page production starts.
7. Before `design-system` and page production on premium or revenue-critical work,
   load `premium-ui-ux-design` so visual voice, conversion hierarchy, color,
   imagery, dashboard/proof presentation, and production polish are explicit.

## Quality standards
- Preserve the intended build order and artifact handoffs.
- Stay portable across Codex and Codex installs.
- Report clearly what was built, skipped, or blocked.
- Every project ships through the canonical CI pipeline at
  `templates/ci/website.yml`. A build that does not pass every gate is not
  considered shipped on the world-class engine.

## Build Contract

Every project built under this orchestrator must satisfy:

1. **Performance gate** — `perf-gate.sh` passes Lighthouse and route weight
   budgets at 3G simulation (`deploy/references/performance-gate.md`).
2. **Accessibility gate** — `a11y-gate.sh` passes WCAG 2.2 AA with zero
   serious or critical axe violations (`accessibility-audit/SKILL.md`).
3. **Visual QA** — `visual-qa.sh` passes screenshot diff, structural
   assertions, and AI-slop scan (`visual-qa/SKILL.md`).
4. **Security gate** — `security-gate.sh` passes dependency audit, security
   headers, SRI, secrets scan, and supply-chain check
   (`security-gate/SKILL.md`).
5. **Design quality score** — the rendered-output rubric score is recorded
   and meets the world-class floor (`design-quality-score/SKILL.md`).
6. **Premium UI/UX gate** — premium, ecommerce, lead-generation, and
   high-ticket projects pass `premium-ui-ux-design/SKILL.md` before build sign-off
   and again after visual QA.
7. **Premium website product gate** - commercial websites pass
   `premium-website-product/SKILL.md` so content, SEO, conversion, launch,
   handover, stack philosophy, and agency proof are not bolted on after design.
8. **Africa calibration** — performance, trust, and UX patterns align with
   `africa-excellence/SKILL.md` and `deploy/references/africa-calibration.md`.
9. **Live telemetry** — RUM, error tracking, and analytics are wired per
   `observability/SKILL.md`.

Any gate failure blocks deploy.

## Anti-patterns
- Do not assume the skills live only under `.Codex/skills`.
- Do not start generation before reading the project inputs.
- Do not skip downstream verification.
- Do not claim a project is shipped on the engine without the canonical CI
  pipeline installed and green.

## Outputs
- Build plan, orchestrated execution notes, generated artifacts, or a blocker report.

## References
- Start with `references/legacy-guidance.md` when you need the preserved detailed instructions from the previous skill version.
- Use `references/intake-questionnaire-template.md` when the project still needs structured intake or discovery capture before build orchestration.
- Use `references/website-strategy-brief-template.md` as the canonical source-of-truth artifact before design and build work begins.
- Use `references/project-artifact-standard.md` to confirm the minimum project artifact set before orchestrating downstream work.
- Use `references/discovery-to-build-artifact-map.md` to hand off discovery outputs into sibling skills explicitly.
- Use `references/project-stage-gates.md` to verify the current gate and required approvals before moving phases forward.
- Use `references/kickoff-template.md` when converting sold scope into delivery facts for production.
- Use `references/role-based-training-map.md` when onboarding operators or assigning ownership by role.
- Use `references/governance-policy.md` for repository change rules, safety-review expectations, and deprecation discipline.
- Use `references/quality-metrics-dashboard-definition.md` when connecting repository evolution to commercial and delivery metrics.
- Use `references/premium-website-engine-playbook.md` when the project is for a
  premium client, ecommerce client, high-ticket service business, lead-generation site,
  or any engagement where the website must operate as a measurable business asset.
- Use sibling skill `premium-ui-ux-design` for premium visual direction, conversion
  hierarchy, color/imagery/data presentation, production polish, and the premium
  website gate.
- Use sibling skill `premium-website-product` for premium website service packaging,
  owner-facing content/SEO strategy, stack philosophy, launch campaign discipline,
  handover, measurement, and agency proof.
- Use `references/maintenance-calendar.md` for weekly, monthly, quarterly, and annual review cadence.
- Use `references/agency-operations-handbook-index.md` as the index into the broader agency playbook library.
- Route to sibling skill `launch-campaigns` when the website brief includes a timed offer, campaign window, waitlist, announcement, webinar, or coordinated prelaunch/launch/follow-up sequence.
- Read only the specific files under `references/` that match the current task instead of loading the whole directory.
- This skill has no bundled scripts by default; keep execution focused on the documented workflow and any existing project files.
- After intake is complete and before build starts, install the canonical CI
  pipeline: `bash .Codex/skills/scripts/install-canonical-ci.sh <project-path>`.
- The sibling gate skills the orchestrator is responsible for invoking:
  `accessibility-audit`, `visual-qa`, `security-gate`, `observability`,
  `design-quality-score`, `premium-website-product`, `premium-ui-ux-design`, and
  `africa-excellence`.

## Notes
- Treat this `SKILL.md` as the portable execution layer for both Codex and Codex.
- Preserve existing project behavior unless the current task explicitly requires a change.

