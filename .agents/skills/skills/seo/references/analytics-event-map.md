# Analytics Event Map

The minimum instrumentation every premium site ships with. Measurement is not an afterthought — it is the difference between a site that can prove business value and a site that cannot.

Grounded in *Made to Sell* (plan before you track, event-driven GA4, post-conversion journey), Schwartz (three-level SEO funnel, conversion-not-rankings), and the repo's existing `seo/` and `seo-audit/` skills.

Companion files: `premium-seo-package.md` (this directory), `page-conversion-checklist.md` (in `page-builder/references/`).

---

## 1. Measurement principles

1. **Plan before you tag.** Decide what decisions the data should inform, then instrument. The reverse order produces dashboards nobody reads.
2. **Every event ties to a KPI.** If an event does not help the agency or client make a decision, it is noise.
3. **Conversion is the scoreboard, not sessions.** Traffic is context. Revenue, leads, and pipeline are the metrics.
4. **Event data must outlast the tool.** GA4 is the current baseline; the event schema is designed to survive a platform change.
5. **Events fire server-side where they matter.** For critical conversions, duplicate client-side events with server-side confirmation.
6. **Privacy first.** No PII in event parameters. Consent management respects the client's jurisdiction.
7. **Every event is documented.** The measurement plan lives in `docs/` and `project-log/` — not just in the tag manager.

---

## 2. The measurement stack

### Baseline (every site)

- **Google Analytics 4** — primary analytics
- **Google Search Console** — organic search truth
- **Google Tag Manager** — event orchestration
- **Bing Webmaster Tools** — Bing coverage

### Growth-tier additions

- **CRM pixel / conversion webhook** — leads flow into the client's CRM with attribution
- **Marketing-automation integration** — email-sequence triggers on key conversions
- **Meta / LinkedIn / Pinterest pixels** — where the client runs paid

### Authority-tier additions

- **Attribution platform** — Dreamdata, HockeyStack, or similar for multi-touch attribution (B2B only)
- **Session recording / heatmaps** — Crazy Egg, Hotjar, or PostHog for top 3 sales pages
- **Product analytics** — Mixpanel or Amplitude if the site has app-like flows
- **A/B testing** — Google Optimize replacement (VWO, Optimizely, or server-side)

### Privacy-first alternatives

Where GA4 is politically or legally unworkable (EU-strict clients, privacy-focused firms):

- **Plausible, Fathom, or Matomo** — cookieless, GDPR-ready
- **Simple Analytics** — lightweight, no cookies

The schema below is platform-agnostic. Event names are suggestions that match GA4 conventions but survive translation.

---

## 3. Events every site fires

### Page-level

| Event name | Fires on | Parameters |
|---|---|---|
| `page_view` | Every page load | `page_title`, `page_location`, `page_referrer`, `language`, `page_type` |
| `scroll_depth` | 25%, 50%, 75%, 90% scroll | `percent_scrolled`, `page_type` |
| `time_on_page` | 30s, 60s, 180s thresholds | `seconds_elapsed`, `page_type` |
| `rage_click` | 3+ clicks on same element within 2s | `element_id`, `element_text` |
| `404_error` | On the 404 page | `referrer`, `intended_url` |

Scroll-depth tracking enabled on money pages (home, services, case studies, blog posts) only. Other pages: page_view + time_on_page sufficient.

### Engagement

| Event name | Fires on | Parameters |
|---|---|---|
| `outbound_click` | Click on external link | `outbound_url`, `link_text`, `source_section` |
| `internal_link_click` | Click on internal link | `destination`, `link_text`, `source_section` |
| `cta_click` | Click on any CTA button | `cta_label`, `cta_position`, `cta_rung`, `destination` |
| `nav_click` | Click on main nav | `nav_item`, `nav_level` |
| `search` | Site-search submission | `search_term`, `results_count` |
| `video_play` | Video play starts | `video_title`, `video_url`, `video_provider` |
| `video_progress` | 25%, 50%, 75%, 100% | `percent`, `video_title` |
| `download` | PDF or asset download | `file_name`, `file_type`, `source_page` |
| `share` | Social share button click | `platform`, `shared_url` |

