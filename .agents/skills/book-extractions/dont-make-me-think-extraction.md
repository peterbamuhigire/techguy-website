# Don't Make Me Think — Reference Extraction

**Source:** Krug, S. (2014). *Don't Make Me Think, Revisited: A Common Sense Approach to Web and Mobile Usability*, 3rd ed. New Riders.

> This extraction is a reference for the `web-usability-krug` global skill and for embedding key principles into the website-skills pipeline. See the global skill for the complete reference.

---

## Krug's Three Laws

| Law | Statement | Design Rule |
|-----|-----------|-------------|
| **First** | Don't make me think | Every page must be self-evident. Eliminate all "question marks" — ambiguous labels, unclear affordances, invisible clickables |
| **Second** | Clicks don't matter; cognitive effort does | Depth ≠ bad. Ambiguity = bad. A 5-click mindless path beats a 2-click puzzling one. "Scent of information" must be maintained at every step |
| **Third** | Omit needless words | Cut word count in half. Then cut half of what remains. Happy talk and instructions will not be read |

---

## Three Facts of Real Web Use

**Fact 1 — We scan, not read.**
Users glance at a page, find words that match their goal, click. They are "like sharks — they have to keep moving." Design for scanning not reading.

**Fact 2 — We satisfice, not optimise.**
Users take the first reasonable option, not the best one. Reasons: in a hurry; little penalty for back-button; weighing options doesn't help on bad sites; guessing is more fun. The first plausible link wins.

**Fact 3 — We muddle through.**
Users never read instructions. They invent plausible stories about how things work and proceed. The design must support successful muddling without requiring comprehension.

**Implication:** Design great billboards. Not brochures. Not novels. Billboards.

---

## Billboard Design 101 — Six Principles

1. **Conventions are your friends.** Logo top-left, nav top or left, search top-right, blue underlined links. Convention has zero learning cost. Innovate only when the benefit unmistakably outweighs the learning cost.

2. **Effective visual hierarchies.** Three traits: (a) More important = more prominent (size, weight, colour, whitespace); (b) Related = visually grouped; (c) Nested visually = nested logically. A good visual hierarchy preprocesses the page for the user instantly.

3. **Break pages into clearly defined areas.** Users decide which areas to focus on and which to skip entirely. Banner blindness proves users can completely ignore regions they've categorised as irrelevant.

4. **Make clickables obvious.** Shape, location, colour/underline. Never use the same colour for links and non-clickable headings. On mobile: no hover state — affordances must be visible without cursor interaction.

5. **Eliminate visual noise.** Three types: Shouting (everything competing, exclamation marks everywhere), Disorganisation (no grid), Clutter (too much stuff). Start with assumption everything is noise — prove it has earned its place.

6. **Format for scanning.** Headings that stand alone as labels (closer to content below than section above). Short paragraphs (single sentences are fine). Bulleted lists. Bold key terms where they first appear. Lots of headings.

**Rule: CLARITY TRUMPS CONSISTENCY.** If you can make something significantly clearer by making it slightly inconsistent, choose clarity.

---

## Navigation Design

### Why Navigation Matters
Navigation does three things beyond wayfinding:
1. **Reveals content** — shows users what the site contains
2. **Teaches site use** — is the only instruction most users will ever read
3. **Builds confidence** — users are constantly asking "do these people know what they're doing?"

### Persistent Navigation (every page except form/checkout)
| Element | Rule |
|---------|------|
| **Site ID** | Top-left; highest in visual hierarchy; frames the page; links to home |
| **Sections** | Primary nav; top-level IA |
| **Utilities** | 4-5 max in header; rest in footer; less prominent than sections |
| **Search** | Simple box + button labelled "Search" (not "Find", not "Keyword Search") |

### Page-Level Rules
- **Every page needs a name.** Prominent. Must match what was clicked exactly.
- **"You are here" indicator.** Highlight current section/subsection in nav. Must be prominent — if a designer thinks it's sticking out, it probably needs to be twice as prominent.
- **Breadcrumbs.** At top. Use `>` separator. Bold last item (current page, not a link).
- **Design navigation for ALL levels.** Don't neglect 3rd, 4th level nav — users spend as much time there.

