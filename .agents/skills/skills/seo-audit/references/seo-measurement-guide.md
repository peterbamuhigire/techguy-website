# SEO Measurement Guide — KPI Framework

How to measure, monitor, and demonstrate SEO success. This framework defines the key performance indicators, benchmarks, and monitoring schedule for every website we build.

Source: *The SEO Book* (Tobias Ebner & Levin Granitza), Chapter 7: Measuring and Demonstrating the Success of SEO.

---

## The SEO Success Chain

SEO success flows through a measurable chain. Each link must be tracked:

```
Rankings → Impressions → Clicks → Traffic → Engagement → Conversions → Revenue
```

If any link is weak, the chain breaks. Diagnose by working backwards from the goal.

---

## Traffic Metrics

### Organic Visits
- **What**: Number of visitors arriving from organic search results (not paid ads)
- **Where**: Google Analytics 4 → Acquisition → Traffic Source = Organic Search
- **Benchmark**: Healthy sites see organic traffic grow 5-15% month-over-month after launch
- **Warning**: If organic traffic drops >20% in one month, investigate immediately (algorithm update, crawl error, penalty)

### Traffic by Source
| Source | What It Tells You |
|--------|-------------------|
| Google organic | Primary search visibility |
| Bing organic | AI search platform visibility (ChatGPT, Perplexity, Claude use Bing) |
| Direct | Brand awareness and repeat visitors |
| Referral | Off-page authority and partnerships |
| Social | Social media effectiveness |

**Important**: Track Google and Bing organic traffic separately. Bing traffic indicates AI search platform visibility.

---

## Engagement Metrics

### Bounce Rate Benchmarks
| Page Type | Acceptable Bounce Rate | Concerning |
|-----------|----------------------|------------|
| Homepage | 40-60% | >70% |
| Service pages | 30-50% | >60% |
| Blog articles | 60-80% | >85% |
| Contact page | 40-60% | >70% |
| Landing pages | 30-50% | >65% |

**Context matters**: A high bounce rate on a blog article is not always bad — the reader may have found their answer. But a high bounce rate on a service page means visitors are not finding what they expected.

### Time on Site (Dwell Time)
- **Good**: 2-4 minutes average session duration
- **Concerning**: Under 30 seconds (visitors leaving immediately)
- **What affects it**: Content quality, page load speed, search intent match, readability

### Pages per Session
- **Good**: 2-4 pages per session
- **Indicates**: Effective internal linking and engaging content
- **Low count**: Check navigation, CTAs, and content cross-linking

---

## Conversion Metrics

### Conversion Rate
**Formula**: `(Conversions ÷ Total Visitors) × 100`

| Business Type | Average Conversion Rate | Good |
|---------------|------------------------|------|
| Professional services | 2-5% | >5% |
| E-commerce | 1-3% | >3% |
| B2B / SaaS | 2-5% | >5% |
| Local business | 3-8% | >8% |

### What Counts as a Conversion
Define before launch — every site must track at least one:
- Contact form submission
- Phone call initiated (via `tel:` link click)
- Email click (via `mailto:` link click)
- CTA button click (primary action)
- Newsletter signup (if applicable)
- Quote request or booking

### Cost-per-Acquisition (CPA)
**Formula**: `Total Marketing Spend ÷ Number of Conversions`

Compare CPA across channels to prove SEO ROI:
- SEO (organic) — typically lowest CPA after initial investment
- Paid search (Google Ads) — immediate but ongoing cost
- Social media — brand building, harder to attribute directly
- Directories — moderate, depends on industry

---

## Ranking & Visibility Metrics

### Google Search Console Metrics
| Metric | What It Means | Where to Find |
|--------|---------------|---------------|
| Impressions | How often your pages appeared in search results | GSC → Performance → Search Results |
| Clicks | How many times users clicked through to your site | GSC → Performance → Search Results |
| CTR (Click-Through Rate) | Clicks ÷ Impressions — how compelling your titles/descriptions are | GSC → Performance → Search Results |
| Average Position | Your average ranking position for tracked queries | GSC → Performance → Search Results |

### CTR Benchmarks by Position
| Ranking Position | Expected CTR |
|-----------------|-------------|
| Position 1 | 32.5% |
| Position 2 | 17.6% |
| Position 3 | 11.4% |
| Position 4-10 | 2-8% |
| Page 2+ | <1% |