### Contact / lead capture

| Event name | Fires on | Parameters |
|---|---|---|
| `form_start` | First field focus | `form_id`, `form_location` |
| `form_field_focus` | Each field focus | `form_id`, `field_name` |
| `form_field_abandon` | Field loses focus without value | `form_id`, `field_name` |
| `form_submit_attempt` | Submit button click | `form_id` |
| `form_submit_success` | Successful submit response | `form_id`, `form_type`, `lead_magnet` |
| `form_submit_error` | Validation or server error | `form_id`, `error_type` |
| `phone_click` | Click on `tel:` link | `phone_location`, `source_page` |
| `email_click` | Click on `mailto:` link | `email_location`, `source_page` |
| `whatsapp_click` | Click on WhatsApp link | `whatsapp_location`, `source_page` |
| `calendar_booking_start` | Opening calendar embed | `calendar_type` |
| `calendar_booking_complete` | Confirmed booking event | `calendar_type`, `event_type` |

### Conversion (primary KPIs)

| Event name | Fires on | Parameters |
|---|---|---|
| `lead_generated` | Any lead form submission | `lead_source`, `lead_medium`, `lead_campaign`, `form_id`, `page_path` |
| `consult_booked` | Calendar booking confirmed | `source`, `medium`, `campaign`, `consult_type` |
| `proposal_requested` | Proposal request form | `source`, `medium` |
| `newsletter_signup` | List signup | `signup_source`, `lead_magnet` |
| `lead_magnet_download` | Gated asset downloaded | `asset_name`, `source` |
| `purchase` | (e-commerce) transaction | `transaction_id`, `value`, `currency`, `items` |

Every conversion event carries UTM parameters parsed from the landing session — `utm_source`, `utm_medium`, `utm_campaign`, `utm_content`, `utm_term`. UTMs are stored in a first-party cookie that persists for the session.

---

## 4. UTM and campaign tagging

Every external link pointing to the site must carry UTMs. The agency maintains a UTM builder document in the client's `docs/` folder.

### UTM convention

- `utm_source` — the publishing platform (google, bing, linkedin, twitter, newsletter, partner-name)
- `utm_medium` — the channel (cpc, organic, social, email, referral, partner)
- `utm_campaign` — the named campaign (q2-2026-growth, event-kampala-summit)
- `utm_content` — the specific ad or link (hero-cta, footer-link, email-block-1)
- `utm_term` — the paid keyword (paid search only)

Lowercase, hyphenated, no spaces. Consistency is the point.

### Referrer policy

- Internal links: no UTMs. UTMs on internal links corrupt session attribution.
- External partner links: UTMs mandatory.
- Email: UTMs mandatory, per send.

---

## 5. Event taxonomy by page type

### Home page

- `page_view`, `scroll_depth` (25/50/75/90), `nav_click`
- `cta_click` on hero CTA, secondary CTA, section CTAs
- `internal_link_click` on home-to-service and home-to-case links

### Services page

- `page_view`, `scroll_depth`, `time_on_page`
- `cta_click` on primary and final CTAs
- `form_submit_success` if consult or lead form is on-page
- `pricing_section_viewed` (section-in-view event) — identifies price-exposed visitors

### Case study

- `page_view`, `scroll_depth`, `time_on_page`
- `cta_click` to related service
- `outbound_click` if client's site is linked

### Blog post

- `page_view`, `scroll_depth`, `time_on_page`
- `newsletter_signup` if inline signup
- `lead_magnet_download` if gated
- `share` events
- `internal_link_click` for related articles + money pages

### Contact page

- `page_view`
- `form_start`, `form_field_abandon`, `form_submit_attempt`, `form_submit_success`, `form_submit_error`
- `phone_click`, `email_click`, `whatsapp_click`
- `calendar_booking_*` events if embedded

