# Certified Engine Operator — Written Exam Bank

**Purpose**: Canonical question bank for the written exam component of the
certification programme. Each cohort's exam is drawn from this bank; the
programme lead selects 60 questions across shared and track modules.

**Pass mark**: 80% (48 of 60 correct).

**Rule**: no question has more than one correct answer. If a candidate
disputes a question, the dispute must be resolved before that question's
score is counted — the candidate does not lose the item by default.

## Section A — Shared (all tracks must answer 30 of 40)

### Engine orientation

**A1.** Which file is the canonical routing layer for Codex operating the
repository without `.claude/`?
- [ ] CLAUDE.md
- [x] AGENTS.md
- [ ] SKILL.md
- [ ] README.md

**A2.** Which five-layer mental model describes the engine?
- [ ] Intake / design / build / launch / support
- [x] Commercial / strategy / build / launch / governance
- [ ] Brand / design / SEO / launch / retainer
- [ ] Sales / product / operations / success / finance

**A3.** When a skill exceeds 500 lines, what is required?
- [x] A justification comment at the top or a split into references
- [ ] A rewrite within the same sprint
- [ ] A deprecation notice
- [ ] Nothing — the 500-line rule is a recommendation

**A4.** What is the *reference vs SKILL.md* split rule?
- [ ] SKILL.md contains everything; references are optional
- [x] SKILL.md is the portable execution layer; references carry the
  detailed material
- [ ] References are for historical context only
- [ ] They are interchangeable

### Canonical CI

**A5.** Pipeline step 7 is the performance gate. What immediately precedes it?
- [x] Metadata audit (step 6)
- [ ] Build (step 4)
- [ ] E2E smoke (step 5)
- [ ] Lint (step 2)

**A6.** A client-project team wants to disable the a11y gate for one release.
What is the correct path?
- [ ] Comment out the job in the client-project workflow
- [ ] Add an `if: false` override
- [x] File a decision entry under `project-log/decisions/` explaining the
  exception; cannot be a standing policy
- [ ] Delete the job and re-install later

**A7.** The performance gate is calibrated for which network profile?
- [ ] US broadband
- [ ] 4G LTE (global median)
- [x] African 3G (1638 Kbps, 300 ms RTT, 4× CPU slowdown)
- [ ] No network profile — perf is measured unthrottled

**A8.** What blocks deploy on the canonical pipeline?
- [ ] Any lint warning
- [x] Any failure in gates: e2e-smoke, metadata-audit, perf, a11y, visual-qa,
  security, drift-check, or design-quality-score (on main)
- [ ] Only the security gate
- [ ] Only the performance gate

### Africa calibration

**A9.** What is the Phase 10 first-load total-weight budget per route?
- [ ] 150 KB
- [ ] 250 KB
- [x] 350 KB
- [ ] 500 KB

**A10.** Which header signals a user-chosen data-saver mode the site should
respect?
- [ ] `DNT`
- [x] `Save-Data`
- [ ] `Prefer-Reduced-Data`
- [ ] `X-Data-Saver`

**A11.** Which image format is the engine's first choice, with WebP as
fallback?
- [ ] JPEG
- [ ] PNG
- [x] AVIF
- [ ] GIF

### Documentation discipline

**A12.** A reference file contains "as of 2024, this framework is
recommended." What does `drift-check.sh` do?
- [ ] Ignores it
- [x] Flags it as dated framing and fails the build
- [ ] Rewrites it to "as of [current year]"
- [ ] Issues a warning only

**A13.** Which file is the canonical-name authority for concepts, skills,
gates, and artefacts?
- [ ] README.md
- [ ] AGENTS.md
- [x] glossary.md
- [ ] SKILL.md

**A14.** A skill is renamed from `x-audit` to `x-gate`. What is the minimum
drift-safe action?
- [ ] Delete the old skill
- [ ] Symlink the old name
- [x] Mark the old skill deprecated with a removal date per
  `docs/deprecation-policy.md` and update every reference
- [ ] Leave a note in CLAUDE.md only

**A15.** How often is the documentation audit filed?
- [ ] Annually
- [x] Quarterly, with a written report in `project-log/decisions/`
- [ ] Only when drift-check fails
- [ ] Never; drift-check replaces it

