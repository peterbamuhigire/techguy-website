# Monthly Report Skill

Generate a complete, professional monthly client report in under 10 minutes. This skill runs as a structured interview — Claude asks for data section by section, then writes the full report with plain-English commentary that sounds like it came from a strategic partner, not an analytics tool.

## What This Skill Produces

A complete monthly report including:
- Executive Summary (3 sharp bullets — up, watching, doing)
- Traffic overview with plain-English interpretation
- Conversion performance with lead source analysis
- SEO progress with keyword movement table
- What We Did This Month (actions + reasoning)
- Next Month Plan (initiatives + expected outcomes)
- Formatted in clean markdown, ready for PDF export or email

---

## Step 0: Confirm Client Context

Before gathering data, establish context. Ask:

**"Which client is this report for? Tell me:**
1. **Client name and business type** (e.g., "Kampala Law Firm — commercial law")
2. **Their primary goal** (e.g., "Generate 15 qualified leads/month from organic search")
3. **Report month** (e.g., "February 2026")
4. **Months of relationship** (e.g., "Month 4 of 12") — affects tone and benchmarking
5. **Any major context** (e.g., "They launched a new service page this month" or "Their industry had a seasonal dip")"

Wait for answers before proceeding.

---

## Step 1: Gather Traffic Data

Ask for these exact numbers. If the client uses GA4, they can copy from the Acquisition overview report. If they use another tool, ask for equivalents.

**"Please paste your traffic numbers for [Month] and the previous month:"**

```
TRAFFIC DATA — [Month Year]
This month:
  Total sessions: ___
  Organic search sessions: ___
  Direct sessions: ___
  Referral sessions: ___
  Social sessions: ___
  Paid sessions (if any): ___
  New users: ___
  Returning users: ___

Previous month:
  Total sessions: ___
  Organic search sessions: ___

Same month last year (if available):
  Total sessions: ___
```

**If the client cannot provide granular breakdown:** Ask for total sessions this month vs. last month as a minimum. Generate commentary from what's available and note what tracking needs to be set up.

---

## Step 2: Gather Conversion Data

**"Now the conversion numbers:"**

```
CONVERSION DATA — [Month Year]
Total leads/enquiries received: ___
  From organic search: ___
  From direct: ___
  From referral: ___
  From social: ___
  From paid (if any): ___

Previous month total leads: ___

Conversion rate this month (leads ÷ sessions × 100): ___%
Conversion rate last month: ___%

If ecommerce:
  Total orders: ___
  Revenue: ___
  AOV: ___
  Previous month revenue: ___
```

---

## Step 3: Gather SEO Data

**"SEO data — keyword rankings and content:"**

```
SEO DATA — [Month Year]
Top keywords being tracked (paste ranking changes):

Keyword | Last Month Position | This Month Position
[keyword 1] | P__ | P__
[keyword 2] | P__ | P__
[keyword 3] | P__ | P__
[keyword 4] | P__ | P__
[keyword 5] | P__ | P__

New content published this month:
- [Article/page title] — target keyword: [keyword]
- [Article/page title] — target keyword: [keyword]

Technical issues found and resolved (if any):
- ___

Backlinks acquired (if any):
- ___
```

---

## Step 4: Gather Work Done

**"List everything the agency did this month — be specific. One action per line:"**

```
WORK DONE — [Month Year]
(List each task with a brief note on why it was done)

1. [Action] — [Reason/goal]
2. [Action] — [Reason/goal]
3. [Action] — [Reason/goal]
...
```

Examples of well-formatted work items:
- "Rewrote homepage headline and hero subtext — previous version had 71% bounce rate; new version addresses visitor's primary concern"
- "Published article: 'How much does a commercial lawyer cost in Uganda?' — targeting high-intent search query, 180 monthly searches"
- "Fixed broken internal links on 4 service pages — was causing crawl errors in Search Console"
- "Set up Goal tracking in GA4 for contact form submissions — enables accurate lead attribution from next month"

---

## Step 5: Gather Next Month Plans

**"What is planned for next month? List 3-5 initiatives:"**

```
NEXT MONTH PLAN
1. [Initiative] — [Why] — [Expected outcome]
2. [Initiative] — [Why] — [Expected outcome]
3. [Initiative] — [Why] — [Expected outcome]
```

**Also ask:** "Is there anything the client needs to provide or approve for next month's work?"

---

## Step 6: Generate the Report

Once all data is collected, generate the complete report. Follow these writing rules:

### Plain-English Commentary Rules

**For traffic increases:**
- Don't write: "Sessions increased 18% MoM"
- Do write: "18% more people visited your website this month compared to last — the two articles we published in January are now ranking on page 1, bringing in [X] new visitors who are actively searching for your service"

**For traffic decreases:**
- Don't write: "Sessions declined 12% vs. prior month"
- Do write: "Website visits dipped 12% this month — this is consistent with the seasonal pattern in your industry (February is typically slower than January) and we're not concerned. Our focus is on conversion quality, not raw traffic volume."

**For flat metrics:**
- Don't write: "Conversion rate remained stable at 2.3%"
- Do write: "Your conversion rate held steady at 2.3% — healthy for your industry benchmark of 2-4%. The work this month was foundation-setting; we expect to see this move in month 5 when the new service pages are indexed."

**For SEO improvements:**
- Don't write: "Keyword X improved from position 8 to position 4"
- Do write: "'[Keyword]' moved from position 8 to position 4 — we're now on the first page for a query that gets [X] monthly searches. At your current click-through rate, this should produce [Y] additional visitors per month once it stabilises."

