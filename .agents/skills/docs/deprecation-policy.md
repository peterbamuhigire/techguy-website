# Deprecation Policy

**Purpose**: Define how skills, references, scripts, configs, and documented
patterns retire from the engine without leaving dangling references,
silent renames, or ambiguous successors.

**Enforcement**: `scripts/drift-check.sh` parses the deprecation register in
this file and fails the build if a deprecated entity is referenced outside
its compatibility window.

## Principles

1. Deprecation is a public act. Silent renames cause more drift than
   deliberate removals.
2. Every deprecated entity has a **date of deprecation**, a **date of
   removal**, and a named **successor or replacement rule**.
3. The compatibility window between deprecation and removal is at least
   90 days. Operators need time to update downstream work.
4. Once removed, the entity is not restored. A later need for the same
   name produces a new entity with a new purpose.

## Required fields for a deprecation

Every deprecated entity has a row in the register below with these fields:

- **Entity** — the file, skill, script, command, or named concept.
- **Kind** — skill, reference, script, config, concept, or command.
- **Deprecated on** — ISO date.
- **Removal on** — ISO date (≥ 90 days after deprecated-on).
- **Successor** — canonical name of the replacement, or "no successor; drop
  the dependency".
- **Reason** — one line, taken from the decision entry.
- **Decision entry** — link to the `project-log/decisions/` file that
  authorised the deprecation.

## How to deprecate

1. File a decision entry proposing the deprecation with rationale.
2. On approval, add a row to the register in this file.
3. Mark the entity itself:
   - for a SKILL.md: add a `status: deprecated` line to the frontmatter
     and a Deprecation banner at the top pointing to the successor.
   - for a reference: add the banner at the top.
   - for a script: add a `>&2 echo "DEPRECATED: see docs/deprecation-policy.md"`
     line as the first executable statement, behind a flag that can be
     silenced by operators who have migrated.
   - for a config key: emit a warning when the key is read; the key is
     honoured during the compatibility window.
4. Update every internal reference to the deprecated entity to point at
   the successor. `drift-check.sh` will report any remaining internal
   references after the removal date.
5. Update `glossary.md` to move the entity to the Legacy section or to
   remove it entirely after the removal date.
6. On removal date: delete the entity; the decision entry carries the
   memory.

## Legacy status

The glossary has a "Legacy (superseded)" section listing entities that
remain present in the repository for backwards compatibility but are no
longer actively maintained. Legacy status is stricter than deprecated:

- no new work depends on legacy entities
- bug fixes are only applied if a client project actively relies on them
- legacy entities are removed at the next annual evaluation re-run unless
  a decision entry extends their life

## Register

| Entity | Kind | Deprecated on | Removal on | Successor | Reason | Decision |
|---|---|---|---|---|---|---|
| `skills/east-african-english/SKILL.md` | skill | 2026-03-21 | 2026-09-21 | `skills/language-standards` | Subsumed by broader 3-language voice system | (pre-Phase 11 note; file a retroactive entry if required) |

*Remove this table row only when the entity is removed and a decision entry
records the removal.*

## Renames

A rename is a deprecation of the old name plus creation of the new name. The
old name follows the full deprecation flow; the new name appears in the
glossary and is treated as a separate entity.

## Breaking changes in non-deprecated entities

If a behaviour changes without renaming or removing the entity, and the
change can break a downstream project, the change still requires a decision
entry. The entry names:

- the change, in one sentence
- the migration action for downstream projects
- the version or commit where the change landed
- how downstream CI will detect the change (usually drift-check or a new
  gate)

Breaking changes without a decision entry are drift.

## No-decision deprecations are forbidden

If an entity is removed without a deprecation entry and a decision entry,
the next drift-check flags every dangling reference and the next
documentation audit must either restore the entity or back-date a
deprecation entry before the audit can close.
