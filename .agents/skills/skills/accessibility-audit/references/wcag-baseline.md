# WCAG 2.2 AA Baseline

The floor the website-skills engine enforces on every shipped site. Do not
negotiate below these rules; a failure on any of them blocks deploy.

## Scope

WCAG 2.2 Level AA plus the additions listed in "Beyond WCAG 2.2 AA" below.
Level AAA rules are encouraged but not enforced, with two exceptions listed
in the same section.

## Perceivable

### 1.1 Text alternatives
- Every `<img>` has an `alt` attribute. Decorative images use `alt=""`.
- Every meaningful SVG has `role="img"` and a `<title>` child, or an
  `aria-label` on the element.
- Every icon-only button has `aria-label` describing its action.
- Every `<figure>` with a caption uses `<figcaption>`; the caption is not the
  alt text.

### 1.2 Time-based media
- No autoplay with sound. Auto-playing muted video is allowed only above the
  fold and only if it respects `prefers-reduced-motion: reduce`.
- Any video with spoken content ships with captions (WebVTT). Auto-generated
  captions are not acceptable; captions are human-reviewed.
- Any audio-only content ships with a transcript on the same page.

### 1.3 Adaptable
- The page uses semantic landmarks: exactly one `<header>`, one `<main>`, one
  `<footer>`. `<nav>` is labelled when more than one exists.
- Heading hierarchy is continuous: one `<h1>`, no skipped levels.
- Form fields have a programmatic label (`<label for>` or `aria-labelledby`).
  Placeholder is not a label.
- Lists are real lists (`<ul>`, `<ol>`, `<dl>`), not divs with bullets.
- Tables used for data have `<th>` with `scope`; layout tables are banned.
- `<html lang>` is present and matches the language of the primary content.
  Language switches within a page use `lang` on the switched element.

### 1.4 Distinguishable
- Body text contrast ratio >= 4.5:1 against its background.
- Large text (18.66px bold / 24px normal) contrast ratio >= 3:1.
- Non-text UI components (icons, form borders, focus rings) contrast ratio >= 3:1.
- Colour is never the only channel. Error state uses icon + text, not red alone.
- Text reflows at 320 CSS pixels wide without horizontal scroll (except data
  tables, code blocks).
- Line height >= 1.5 for body copy. Paragraph spacing >= 2x font size.
- Letter spacing >= 0.12em when overridden. Word spacing >= 0.16em.
- Text can be zoomed to 200% without loss of content or function.
- No text is rendered as an image when a font would do.
- Focus indicator is visible, contrast >= 3:1 against adjacent background,
  minimum 2 CSS pixels thick. `outline: none` without a replacement is banned.

## Operable

### 2.1 Keyboard accessible
- Every interactive element is reachable by Tab, activatable by Enter/Space
  (button) or Enter (link).
- No keyboard trap. Modals, menus, and widgets release focus on Escape.
- Skip link is the first focusable element, visible on focus, and moves
  focus to `<main>`.
- Custom widgets implement the keyboard behaviour from the WAI-ARIA
  Authoring Practices Guide (APG).

### 2.2 Enough time
- No session timeout under 20 minutes without warning and an extend option.
- Animations that loop more than five seconds offer a pause control.
- Moving, auto-updating, or scrolling content (carousels, tickers) can be
  paused.

### 2.3 Seizures and physical reactions
- No content flashes more than three times per second.
- Full-page motion respects `prefers-reduced-motion: reduce` (fades, slides,
  parallax, hero-video autoplay).

### 2.4 Navigable
- Every page has a descriptive `<title>` tag.
- Focus order matches visual order.
- Link text is meaningful out of context. Banned: "click here", "read more"
  without context.
- Heading and label text describe content or function.
- Current location is indicated in navigation (aria-current="page").
- Multiple ways exist to find a page (sitemap + search or sitemap + navigation).

### 2.5 Input modalities
- Touch targets are >= 24x24 CSS pixels (WCAG 2.2 minimum). The engine
  enforces 44x44 as the practical target.
- Drag operations offer a non-drag alternative (buttons, form control).
- Pointer gestures (swipe, pinch) are not the only way to activate a feature.
- Accessible name starts with the visible label text.

## Understandable

### 3.1 Readable
- `<html lang>` is set. Deviations inside the page use `lang` on the element.
- Unusual words, abbreviations, and idioms have an explanation on first use.

### 3.2 Predictable
- Focusing or changing input value does not automatically change context
  (no auto-submit on focus).
- Navigation is consistent across pages (same order, same labels).
- Identifying components that appear on multiple pages are identified
  consistently.

### 3.3 Input assistance
- Errors identify the field, describe the problem, and suggest a fix.
- Required fields are indicated by both text and a visible marker.
- Labels or instructions appear for every input that requires specific data.
- Destructive or legal-commitment actions (submit, purchase, delete) are
  reversible, verified, or checked for errors.
- Accessible authentication: do not require the user to solve a cognitive
  function test (pattern memorisation, object identification) unless an
  alternative exists.

## Compatible

### 4.1 Compatible
- HTML validates (no duplicate IDs, no mismatched tags).
- ARIA is used correctly: every custom widget has role, state, name.
  Native semantic element is preferred over ARIA.
- Status messages use `role="status"`, `role="alert"`, or `aria-live`.

## Beyond WCAG 2.2 AA — Engine Additions

The engine enforces two rules that WCAG 2.2 AA does not require but that
premium positioning in Africa demands:

- **Focus visible on all themes.** The focus ring must be tested in both light
  and dark mode, and its contrast measured in each.
- **Reduced-motion compliance by default.** Every animated component ships a
  reduced-motion variant from day one, not after a user complaint.

## Enforcement

- Automated: `scripts/a11y-gate.sh` runs axe-core against every primary route.
- Manual: `manual-checklist.md` and `screen-reader-scripts.md` are signed by
  the QA operator before launch.
- The canonical CI pipeline blocks deploy on any serious or critical
  automated violation.

## References

- WCAG 2.2 specification: https://www.w3.org/TR/WCAG22/
- WAI-ARIA Authoring Practices Guide: https://www.w3.org/WAI/ARIA/apg/
- axe-core rule index: https://dequeuniversity.com/rules/axe/
- *Inclusive Components* by Heydon Pickering.
- *Accessibility for Everyone* by Laura Kalbag.
- *Form Design Patterns* by Adam Silver.