### Observability

**A16.** Which four metrics are the baseline RUM contract?
- [ ] LCP, FCP, TTI, TBT
- [x] LCP, INP, CLS, plus navigation type
- [ ] FCP, SI, TBT, CLS
- [ ] LCP, FID, CLS, TTI

**A17.** What happens when the monthly-report skill cannot reach its analytics
source?
- [ ] It narrates the gap
- [ ] It estimates values from prior months
- [x] It refuses to render the report
- [ ] It renders an empty template

**A18.** The alert threshold for an LCP regression is:
- [ ] 50 ms
- [ ] 100 ms
- [x] 200 ms
- [ ] 500 ms

**A19.** Which alert must be in place before analytics data is treated as
reliable?
- [ ] Weekly digest email
- [x] Unreachable-source alert at the monthly-report boundary
- [ ] Slack post on every pageview
- [ ] Nothing — collection implies reliability

### Experimentation

**A20.** What is the minimum detectable effect field in the hypothesis
template for?
- [ ] Making the hypothesis feel scientific
- [x] Sizing the test so you know the sample needed to detect the effect you
  care about
- [ ] Reducing confidence interval width
- [ ] Enabling sequential testing

**A21.** Why is "peeking" at an A/B test a problem?
- [ ] It is rude to the engineering team
- [x] It inflates the false-positive rate because the stopping rule is
  effectively no rule
- [ ] It is fine if you use Bayesian inference
- [ ] It is only a problem for small samples

**A22.** What is the minimum cadence of experimentation the engine requires
for retainer clients?
- [ ] One test per month
- [x] At least one test per quarter per retainer client (≥30% active at
  any time)
- [ ] One test per year
- [ ] No minimum

### Design-quality scoring

**A23.** The design-quality rubric has how many categories?
- [ ] Five
- [ ] Six
- [x] Seven (typography, colour, spacing, hierarchy, copy, trust, originality)
- [ ] Ten

**A24.** The minimum rubric score for a shipped project is:
- [ ] 6/10
- [ ] 7/10
- [x] 8/10
- [ ] 9/10

**A25.** "Welcome to our website" as a hero headline is blocked by which
`slop-scan.sh` rule?
- [x] Banned headline patterns
- [ ] Generic icon overuse
- [ ] Banned colour combinations
- [ ] Easing-curve ban

---

### Engine process

**A26.** A gate fails on main. What is the correct response?
- [ ] Skip hooks and push anyway
- [x] Fix the underlying issue; never use `--no-verify` to bypass a gate
- [ ] Disable the gate
- [ ] Open a decision entry to exempt the project

**A27.** The deprecation policy requires what three fields for any deprecated
skill?
- [x] Marker, date of deprecation, date of removal
- [ ] Author, reason, successor
- [ ] Version, branch, reviewer
- [ ] None; a note is enough

**A28.** Which skill owns the contract between the project's `project-log/`
directory and the monthly report?
- [ ] seo-audit
- [ ] agency-client-retention
- [x] monthly-report
- [ ] deploy

**A29.** Where is an incident report filed?
- [ ] README.md
- [ ] glossary.md
- [x] `project-log/incidents/`
- [ ] Slack only

**A30.** "Maintenance is performed monthly" was written in 2025. The correct
fix today is:
- [ ] Leave it; context is implicit
- [x] Rewrite to state cadence explicitly without dated framing, or remove
- [ ] Move to a reference file
- [ ] Add a timestamp

## Section B — Strategist track (10 questions)

**B1.** In the StoryBrand SB7 framework, the brand plays which role?
- [ ] Hero
- [x] Guide
- [ ] Villain
- [ ] Narrator

**B2.** A trust-signal block on a services page should land:
- [ ] Above the fold only
- [ ] In the footer
- [x] Both above the fold and at the point of primary CTA
- [ ] In a separate tab

**B3.** A client insists on a 40-word hero headline. What does the engine require?
- [x] Reduce to ≤ 10 words or redesign the hero
- [ ] Keep as-is to preserve client voice
- [ ] Move to a subheading
- [ ] Cut to 20 words

**B4.** The Krug "three facts of web use" are:
- [x] Users scan, satisfice, and muddle through
- [ ] Users read, plan, and compare
- [ ] Users click, convert, and return
- [ ] Users search, filter, and share

