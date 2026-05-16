# tests/visual/baseline/ — Visual QA Baseline Contract

The directory contract consumed by `visual-qa/SKILL.md` and
`scripts/visual-qa.sh`. This file is part of the repository's canonical
structure; every client project built on the engine inherits it.

## Layout

```
tests/visual/
  baseline/
    <template>/
      <viewport>[-<state>][-<theme>].png
  fixtures/
    <template>-<state>.json    # any state-setup fixtures
  MASKS.md                      # running log of masked regions and reasons
  visual.config.ts              # Playwright config for the visual suite
  capture.spec.ts               # canonical capture spec
  structure.spec.ts             # canonical structural assertions
```

## Template Set (floor)

Every client project captures at least:

- `home/`
- `services/`
- `service-detail/`
- `about/`
- `contact/`
- `blog/`
- `blog-post/`

Projects that ship additional template types (legal index, case studies,
pricing) add their own directory. Sector-specific template types may be
added; see the sector skill for the list.

## Viewport Set

Every template captures at minimum:

- `375.png`
- `768.png`
- `1280.png`

Dark-mode projects add `-dark` variants. High-contrast projects add `-hc`.

## Naming Rules

- Only lowercase letters, digits, and hyphens.
- `{viewport}` first, then state, then theme. Example:
  `contact/375-error-dark.png`.
- No whitespace or punctuation.

## Storage

- Git-tracked directly when total baseline size < 20 MB.
- Git LFS when larger. See `visual-qa/references/baseline-management.md`.

## Updating

Never update by overwriting in place. Baselines are updated through a PR
that runs `--update-snapshots` on a clean build and is human-approved.
See `visual-qa/references/baseline-management.md`.

## Related

- `visual-qa/SKILL.md` — the skill that owns this contract.
- `visual-qa/references/screenshot-diff-harness.md` — the harness.
- `visual-qa/references/baseline-management.md` — lifecycle rules.
- `scripts/visual-qa.sh` — canonical runner (added alongside the Playwright
  starter).
