# Baseline Management

Baselines are the acceptance contract for a site's visual state. They are
created, updated, and retired deliberately, never auto-accepted.

## Lifecycle

1. **Create** on first pass of a new template, once the design is signed off.
2. **Review** in a PR whenever an intentional visual change requires an update.
3. **Retire** when a template is removed; delete the baseline in the same PR
   that removes the template.

## Create — Initial Baselines

- Run the gate in capture mode (`--update-snapshots`) from a clean build.
- Commit the resulting PNG files under `tests/visual/baseline/<template>/`.
- File a `project-log/decisions/<date>-visual-baseline-<project>.md` entry
  naming the commit, the templates captured, and the sign-off reviewer.

## Update — Intentional Change

An update PR must:

- Change only the baselines affected by the design change. An unrelated
  baseline change in the same PR is a review flag.
- Include side-by-side before/after images in the PR description.
- State the reason in one sentence. Examples:
  - "Hero headline refresh for Mara campaign."
  - "Dark-mode token revision for WCAG 2.2 non-text contrast."
- Be approved by one reviewer other than the author.
- Not pass through automation alone. Merge is human-approved.

## Retire

- When a template is removed, delete the baseline directory in the same PR.
- If a template is deprecated but still shipping, mark with a stub file at
  `tests/visual/baseline/<template>/DEPRECATED.md` containing the removal date.

## Storage

- Files are PNGs, named `<viewport>[-<state>][-<theme>].png`.
- Tracked in Git if the total baseline directory is < 20 MB.
- Tracked in Git LFS otherwise. `.gitattributes` entry:

  ```
  tests/visual/baseline/**/*.png filter=lfs diff=lfs merge=lfs -text
  ```

- Never stored only in CI cache; every operator must be able to reproduce the
  gate locally.

## Masking vs Baselining

Dynamic content is masked (see `screenshot-diff-harness.md`) rather than
baselined. Rules:

- If the content changes every build, mask it.
- If the content changes but the change itself is a regression risk, keep it
  in the baseline and produce a new baseline on intentional change.
- Never mask entire sections; mask the smallest rectangle that covers the
  dynamic content.

## Multiple States

Some templates have multiple baseline states:

- `home/375.png` — default state.
- `home/375-menu-open.png` — navigation opened.
- `contact/375-error.png` — form submitted with validation errors.
- `contact/375-success.png` — form submitted successfully.

The capture spec names each state explicitly; do not rely on the page's
default state covering all the interactive regressions.

## Theme Variants

- `home/375.png` — light mode (default).
- `home/375-dark.png` — dark mode.
- `home/375-hc.png` — high-contrast mode (when supported).

## Locales

For multi-language sites, capture the default locale only. Copy length
variance is caught by `hierarchy-overflow-checks.md` and by content reviews;
capturing every locale doubles or triples baseline count without adding
protection proportional to effort.

If a site has deeply different layouts per locale (rare), capture the locale
with the biggest layout divergence only.

## When to Force a Full Recapture

- Design-system token changes (colour, type scale, spacing scale).
- Layout breakpoint changes.
- Font swap.
- Theme addition or removal.

Force a recapture by running `--update-snapshots` on a clean build and
committing the full baseline directory in one PR. Document the scope in
`project-log/decisions/`.

## Anti-Patterns

- Committing baselines from a non-clean build (cache artifacts, stale fonts).
- Updating baselines in the same PR as a feature change without isolating the
  intentional visual delta.
- Skipping a template's baseline because it is "just a static page".
- Baselining a page in the middle of an animation.
- Running baseline capture on a different OS than CI without the expected
  font metrics. Pin the Playwright Docker image in CI to the version used
  locally.

## Reviewer Checklist

When reviewing a baseline-update PR:

- [ ] Every changed baseline is traceable to a documented design change.
- [ ] Before/after are included in the PR description.
- [ ] No baseline change is accompanied by a suspicious diff elsewhere.
- [ ] Sign-off reviewer is not the PR author.
- [ ] `project-log/decisions/` entry is added.

## Reading

- Playwright toHaveScreenshot: https://playwright.dev/docs/api/class-snapshotassertions
- Google SRE chapter on release engineering (for the "humans approve, not
  automation" posture).