### The Home Page
Three questions every Home page must answer instantly:
1. What is this? (tagline — 6-8 words, differentiating, not a motto)
2. What can I do here?
3. Why should I be here, not somewhere else?

Three starting options must be visible: search, browse, sample their best.

Home = North Star. Always navigable to from anywhere. Back to fresh start.

**Tagline rules:** Describes what the site does. Not a corporate motto. Specific differentiator. 6-8 words max.

---

## Mindless Choices

Users will happily click many times if each click is **mindless and unambiguous**. Rule: *3 mindless clicks = 1 thinking click*.

**Scent of information:** Links must unambiguously signal where they lead. Ambiguous links break the trail. When the scent is strong, users follow confidently. When weak, they abandon.

When unavoidable choices are complex, provide guidance that is:
- **Brief** — smallest amount of info that helps
- **Timely** — appears exactly when needed
- **Unavoidable** — formatted so it will be noticed

---

## Word Reduction Rules

**Happy talk must die.** Introductory text that welcomes users, congratulates the site, or describes what the user is about to see. Zero information content. Users skip it instantly. Kill it.

**Instructions must die.** No one reads them. Objective: eliminate instructions entirely by making design self-explanatory. When absolutely necessary: cut to bare minimum.

**Cutting benefits:**
- Reduces noise
- Makes useful content more prominent
- Makes pages shorter (less scrolling)

---

## Mobile Usability

**Core rule:** Managing real estate challenges shouldn't be done at the cost of usability.

**Mobile First** means: determine what's truly essential first, then add. Don't assume "mobile = on the move" — users use mobile everywhere, for everything.

**Prioritisation rule:** Frequent/urgent features = close at hand. Everything else = a few taps away with an obvious path. More taps are fine if the user remains confident.

**Affordances on mobile:**
- No hover/cursor → hover-dependent affordances don't exist
- Flat design removes visual cues that indicate interactivity
- Multi-dimensional signalling required: position + formatting + colour + shape
- Clickable elements must be visually distinguishable without hover

**Performance:** Speed is crucial. Slow performance on mobile = loss of goodwill. Don't load desktop images at mobile resolution.

**Three mobile hygiene rules:**
1. Allow zooming (if not responsive)
2. Deep links should go to the actual content, not the home page
3. Always provide path to full site

---

## Usability Testing

**Key insight:** Debates about what users like waste time. Testing reveals what actually works.

**DIY testing formula:** 3 users, once a month, observe them doing typical tasks. Even rough testing beats no testing.

**Focus groups ≠ usability testing.** Focus groups reveal attitudes; usability testing reveals behaviour.

**Test timing:** Start before design. Test competitors. Test sketches. Test wireframes. Test prototypes. Test live pages. Never stop.

---

## Goodwill Reservoir

Every site has a reservoir of goodwill. Actions that drain it:
- Hiding information users need (price, phone number, requirements)
- Requiring registration before anything is shown
- Asking for information that isn't necessary
- Not linking directly to the thing referenced ("go to X, then click Y, then scroll to Z")
- Making pages look unprofessional (typos, broken images, inconsistencies)

Actions that fill it:
- Knowing the main thing users want and making it obvious
- Telling users what they need to know (e.g., exactly what area codes/formats are accepted)
- Providing fewer steps when possible
- Giving a "straight answer" to questions users actually have

---

## Accessibility Essentials

Accessibility is the right thing to do AND it improves usability for everyone.

Key fixes with high impact:
1. Alt text on images (not "image of" — describe what matters)
2. Keyboard navigation: all interactive elements reachable without mouse
3. Sufficient colour contrast (WCAG AA minimum)
4. Don't rely on colour alone to convey information
5. Captions on video

---

## Cross-Skill References

- **`web-usability-krug`** (global skill) — complete reference; load alongside `ux-psychology`
- **`ux-psychology`** — cognitive science foundations for why these principles work
- **`content-writing`** — Krug's word reduction rules applied to copywriting
- **`page-builder`** — scanning design and navigation conventions applied to Astro pages
- **`form-ux-design`** — mindless choices and inline guidance principles apply directly to forms