**Implication**: If a page ranks position 1 but has CTR well below 32%, the title or description needs improvement. If a page ranks position 5+ but has high CTR, it has strong titles and may climb with more authority.

### Brand vs Non-Brand Search
Track separately in Google Search Console:
- **Brand queries**: Searches including your company/product name — measure brand awareness
- **Non-brand queries**: Generic searches like "website designer Uganda" — measure SEO effectiveness
- Healthy sites show growth in both categories over time

---

## Off-Page Metrics

### Domain Authority (DA) / Page Authority (PA)
- **What**: Predictive scores (0-100) estimating ranking ability
- **Where**: Moz, Ahrefs (Domain Rating), SEMrush (Authority Score)
- **New sites**: DA 1-10 (expected; builds over months/years)
- **Established sites**: DA 20-40 (competitive for local searches)
- **Authority sites**: DA 50+ (competitive for national/international terms)

### Backlink Quality Indicators
| Metric | What to Check | Red Flag |
|--------|--------------|----------|
| Referring domains | Total unique domains linking to you | Sudden spike = possible spam attack |
| TrustFlow | Quality/trustworthiness of linking sites (Majestic) | Low TrustFlow with high links = spam |
| SpamScore | Probability that links are spam (Moz) | SpamScore > 30% requires investigation |
| Anchor text distribution | Natural mix of branded, URL, and keyword anchors | >50% exact-match keyword anchors = unnatural |

### Review & Reputation Metrics
- Google Business Profile: star rating and review count
- Industry-specific review sites (Clutch, G2, etc.)
- Response rate to reviews (both positive and negative)
- Review growth rate (aim for steady increase)

---

## Crawling & Indexation Health

### Google Search Console — Coverage Report
| Status | What It Means | Action |
|--------|--------------|--------|
| Valid | Pages indexed and serving in search | Monitor — no action needed |
| Valid with warnings | Indexed but has issues | Review and fix warnings |
| Excluded | Not indexed (by choice or error) | Verify intentional exclusion |
| Error | Cannot be indexed | Fix immediately (404, server error, blocked) |

### Crawl Error Types
- **Server errors (5xx)**: Server unreachable — check hosting
- **Not found (404)**: Page deleted or URL changed — set up redirects
- **Soft 404**: Page returns 200 but shows "not found" content — fix or redirect
- **Redirect errors**: Redirect chains or loops — simplify to single redirect
- **Blocked by robots.txt**: Unintentional blocking — review robots.txt rules

---

## Monitoring Schedule

### Weekly
- [ ] Check GSC for new crawl errors
- [ ] Review Core Web Vitals status
- [ ] Check organic traffic trend (vs previous week)
- [ ] Scan for new backlinks (quality check)

### Monthly
- [ ] Full GA4 traffic report (organic, direct, referral, social)
- [ ] Conversion rate and goal completion review
- [ ] Keyword ranking changes for top 10 target keywords
- [ ] Bounce rate and dwell time by page type
- [ ] Review and respond to new Google Business Profile reviews
- [ ] Lighthouse score check (homepage + 2 key pages)

### Quarterly
- [ ] Run full SEO audit (this skill)
- [ ] Competitor ranking comparison for target keywords
- [ ] Backlink profile health check (DA, SpamScore, TrustFlow)
- [ ] Brand search volume trend (Google Trends or GSC)
- [ ] Content freshness review (update stale pages)
- [ ] Core Web Vitals performance trend

---

## Red Flags — Investigate Immediately

| Signal | Possible Cause | First Step |
|--------|---------------|------------|
| Organic traffic drops >20% | Algorithm update, penalty, crawl error | Check GSC Coverage + filter by date |
| Sudden backlink spike | Spam attack or negative SEO | Audit new links, disavow toxic ones |
| Crawl errors increasing | Broken links, server issues, redirect loops | GSC → Coverage → Errors |
| Conversion rate drops | UX change, broken form, slow page | Test all conversion paths manually |
| Keyword rankings plummet | Competitor outranking, content freshness, penalty | Compare content quality vs competitors |
| Bounce rate spikes | Slow page, misleading title/description, poor mobile | Check page speed + search intent match |
| Pages not indexed | robots.txt blocking, noindex tag, crawl budget | GSC URL Inspection tool |
