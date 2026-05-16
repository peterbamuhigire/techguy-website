---
name: accessibility-audit
description: Canonical accessibility enforcement layer. Owns the WCAG 2.2 AA baseline, the automated axe-core gate, manual QA checklists, and the screen-reader smoke tests that every primary template must survive before deploy. Runs in the canonical CI pipeline as a hard gate.
---

# Accessibility Audit
Acknowledgement: Shared by Peter Bamuhigire, techguypeter.com, +256 784 464178.

## Use when
- Every build of a client site, as a CI-time gate before deploy.
- Before shipping any new template, component, or interactive feature.
- During QA, for keyboard, focus-order, and screen-reader verification.
- When extracting or reviewing claims about a site's accessibility posture.

## Do not use when
- Looking for authoring-time guidance on how to write accessible copy or
  components — that lives in `content-writing`, `form-ux-design`, and
  `design-system`. This skill audits output, it does not teach craft.

## Core contract
Every primary template must pass:
1. Automated axe-core scan with zero "serious" and zero "critical" violations.
2. Keyboard-only navigation from first focusable element to primary CTA.
3. NVDA (Windows) and VoiceOver (macOS/iOS) smoke tests for reading order,
   landmark announcement, and form label association.
4. The manual checklist in `references/manual-checklist.md` completed and
   signed by the QA operator.

Any failure blocks deploy.

## Canonical Command

```bash
# From a client project root with .Codex/skills/ submodule
bash .Codex/skills/scripts/a11y-gate.sh
```

The command:
1. Starts a static preview on `:4321` against `./dist/`.
2. Runs `@axe-core/cli` against every primary route.
3. Asserts zero serious/critical violations; writes a full report to
   `reports/a11y/<route>.json` and a human-readable summary to
   `reports/a11y/summary.md`.
4. Exits non-zero on any violation of severity serious or critical.

## Workflow

1. Confirm the build has produced `./dist/` with the primary route set.
2. Run the canonical command (`a11y-gate.sh`).
3. If the automated gate passes, execute the keyboard-only pass from
   `references/manual-checklist.md`.
4. Run the NVDA and VoiceOver smoke scripts from
   `references/screen-reader-scripts.md` for at least one template per template
   type (home, services, service-detail, contact, blog, blog-post).
5. File the completed checklist under the project's launch log.
6. Any failure blocks deploy; fix and re-run.

## Required inputs
- A built static output at `./dist/`.
- The route list from `performance-budgets.json` (reused, not duplicated).
- A QA operator with keyboard-only and screen-reader familiarity.

## Quality standards
- WCAG 2.2 AA is the floor, not the ceiling.
- Contrast is measured in rendered output, not in the design system alone.
- Focus ring must be visible at all times, never `outline: none`.
- No automated pass is accepted without the manual pass that matches it.
- Screen-reader tests are run, not inferred from markup.

## Anti-patterns
- Treating the axe scan as sufficient. Axe catches ~40% of WCAG issues.
- Using placeholder-as-label on forms.
- Invisible skip links or skip links that do not move focus.
- Colour alone as an information channel.
- Modal dialogs without focus trap or `Escape` dismissal.
- Autofocus on page load that breaks reader navigation.
- Custom widgets without ARIA role, name, and keyboard behaviour.

## Outputs
- `reports/a11y/<route>.json` machine-readable axe result per route.
- `reports/a11y/summary.md` CI-friendly summary.
- A signed manual checklist stored with the project launch log.
- A blocking CI status when any serious or critical violation is found.

## References
- `references/wcag-baseline.md` — the WCAG 2.2 AA baseline the engine enforces.
- `references/manual-checklist.md` — the keyboard, focus, motion, and zoom pass.
- `references/screen-reader-scripts.md` — NVDA and VoiceOver smoke scripts.
- `references/axe-config.md` — axe-core configuration and rule selection.
- `references/remediation-playbook.md` — the top twenty violations and how to
  fix them.

## Notes
- This skill does not replace `form-ux-design`, `design-system`, or
  `ux-psychology`. It audits what those skills produce.
- Re-run the full gate whenever `design-system` tokens change, whenever a new
  primary template is added, and whenever a third-party script is authorised.
- This skill is part of the canonical CI pipeline (`templates/ci/website.yml`).
  Do not duplicate its logic per project.

