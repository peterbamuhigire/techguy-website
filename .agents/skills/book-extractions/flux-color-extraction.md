# Flux Academy - The Complete Guide for Choosing Colors

**Source:** Ran Segall et al. (Flux Academy), *The Complete Guide for Choosing Colors*.

## Use this for

- Picking a brand or website palette from a brief (with or without existing brand colours).
- Auditing an existing palette for accessibility, ratio balance, or visual coherence.
- Generating a tonal scale (50–900) from a single brand colour.
- Resolving a contrast failure without abandoning the brand colour.

## High-signal insights

1. **All palettes begin with one hue.** Pick the primary from mood + audience, never from a generator.
2. **Imagery first.** The book's worked example tints a B&W reference photo (girl with balloons) purple, then builds the palette around that hue. Brand colour lives *inside* the photography, not on top of it.
3. **Six harmonies and when to use them.** Monochromatic (premium/minimal) · Analogous (organic/wellness) · Complementary (sports/punch) · Split-complementary (CTA-led SaaS, the workhorse) · Triadic (playful/creative) · Tetradic (editorial, hardest to balance).
4. **60/30/10 is a dominance gauge, not a literal three-colour rule.** Neutrals 60%, primary 30%, accent 10% — by visual weight, regardless of how many swatches.
5. **Brand colour rarely passes AA on white as body text.** Reserve raw brand for chrome, headings, and CTAs. Use `purple-700` / `-800` for body weight on white.
6. **Tone matters more than hue for legibility.** Two different hues at the same lightness can have terrible contrast.
7. **Move shade up/down the scale to fix a contrast failure — never re-pick the hue.** Preserves brand identity.
8. **Build base first, accents last.** Loud accents in non-CTA areas pull attention away from conversion.
9. **Psychology is situational.** Red is not always passion; blue is not always calm. Same hue at different saturations does opposite jobs.
10. **OKLCH for perceptually uniform 10-step scales.** Equal L truly looks equal-bright; HSL doesn't (yellow at L=50% looks far brighter than blue at L=50%).

## The Flux process

Brief → Four diagnostic questions (constraints? all guidance? what feel? what action?) → Primary hue → Harmony → Tonal scales → 60/30/10 distribution → WCAG verification → Review checklist (functional? appealing? brand-consistent? brief-answered?).

Full process and worked example in the `color-theory` skill in the parent skills repo, and in `color-selection/references/flux-process.md` in this repo.

## Skill cross-reference

Seeds the new `color-theory` skill (parent repo) and updates `color-selection` (this repo).
