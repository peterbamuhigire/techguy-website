# African Language Pack

**Read this when**: adding or reviewing language support for an
African-market site, or when auditing an existing site's language
coverage against its audience.

**Purpose**: Define the 10 first-class African languages the engine
supports beyond "English + French", their font-support requirements,
expansion ratios for layout, and the RTL rules for markets where they
apply.

## First-class languages

| Language | Code | Script | Region | Speakers (approx) |
|---|---|---|---|---|
| Kiswahili | sw | Latin | East Africa (EAC) | 200M |
| Luganda | lg | Latin | Uganda | 10M |
| Amharic | am | Ethiopic (Ge'ez) | Ethiopia | 32M |
| Yoruba | yo | Latin (with tone marks) | Nigeria, Benin, Togo | 45M |
| Hausa | ha | Latin or Ajami (Arabic script) | Nigeria, Niger | 80M |
| Zulu | zu | Latin | South Africa | 12M |
| Twi | tw (ak) | Latin | Ghana | 20M |
| Wolof | wo | Latin | Senegal, Gambia | 10M |
| Arabic | ar | Arabic (RTL) | North Africa | ~280M across region |
| Tifinagh (Berber) | zgh | Tifinagh | Morocco, Algeria | ~10–15M |

English and French remain first-class globally; this list extends the
engine's default.

## When to ship which language

The language set is decided during strategy:

- **Primary market rule**: always ship the primary market's dominant
  trade language. For Uganda that is English plus Kiswahili plus often
  Luganda. For Nigeria, English plus the state's primary (Hausa in
  the north, Yoruba in the south-west, Igbo in the south-east — Igbo
  is not yet first-class here; add via decision entry when needed).
- **Buyer-vs-user rule**: if the buyer operates in English but the
  end-user does not, ship the end-user's language for the
  end-user-facing flows.
- **Formal-vs-informal rule**: in many markets, the website's
  "official" voice is English, but the CTA, trust strip, and
  testimonial voice work better in the local language. Mix deliberately.

## Font support

| Language | Recommended primary fonts (open-source) | Notes |
|---|---|---|
| Kiswahili | Inter, IBM Plex, Source Sans | Latin; no special glyphs beyond ASCII. |
| Luganda | Inter, Source Sans | Latin; no special glyphs. |
| Amharic | Noto Sans Ethiopic, Abyssinica SIL | Ge'ez script; body text only in fonts with Ethiopic coverage. |
| Yoruba | Noto Sans, Inter (with Yoruba subset) | Tone marks: ọ, ẹ, ṣ, and above diacritics. Confirm glyph coverage. |
| Hausa (Latin) | Inter, Noto Sans | Hooked letters: ɓ, ɗ, ƙ, ƴ. Confirm glyphs. |
| Hausa (Ajami) | Noto Naskh Arabic | Same script family as Arabic; RTL. |
| Zulu | Inter, Source Sans | Latin with clicks written with standard letters. |
| Twi | Noto Sans, Inter | Tone marks and special letters (ɛ, ɔ). |
| Wolof | Inter, Noto Sans | Latin with special letters (ñ, ŋ). |
| Arabic | IBM Plex Arabic, Noto Naskh Arabic | RTL, script-family differences between North African and Gulf styles. |
| Tifinagh | Noto Sans Tifinagh | Very small user base; subset carefully. |

Rules:

- Never ship a font that does not render every character in the
  target language. Missing glyphs show as empty boxes; unacceptable.
- Subset per language shipped. Don't load the full Noto Sans when
  the page is Kiswahili and uses only basic Latin.
- Prefer Noto family for coverage breadth. IBM Plex and Source Sans
  are good choices for Latin-script African languages.

## Expansion ratios

Translate your English wireframe with realistic pad for each language.
Never lay out against English character counts alone.

| Language | Expansion vs English |
|---|---|
| Kiswahili | +10 to +25% (longer compound words, "ku-" prefixes) |
| Luganda | +15 to +30% (noun-class prefixes) |
| Amharic | varies; character count may drop but height increases for Ethiopic |
| Yoruba | +10 to +15% |
| Hausa | +10 to +20% |
| Zulu | +15 to +30% (prefixes) |
| Twi | +10 to +15% |
| Wolof | +10 to +15% |
| Arabic | -5 to +10% character count; RTL reverses layout entirely |

Design implications:

- Buttons: size to the longest label you will ship + 10%.
- Navigation: horizontal nav breaks in Kiswahili; plan a compact
  variant.
- Hero headlines: allow 2 line wraps; plan for the treatment to work
  at both 6 words and 12 words.
- Forms: field labels above inputs, not beside them, so expansion
  does not crowd the input.

## RTL — Arabic, Tifinagh

When shipping RTL:

- Flip the entire layout (`dir="rtl"`).
- Flip icons that imply direction (arrows, chevrons).
- Do **not** flip brand marks.
- Do not flip icons that do not imply direction (settings gear,
  search magnifier).
- Mirror spacing utilities; Tailwind has `rtl:` variants.
- Date pickers: confirm the calendar respects the locale.
- Numbers: decide per-market — Arabic-speaking audiences may prefer
  Arabic-Indic digits (٠١٢٣٤٥٦٧٨٩) for body text and Western digits
  (0123456789) for data-heavy content.

Test RTL builds against LTR builds side-by-side; visual parity is
required.

## Tone marks and diacritics

Yoruba and Twi both rely on diacritics for meaning. Copy-paste from
a source that strips diacritics is wrong. The content pipeline must:

- Accept Unicode NFC-normalised text.
- Not auto-correct or "clean" diacritics.
- Preview the rendered output in-market before sign-off.

## Hausa dual-script

If the client's audience includes Ajami-script readers (northern
Nigeria, Niger), decide at strategy time whether to ship Ajami as a
separate locale or only Latin-Hausa. Ajami is RTL and uses the
Arabic-script tooling.

## Translation sourcing

- Human translation is the default. Machine translation is a bridge
  only, and even then reviewed by a native speaker before shipping.
- Back-translate to confirm nuance; the engine does not ship content
  the native-speaker reviewer has not signed off.
- Maintain a glossary per language at
  `docs/<lang>/glossary.md` in the client project for brand terms
  that should not be translated (product names, CTAs if kept in
  English).

## SEO implications

- hreflang for every language shipped.
- URL structure: subdirectory (`/sw/`, `/am/`), not subdomain, unless
  the client's SEO history dictates otherwise.
- Locale-specific structured data (Organization name in local script).
- Meta descriptions in the target language, not auto-translated from
  English.

## Verification

At launch:

- Render each shipped language in the browser and visually inspect
  for rendering errors, missing glyphs, or layout breaks.
- Confirm expansion has not broken navigation.
- Confirm RTL builds mirror correctly end-to-end.
- Confirm keyboard input works for diacritics and special letters in
  form fields.

## Adding a new language

- File a decision entry proposing the addition.
- Choose the font and confirm glyph coverage.
- Compute expansion ratio on the top three pages.
- Source translation from a native speaker; document the translator's
  name and approval.
- Update hreflang, sitemap, and the language switcher.
