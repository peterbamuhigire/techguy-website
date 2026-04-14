# 04 — AI Referral Tracking: GA4 Custom Channel Groups

## Skills Applied
- `seo` — `references/seo-reference.md` (Analytics, AI traffic measurement)

## Current State

**File:** `src/layouts/BaseLayout.astro` — lines 169-182 (GA4 tag — currently placeholder `G-XXXXXXXXXX`)

Phase 1, file 01 specified connecting GA4 with the real measurement ID. This file specifies what to do in GA4 after it is connected: setting up custom channel groups to identify and track AI referral traffic separately from organic search traffic.

## Problem

AI search engines (ChatGPT, Perplexity, Gemini, Claude) increasingly refer traffic to websites. This traffic arrives via referrals from domains like `chat.openai.com`, `perplexity.ai`, `gemini.google.com`, and others. By default, GA4 reports this traffic in the "Referral" channel — mixed in with regular referral traffic from social networks, directories, and partner sites. Without a dedicated channel group, it is impossible to measure:

1. How much traffic is arriving from AI systems
2. Which pages AI systems are sending users to
3. Whether AI-referred visitors convert differently from organic search visitors

## Target State

A GA4 custom channel group called "AI Search" that captures all traffic from known AI referral domains and reports it separately from other referral and organic traffic.

## Step-by-Step Instructions

### Step 1 — Connect GA4 (prerequisite from Phase 1)

If not already done: replace `G-XXXXXXXXXX` in `src/layouts/BaseLayout.astro` with the real GA4 measurement ID obtained in Phase 1, file 01.

### Step 2 — Create the "AI Search" custom channel group in GA4

**Location in GA4:** Admin → Data display → Channel groups → Create new channel group

**Channel group name:** `AI Search`

**Rules — add one condition per AI source:**

| Channel name | Condition |
|---|---|
| ChatGPT | Session source contains `chat.openai.com` OR `openai.com` |
| Perplexity | Session source contains `perplexity.ai` |
| Google Gemini | Session source contains `gemini.google.com` OR `bard.google.com` |
| Microsoft Copilot | Session source contains `copilot.microsoft.com` OR `bing.com/chat` |
| Claude (Anthropic) | Session source contains `claude.ai` |
| You.com | Session source contains `you.com` |
| AI Overview (Google) | Session medium = `organic` AND session source = `google` AND page_referrer contains `?sgrd=` |

**Combined AI Search channel rule:**
```
Session source contains any of:
  chat.openai.com
  openai.com
  perplexity.ai
  gemini.google.com
  bard.google.com
  copilot.microsoft.com
  claude.ai
  you.com
```

### Step 3 — Add UTM parameters to in-site links for AI tracking context

This step is optional but useful: if the site is referenced in AI-generated content with a direct link, UTM parameters allow identification of the specific AI system. However, UTMs cannot be added to external AI citations — they are only useful for links you control.

For the `hreflang` meta tags and sitemap links, no UTM parameters are needed.

For any links placed in AI-indexable contexts (e.g. structured data `url` fields), ensure the canonical URL is used without UTM parameters — UTMs in structured data can confuse schema validation.

### Step 4 — Create a GA4 comparison segment for AI traffic

**Location:** GA4 → Reports → Add comparison → Segment

Create a saved segment:
- **Segment name:** AI Search Referrals
- **Condition:** Session source matches regex `(chat\.openai\.com|perplexity\.ai|gemini\.google\.com|claude\.ai|copilot\.microsoft\.com)`

This segment can be applied to any GA4 report to filter for AI-referred sessions specifically.

### Step 5 — Create an AI traffic monitoring report

**Location:** GA4 → Explore → Blank

Create a custom exploration:

- **Name:** AI Search Traffic Monitor
- **Dimensions:** Session source, Landing page, Date
- **Metrics:** Sessions, Engaged sessions, Conversions (contact form submissions)
- **Filter:** Session source matches AI domains (from segment above)

Save and pin to the reports home.

### Step 6 — Set a monthly review cadence

At the start of Phase 10 (measurement maturity), this report is reviewed monthly. The key questions:

1. Which AI systems are sending the most traffic?
2. Which pages are AI systems sending users to?
3. Are AI-referred visitors converting (submitting the contact form)?
4. Is AI referral traffic growing month-over-month?

If a specific page is receiving significant AI referral traffic, that page is being cited by AI systems — confirm the `FAQSection` and `QuickAnswer` on that page are complete and accurate, and consider expanding the content depth.

### Step 7 — Track the effect of Phase 8 changes

Before implementing Phase 8 changes, record baseline metrics from GA4:
- Total sessions from AI referral channels (likely near zero if Phase 8 has not yet launched)
- Organic search sessions
- Referral sessions

After Phase 8 is fully implemented, compare 90-day periods before and after. The target improvement is: measurable AI referral traffic appearing within 90 days of full Phase 8 implementation (QuickAnswer, FAQPage schema, Author Box, Person schema).

## Known AI Referral Domains (update as new systems launch)

Maintain this list and update the GA4 channel group quarterly:

```
chat.openai.com
openai.com
perplexity.ai
gemini.google.com
bard.google.com
copilot.microsoft.com
copilot.bing.com
claude.ai
anthropic.com
you.com
phind.com
kagi.com
```

## Acceptance Criteria

- [ ] GA4 measurement ID connected to the site (Phase 1 prerequisite)
- [ ] Custom channel group "AI Search" created in GA4 with rules for all known AI domains
- [ ] GA4 comparison segment "AI Search Referrals" saved
- [ ] Custom exploration "AI Search Traffic Monitor" created and pinned
- [ ] Baseline metrics recorded before Phase 8 implementation
- [ ] Monthly review date set in calendar for 90 days after Phase 8 completion

## Effort

**S** — 1 hour (GA4 configuration only; requires GA4 access)
