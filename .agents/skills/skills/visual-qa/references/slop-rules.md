# AI-Slop Detection Rules for Rendered Output

Extends `design-system/references/ai-slop-prevention.md` with rules that only
make sense against rendered HTML and CSS. Consumed by `scripts/slop-scan.sh`.

The rule names below map 1:1 to entries in the slop-scan JSON output.

## 1. Banned Gradient Backgrounds

The following gradient patterns are banned on hero sections, card backgrounds,
and primary CTAs:

- Purple-to-pink generic SaaS gradient (`#6366f1` → `#ec4899` or near variants).
- Teal-to-cyan generic fintech gradient (`#0d9488` → `#06b6d4` or near variants).
- Orange-to-red generic "bold" gradient (`#f97316` → `#ef4444`).
- Any two-stop linear gradient between pastel colours without a third stop
  or a photographic overlay.

Detection: scan compiled CSS for `linear-gradient(...)` rules with two colour
stops that fall within 30 RGB units of the banned pairs.

## 2. Banned Easing Curves

- `ease-in-out` on hero animations (too slow to feel premium).
- `cubic-bezier(0, 0, 0.2, 1)` on anything longer than 500 ms (feels generic).

Detection: scan compiled CSS for `transition-timing-function` and
`animation-timing-function`; compare against the allowlist defined in
`design-system/tokens.css`.

## 3. Banned Headline Patterns

The hero `<h1>` fails if it matches any of the following regex, case-insensitive:

- `/^welcome to\s/` — "Welcome to <brand>".
- `/^we are (passionate|dedicated|committed)/` — generic agency opener.
- `/your one[-\s]?stop/` — "Your one-stop <x>".
- `/^transform(ing)? your (business|life|journey)/` — generic promise.
- `/^innovative\s(solutions?|services?|platform)/` — adjective noise.
- `/^leading\s.*(provider|company|brand|studio)\s/` — unearned superlative.
- `/^revolutionize\s/` — overused verb.
- `/cutting[-\s]?edge/` — dated phrase.

Detection: extract `<h1>` text from every primary route; run the regex set.

## 4. Low-Information Hero

A hero fails when:

- `<h1>` is shorter than 3 words; or
- visible copy above the fold is shorter than 12 words total; or
- the hero contains only a single short verb-led phrase and a button.

Detection: render the homepage at 1280x800; capture visible text nodes
above the 800px fold; count words.

## 5. Generic Icon Overuse

A page fails when:

- More than 8 icons visible above the fold; or
- More than 20 icons total on a non-services page; or
- A stretch of 3 or more consecutive sections share a "feature row of three
  icons" pattern.

Detection: count `<svg>` and icon-font elements with a visual bounding box
greater than 12x12 CSS pixels.

## 6. Filler Adjectives in Body Copy

A page warns (not fails) when any of these adjectives appears more than 3
times total: *innovative, seamless, cutting-edge, bespoke, synergistic,
robust, world-class, state-of-the-art, game-changing, leading*.

Detection: count occurrences in visible body text.

## 7. Generic Three-Column Feature Grid

A page fails when:

- A section contains exactly three equal columns;
- each column starts with a coloured icon;
- each column has a one-line heading of 1-3 words and a subhead of 8-14 words;
- the three headings are parallel single-word or two-word phrases (e.g.
  "Fast / Secure / Reliable").

Detection: DOM pattern match against a section with three grid children,
each matching the above shape; cross-check with
`design-system/references/ai-slop-prevention.md`.

This rule allows three-column grids in general; it bans the specific generic
pattern.

## 8. Template Hero Imagery

A hero fails when the image matches any of these patterns (flagged, not
automatically blocked — manual review required):

- Stock photo of a diverse team in a glass-walled office pointing at a
  laptop.
- Stock photo of a smiling woman on a phone, generic business background.
- AI-generated image with visible artifacts (extra fingers, melted ear,
  noisy background text).

Detection: surface a warning when the hero image references a known stock
library hostname (shutterstock, gettyimages, adobe stock) or carries no
EXIF (a heuristic for AI generation).

## 9. Banned Copy Blocks on Dedicated Pages

- About page that starts with "Our Story" plus a founder photo plus a
  paragraph that contains "passion" and "journey" in the same sentence.
- Services page that introduces services with "Whether you are a <x> or a
  <y>, we have the right solution for you."
- Contact page that starts with "Let's get in touch."

Detection: string match on the first 200 characters of `<main>`.

## 10. Colour Discipline

The page fails when:

- More than 5 distinct hues are used in the rendered colour palette
  (measured by reducing every used colour to the nearest HSL hue bucket).
- Any hue outside the project's declared palette appears on a non-photograph
  element.

Detection: run `scripts/slop-scan.sh` with the `--palette-check` flag against
`design-system/tokens.css` as the source of truth.

## 11. Typography Discipline

The page fails when:

- More than 2 font families are loaded.
- More than 5 distinct font sizes are used.
- Line-height on body copy is less than 1.5 or greater than 1.9.
- Any heading sits on the page with letter-spacing > 0.04em (bad default from
  generic design tooling).

## 12. Spacing Discipline

The page fails when:

- More than 4 distinct top margins are used on direct children of `<section>`.
- A section uses non-8px spacing without a design-system reason code.

## Invocation

```bash
bash .claude/skills/scripts/slop-scan.sh dist
```

Output is both a human summary and a machine JSON under
`reports/visual/slop-scan.json`.

## Escalation

- Automatic block: rules 1, 2, 3, 4, 5, 7, 10.
- Warning with review: rules 6, 8, 9, 11, 12.

Warnings require a one-line reviewer acknowledgement in the PR before merge.
Automatic blocks require a fix.

## Reading

- `design-system/references/ai-slop-prevention.md` — the token-level slop
  rules this file extends.
- `content-writing/references/banned-phrases.md` — full banned phrase list
  used by rule 3 and rule 6.
- `design-quality-score/SKILL.md` — the rubric that scores rendered output
  beyond pass/fail slop detection.