**B5.** "Discovery" in the engine produces which named artefact?
- [ ] A Figma file
- [x] A signed strategy brief referenced by the build skills
- [ ] A Notion board
- [ ] A PDF proposal

**B6.** A sector is not in `sector-strategies/templates/`. What is the
correct action?
- [x] Adapt the `general` sector template and file a new sector when pattern
  repeats
- [ ] Invent a new skill ad hoc
- [ ] Refuse the project
- [ ] Use any matching sector

**B7.** How is the Maduuka project (SaaS) sector classified in this engine?
- [ ] general
- [x] app-landing-pages
- [ ] ecommerce
- [ ] agency

**B8.** The page-goal map ties to which later skill?
- [x] seo (search intent, hreflang, analytics-event-map)
- [ ] brand-storytelling
- [ ] photo-manager
- [ ] deploy

**B9.** Which archetype is chosen during brand-strategy's Step 10 BrandScript
synthesis?
- [x] The CBBE + SB7 synthesis does not choose an archetype; it maps brief
  sections to SB7 elements
- [ ] Hero
- [ ] Caregiver
- [ ] Sage

**B10.** A competing brief lists a 14th trust pattern. The correct path is:
- [x] Propose an update to `sector-strategies` via decision entry
- [ ] Add locally and proceed
- [ ] Ignore; stick with published patterns
- [ ] Raise at the next cohort

## Section C — Designer / Builder track (10 questions)

**C1.** The engine's grid unit is:
- [ ] 5 px
- [ ] 6 px
- [x] 8 px (with 4 px allowed for fine alignment)
- [ ] 10 px

**C2.** Line-height formula for body copy in the engine is:
- [ ] font × 1.2
- [ ] font × 1.4
- [x] font × 1.6
- [ ] font × 2.0

**C3.** Which colour is explicitly banned as a pure value for UI text?
- [x] `#000000` — pure black
- [ ] `#111111`
- [ ] `#1a1a1a`
- [ ] None

**C4.** A button must define how many states?
- [ ] Three
- [ ] Four
- [x] Six (default, hover, active, focus, disabled, loading)
- [ ] Eight

**C5.** The primary visual-QA gate uses:
- [x] Playwright screenshot diff + structural + AI-slop
- [ ] Percy only
- [ ] Chromatic only
- [ ] Cypress

**C6.** A photo uploaded to `photo-bank/branding/` at 4 MB should:
- [x] Be compressed at build time (image-compression skill) and served as
  AVIF with WebP fallback
- [ ] Be re-saved as JPEG 90% and committed
- [ ] Be rejected
- [ ] Be kept as-is

**C7.** Tidwell's "Center Stage" pattern is useful when:
- [x] One task or object clearly dominates the page
- [ ] The page shows many equal items
- [ ] The layout is a dashboard
- [ ] The screen is mobile

**C8.** "Three-column feature grid with icons" is flagged by the engine as:
- [x] Generic three-column pattern — allowed only with distinctive
  typography, content, and photography; otherwise AI-slop
- [ ] Always allowed
- [ ] Always banned
- [ ] Pattern-irrelevant

**C9.** A hover effect is added in CSS. The motion timing rule is:
- [x] 100 ms for micro, 300 ms for standard, 500 ms for large transitions
- [ ] 200 ms for everything
- [ ] 400 ms for everything
- [ ] No rule

**C10.** A visual regression of > 0.1% pixels triggers:
- [x] A blocked deploy with a required baseline update decision
- [ ] A warning
- [ ] Nothing
- [ ] Automatic baseline overwrite

## Section D — SEO + Content track (10 questions)

**D1.** hreflang is required for:
- [ ] All multilingual content only
- [x] Any page published in more than one language or region variant
- [ ] Only the homepage
- [ ] Never; canonical is enough

**D2.** The canonical analytics event map lives at:
- [x] `seo/references/analytics-event-map.md`
- [ ] `seo/SKILL.md`
- [ ] `deploy/references/analytics.md`
- [ ] `content-writing/references/events.md`

**D3.** The engine's rule on keyword stuffing is:
- [ ] Acceptable for long-tail terms
- [x] Banned; human-voice copy is the standard, keyword density is monitored
  against the brand-alignment blacklist
