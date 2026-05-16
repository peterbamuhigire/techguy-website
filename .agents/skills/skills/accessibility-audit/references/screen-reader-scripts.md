# Screen Reader Smoke Test Scripts

Per-template scripts the QA operator follows verbatim. Each script is a timed
smoke test (target <= 6 minutes per template). Failures are logged, filed, and
block deploy.

## Preparation

**Windows + NVDA**
- Install NVDA from https://www.nvaccess.org/download/
- Run with default profile. Disable "Speak typed characters" for clarity.
- Use Chrome 119+ or Firefox 115+. Edge is acceptable; Safari is not on Windows.
- Cheat sheet: Insert+F7 = Elements List, H = next heading, K = next link,
  F = next form field, D = next landmark.

**macOS + VoiceOver**
- Enable via Cmd+F5.
- Use Safari for VoiceOver tests (Safari is the deepest VoiceOver integration).
- Cheat sheet: VO = Ctrl+Option. VO+Cmd+H = heading, VO+Cmd+L = link,
  VO+Cmd+J = form control, VO+U = rotor.

**iOS + VoiceOver**
- Enable via Settings > Accessibility > VoiceOver.
- Use Safari. Single-tap to focus, double-tap to activate, swipe right for
  next element.

## Global Conventions

- Script format: **Action** — *Expected announcement*.
- Record any **Unexpected** behaviour with a two-sentence note.
- A silent element where announcement is expected is a FAIL.
- An announcement that contradicts the visible label is a FAIL.
- An announcement that exposes placeholder text as the label is a FAIL.

## Script 1 — Home Template

1. Load the page. — *Site title followed by the first landmark announcement.*
2. Press D twice (NVDA) or VO+U landmarks (VoiceOver). — *Banner, navigation,
   main, contentinfo announced in order.*
3. Press H repeatedly. — *One H1 announced first, then H2s in visual order, no
   skipped levels.*
4. Tab to the skip link. — *"Skip to main content" (or localised equivalent)
   announced, visible on focus.*
5. Press Enter on the skip link. — *Focus moves to `<main>`; next Tab lands on
   first interactive element inside main.*
6. Navigate to the primary CTA with Tab. — *Button announces an action verb.
   Not "button" alone.*
7. Activate the CTA with Enter. — *Navigation announces a new page title or a
   modal opens with focus trapped.*

## Script 2 — Services Index

1. Load the page. — *Title and breadcrumb are both announced on load.*
2. Press H. — *H1 is "Services" (or the localised equivalent).*
3. Press K repeatedly. — *Each service link announces a meaningful destination;
   no "Learn more" without context.*
4. Navigate by the arrow keys inside the rotor filtered to links. — *Same order
   as visual order.*
5. Activate the third service link. — *New page announces its H1 within 1.5s
   of navigation.*

## Script 3 — Service Detail

1. Load the page. — *Title announces the service name, not "Untitled".*
2. Press H. — *H1 is the service name; H2s are the section titles.*
3. Tab through the page. — *No focus trap; sticky CTA is reachable.*
4. Locate the primary CTA through VO+U rotor form controls or NVDA F. —
   *Button announces its action.*
5. Activate the CTA. — *Form opens or page navigates; focus moves to the
   first input or to the new page H1.*

## Script 4 — About

1. Press H. — *Narrative headings in order; no orphan H3.*
2. Tab to team images. — *Each image announces the team member name and role.*
3. Skip using D to the contact CTA in the footer. — *Footer landmark announces
   before the CTA.*

## Script 5 — Contact Form

1. Press F (NVDA) or VO+U form controls. — *Every field announces a label and
   its required state.*
2. Tab into the name field. — *Label and hint text announced; placeholder, if
   present, is supplementary.*
3. Leave the email field blank and press Submit. — *Error summary at top of
   form announces "N errors", moves focus to summary, each item is a link to
   the invalid field.*
4. Activate the first error link. — *Focus moves to the invalid field; error
   message is associated (aria-describedby) and re-announced.*
5. Correct errors and submit. — *Success message announced via live region
   without moving focus off the form.*

## Script 6 — Blog Index

1. Press H. — *Section headings in order; post titles are H2s or H3s
   consistently.*
2. Press K. — *Each post link announces the title, not "read more".*
3. Navigate to pagination. — *"Page 1 of N" announced; next/previous
   announced as links, not as decorative icons.*

## Script 7 — Blog Post

1. Press H. — *One H1 (the title), H2s for section breaks, H3s under H2s.*
2. Tab through in-line citations and links. — *Each link announces meaningful
   destination.*
3. Reach the share buttons. — *Each share button announces the network and the
   action (e.g. "Share on WhatsApp, button"), not just an icon name.*
4. Reach the related-posts list. — *Announced as a list with a heading.*

## Script 8 — Navigation and Language Switcher

1. From any page, press D to reach the navigation landmark.
2. Tab through primary navigation. — *Current page announces "current page"
   (aria-current="page").*
3. Open the language switcher. — *Each language option is announced in its
   own language: "Français", "Kiswahili", not "French", "Swahili".*
4. Switch to a second language. — *After navigation, `<html lang>` is the new
   language; headings are read in that language.*

## Script 9 — Mobile VoiceOver (iOS)

Run at least the home and contact scripts on a real iPhone with iOS Safari.
Log any mobile-only failures (common: swipe navigation misses a sticky CTA,
form field label duplicates due to aria-labelledby + label).

## Logging

File a one-pager at `project-log/launches/<project>/screen-reader-log.md`:

```markdown
# Screen Reader Smoke — <project> — <date>

Readers used: NVDA 2024.x / Chrome, VoiceOver macOS 15 / Safari,
VoiceOver iOS 18 / Safari.
Operator: <name>
Scripts run: 1, 2, 3, 4, 5, 6, 7, 8, 9

## Findings

- <template> <step>: <expected> vs <observed>. Severity: minor/serious/critical.

## Decision

ship / fix-and-rerun
```

## When a Script Fails

- Serious / critical in NVDA or VoiceOver: block deploy. File an issue.
- Minor (typo, inconsistent verb): fix inside the same sprint; ship after
  rerun.
- If a failure only reproduces on iOS VoiceOver but not on macOS VoiceOver,
  assume the iOS behaviour is authoritative for mobile-first users.

## References

- WebAIM Screen Reader User Survey (latest annual release).
- NVDA User Guide: https://www.nvaccess.org/files/nvda/documentation/userGuide.html
- VoiceOver: https://www.apple.com/accessibility/voiceover/
- *Inclusive Components* by Heydon Pickering — per-component screen reader
  behaviour.
