# Banned Patterns

**Read this when**: tuning `scripts/slop-scan.sh` or scoring a template
against the rubric's copy and originality categories.

**Purpose**: A machine-readable catalogue of banned headline patterns,
banned colour combinations, and banned pattern language. The
`slop-scan.sh` script reads this list and fails the build on any match.

## Banned headline and hero patterns

- `Welcome to (our|the)` — generic welcome framing.
- `We (are|'re) passionate about` — passion claim without proof.
- `Your one-stop (shop|solution|destination)` — category bloat.
- `Bringing the future of` — vague futurism.
- `Empowering (businesses|people|teams)` — abstract empowerment.
- `Revolutionising` — overclaim verb.
- `The leading` — unverifiable superlative.
- `Cutting-edge` — dated buzzword.
- `State of the art` — dated buzzword.
- `Innovative solutions` — double-generic.
- `Crafted with care` — sentimental filler.
- `Take your (business|brand|project) to the next level` — template
  framing.

Rule: any of the above in a hero or section header fails the scan.
Contextual use in body copy that discusses the phrase (e.g. "we avoid
calling ourselves 'cutting-edge' because…") is allowed.

## Banned filler words (in heroes and sub-heroes)

These words appearing in a hero or sub-hero headline suggest vague
positioning. A hero with two or more flags fails:

- `seamless`, `seamlessly`
- `holistic`
- `synergy`, `synergistic`
- `robust` (as an adjective)
- `scalable` (as a selling point, not a fact)
- `next-generation`, `next-gen`
- `best-in-class`
- `world-class` (as an adjective)

## Banned colour combinations

Derived from `design-system/references/ai-slop-prevention.md`:

- Pure `#000000` text on pure `#FFFFFF` background for body copy.
- Any rainbow-gradient hero without a content reason.
- Purple-to-blue gradient background as default "SaaS" visual.
- Off-palette accent hex used once and nowhere else.

## Banned easing curves

Motion must follow the 100/300/500 ms rule and use the engine's
approved easing curves. Banned defaults:

- `cubic-bezier(0.4, 0, 0.2, 1)` as the universal curve for every
  transition — fine for one utility, drift when applied everywhere.
- `ease-in-out` on entrance animations that should ease-out only.
- Bounce or elastic easing on primary content reveals.

## Banned generic layouts

- Three-column feature grid with identical icons, identical heading
  length, and identical two-line body copy.
- Generic testimonial carousel with three slides and no attribution.
- "Team" section with six circular headshots and titles but no specific
  roles (e.g. "Founder" without context).

The rubric allows these layouts when the content, typography, or
photography makes them distinctive; the ban applies to the default
instantiation.

## Banned icon patterns

- Heroicons default set used across the entire site without a chosen
  style (outline vs solid) and without consistent colour treatment.
- Emoji substituted for icons.
- Decorative icons that duplicate the heading label.

## Banned trust patterns

- "Trusted by" row with three greyscale logos and no link or proof.
- Star ratings from unnamed sources.
- "Featured in" with logos of publications that never wrote about the
  client.
- Stock photography for team, customers, or testimonials.

## Banned copy shortcuts

- Sentences starting with "In today's fast-paced world".
- Sentences starting with "In the digital age".
- "At the end of the day" as a transition.
- "Unpack" as a verb for explaining anything.
- "Dive into" as a verb for starting any section.

## How the slop-scan uses this

`scripts/slop-scan.sh` turns the lists above into grep patterns and
scans:

- rendered HTML in `dist/` (for copy and markup)
- compiled CSS (for banned gradient tokens and easing curves)
- inline JS (for obvious telltale marketing strings)

Any match fails the scan with a non-zero exit. The scan is deliberately
cheap to run; the rubric catches more subtle failures.

## Updating the list

- A new banned pattern is added through a decision entry that cites the
  occurrence (internal or external) that motivated the addition.
- A banned pattern cannot be removed once added without an explicit
  decision entry overturning it.
- The list is reviewed at the quarterly documentation audit.
