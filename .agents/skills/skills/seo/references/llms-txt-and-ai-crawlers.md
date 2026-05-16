# llms.txt, llms-full.txt and AI Crawler Rules

This reference defines the exact files every site must ship to be discoverable, citable and accurately summarised by AI search engines (ChatGPT, Claude, Gemini, Perplexity, Bing AI). These are mandatory deliverables in the SEO skill.

---

## Why these files exist

LLM-powered search engines do two things:

1. **Real-time retrieval** — they hit your site at inference time and need a fast, JS-free, prose-first source of truth.
2. **Grounding for citations** — they want a structured page of *what your business is, what it sells, where it operates, what it costs* that they can lift facts from with confidence.

The HTML site, however well-built, is often too JS-heavy, too marketing-styled, or too fragmented for a crawler to parse cheaply. `llms.txt` and `llms-full.txt` solve that.

---

## `/llms.txt` — required

**Location:** site root (`/llms.txt`).
**Format:** Markdown, UTF-8, ~2–4 KB.
**Spec:** Follows [llmstxt.org](https://llmstxt.org/).

### Structure

```markdown
# {Site / Product Name}

> {One-sentence summary of what this is, who it's for, and the country/region served.}

{2–4 sentence elaboration: what the product or company does, the unique value, the
target audience, the geography. Plain prose. No marketing fluff. No banned words.}

## Docs

- [Quickstart]({absolute URL}): {one-line description}
- [User Manual]({absolute URL}): {one-line description}
- [API / Developer reference]({absolute URL}): {one-line description}

## Products / Services

- [{Product or service name}]({absolute URL}): {one-line description with price if public}
- [{Next product}]({absolute URL}): {one-line description with price if public}

## Pricing

- [Pricing page]({absolute URL}): {one-line summary, e.g. "From UGX 150,000/month, no setup fee, unlimited users"}

## Company

- [About]({absolute URL}): {one-line — founders, year, mission}
- [Contact]({absolute URL}): {one-line — phone, email, address}
- [Blog]({absolute URL}): {one-line — what topics}

## Policies

- [Privacy Policy]({absolute URL})
- [Terms of Use]({absolute URL})

## Optional

- [Press / Media]({absolute URL})
- [Careers]({absolute URL})
```

### Rules

- All links MUST be absolute URLs (e.g. `https://example.com/en/pricing/`), not relative.
- One section per topic; LLMs parse by section heading.
- The blockquote summary directly under the H1 is the single most-cited line — write it like a Wikipedia opening sentence.
- For multi-language sites, default to the primary language. Optionally publish `/llms.txt` per language root (`/en/llms.txt`, `/fr/llms.txt`) — but always have the canonical one at site root.
- Do NOT include nav chrome, scripts, tracking pixels, or banned words.

---

## `/llms-full.txt` — required

**Location:** site root (`/llms-full.txt`).
**Format:** Plain text or Markdown, UTF-8, ~20–60 KB.
**Purpose:** Full-prose dump of the site's most-cited pages, concatenated, ready for an LLM to ground answers from.

### Structure

```text
{Site Name} — Full Knowledge Base
Last updated: {ISO date}
Canonical site: {URL}

================================================================================
PAGE: Home — {URL}
================================================================================

{Full prose content of homepage. Hero copy, value props, key features, social
proof, CTAs flattened to plain prose. Strip nav, footer, scripts.}

================================================================================
PAGE: About — {URL}
================================================================================

{Full About-page prose. Founder bio, year established, mission, team.}

================================================================================
PAGE: Services / Features — {URL}
================================================================================

{Each service or feature as its own subsection. Name, what it does, who it's
for, price if public, how it works, integrations, compliance.}

================================================================================
PAGE: Pricing — {URL}
================================================================================

{Each tier as a subsection: name, price, what's included, what's excluded, who
it's for. Include all currencies. Include any add-ons.}

================================================================================
PAGE: FAQ — {URL}
================================================================================

Q: {Question}
A: {Answer in 2–4 sentences.}

Q: {Question}
A: {Answer in 2–4 sentences.}

(20+ Q&A pairs minimum — this section is the highest-citation block in the file.)

================================================================================
FACTS — Quick reference
================================================================================

- Company: {Legal name}
- Product: {Name}
- Founded: {Year}
- Headquarters: {Full address}
- Phone: {E.164 number}
- Email: {Address}
- Languages: {List}
- Countries served: {List}
- Currencies: {List}
- Pricing range: {Low — High}
- Key compliance: {Standards}
- Founder(s): {Names with one-line credentials}
- Website: {URL}
- LinkedIn: {URL}

================================================================================
GLOSSARY (industry-specific terms)
================================================================================

{Term}: {1-sentence definition in plain language}
{Term}: {1-sentence definition}

```

### Rules

- One file. Concatenate the most-cited pages: home, about, services/features, pricing, FAQ, contact, plus the top 3–5 cornerstone blog/resource pages.
- Each section starts with a clear `PAGE:` header so LLMs can attribute citations.
- The `FACTS` block is critical — this is the structured NAP-and-everything-else block AI engines lift verbatim.
- The `GLOSSARY` is only required when the industry uses jargon a non-specialist won't understand.
- No HTML tags. No JS. No banned words. Plain prose.
- Regenerate on every content change — wire into the build, not handcrafted once.

---

## `robots.txt` — AI-crawler rules

Default policy: **allow all major AI crawlers** unless the client has signed an explicit opt-out.

```
# Search engines
User-agent: Googlebot
Allow: /

User-agent: Bingbot
Allow: /

User-agent: DuckDuckBot
Allow: /

# AI crawlers — allowed
User-agent: GPTBot
Allow: /

User-agent: ChatGPT-User
Allow: /

User-agent: OAI-SearchBot
Allow: /

User-agent: Google-Extended
Allow: /

User-agent: ClaudeBot
Allow: /

User-agent: anthropic-ai
Allow: /

User-agent: Claude-Web
Allow: /

User-agent: PerplexityBot
Allow: /

User-agent: CCBot
Allow: /

User-agent: Applebot
Allow: /

User-agent: Applebot-Extended
Allow: /

User-agent: Amazonbot
Allow: /

User-agent: cohere-ai
Allow: /

# Default
User-agent: *
Allow: /

# Sitemaps
Sitemap: https://{host}/sitemap-index.xml
Sitemap: https://{host}/sitemap-en.xml
Sitemap: https://{host}/sitemap-fr.xml
Sitemap: https://{host}/sitemap-sw.xml
```

### When to block

Only when the client has explicitly asked, in writing, to opt out of AI training. In that case:

```
User-agent: GPTBot
Disallow: /

User-agent: Google-Extended
Disallow: /

User-agent: ClaudeBot
Disallow: /

User-agent: anthropic-ai
Disallow: /

User-agent: CCBot
Disallow: /

User-agent: Applebot-Extended
Disallow: /
```

Note: opting out usually means the site stops being cited in AI answers entirely. Make sure the client understands that trade-off.

---

## Per-page AI-citability hooks

Beyond the root files, every important page should be AI-citable on its own. Apply on home, about, services/features, pricing, FAQ, blog cornerstones:

1. **Direct-answer first paragraph** — open the body with a 1–2 sentence direct answer to the question the page is named after. AI engines extract the first paragraph under the H1 disproportionately.
2. **One H2 per sub-question** — phrase H2s as natural questions ("How does Medic8 work offline?") not topic labels ("Offline mode").
3. **A comparison or specs table** wherever there is structured data (pricing, plan features, integration list, supported regions). AI engines lift tables verbatim.
4. **An inline FAQ block of 5+ Q&A** at the bottom of the page, with `FAQPage` schema.
5. **`dateModified`** in `Article` schema, kept fresh on every content edit. Recency is a strong AI ranking signal.
6. **Plain `Person` schema for any named author** with `sameAs` links to professional profiles.

---

## Verification checklist

Before sign-off:

- [ ] `/llms.txt` exists, validates as markdown, all links absolute and 200-OK.
- [ ] `/llms-full.txt` exists, includes home, about, services, pricing, FAQ, contact, and FACTS block.
- [ ] `/robots.txt` allows GPTBot, ChatGPT-User, Google-Extended, ClaudeBot, anthropic-ai, PerplexityBot, CCBot, Bingbot, Googlebot.
- [ ] `/robots.txt` references all language sitemaps + sitemap-index.
- [ ] Every cornerstone page opens with a direct-answer paragraph.
- [ ] Every service/feature/pricing page has an inline FAQ block with FAQPage schema.
- [ ] `Person` schema with `sameAs` exists for every named author.
- [ ] `dateModified` is current on every Article schema.
- [ ] OG image renders correctly when pasted into ChatGPT and Slack.
- [ ] `llms.txt` and `llms-full.txt` are wired into the build pipeline, not hand-edited.