- [ ] Allowed in H1 only
- [ ] No rule

**D4.** A blog post fails the "three-web-writing rules" check. The rules are:
- [x] Omit words, kill happy talk, kill instructions
- [ ] Use keywords, add schema, add images
- [ ] Write 1200+ words, add FAQ, use H2s
- [ ] Keep it under 500 words

**D5.** Required schema types for a services page include:
- [x] Organization, Service (or LocalBusiness where applicable), BreadcrumbList
- [ ] Article only
- [ ] FAQ only
- [ ] None

**D6.** A blog post is ideated. The engine's ideation skill is:
- [x] blog-idea-generator (then blog-writer for drafting)
- [ ] content-writing
- [ ] brand-strategy
- [ ] sales-copywriting

**D7.** Monthly SEO commentary must cite:
- [x] Log-backed events from `project-log/` dated within the target month
- [ ] The best metric available
- [ ] Last quarter's trend
- [ ] Whatever the client wants

**D8.** Which English variant is the engine's first-party tone standard?
- [x] East African English (authentic, not caricatured)
- [ ] American English
- [ ] Queen's English
- [ ] Plain-language global

**D9.** The indexation audit after launch uses:
- [x] seo-audit skill with Google Search Console integration
- [ ] Lighthouse only
- [ ] axe-core
- [ ] Playwright

**D10.** A blog post's image is compressed to 450 KB. The engine's rule:
- [x] Return for re-compression; feature-image hero budgets are tighter
- [ ] Accept
- [ ] Convert to SVG
- [ ] Remove the image

## Section E — QA + Launch track (10 questions)

**E1.** The axe-core gate treats which severities as blocking?
- [x] Serious and critical
- [ ] Moderate and above
- [ ] Only critical
- [ ] All severities

**E2.** A skip link that does not move focus fails:
- [x] Accessibility gate (manual keyboard pass)
- [ ] Visual-QA gate
- [ ] Security gate
- [ ] Metadata audit

**E3.** An inline script is added to `<head>`. Required action:
- [x] Add SRI hash if external; otherwise CSP nonce; update
  check-security-headers.sh expectation
- [ ] Leave it; inline is exempt
- [ ] Move to footer
- [ ] Remove

**E4.** A lockfile drift is detected. The correct response:
- [x] Fail the supply-chain check; require an explicit install decision
- [ ] Auto-regenerate
- [ ] Warn only
- [ ] Ignore

**E5.** The rollback script expects which artefact to be present?
- [x] A versioned deploy artefact and a previous-known-good pointer
- [ ] A full repo snapshot
- [ ] A database dump
- [ ] Nothing

**E6.** The post-deploy smoke targets:
- [x] The production URL set in `vars.PRODUCTION_URL`, testing homepage,
  contact, and primary CTA
- [ ] `localhost:4321`
- [ ] The staging URL
- [ ] Every route

**E7.** The design-quality score runs:
- [x] As step 12 of the canonical CI, advisory on PR and blocking on main
- [ ] As a manual QA step only
- [ ] As a pre-commit hook only
- [ ] As part of the a11y gate

**E8.** Secrets detected by `scan-secrets.sh` require:
- [x] Immediate rotation per `security-gate/references/secrets-response.md`
  and a blocking CI status until clean
- [ ] A warning only
- [ ] Removal from repo but no rotation
- [ ] A decision entry to accept

**E9.** LCP regresses by 180 ms after a design-system token change. What
should fire?
- [ ] A blocking deploy failure
- [x] An observability alert (regression threshold is 200 ms) and an
  investigation; not a deploy block
- [ ] A rollback
- [ ] Nothing

**E10.** An operator is ready to launch but drift-check finds three stale
internal links. What is the correct path?
- [x] Fix the links; drift-check is a blocking gate, not a warning
- [ ] Launch and open tickets
- [ ] Accept as known-issue
- [ ] Disable drift-check for the release

## Grading notes

- Each question is worth 1 point. No partial credit.
- Section A carries 30 points; track section carries 10 points; total 40. The
  programme lead may mix 60 questions by duplicating from this bank for a
  longer exam; the pass mark stays 80%.
- A dispute is escalated to the programme lead within 24 hours of result
  publication.
