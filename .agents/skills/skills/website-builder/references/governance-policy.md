# Governance Policy For Skills And Templates

This policy governs how the repository evolves as a production system.
The goal is coherence, safety, and commercial usefulness as the library grows.

## Governance Objectives

- preserve portability across Claude Code and Codex
- prevent quality drift
- prevent contradictory standards from accumulating
- keep the library aligned with commercial priorities
- reduce founder dependence by making decisions explicit

## Scope

This policy applies to:

- `SKILL.md` files
- `references/`
- `scripts/`
- shared templates
- evaluation documents
- repo-level documentation

## Change Categories

### 1. Skill Logic Changes

Examples:

- workflow changes
- ownership changes
- new required inputs
- changed outputs

Requirements:

- update the relevant `SKILL.md`
- update any affected references
- check for downstream contract impact
- run a safety audit
- update documentation if conventions changed

### 2. Reference Changes

Examples:

- new guidance
- updated standards
- removed or deprecated patterns

Requirements:

- keep heavy detail in `references/`, not `SKILL.md`
- avoid duplication where a shared source should own the rule
- update cross-references if ownership changed

### 3. Template Changes

Examples:

- project artifacts
- proposal templates
- checklists
- runbooks

Requirements:

- preserve portability
- state the owner and usage point clearly
- confirm the template still fits the current stage-gate model

### 4. Design System Changes

Examples:

- token restructures
- component additions or deprecations
- new states, variants, or accessibility contracts
- design-system documentation or source-of-truth changes

Requirements:

- audit existing variants before adding anything new
- prefer extending an existing component over creating a parallel one
- update both implementation guidance and documentation of usage/state rules
- confirm the source of truth remains explicit and current
- record downstream adoption risk for page-builder and related skills

## Mandatory Review Rules

Every material change must answer:

1. What problem does this solve?
2. Which skill owns this behavior?
3. What upstream artifact does it require?
4. What downstream behavior does it affect?
5. Does it create any contradiction with existing rules?
6. Could this be solved by reuse instead of a new pattern?
7. Where is the source of truth after this change?

## Safety And Documentation Rules

- Run `skill-safety-audit` when a skill changes materially
- Update repo documentation when behavior, structure, or execution order changes materially
- Do not accept hidden side effects, external installers, or shadow dependencies
- Design-system changes must include state, accessibility, and usage guidance, not only visual description

## Deprecation Policy

When guidance becomes outdated:

- do not silently leave conflicting material in place
- either update it, replace it, or mark it deprecated explicitly
- remove ownership ambiguity where two files claim the same rule

## Release Notes Requirement

Every meaningful repository improvement should leave a short change record:

- phase or initiative
- affected skills
- new artifacts
- changed standards
- commercial or operational impact

## Gap Review Rhythm

Run structured gap reviews on a recurring basis to identify:

- contradictory instructions
- weak enforcement areas
- underperforming skills
- outdated templates
- missing commercial coverage

## Decision Quality Rules

Borrowing from explicit-principles management:

- prefer observable standards over taste-based arguments
- diagnose root causes, not symptoms
- record decisions in documents, not chat fragments
- distinguish between one-off exceptions and rule changes

## Ownership Model

- `website-builder` owns cross-skill orchestration and system-level references
- specialist skills own their domain references
- repo-level docs must reflect the current operating truth

## Design System As Product

Treat the design system as a maintained product with:

- a clear source of truth
- a contribution path
- named owners
- adoption and drift checks
- regular cleanup of dead, duplicated, or unofficial variants

Useful team models:

- centralized ownership for speed and consistency
- federated contribution for coverage across product areas

Either can work. What fails is implicit ownership.

## Governance Approval Questions

Before merging or accepting a change:

- [ ] Is ownership clear?
- [ ] Is portability preserved?
- [ ] Are stage-gate effects understood?
- [ ] Was a safety review performed where needed?
- [ ] Was documentation updated where needed?
- [ ] Does this improve the machine instead of only adding more text?
- [ ] Does this reduce design debt rather than rename it?
- [ ] Is the source of truth still obvious to the next contributor?
