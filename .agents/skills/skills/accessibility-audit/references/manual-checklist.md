# Manual Accessibility Checklist

Signed by the QA operator before every launch. Covers the rules that axe-core
cannot catch. Complete once per primary template, per launch.

Template types: home, services-index, service-detail, about, contact, blog-index,
blog-post, legal (privacy, terms). Any custom template adds a row.

## How to Use

1. Run `scripts/a11y-gate.sh` first. Fix automated failures before starting manual.
2. Open the built site on localhost on a desktop and on a real mobile device.
3. Work through each section below on the current template.
4. Mark every item PASS, FAIL, or N/A with a short note.
5. File the completed sheet under `project-log/launches/<project>/a11y-manual.md`.

## 1. Keyboard Navigation (every template)

- [ ] Tab from page load reaches the skip link first.
- [ ] Skip link is visible on focus and moves focus to `<main>` on activation.
- [ ] Tab order follows visual order, top to bottom, left to right (RTL reversed).
- [ ] Every interactive element is reachable by Tab alone — no mouse-only action.
- [ ] Enter activates links; Enter and Space both activate buttons.
- [ ] Buttons are real `<button>` elements for actions; links with `href` are used for navigation.
- [ ] Focus is always visible. Test on light and dark modes.
- [ ] No element traps focus. Tab eventually returns to the browser chrome.
- [ ] Modal dialogs: focus moves to the dialog on open, is trapped while open,
      and returns to the invoking element on close. Escape closes the dialog.
- [ ] Dropdown menus: Arrow keys navigate options. Escape closes.
- [ ] Form errors: Tab reaches the first invalid field on submit.

## 2. Screen Reader Reading Order (every template)

- [ ] Landmarks announce correctly: banner, main, contentinfo, navigation.
- [ ] Heading list navigation (NVDA: H, VoiceOver: VO+Cmd+H) shows a logical
      outline with no skipped levels.
- [ ] Images announce meaningful alt text; decorative images are silent.
- [ ] Icon-only buttons announce a verb, not a shape.
- [ ] Form fields announce label and, where applicable, required state and
      error message.
- [ ] Current page in navigation announces "current page".
- [ ] Status messages (form success, cart update) are announced without moving
      focus away.

See `screen-reader-scripts.md` for the per-template NVDA and VoiceOver scripts.

## 3. Visual Focus Indicator (every template)

- [ ] Focus ring contrast >= 3:1 against background in both light and dark mode.
- [ ] Focus ring is at least 2 CSS pixels thick.
- [ ] Focus is never removed with `outline: none` without a replacement.
- [ ] Focus on dark buttons is still visible (rule often fails on black buttons).
- [ ] Focus on sticky navigation does not get clipped by a sticky header.
- [ ] Sticky CTA bars, cookie banners, and chat widgets never obscure the focused control.

## 4. Zoom and Reflow (home, services, contact)

- [ ] Zoom to 200% on desktop at 1280 wide. No horizontal scroll. No content loss.
- [ ] Zoom to 400% at 1280 wide reflows to a single column without loss of
      function. Horizontal scroll tolerated only for tables and code blocks.
- [ ] Text spacing override (line-height 1.5, paragraph spacing 2x font,
      letter-spacing 0.12em, word-spacing 0.16em) does not clip or overlap
      content. Test with the WAI Text Spacing bookmarklet.

## 5. Contrast in Rendered Context (every template)

- [ ] Body text contrast measured in real rendered output (not token values):
      ratio >= 4.5:1.
- [ ] Large text ratio >= 3:1.
- [ ] Non-text UI (icons, form borders, focus rings): ratio >= 3:1.
- [ ] Text over images or gradients: measure at the worst pixel in the overlap.
      Add a scrim if needed.
- [ ] Link text is distinguishable from body without relying on colour alone
      (underline on hover at minimum; always-underlined inside body copy).
- [ ] Error, success, warning states use icon + text, not colour alone.

## 6. Motion and Animation (any page with motion)

- [ ] `prefers-reduced-motion: reduce` disables hero video autoplay, parallax,
      full-page transitions, and any looping motion above 5 seconds.
- [ ] No content flashes > 3 times per second.
- [ ] Auto-advancing carousels offer pause, previous, next.
- [ ] Scroll-triggered animations do not cause a user to lose their place when
      they scroll back.

## 7. Forms (contact, quote, any form-bearing template)

- [ ] Every input has a visible label. No placeholder-as-label.
- [ ] Required fields are marked with both text and a visible marker.
- [ ] Error state describes the field, the problem, and the fix.
- [ ] Error summary appears at the top of the form and links to the first
      invalid field.
- [ ] Submit button is never disabled until the user interacts.
- [ ] Loading buttons keep the action label context ("Sending...", "Saving...")
- [ ] Honeypot field is visually hidden from sighted users but labelled for
      screen readers with instructions to leave blank.
- [ ] `autocomplete` is set on every relevant field (name, email, tel, etc.).
- [ ] `inputmode` is set where appropriate (numeric, email, tel).

## 8. Touch Targets and Gestures (mobile)

- [ ] Every tappable element is >= 44x44 CSS pixels, spacing included.
- [ ] No drag-only interaction. Every drag action has a button alternative.
- [ ] Pinch zoom is not disabled (no `user-scalable=no`).
- [ ] Swipe carousels offer a keyboard and button alternative.
- [ ] Sticky bottom CTAs do not cover field errors, helper text, or focused inputs.

## 9. Language (every template)

- [ ] `<html lang>` matches the primary content language.
- [ ] Any section in a different language has `lang` on its wrapper.
- [ ] Language switcher announces the target language in that language
      (e.g. "French" is labelled "Français" in the menu).

## 10. Authentication and Session (if any)

- [ ] Session timeout is >= 20 minutes and gives a warning with an extend button.
- [ ] Login forms do not disable paste on password fields.
- [ ] Password visibility toggle is keyboard operable and labelled.
- [ ] No cognitive test (remember this pattern, identify this object) without
      an alternative.

## Sign-off

| Field | Value |
|---|---|
| Project |  |
| Launch date |  |
| Template audited |  |
| Operator name |  |
| Operator screen reader experience |  |
| Automated gate result | PASS / FAIL |
| Manual checklist result | PASS / FAIL |
| Remediation issues filed |  |
| Decision | ship / block |

Signed: _________________________ Date: _______________

File this under `project-log/launches/<project>/a11y-manual.md`.