**For declines:**
- Always explain the cause first, then what you're doing about it
- Never leave a red number without a sentence about the action being taken

### Executive Summary Rules

Write exactly 3 bullets. Each bullet is one sentence. Tone: confident, clear, non-defensive.

- Bullet 1: The most positive metric this month — what went up, and why it matters
- Bullet 2: The one thing being monitored — honest, not alarming
- Bullet 3: The priority action for next month — what you're doing and why

### Report Output Format

Generate the report in this exact markdown structure:

```markdown
# [Client Name] — Monthly Performance Report
**Period:** [Month Year]
**Prepared by:** [Agency Name]
**Relationship:** Month [X] of partnership

---

## Executive Summary

Three things you need to know this month:

1. **[Positive headline]:** [One sentence — metric + plain-English meaning]
2. **[Watching headline]:** [One sentence — honest observation + context]
3. **[Action headline]:** [One sentence — what we're doing next and why]

---

## Traffic Overview

| Metric | This Month | Last Month | Change |
|--------|-----------|-----------|--------|
| Total Sessions | [X] | [Y] | [↑/↓ Z%] |
| Organic Search | [X] | [Y] | [↑/↓ Z%] |
| Direct | [X] | [Y] | [↑/↓ Z%] |
| Referral | [X] | [Y] | [↑/↓ Z%] |
| Social | [X] | [Y] | [↑/↓ Z%] |
| New Users | [X] | [Y] | [↑/↓ Z%] |

**What this means:** [2-3 sentences in plain English. Name the specific cause of the most significant change.]

---

## Conversion Performance

| Metric | This Month | Last Month | Change |
|--------|-----------|-----------|--------|
| Total Leads/Enquiries | [X] | [Y] | [↑/↓ Z%] |
| Conversion Rate | [X]% | [Y]% | [↑/↓] |
| Top Lead Source | [channel] | [channel] | — |

**What this means:** [2-3 sentences. Name where the best leads came from. Explain what drives conversion rate change.]

[If ecommerce, add:]
| Revenue | [X] | [Y] | [↑/↓ Z%] |
| Orders | [X] | [Y] | [↑/↓ Z%] |
| AOV | [X] | [Y] | [↑/↓ Z%] |

---

## SEO Progress

**Keyword movements:**

| Keyword | Last Month | This Month | Trend |
|---------|-----------|-----------|-------|
| [keyword 1] | P[X] | P[Y] | [↑/↓/—] |
| [keyword 2] | P[X] | P[Y] | [↑/↓/—] |
| [keyword 3] | P[X] | P[Y] | [↑/↓/—] |
| [keyword 4] | P[X] | P[Y] | [↑/↓/—] |
| [keyword 5] | P[X] | P[Y] | [↑/↓/—] |

**Content published this month:**
[List each piece with its target keyword]

**Technical:** [What was fixed, or "No technical issues identified this month."]

**What this means:** [2-3 sentences interpreting the ranking movements and what to expect next month.]

---

## What We Did This Month

[For each work item, write one paragraph: Action → Why we did it → What we expect it to produce]

- **[Action]:** [Why] → [Expected outcome]
- **[Action]:** [Why] → [Expected outcome]
- **[Action]:** [Why] → [Expected outcome]

---

## Next Month Plan

| Initiative | Why | Expected Outcome |
|-----------|-----|-----------------|
| [Action 1] | [Business reason] | [Measurable result by when] |
| [Action 2] | [Business reason] | [Measurable result by when] |
| [Action 3] | [Business reason] | [Measurable result by when] |

**We need from you:**
[List any client inputs, approvals, content, photos, or decisions needed]

---

*Report prepared by [Agency Name] · [Month Year] · Next report: [Next Month]*
```

---

## Step 7: Review and Delivery

After generating the report, ask:

**"Here is the complete report. Before you send it:**
1. Does the Executive Summary accurately reflect this month?
2. Is there anything sensitive that shouldn't be in the written report?
3. Should any numbers be adjusted for context I don't have?

Once approved, copy the markdown into your PDF tool or email template."

**Recommended PDF tools:**
- Paste markdown into Notion → Export as PDF
- Use Pandoc: `pandoc report.md -o report.pdf` (requires Pandoc installed)
- Copy into Google Docs → File → Download as PDF
- Use a markdown-to-PDF browser extension

---

## Tracking Across Months

After generating each report, note:
- Which metrics improved vs. last month
- Which metrics are flat for 2+ consecutive months (needs intervention)
- Whether the client's 12-month goal is on track (calculate % of way there)

Flag to the account manager if:
- Conversion rate has been flat for 3+ months → trigger CRO audit
- Organic traffic declining for 2+ months → trigger technical SEO review
- Client has not responded to last report → trigger retention call

---

## Integration

- **agency-client-retention** — this skill operationalises the monthly communication rhythm; the Seed the Vision quarterly framework extends this into a strategic planning session
- **ecommerce-analytics** — use the RASTA model (Relevant, Accurate, Simple, Timely, Actionable) for all commentary; reference RFM and CLV metrics for ecommerce client reports
- **seo-audit** — for clients with SEO concerns, run seo-audit skill first and incorporate findings into the SEO section
- **they-ask-you-answer** — content published each month (Big 5 articles) appears in "What We Did" and "Content published" sections
- **agency-positioning** — all report commentary should reflect the Doctor (diagnosis), Pilot (strategy), and Teacher (explanation) roles
