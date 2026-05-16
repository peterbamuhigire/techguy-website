# Accessibility Remediation Playbook

The twenty most common violations on static marketing sites built by this
engine, in order of frequency, with the correct fix. Use as a quick reference
during triage; do not treat as a substitute for the WCAG baseline.

## 1. color-contrast (body and link text)

**Fix.** Measure in the rendered page, not against tokens. Adjust the design
system token (`design-system/tokens.css`) so the issue is fixed at the source.
Do not apply a per-page override; that produces drift.

## 2. color-contrast (text over image)

**Fix.** Add a scrim (semi-transparent dark gradient) behind the text block
until contrast clears 4.5:1 against the worst pixel in the overlap. Measure
with DevTools contrast picker on the worst pixel, not the average.

## 3. image-alt

**Fix.** Every `<img>` requires `alt`. Decorative images use `alt=""`. Hero
images that convey meaning get an alt describing the meaning (not "hero
image"). Icons inside buttons move to `aria-label` on the button and set the
icon's `aria-hidden="true"`.

## 4. label (orphan form input)

**Fix.** Replace placeholder-as-label with a visible `<label for>` above the
input. If the design requires a floating label, keep the real `<label>` in the
DOM and transform it with CSS; never replace it with a placeholder.

## 5. link-name (empty or icon-only links)

**Fix.** Add visible text or `aria-label`. Social icons: add the network name
in `aria-label` ("Visit our WhatsApp community"). Logo link: add
`aria-label="<brand name> home"`.

## 6. button-name

**Fix.** Same as link-name for icon-only buttons. Menu toggles, close buttons,
and play/pause controls all need names that state what they do.

## 7. heading-order

**Fix.** Walk the outline and re-number. Never skip a level. If the design
calls for large body text that looks like a heading, style a paragraph to look
large; don't mark up decorative text as a heading.

## 8. landmark-one-main

**Fix.** One `<main>` per page. Turn the sibling landmarks into `<section
aria-label="...">` or `<article>` as appropriate.

## 9. region (content outside a landmark)

**Fix.** Wrap any content not inside `<header>`, `<main>`, `<footer>`, `<nav>`,
or `<aside>` in a landmark. Common culprit: cookie banners, sticky CTAs.

## 10. skip-link

**Fix.** Add the skip link as the first child of `<body>`. Style it visible on
focus. Ensure it targets `#main` or the `<main>` element and actually moves
focus on activation (test by pressing Tab then Enter from a cold load).

## 11. focus-visible (outline: none)

**Fix.** Remove `outline: none`. If the default outline is ugly, provide a
custom `:focus-visible` style that meets 3:1 contrast on both light and dark
backgrounds.

## 12. html-has-lang / html-lang-valid

**Fix.** Set `<html lang>` from the Astro layout for every language build.
Multi-language setups set the lang on the generated output per locale.

## 13. aria-valid-attr / aria-allowed-attr

**Fix.** Remove the invalid ARIA. Most commonly, the native element already
has the correct semantics and the ARIA is redundant. Example: `<button
role="button" tabindex="0">` collapses to `<button>`.

## 14. autocomplete-valid

**Fix.** Set `autocomplete` on every relevant field using the HTML spec values
(`given-name`, `family-name`, `email`, `tel`, `street-address`, `country-name`).

## 15. target-size (< 24x24)

**Fix.** Enlarge to at least 44x44 CSS pixels including padding. Icon buttons
in navigation are the most common offender. Use the `design-system` token for
touch target size; do not set sizes per component.

## 16. duplicate-id

**Fix.** Audit the DOM with `document.querySelectorAll('[id]')` and dedupe.
Common causes: two instances of a sticky CTA with the same ID, shared template
partial injected twice.

## 17. empty-heading

**Fix.** Either add text or change the element. Empty headings often appear
when a designer uses an `<h2>` as a container for a decorative SVG; use a
`<div>` instead.

## 18. frame-title

**Fix.** Every `<iframe>` needs a `title`. Map embeds, YouTube embeds, and
reCAPTCHA frames are the usual culprits.

## 19. object-alt and svg-img-alt

**Fix.** SVG with `role="img"` needs `<title>` and often `<desc>` inside, plus
an `aria-labelledby` pointing to the title's id. Icons-as-decoration get
`aria-hidden="true"` instead.

## 20. scrollable-region-focusable

**Fix.** Scrollable regions (`overflow: auto` with content taller than the
container) must be reachable by keyboard. Add `tabindex="0"` and a visible
focus ring.

## General Principles When Remediating

- **Fix at the source.** If the violation is in a design-system component,
  fix the component, not every page that uses it.
- **Re-run the full gate** after any remediation, not just the violating route.
- **Never add `aria-hidden` to fix a contrast problem.** It hides the content
  from screen readers instead of fixing it.
- **Avoid the `!important` escalation.** The fix belongs in the cascade where
  the problem started.
- **Log every fix in the project's a11y manual log** so the pattern is visible
  to the next operator.

## When a Violation Resists Fixing

- The vendor supplies the markup (e.g. embedded map, payment widget). Isolate
  the vendor element, document the risk in `project-log/decisions/`, and
  require vendor to provide an accessible alternative or remove the widget.
- The violation is in third-party analytics. Replace with a self-hosted,
  accessible alternative (Plausible self-hosted, Umami).
- The violation is a design constraint from the brand (low-contrast colour).
  Escalate to `brand-alignment` and `design-system`; contrast is non-negotiable.
