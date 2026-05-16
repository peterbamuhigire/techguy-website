# Math for Web Design

Use this reference when website design needs precise proportion, fluid sizing, responsive grids, color steps, or motion timing. The goal is to make layout decisions reproducible instead of hand-tuned by eye.

## Principles

- Prefer mathematical relationships over isolated values: ratio, percentage, `fr`, `rem`, `em`, `ch`, `vw`, `calc()`, `min()`, `max()`, and `clamp()`.
- Use content-driven breakpoints. Add breakpoints where content breaks, not because a device name exists.
- Give fluid values bounds. Unbounded viewport units often become too small on phones or too large on wide screens.
- Reserve media space with `aspect-ratio` to avoid distortion and layout shift.
- Round display values intentionally: progress percentages, dimensions derived in JavaScript, and calculated visual values should not leak noisy decimals into the UI.
- Treat color, type, spacing, layout, and motion as systems with ratios and rules, not one-off CSS.

## Fluid Layout Recipes

```css
:root {
  --measure: 65ch;
  --space-section: clamp(3rem, 7vw, 7rem);
  --text-hero: clamp(2.25rem, 6vw, 5rem);
}

.auto-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(min(18rem, 100%), 1fr));
  gap: clamp(1rem, 2vw, 2rem);
}

.media-frame {
  aspect-ratio: 16 / 9;
  overflow: hidden;
}

.media-frame > img {
  inline-size: 100%;
  block-size: 100%;
  object-fit: cover;
}
```

Use `calc()` when combining units:

```css
.full-bleed {
  margin-inline: calc(50% - 50vw);
}
```

## Typography Math

- Keep text measure between roughly `50-75` characters: `max-inline-size: 60ch` to `70ch`.
- Use a type ratio, then cap with `clamp()`. Compact sites can use `1.2` or `1.25`; editorial or premium landing pages can use `1.333` or `1.5`.
- Use `rem` for type, `em` for component-relative local spacing, and `ch` for line length.
- Avoid fixed pixel font sizes because they ignore user preferences and break zoom resilience.

## Ratio and Composition

- `16 / 9`: video, hero media, wide case-study images.
- `4 / 3`: cards, services, article thumbnails.
- `1 / 1`: avatars, logos, small product tiles.
- Around `38% / 62%`: sidebar/content split or editorial asymmetry when content supports it.
- Use rule-of-thirds placement for hero focal points and CTAs when working with photography.

## Color Math

- Use HSL or OKLCH thinking: hue = family, saturation = intensity, lightness = value.
- Build palettes by changing lightness in deliberate steps, not by collecting arbitrary hex values.
- Check contrast numerically for text and UI states.
- Be careful with overlays and alpha transparency on images; contrast can change as the image changes.

## Motion Math

- Animate only `transform` and `opacity` unless there is a strong reason.
- Use ease-out for entrances, ease-in for exits, and ease-in-out for state changes.
- Keep stagger formulas bounded: `delay = min(index * 60ms, 480ms)`.
- Use elapsed time with `requestAnimationFrame()` for JavaScript motion; do not assume a fixed frame rate.
- Use trigonometry only for real geometric needs such as radial menus, orbiting elements, wave paths, or circular charts.

## QA Checks

- No horizontal overflow at `320px`.
- Grids collapse via `auto-fit/minmax()` before media queries are added.
- Fluid type and spacing use `clamp()` bounds.
- Images and video use aspect-ratio placeholders.
- Body copy stays within a readable `ch` measure.
- Color contrast passes after overlays are applied.
- Animations remain purposeful and respect `prefers-reduced-motion`.