### Lead magnet landing page

- `page_view`
- `form_start`, `form_submit_success`
- `lead_magnet_download` (post-conversion)
- Pixel fires (Meta/LinkedIn) on conversion

### Pricing page

- `page_view`, `scroll_depth`
- `tier_viewed` (section-in-view per tier)
- `cta_click` per tier
- `pricing_faq_expanded` (per FAQ item)

---

## 6. Conversion goals and funnels

Configure in GA4 (or equivalent) as defined conversions, not just events.

### Goal conversions (every site)

1. `lead_generated` — any primary lead form submission
2. `consult_booked` — calendar or discovery-call booking
3. `newsletter_signup` — list acquisition
4. `lead_magnet_download` — top-of-funnel capture

### Funnels to build

**Lead funnel:**
1. `page_view` (any page)
2. `page_view` (services or pricing page)
3. `cta_click` (consult CTA)
4. `form_start` (on contact / consult form)
5. `form_submit_success`
6. `consult_booked`

**Content funnel:**
1. `page_view` (blog post)
2. `scroll_depth` (75%)
3. `cta_click` (inline or end-of-article)
4. `newsletter_signup` or `lead_magnet_download`

**Enterprise funnel (Authority tier):**
1. First-session `page_view` (any)
2. Session return (30-day window)
3. `page_view` on case study or services page
4. `consult_booked` or `proposal_requested`

Drop-off at each step is the diagnostic signal. Where drop-off is high, test.

---

## 7. Attribution model

Default: **data-driven attribution in GA4**, with UTMs and first-party cookies carrying source data through the session.

For Authority-tier clients with long enterprise sales cycles (30+ days):

- Multi-touch attribution via dedicated platform
- First-touch and last-touch both recorded
- Self-reported attribution on lead forms ("How did you hear about us?")
- Pipeline attribution in the client's CRM linked to UTMs

### Anti-pattern: last-click only

Last-click attribution under-credits SEO and content. Never the sole attribution model for any premium client.

---

## 8. Core Web Vitals and performance monitoring

- **Real-user monitoring (RUM)** via GA4 or `web-vitals` JS library firing events
- Events: `lcp`, `inp`, `cls`, `ttfb` with values and percentile bucket
- Per-page dashboard in GA4 custom reports
- Regression alerts at weekly review

---

## 9. Privacy, consent, and compliance

### Consent management

- **Cookie banner** required for EU, UK, and any other applicable jurisdiction
- **Granular consent**: analytics, marketing, functional — separately
- **Consent-mode v2** (Google) where GA4 and Google Ads are in use
- **No tracking before consent** for non-essential categories

### Data minimisation

- Never log PII in event parameters. Email, phone, name — omitted from the event, sent server-side to the CRM only.
- Hash any identifier that must cross systems (SHA-256 of email for audience matching).
- IP anonymisation enabled in GA4.

### Jurisdiction-specific

- **EU/UK:** GDPR-conformant, cookie consent, data processing agreement with Google
- **Uganda / East Africa:** DPPA 2019 compliance — see `uganda-dppa-compliance` skill if applicable
- **California:** CCPA opt-out link in footer
- Privacy Policy and Cookie Policy pages link from the banner and footer

### Retention

- GA4 retention set to 14 months by default; 26 months for Authority tier where justified.
- Document retention policy in `docs/privacy-policy.md`.

---

## 10. Reporting

### Agency-internal dashboards (weekly)

- Search Console anomalies (position drops, coverage issues)
- CWV regressions
- Form submission volume
- Funnel drop-off per step
- Top landing pages with bounce rate

### Client-facing monthly report

Generated from `project-log/monthly/YYYY-MM.md` via the `monthly-report` skill. Minimum content:

1. **Executive summary.** 2–3 sentences.
2. **Traffic and engagement.** Sessions, users, session duration, MoM delta.
3. **Acquisition.** Top channels, top landing pages, top queries (Search Console).
4. **Conversions.** Lead volume, quality, conversion rate by channel.
5. **Goal-specific metrics.** Per the client's stated KPIs.
6. **Content performance.** Top blog posts by traffic, conversion, time-on-page.
7. **Technical health.** CWV, crawl errors, schema validity, broken links.
8. **Wins.** Specific outcomes.
9. **Issues.** What broke, how it was resolved.
10. **Next month plan.** 3–5 priorities.

See `monthly-report/references/` for the full commentary rules.

### Client-facing quarterly review

- Goal-vs-actual against quarterly KPIs
- Attribution review (where leads originated, sales-cycle length)
- Content strategy review
- Technical review
- Priorities for next quarter

---

## 11. Measurement plan documentation

Every client project ships with a measurement plan saved at `docs/measurement-plan.md`:

1. **Business goals.** What the client is trying to achieve.
2. **KPIs.** Which metrics measure those goals.
3. **Event schema.** The full list of events this site fires, parameters, triggers.
4. **Conversion definitions.** Which events are counted as conversions.
5. **Attribution model.** How credit is assigned.
6. **Reporting cadence.** Who gets what, when.
7. **Tools.** What is installed, login access.
8. **Data ownership.** Who owns the accounts. Who has editor access.
9. **Compliance.** Jurisdiction, consent model, retention.

Logged in `project-log/decisions/` at kickoff and updated when the plan changes.

---

## 12. Pre-launch checklist

Before any site goes live:

- [ ] GA4 property created, admin access transferred to client
- [ ] GTM container created, admin access transferred to client
- [ ] Search Console property verified and ownership transferred to client
- [ ] Bing Webmaster verified
- [ ] All events firing correctly in Tag Assistant / GTM Preview
- [ ] Form submission events tested end-to-end (real submission, real receipt)
- [ ] Phone / email / WhatsApp click events tested on mobile
- [ ] Conversion events marked as conversions in GA4
- [ ] UTM convention document delivered to client
- [ ] Cookie banner working with granular consent
- [ ] Privacy Policy and Cookie Policy published
- [ ] GDPR DPA signed where applicable
- [ ] CrUX data visibility checked (may lag 28 days post-launch)
- [ ] Web Vitals events firing with values
- [ ] Old site analytics compared to new site baseline (document in project log)
- [ ] Measurement plan saved at `docs/measurement-plan.md`
- [ ] First project-log metrics snapshot recorded

---

## 13. Post-launch monitoring (first 30 days)

Daily (first week):

- Event volume sanity check (are events firing?)
- Conversion volume (are leads flowing?)
- 404 errors and JavaScript errors (any regressions?)
- Search Console coverage report (indexation issues?)

Weekly:

- Top landing pages review
- Form conversion rates
- CWV review
- Source / medium distribution

Month-end:

- Full month roll-up in `project-log/monthly/YYYY-MM.md`
- Client report generated
- Hypotheses identified for next-month optimisation

---

## 14. What the agency never does

- Fires events without documenting them.
- Adds tracking without updating the measurement plan.
- Reports on metrics the client did not name as KPIs.
- Uses dark-pattern consent ("reject" hidden behind two clicks, "accept" front-and-centre). Consent is neutral.
- Sends PII in event parameters.
- Maintains analytics access that was supposed to be transferred to the client.
- Ties any team member's pay to analytics KPIs.

The measurement stack is the client's asset. The agency stewards it during the engagement and hands it back operable.

---

## 15. Source anchors

- **Ari & Peter Krzyzek, *Made to Sell*:** plan-then-tag, event taxonomy by page type, post-conversion journey, A/B testing discipline (change one variable, wait until baseline exists).
- **Eli Schwartz, *Product-Led SEO*:** three-level funnel, conversion-over-rankings, Search Console as source of truth, anti-pattern on pay-for-KPIs.
- **Repo skills:** `seo/`, `seo-audit/`, `monthly-report/`, `policy-pages/`, `uganda-dppa-compliance/`.

Tags come and go. The event schema survives platform changes.
