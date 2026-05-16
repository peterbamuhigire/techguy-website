# UX Writing Pattern Library

Operational pattern library for the small text on a premium website that decides whether the user understands, trusts, and acts.

## Voice chart

Every premium site has a voice chart. Six rows, applied consistently:

- Concepts. The ideas the brand keeps repeating; the categories it refuses.
- Vocabulary. The specific words used and avoided.
- Verbosity. How much text is acceptable per pattern.
- Grammar. Person, tense, sentence structure.
- Punctuation. House style on dashes, commas, exclamations.
- Capitalisation. Title case, sentence case, product names.

The voice chart belongs in `brand-style-guide` and is read by every writer.

## The 11 UX text patterns

Each pattern has a job. Apply the pattern; do not invent a new one.

1. Title. Names the page or screen. Specific, plain, scannable.
2. Heading. Structures the page. Promises what the section answers.
3. Body. Carries the argument. Short paragraphs, lists, examples.
4. Button. Verb that states what happens when clicked. Never "Submit", "Click here", "Learn more".
5. Description. Helps the user choose. Plain, comparative, honest.
6. Empty state. Explains why nothing is here and what to do next.
7. Label. Names the input. Shorter than the user expects, still clear.
8. Notification. Time-sensitive, low priority. Easy to dismiss.
9. Confirmation. Short positive feedback. "Sent. We will reply within one business day."
10. Error. States what went wrong and how to fix it.
11. Help text. Removes friction without growing the form.

## Editing pass

Run every UX text decision through this four-phase edit:

- Purposeful: every word does work. If a sentence can be cut, cut it.
- Concise: rewrite to half the length, then judge. Keep the version that wins on clarity.
- Conversational: read it aloud. If it sounds stilted, rewrite.
- Clear: a 14-year-old should understand it on first read.

## Patterns by page type

- Homepage hero: one promise + one proof + one action. Maximum 18 words combined for the promise.
- Service or product page hero: who it is for + what it does + what changes for the buyer.
- Pricing: plain table, plain currency, plain inclusions. Every "plus" needs a price.
- About: who, why, evidence. Skip the corporate adjectives.
- Contact / Lead form: confirm what the user gets back and how soon.
- 404 / 500: name the situation, give one route forward, do not apologise excessively.
- Confirmation pages: confirm what just happened, what happens next, who is responsible, and how to reach a human.

## Microcopy details that matter

- Button verbs follow the same family ("Send", "Book", "Get", "Start"). Avoid mixing "Submit" with "Send".
- Form labels match what the user calls the thing, not the database column.
- Currency symbols sit in the locally expected position, with the locally expected separator.
- Date formats follow the locale; for ambiguous markets show the month spelled out.
- Phone numbers shown in a format the user can dial without parsing.

## Error message patterns

- "Email looks incomplete. Please include the @ and the domain."
- "We could not find that postal code in [country]. Please check or enter the city."
- "Card declined by your bank. Please try another card or contact your bank."
- Avoid: "Invalid input.", "Error.", "Field is required."

## Empty state patterns

- "No results yet. Try a broader keyword, or browse [link to category]."
- "Your saved items will live here. Tap the bookmark on any product to start."

## Notification patterns

- "Saved." (Confirmation, low priority.)
- "Couldn't save. Check your connection and try again." (Error.)
- "5 new updates since you were last here." (Re-engagement.)

## Measurement

For copy decisions that could swing conversion:

- A/B test only when traffic supports significance.
- For low-traffic premium sites, run before/after comparisons over four weeks per change, with one variable at a time.
- Track: form completion rate, click-through on the changed CTA, scroll depth past the changed block.

## Anti-patterns

- Corporate softening. "We are pleased to inform you that..." → "..."
- Empty superlative modifiers (the engine's banned-term list in `glossary.md` enumerates them). Strip on first read.
- Generic CTAs. "Learn more" → "Read the case study", "See pricing".
- Apology spirals. One specific apology > three generic ones.
- AI-slop signals. Em-dashes between two adjectives, "delve into", "in today's fast-paced world", "elevate your". Strip these on first review.
