# Pickering & Bell - Every Layout

**Source:** Heydon Pickering & Andy Bell, *Every Layout* (every-layout.dev).

## Use this for

- Choosing the right CSS layout primitive instead of writing bespoke flex/grid CSS.
- Migrating from breakpoint-driven layouts to container-aware, intrinsic layouts.
- Building a JS-framework component library where each primitive becomes a `<Stack>`, `<Cluster>`, etc.
- Reviewing CSS for over-use of `@media` queries, hard-coded widths, duplicated spacing rules.

## High-signal insights

1. **Algorithmic layout, not artisanal layout.** Describe rules, let the browser solve. You are the browser's mentor, not micro-manager.
2. **`min(VAR, 100%)` is a one-line container query.** `repeat(auto-fit, minmax(min(20ch, 100%), 1fr))` makes Grid reflow without `@media`.
3. **Sidebar > viewport breakpoint.** Two-up that stacks when narrow is a *quantum* layout — `flex-grow: 999` + `min-inline-size: 50%` does it without media queries.
4. **`gap` over margin** for sibling spacing inside flex/grid; the owl selector (`* + *`) is reserved for the Stack primitive itself, where `margin: auto` must remain available for the splitter variant.
5. **Custom properties on children, not parents.** `.stack > * + * { margin-block-start: var(--space) }` so nested same-class instances override correctly.
6. **Logical properties always.** `margin-inline`, `inline-size`, `inset-block-start` — never `margin-left` / `width` / `top` for content layout.
7. **One concern per primitive.** Stack only does vertical rhythm; Box only does padding/border; compose by nesting, never by bolting on.
8. **`box-sizing: border-box` is global.** Center is the one exception (`content-box`) so padding adds outside the 60ch measure.
9. **Switcher uses `calc((--threshold - 100%) * 999)`** as a 1-line container-aware threshold trigger.
10. **Imposter** is the only no-flex method that handles unknown content height robustly via `transform: translate(-50%, -50%)`.

## The 12 primitives

Stack · Box · Center · Cluster · Sidebar · Switcher · Cover · Grid · Frame · Reel · Imposter · Icon.

Full canonical CSS, custom properties, variants, and gotchas in the `every-layout` skill (`C:\Users\Peter\.claude\skills\every-layout\references\primitives.md`).

## Skill cross-reference

This extraction seeds the `every-layout` skill in the parent skills repository, which is the primary execution-time reference. Use this document for the high-level inventory; load the skill for the working code.
