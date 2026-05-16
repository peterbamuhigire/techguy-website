# Licensing Matrix

**Status**: Initial Phase 12 decision. The explicit licences below
replace ambient "share if asked" convention.

**Purpose**: Name exactly what in this repository is open, under which
licence, and what is closed — so external studios, operators, and
contributors know where they stand before copying, forking, or
contributing.

## Principles

1. **Make the floor open.** The standards the engine holds other
   African studios to should be public. Closed standards compete on
   sales; open standards compete on demonstrated quality.
2. **Keep the business layer closed.** Positioning, pricing, client
   lists, and specific sales assets remain the agency's competitive
   posture and are not open source.
3. **Be explicit.** Ambient "you can probably use it" invites
   confusion and disputes.

## Matrix

| Area | Path | Licence | Notes |
|---|---|---|---|
| Build skills (SKILL.md files) | `skills/*/SKILL.md` under engine skills | CC BY 4.0 | Attribution required; derivatives allowed; commercial use allowed. |
| References backing skills | `skills/*/references/*.md` | CC BY 4.0 | Same. |
| Scripts | `scripts/*.sh` and script-embedded code | MIT | Standard permissive. |
| CI template | `templates/ci/website.yml` | MIT | Copy into your repo freely. |
| Performance budgets and Lighthouse config | `performance-budgets.json`, `lighthouserc.json` | MIT | Copy-ready. |
| Plan documents | `docs/plans/website-agency-engine/*.md` | CC BY-SA 4.0 | Derivatives must be similarly licensed — the strategic roadmap should stay open when forked. |
| Glossary and doc style guide | `glossary.md`, `docs/doc-style-guide.md` | CC BY 4.0 | Attribution required. |
| Africa-excellence references | `skills/africa-excellence/**` | CC BY 4.0 | Attribution required; the agency encourages reuse. |
| Design-quality rubric | `skills/design-quality-score/references/rubric.md` | CC BY 4.0 | Attribution required; cite the rubric when using. |
| Certification syllabus and exam bank | `certification/syllabus.md`, `certification/exam.md` | CC BY-NC 4.0 | Non-commercial use allowed; commercial reuse (running a competing certification) requires a licence from the agency. |
| Agency positioning references | `skills/agency-positioning/**` | **Closed — proprietary** | Not open; internal-only. |
| Agency narrative and pricing | `skills/agency-positioning/references/agency-narrative.md`, `skills/agency-positioning/references/pricing-rules.md` | **Closed — proprietary** | Not open. |
| Proposal templates | `proposal-skills/**` | **Closed — per submodule licence** | Separate submodule; see that repo's LICENSE. |
| Client project logs | `project-log/**` (in client projects) | **Client-owned** | Engine does not claim rights over client data. |
| Book extractions | `skills/book-extractions/**` | **Fair use / internal only** | Not redistributed; references only. |
| Reports from CI | `reports/**` (in client projects) | **Client-owned** | Engine does not claim rights. |

## Licence texts

The top-level LICENSE file in this repository carries:

- The MIT notice for code (scripts, CI template, configs).
- The CC BY 4.0 notice for skills and references (except agency-
  positioning, which is excluded by path).
- The CC BY-SA 4.0 notice for plan documents.
- The CC BY-NC 4.0 notice for certification materials.

Where multiple licences apply to different files in the same
repository, the per-file licence header is authoritative. A file
without a header defaults to the matrix above.

## Attribution

For CC BY material, attribution takes the form:

> Based on the website-agency-engine skills library by Peter
> Bamuhigire (<https://github.com/...>, adjust to actual repo).
> Licensed under CC BY 4.0.

A link to the specific file URL is sufficient for attribution.

## Contributions

- Contributions to the open parts of the repository are accepted
  under the same licences as the affected files.
- Contributions to the closed agency-positioning files are not
  accepted from external contributors. The agency reserves that
  surface.
- A CONTRIBUTING.md (Phase 12 follow-up) will specify PR process,
  style guide, and the DCO sign-off.

## Changes to the matrix

- Any change to a path's licence requires a decision entry.
- Relicensing must be compatible with the prior licence's terms (a
  move from CC BY-SA to CC BY is a downgrade that may not be
  permitted without every contributor's consent).
- Closed-to-open moves require a decision entry explaining the
  business rationale.

## What is "open" vs "knowledge commons"

- **Open** — a recognised open-source or open-content licence applies
  (MIT, CC BY, CC BY-SA, CC BY-NC).
- **Knowledge commons** — the material is publicly visible, but
  governance of the canonical version is held by the agency. The
  design-quality rubric is a knowledge-commons artefact: use it, cite
  it, but the authoritative version is here.
