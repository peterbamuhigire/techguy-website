# Website-Skills UX/UI Phase 2 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Integrate the 5 UX/UI book extractions (Levy, Enterprise UX, Branson, Deacon, Fekeshazi) into 5 core website-skills + 2 universal-guideline docs through 8 new reference files, 8 file extensions, and 5 SKILL.md pointer edits.

**Architecture:** Documentation/skill upgrade — no code, no tests-as-pytest. Each task creates or extends a markdown file. Verification = file exists, expected line count or grep-for-section-header passes. One commit per skill cluster keeps history readable.

**Tech Stack:** Markdown only. Sources in `C:\Users\BIRDC\.claude\skills\book-extractions\` (canonical) — these are read-only inputs. Targets in `C:\wamp64\www\website-skills\`.

**Spec:** `C:\Users\BIRDC\.claude\skills\docs\superpowers\specs\2026-05-04-website-skills-uiux-phase2-design.md`

**Repo state:** `C:\wamp64\www\website-skills` is a git repo on `main`. Commit per cluster.

---

## File Map

```
website-skills/
├── skills/
│   ├── premium-ui-ux-design/
│   │   ├── SKILL.md                                       (modify)
│   │   └── references/
│   │       ├── levy-four-tenets.md                        (create)
│   │       ├── enterprise-five-outcomes.md                (create)
│   │       └── pm-collaboration-rules.md                  (create)
│   ├── ux-psychology/
│   │   ├── SKILL.md                                       (modify)
│   │   └── references/
│   │       ├── three-paradigms-of-hci.md                  (create)
│   │       ├── three-levels-of-ux-scope.md                (create)
│   │       └── legacy-guidance.md                         (extend)
│   ├── design-quality-score/
│   │   ├── SKILL.md                                       (modify)
│   │   └── references/
│   │       ├── enterprise-ux-maturity-checklist.md        (create)
│   │       ├── rubric.md                                  (extend)
│   │       └── score-calibration.md                       (extend)
│   ├── design-reference/
│   │   ├── SKILL.md                                       (modify)
│   │   └── references/
│   │       ├── levy-competitive-matrix.md                 (create)
│   │       └── competitor-analysis-worksheet.md           (extend)
│   └── design-system/
│       ├── SKILL.md                                       (modify)
│       └── references/
│           ├── enterprise-data-viz-rules.md               (create)
│           ├── ux-quality-checklist.md                    (extend)
│           └── ai-slop-prevention.md                      (extend)
└── universal-guidelines/
    ├── UNIVERSAL-DESIGN-GUIDELINES.md                     (extend)
    └── ux-laws-and-psychology.md                          (extend)
```

**21 file edits total: 8 new + 8 extended + 5 SKILL.md modifications.**

---

## Source-of-truth conventions

- Every **new** reference file MUST start with this provenance header:
  ```markdown
  # <Title>
  **Source:** Extracted from `<extraction-filename>` (canonical at `C:\Users\BIRDC\.claude\skills\book-extractions\`).
  **Used by:** <skill name>.

  ---
  ```
- Every **extension** to an existing file MUST mark the new section clearly:
  ```markdown
  ---

  ## <New Section Title> (added 2026-05-04 from <book>)

  ...content...
  ```
- Do NOT modify the file's existing frontmatter.
- Do NOT introduce emojis.

---

## Cluster A — premium-ui-ux-design (4 file edits, 1 commit)

### Task 1: Create `levy-four-tenets.md`

**Files:**
- Create: `C:\wamp64\www\website-skills\skills\premium-ui-ux-design\references\levy-four-tenets.md`

- [ ] **Step 1: Create the file with provenance + Four-Tenet content**

Source extraction sections to mirror: Parts I–V of `levy-ux-strategy-extraction.md` (Core Formula, four misinterpretations, Top-10 Not-UX-Strategies, the four tenets summarized).

Write the file with this exact structure:

```markdown
# Levy's Four Tenets of UX Strategy
**Source:** Extracted from `levy-ux-strategy-extraction.md` (canonical at `C:\Users\BIRDC\.claude\skills\book-extractions\`).
**Used by:** premium-ui-ux-design.

---

## The formula

> **UX Strategy = Business Strategy + Value Innovation + Validated User Research + Killer UX Design**

These are simultaneously-spinning plates, not phases. If any drops, the strategy fails.

## Use this file when

- Reviewing a brief at kickoff for a premium ($20k+) website project
- A stakeholder pitches a "killer idea" without research
- The team is about to skip discovery to "save time"

## Four misinterpretations (correct each at kickoff)

1. **"UX strategy is a North Star."** Reality: digital products in fast markets need agile, iterative, variable processes — not a fixed star.
2. **"UX strategy is a strategic way to do UX design."** Reality: design = creating; strategy = the game plan *before* creating. Two different disciplines.
3. **"UX strategy is just product strategy."** Reality: UX strategy spans dozens of products, services, platforms — interconnected ecosystem.
4. **"UX strategy is closely tied to brand strategy."** Reality: a poor UX decreases brand value, but the brandiest brand cannot rescue a poor UX.

## The four tenets (one paragraph each)

### Tenet 1: Business Strategy
The top-line vision. Use the Business Model Canvas (9 building blocks): customer segments, value propositions, channels, customer relationships, revenue streams, key resources, key activities, key partnerships, cost structure. UX strategy intersects with the bolded blocks — segments and value propositions especially.

### Tenet 2: Value Innovation (Blue Ocean)
Simultaneous pursuit of differentiation and low cost. Red ocean = sea of similar competitors; blue ocean = uncontested territory built by breaking rules. Disruptive innovation (Christensen) starts at the bottom of a market and moves up.

### Tenet 3: Validated User Research
Confirms a specific customer segment finds value in your product. Different from observing or empathy. Lean Startup vocabulary: MVP, Build-Measure-Learn, Pivot. **Confronting target customers is non-negotiable.**

### Tenet 4: Killer UX Design
Distinguishes itself from novice UX by: working collaboratively from inception, designing structured experiments, identifying key moments, mining the existing market, validating with power users, weaving UX through online + offline touch points (frictionless).

## Top-10 Not-UX-Strategies (use to reject weak briefs)

1. A killer idea for a new product
2. A laundry list of features
3. A thoroughly researched plan with no need for customer feedback
4. Permutation of trending buzzwords ("peer-to-peer sharing economy")
5. Generic motivational statements ("Go Team Challenge Conquer")
6. An arrogant statement from an expert
7. A hypothesis with non-validated risky assumptions ("all women like pink")
8. A grandiose vision misaligned with company capabilities
9. A vague Hallmark-card affirmation
10. The North Star

If the client's brief matches any of these, push back before scoping.

## Quotes for client decks

- "UX strategy is the high-level plan to achieve one or more business goals under conditions of uncertainty."
- "A poor UX can decrease the brand value of a product, but not so much the other way around."
- "Confronting your target customers is non-negotiable."
```

- [ ] **Step 2: Verify file exists and has expected size**

Run: `wc -l "C:/wamp64/www/website-skills/skills/premium-ui-ux-design/references/levy-four-tenets.md"`
Expected: ≥ 60 lines.

Run: `grep -c "^## " "C:/wamp64/www/website-skills/skills/premium-ui-ux-design/references/levy-four-tenets.md"`
Expected: ≥ 5 (multiple `##` section headers).

---

### Task 2: Create `enterprise-five-outcomes.md`

**Files:**
- Create: `C:\wamp64\www\website-skills\skills\premium-ui-ux-design\references\enterprise-five-outcomes.md`

- [ ] **Step 1: Write the file**

Source: `enterprise-ux-financial-insurance-extraction.md` Part I "The Five UX Outcomes."

Write exactly:

```markdown
# The Five UX Outcomes — Pre-launch Gate
**Source:** Extracted from `enterprise-ux-financial-insurance-extraction.md` (Synechron, 2018).
**Used by:** premium-ui-ux-design.

---

## The rule

A premium-priced solution must hit ALL FIVE outcomes. Hitting four of five is **not enterprise-grade** and disqualifies premium-pricing claims.

## The five outcomes

| # | Outcome | Verification question | Pass criterion |
|---|---|---|---|
| 1 | **Useful** | Built for the target audience addressing their needs and requirements? | Persona-validated; tested against documented goals |
| 2 | **Easy to use** | Solution is usable with minimal or no training? | First-task success in usability test without coaching |
| 3 | **Efficient** | Fast to access and use the information? | Task time benchmarked against competitor or prior baseline |
| 4 | **Pleasing** | Right kind of aesthetics and design elements for a lasting experience? | Subjective rating ≥ 4/5 on initial-impression test |
| 5 | **Accessible** | Adheres to compliance for people with special needs? | ADA / Section 508 / WCAG 2.1 AA verified |

## Pre-launch checklist

For every primary template, answer Yes/No to all five. **One No = no launch.**

- [ ] Useful — verified against persona goals
- [ ] Easy to use — first-task success without coaching
- [ ] Efficient — task time within target
- [ ] Pleasing — initial-impression rating met
- [ ] Accessible — ADA / WCAG 2.1 AA passes

## Why this matters for premium pricing

Most enterprise apps fail on outcomes 2 and 3 — they're full of features but slow and confusing. Hitting all 5 is a real differentiator that justifies premium fees. The Synechron book's diagnostic of why most enterprise apps fail (feature overload, uninformed design, inconsistent, old-fashioned, cluttered) all map back to one or more of these missed outcomes.
```

- [ ] **Step 2: Verify**

Run: `grep -c "^- \[ \]" "C:/wamp64/www/website-skills/skills/premium-ui-ux-design/references/enterprise-five-outcomes.md"`
Expected: 5 (the checklist items).

---

### Task 3: Create `pm-collaboration-rules.md`

**Files:**
- Create: `C:\wamp64\www\website-skills\skills\premium-ui-ux-design\references\pm-collaboration-rules.md`

- [ ] **Step 1: Write the file**

Source: `fekeshazi-pm-ux-guide-extraction.md` Sections 1 (5+1 Things Managers Should Know) and 5.1 (Don't Hide Important Functions in Menus).

Write:

```markdown
# PM Collaboration Rules
**Source:** Extracted from `fekeshazi-pm-ux-guide-extraction.md` (UX Studio).
**Used by:** premium-ui-ux-design.

---

## Use this file when

- Onboarding a client / PM at project kickoff
- A stakeholder asks for a "design handoff with no further involvement"
- Reviewing a tutorial-heavy onboarding flow
- Auditing whether key actions are buried in menus

## The 5 + 1 rules

### 1. Design is not a pretty skin
"Design is not just what it looks like and feels like. Design is how it works." — Steve Jobs. The aesthetic outlook is the tip of the iceberg.

### 2. Good design improves understanding
**At first use, you have a maximum of 5–10 minutes** to give users answers. **Tutorials are futile attempts** — no one watches them. The interface itself must explain how it works.

### 3. Design is about experimentation
Jony Ive: 561 prototypes before the final Leica M camera. If world-leading designers iterate that hard, no one creates something perfect at once.

### 4. Good design is teamwork — and the client must take part
"Many people believe they make a deal with a designer and only meet again when handed a wonderful completed design. Bad news: it doesn't work like this." Designer needs constant feedback. Active client/PM participation is non-negotiable.

### 5. Design must be measured and tested
User tests, fieldwork, A/B tests, interviews, remote tests, guerrilla tests, 5-second tests, ghetto tests, grandma tests. "Without applying these, you whistle in the dark."

### +1: Design is not a project — it is an ongoing process
"There is no such thing as a finished design." Plan for continuous design alongside continuous dev. "A developer team without a design team is a few bricks short of a load."

## The "don't hide important functions" rule

> "Most people won't even give a try to the menu. They will just leave your app if they can't do what they want on the screen they are."

**Rule:** Don't hide important functions in the menu. They have to be on the screen when the users need them. Surface key actions inline on the relevant entity (a "Setup Alert" button inside the service-detail modal, not buried under a profile-icon menu).

## Audit checklist for an existing site

- [ ] Can a first-time user accomplish the primary goal within 5 minutes without watching a tutorial?
- [ ] Is the primary CTA visible above the fold on every relevant entity page?
- [ ] Are no critical actions hidden behind a hamburger menu or top-right profile icon?
- [ ] Does the team have a continuous design cadence (weekly meetings) or only project-bound design?
- [ ] Is research data the tiebreaker when stakeholders disagree?
```

- [ ] **Step 2: Verify**

Run: `grep -c "^### " "C:/wamp64/www/website-skills/skills/premium-ui-ux-design/references/pm-collaboration-rules.md"`
Expected: ≥ 6 (the 5+1 rules).

---

### Task 4: Update `premium-ui-ux-design/SKILL.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\skills\premium-ui-ux-design\SKILL.md` (append a "World-class UX foundations" subsection before the closing of the file)

- [ ] **Step 1: Read the current file end**

Run: `tail -15 "C:/wamp64/www/website-skills/skills/premium-ui-ux-design/SKILL.md"`
Note the last line for safe append placement.

- [ ] **Step 2: Append the new subsection**

Append exactly this content to the end of the file (preceded by a blank line):

```markdown

## World-class UX foundations (book-derived)

Required reading before kicking off a premium engagement:

- `references/levy-four-tenets.md` — Four-tenet framework (Business Strategy + Value Innovation + Validated User Research + Killer UX Design); Top-10 anti-patterns to reject in client briefs.
- `references/enterprise-five-outcomes.md` — Five mandatory outcomes (Useful / Easy / Efficient / Pleasing / Accessible) as a pre-launch gate. One No = no launch.
- `references/pm-collaboration-rules.md` — Fekeshazi 5+1 (5-10 min to explain, design as ongoing process, etc.) and the "don't hide important functions in menus" rule.

If a brief fails Levy's Top-10 check or omits any of the 5 outcomes, push back before scoping.
```

- [ ] **Step 3: Verify**

Run: `grep -c "World-class UX foundations" "C:/wamp64/www/website-skills/skills/premium-ui-ux-design/SKILL.md"`
Expected: 1.

Run: `grep -c "levy-four-tenets\|enterprise-five-outcomes\|pm-collaboration-rules" "C:/wamp64/www/website-skills/skills/premium-ui-ux-design/SKILL.md"`
Expected: 3.

---

### Task 5: Commit Cluster A

- [ ] **Step 1: Stage and commit**

```bash
cd "C:/wamp64/www/website-skills"
git add skills/premium-ui-ux-design/
git commit -m "premium-ui-ux-design: add Levy 4 tenets + enterprise 5 outcomes + Fekeshazi PM rules

Phase 2 UX upgrade per spec 2026-05-04-website-skills-uiux-phase2-design.md.
Adds three new reference files and pointers in SKILL.md.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

- [ ] **Step 2: Verify commit**

Run: `git log -1 --stat`
Expected: 4 files changed (3 new + 1 modify).

---

## Cluster B — ux-psychology (4 file edits, 1 commit)

### Task 6: Create `three-paradigms-of-hci.md`

**Files:**
- Create: `C:\wamp64\www\website-skills\skills\ux-psychology\references\three-paradigms-of-hci.md`

- [ ] **Step 1: Write the file**

Source: `branson-ux-ui-design-extraction.md` Section 1 (Three Paradigms of HCI Design).

Write:

```markdown
# Three Paradigms of HCI Design
**Source:** Extracted from `branson-ux-ui-design-extraction.md` (originally Harrison, Tatar, Sengers 2007).
**Used by:** ux-psychology.

---

## Use this file when

- Stakeholders disagree about what "good design" means in a review
- A team is split between "make it efficient" and "make it delightful" without realizing they're working in different paradigms
- Translating an academic UX-research source into operational guidance

## The three paradigms (complementary, not exclusive)

### Paradigm 1: Engineering / Building
- **Roots:** software engineering + human factors
- **Approach:** inventory the functionality → build interaction with available resources
- **Goal:** user productivity, eliminate user errors
- **Success metric:** how much the user could accomplish; summative statistical analyses
- **When dominant:** systems with complex, well-understood work domains (factory floor, accounting, ERP)

### Paradigm 2: Human Information Processing (HIP)
- **Roots:** psychology + human factors (cognitive theory)
- **Approach:** model how information is sensed and transformed in the human mind; mirror those models in computer-side processing requirements
- **Famous output:** Miller's 7 ± 2 — UI lists shouldn't exceed ~7 items because of working-memory limits
- **When dominant:** when the goal is to fit the machine to a well-characterized cognitive task

### Paradigm 3: Design Thinking / Phenomenological
- **Roots:** phenomenology, sociology
- **Approach:** the *experiential* nature of interaction — how users *experience meaning* in the artifact
- **Focus:** emotional, social, situated, embodied aspects
- **Distinct trait:** cares about the variety of human practices, not just the predominance — the 2% that don't fit are interesting, not noise

## The cockpit-voice example (the canonical illustration)

The same problem of pilot-warning voice systems analyzed three ways:

1. **Engineering paradigm:** "pilots crashing too often → use a female voice to cut through male-dominated cockpit comms → reduce errors." Empirical and basic.
2. **HIP paradigm:** "female voices effectively differentiate signal from noise; experiments showed that *familiar* voices (wives, girlfriends) further improved performance." Generalizable parameter — signal/noise differentiation.
3. **Design Thinking paradigm:** "the original female voice was selected for its sultry/charming tone; this reinforced the cockpit-as-male space and became inappropriate as women became pilots." Cares about social meaning and minorities.

## The complementarity rule

> All three paradigms have a place. Even creative design-thinking projects benefit from HIP-grounded ergonomics. Even building-paradigm projects should have *some* design-thinking ideation.

## Application to a website project

- **Engineering** dominates form-design and back-office tooling
- **HIP** dominates information density (lists, menus, navigation depth)
- **Design Thinking** dominates landing pages, brand pages, hero sections, "delight" moments

A premium website typically requires all three paradigms applied to different surfaces.
```

- [ ] **Step 2: Verify**

Run: `grep -c "^### Paradigm" "C:/wamp64/www/website-skills/skills/ux-psychology/references/three-paradigms-of-hci.md"`
Expected: 3.

---

### Task 7: Create `three-levels-of-ux-scope.md`

**Files:**
- Create: `C:\wamp64\www\website-skills\skills\ux-psychology\references\three-levels-of-ux-scope.md`

- [ ] **Step 1: Write the file**

Source: `deacon-ux-ui-strategy-extraction.md` Section 2 (Three Levels of UX Scope).

Write:

```markdown
# Three Levels of UX Scope
**Source:** Extracted from `deacon-ux-ui-strategy-extraction.md`.
**Used by:** ux-psychology.

---

## Use this file when

- Scoping a new engagement at the proposal stage
- A client says "improve our UX" without specifying which level
- Resolving expectation mismatches between client (Relationship-level) and designer (Single-Interaction-level)

## The three levels

### Level 1: Single Interaction
The user's experience with **one product or device for one specific task**. Where most UX designers actually work — building an interface for a website or app.

**Examples:** receiving help on phone, filing a claim on insurance website, completing a checkout, reading a blog post.

**Typical website-skills scope:** ~80% of engagements live here.

### Level 2: Journey
The user's experience across **multiple interactive channels/devices to achieve a goal over time**.

**Examples:** receive an email confirmation → check the mail → log in to update preferences → text reminder → return to site.

**Typical website-skills scope:** opt-in upgrade for engagements that include email automation, multi-device responsive flows, or onboarding sequences.

### Level 3: Relationship
The **overall experience** with the organization. Aka customer experience level.

**Examples:** researching → buying → using → renewing → recommending → defending the brand publicly.

**Typical website-skills scope:** rare; requires brand work + service design + customer success integration. Treat as a separate engagement bundle.

## The scoping rule

**Declare the level explicitly in every proposal.** Mismatched expectations between client and designer at this level cause most "scope creep" problems on otherwise-healthy projects.

## Mapping to deliverables

| Level | Typical artifacts |
|---|---|
| Single Interaction | wireframes, page templates, component library, accessibility audit |
| Journey | journey maps, email sequences, multi-device flows, automation hooks |
| Relationship | service blueprints, brand guidelines, customer-success playbooks |
```

- [ ] **Step 2: Verify**

Run: `grep -c "^### Level " "C:/wamp64/www/website-skills/skills/ux-psychology/references/three-levels-of-ux-scope.md"`
Expected: 3.

---

### Task 8: Extend `ux-psychology/references/legacy-guidance.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\skills\ux-psychology\references\legacy-guidance.md` (append two new sections at end)

- [ ] **Step 1: Append the working-memory section**

Append to the file:

```markdown

---

## Working memory and cognitive load (added 2026-05-04 from Branson)

Source: `branson-ux-ui-design-extraction.md` Section 5 (Human Memory Limitations).

### Capacity rule (Miller, 1956)
- Working memory: **7 ± 2 chunks**, often less
- Span: ~30 seconds, extendable by repetition; intervening activities ("proactive interference") shrink it fast
- A "chunk" is one gestalt — a word, not a phoneme; a phrase, not a letter

### Web design implications
- Primary navigation: ≤ 7 items (chunk further if more needed)
- Form fields visible at once: ≤ 7 (split long forms into steps)
- Numeric strings (phone, account): chunk at 3-3-4 or 4-3 patterns
- Avoid stacking: don't ask the user to remember earlier-page values mid-flow

### The chunking trick
- `001010110111000` (15 digits) → ungroupable, fails capacity
- `001 010 110 111 000` (5 chunks of 3) → fits
- `NTHEDOGSAWTHECATRU` → move N to end → `THE DOG SAW THE CAT RUN` (1 sentence chunk)

### Stacking and cognitive load
**Stacking:** when a new task interrupts the current task, the user puts the current context on a memory "stack." Stacks are small, short, and defective — sufficient interruption → user forgets what they were doing.

**Cognitive load (Sweller):** the load on working memory at a moment in time. Cascading menus and long Web flows put users at risk of overload.

**Design rule:** break large complex tasks into a series of smaller activities. Plot working-memory load over time; whenever load reaches zero = task closure. Organize tasks to drive frequent closure.

### Recognition over recall
Computers are better at memory; humans at pattern recognition. Let the user **choose from a list** rather than **recall from memory**. Best for initial / infrequent use. For experienced users who memorize commands, GUI selection becomes slower than typing — provide keyboard shortcuts (Ctrl-S etc.) as physical-affordance bypasses.

---

## Four-stage cognitive affordance discipline (added 2026-05-04 from Branson)

Source: `branson-ux-ui-design-extraction.md` Section 6 (Cognitive Affordance).

For every important interactive element, walk through these four stages. Failure at any stage breaks the chain.

### Stage 1: Presence
Does the affordance exist at all?
- Show which UI object to manipulate
- Show how to manipulate it
- Indicate active defaults, system state, modes
- Remind about steps the user might forget
- Avoid "clueless consent" (user proceeds without understanding consequences)

### Stage 2: Visibility / Perceivability
Can it be seen at all?
- Is it actually rendered?
- Is it occluded by another item?
- Is it small or peripheral or lost in clutter?

**Anti-pattern (must fail design review):** "Where the hell is the sign in?" — small, indistinct sign-in box mixed with other items in the far top-right corner.

### Stage 3: Recognizability
Once visible, can it be detected/identified without searching?
- Location within central focus of attention
- Contrast, size, layout complexity
- Separation from background and other UI clutter

**Anti-pattern:** status lines / message lines at the very top or very bottom — notoriously unnoticed. Pop-ups near the cursor are far more recognizable.

### Stage 4: Intelligibility
Once recognized, is the *content* understandable?
- Legibility (font, size, weight, color, contrast) — *being readable*, not whether words are meaningful
- Meaning — does the user understand once they read?

### Use as a design-review heuristic
Walk every primary CTA on a template through Presence → Visibility → Recognizability → Intelligibility. Any missing stage = redesign required before launch.
```

- [ ] **Step 2: Verify**

Run: `grep -c "added 2026-05-04 from Branson" "C:/wamp64/www/website-skills/skills/ux-psychology/references/legacy-guidance.md"`
Expected: 2.

Run: `grep -c "Recognition over recall\|Stage 4: Intelligibility" "C:/wamp64/www/website-skills/skills/ux-psychology/references/legacy-guidance.md"`
Expected: 2.

---

### Task 9: Update `ux-psychology/SKILL.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\skills\ux-psychology\SKILL.md` (update description; add references list)

- [ ] **Step 1: Read current frontmatter**

Run: `head -8 "C:/wamp64/www/website-skills/skills/ux-psychology/SKILL.md"`

Note the existing `description:` line for replacement.

- [ ] **Step 2: Replace the description line**

Edit the frontmatter `description:` line. Replace the current description with:

```
description: Cognitive psychology for premium web design. Gestalt principles, Nielsen's 10 heuristics, Norman's 3 design levels, System 1/2 thinking with cognitive biases, Branson's three HCI paradigms (Building/HIP/Design Thinking), working-memory rules (Miller 7±2, chunking, stacking, cognitive load), four-stage cognitive affordance discipline (Presence/Visibility/Recognizability/Intelligibility), and Deacon's three levels of UX scope. Use for premium $20k+ websites to justify quality and prevent common psychological UX mistakes.
```

- [ ] **Step 3: Append a "References" subsection at end of file**

Append:

```markdown

## References

- `references/legacy-guidance.md` — Gestalt, Nielsen, Norman, Krug; **+ working-memory rules + four-stage cognitive affordance** (added 2026-05-04)
- `references/three-paradigms-of-hci.md` — Building / HIP / Design Thinking; cockpit-voice example for stakeholder alignment
- `references/three-levels-of-ux-scope.md` — Single Interaction / Journey / Relationship — declare in every proposal
```

- [ ] **Step 4: Verify**

Run: `grep -c "three-paradigms-of-hci\|three-levels-of-ux-scope\|four-stage cognitive affordance" "C:/wamp64/www/website-skills/skills/ux-psychology/SKILL.md"`
Expected: ≥ 3.

---

### Task 10: Commit Cluster B

- [ ] **Step 1: Stage and commit**

```bash
cd "C:/wamp64/www/website-skills"
git add skills/ux-psychology/
git commit -m "ux-psychology: add Branson 3 paradigms + memory rules + 4-stage affordance, Deacon UX scope levels

Phase 2 UX upgrade per spec 2026-05-04-website-skills-uiux-phase2-design.md.
Two new references, legacy-guidance extended with working-memory and affordance discipline.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

- [ ] **Step 2: Verify**

Run: `git log -1 --stat`
Expected: 4 files changed (2 new + 2 modify).

---

## Cluster C — design-quality-score (4 file edits, 1 commit)

### Task 11: Create `enterprise-ux-maturity-checklist.md`

**Files:**
- Create: `C:\wamp64\www\website-skills\skills\design-quality-score\references\enterprise-ux-maturity-checklist.md`

- [ ] **Step 1: Write the file**

Source: `enterprise-ux-financial-insurance-extraction.md` Parts VIII (UX Maturity Models — 5 levels) and IX (UX Maturity Assessment Checklist).

Write:

```markdown
# Enterprise UX Maturity Checklist
**Source:** Extracted from `enterprise-ux-financial-insurance-extraction.md` (derived from The Design Ladder, Danish Design Center; Natalie Hanson's UX Maturity Model).
**Used by:** design-quality-score.

---

## Use this file when

- Scoring a project for premium-tier launch readiness
- Auditing the *process* behind a deliverable, not just the rendered output
- Diagnosing where an enterprise client currently sits and what to invest in next

## The 5 Maturity Levels

### Level 0: No Design
Design ignored entirely. Application screens & flows defined by developers + stakeholders. No significant thought toward user or user experience.

### Level 1: Uninformed UI Design (Styling)
Design considered only as cosmetic/aesthetic value addition. Focus on screens looking pretty (colors, buttons, icons, text placement) without UX thinking.

### Level 2: Style & Color (Problem Solving)
Design integral to the solution. UX approach defined. Business goals & user needs discussed and integrated into application/information flow.

### Level 3: UX Design
Application flow drives expected user behavior. Design solves user problems effectively.

### Level 4: Experience Design (Innovation)
Asks: Why are we designing this? How does this impact the target user's life and journey? How can we add more value? Shifts from "designing a solution" to design thinking. Innovation and wow factor.

## Premium-pricing gate

> A project may not score ≥ 8/10 on premium claims unless documented activities align with **Level 3 (UX Design) at minimum**. Level 4 is the target for the highest-tier work.

This checklist is **additive** — it does not retroactively fail templates scored under the prior 7-category rubric. Apply to new work going forward.

## Activity-by-Level Matrix

A check (✓) means the activity is required at that level.

| Activity | L1 Styling | L2 Problem Solving | L3 UX Design | L4 Experience Design |
|---|---|---|---|---|
| Problem Definition & Business Objective |  |  | ✓ | ✓ |
| Stakeholder Discussions / Interviews |  |  | ✓ | ✓ |
| Success Criteria |  |  | ✓ | ✓ |
| User Research |  |  | ✓ | ✓ |
| Competitor Analysis |  |  | ✓ | ✓ |
| User Interviews |  |  | ✓ | ✓ |
| Personas |  |  | ✓ | ✓ |
| Experience Maps |  |  |  | ✓ |
| User Journeys |  |  | ✓ | ✓ |
| Information Architecture |  |  | ✓ | ✓ |
| Navigation Flow |  |  | ✓ | ✓ |
| Task Flows |  |  | ✓ | ✓ |
| Wireframes (low-fi + high-fi) |  |  | ✓ | ✓ |
| Clickable Prototype |  |  | ✓ | ✓ |
| Visual Design Mockups | ✓ | ✓ | ✓ | ✓ |
| Mood Boards |  |  |  | ✓ |
| Design Templates & Style Guides | ✓ | ✓ | ✓ | ✓ |
| Heuristic / Expert Evaluation |  |  | ✓ | ✓ |
| Usability Testing |  |  |  | ✓ |
| Test Cases & Scenarios |  |  |  | ✓ |
| ADA / Section 508 Compliance | ✓ | ✓ | ✓ | ✓ |

## Scoring rule

For each activity required at the project's claimed maturity level: was it actually performed and documented? Yes = pass; No = the project drops one level until the gap is closed.

## Definitions of activities (one-liners)

- **Problem Definition** — UX designer + stakeholders answer: what is the need, why are we doing this, how does this make life easier for the end user?
- **Stakeholder Discussions** — focused-group or individual interviews with key contacts who fund/sell/execute
- **Success Criteria** — checklist of measures the deliverable must hit; documented and agreed
- **User Research** — qualitative + quantitative; interviews, contextual inquiries, eye tracking, surveys, A/B testing, web analytics, field studies
- **Competitor Analysis** — review/audit/expert-review of competitor products; matrix output (use `levy-competitive-matrix.md`)
- **User Interviews** — process, device usage, preference, industry exposure, context-of-use questions
- **Personas** — name, demographics, goals/motivations, environment, pain points, stress points
- **Experience Maps** — visual flow with feelings, frustrations, expectations
- **User Journeys** — chronological touch-point sequence per user group/scenario
- **Information Architecture** — organization/structure/labelling of all content
- **Navigation Flow** — persistent / sequential / hierarchical drill-down patterns
- **Task Flows** — diagrams of tasks user performs to meet goals
- **Wireframes** — low-fi (paper) + high-fi (no color, focus on flow)
- **Clickable Prototype** — stitched screens; behaves like real product per scenario
- **Visual Design Mockups** — full-scale static representation with colors, branding, graphics
- **Mood Boards** — themes/moods using digital, abstract, physical references
- **Design Templates & Style Guides** — working models for layout/page/screen consistency
- **Heuristic Evaluation** — Nielsen-style review against best practices
- **Usability Testing** — moderated in-person, moderated remote, or unmoderated remote
- **Test Cases & Scenarios** — derived from actual use cases; goal/task oriented
- **Accessibility (ADA / Section 508)** — required at all levels
```

- [ ] **Step 2: Verify**

Run: `grep -c "^### Level " "C:/wamp64/www/website-skills/skills/design-quality-score/references/enterprise-ux-maturity-checklist.md"`
Expected: 5.

---

### Task 12: Extend `design-quality-score/references/rubric.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\skills\design-quality-score\references\rubric.md` (append a new 8th category)

- [ ] **Step 1: Inspect existing structure**

Run: `grep "^## " "C:/wamp64/www/website-skills/skills/design-quality-score/references/rubric.md" | head -20`
Identify how the existing 7 categories are formatted.

- [ ] **Step 2: Append the 8th category**

Append at the end of the file:

```markdown

---

## Category 8: UX Maturity (Process — added 2026-05-04 from Synechron Enterprise UX)

**Important:** This category is *additive*. It does not retroactively fail templates scored under the original 7-category rubric. Apply going forward.

### Definition
Scores the process maturity behind the deliverable, not the rendered output. A pretty page produced without research, personas, or stakeholder discovery may pass the visual rubric but fail the maturity gate — and therefore cannot ship under premium-pricing claims.

### Reference
See `references/enterprise-ux-maturity-checklist.md` for the full 5-level model and activity-by-level matrix.

### Scoring criteria

| Score | Maturity level reached | Premium-launch eligibility |
|---|---|---|
| 1–3 | Level 0–1 (No design / Styling only) | **Disqualified** — premium claims rejected |
| 4–6 | Level 2 (Style & Color / Problem Solving) | Conditional — only for non-premium tiers |
| 7 | Level 3 partial — some required activities missing | Eligible only after closing gaps |
| 8–9 | **Level 3 (UX Design) — all required activities documented** | **Premium-eligible** |
| 10 | Level 4 (Experience Design) — innovation evidence | Top-tier eligible |

### Pass-fail gate
A premium-priced project (≥ $20k) must score **≥ 8** on this category. No score on the visual rubric can compensate for failure here.

### Evidence required for ≥ 8

Documented presence of all of:
- Problem definition + business objective
- Stakeholder discussions (interview notes)
- Success criteria (signed)
- User research (qualitative + quantitative)
- Competitor analysis (matrix per `levy-competitive-matrix.md`)
- Personas (named, with goals + pain points)
- User journeys (per primary persona)
- Information architecture (sitemap + navigation flow)
- Wireframes (low-fi + high-fi)
- Clickable prototype (per crucial user scenarios)
- Heuristic evaluation report
- Visual design mockups
- ADA / Section 508 compliance verification
```

- [ ] **Step 3: Verify**

Run: `grep -c "Category 8: UX Maturity" "C:/wamp64/www/website-skills/skills/design-quality-score/references/rubric.md"`
Expected: 1.

Run: `grep -c "additive" "C:/wamp64/www/website-skills/skills/design-quality-score/references/rubric.md"`
Expected: ≥ 1.

---

### Task 13: Extend `design-quality-score/references/score-calibration.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\skills\design-quality-score\references\score-calibration.md` (append a "Resolving scorer disagreements" section)

- [ ] **Step 1: Append**

Append at the end of the file:

```markdown

---

## Resolving scorer disagreements (added 2026-05-04 from Fekeshazi)

Source: `fekeshazi-pm-ux-guide-extraction.md` Section 3.4 (User Research as Decision-Arbiter).

### The principle
> "Have you had a meeting when there was an important question and all participants had different opinions? How did you decide? Or even worse: who decided? Why don't you let the users answer these questions?"

When two scorers disagree on a category by ≥ 2 points (e.g., one says 6, another says 8), the tiebreaker is **not** the senior scorer's opinion. The tiebreaker is **fresh user-test data** addressing the disputed dimension.

### Procedure
1. Document the disagreement with specifics: which category, which template, which scorers, which scores.
2. Define the testable question (e.g., "Can users find the primary CTA within 5 seconds?").
3. Run a short test (5-second test, guerrilla test, or 3–5 person remote test).
4. The score that aligns with the test data wins.
5. Record the resolution in the project log for future calibration.

### Why this works
Subjective scoring drifts toward whoever is most senior or most opinionated. Anchoring on user-observed reality keeps the rubric honest and gives clients a defensible explanation for the score.

### When to skip
- Disagreements within 1 point — accept either; record both as a calibration note
- Categories that are objectively measurable (load time, accessibility-audit pass) — those don't need user-test arbitration; re-run the measurement
```

- [ ] **Step 2: Verify**

Run: `grep -c "Resolving scorer disagreements" "C:/wamp64/www/website-skills/skills/design-quality-score/references/score-calibration.md"`
Expected: 1.

---

### Task 14: Update `design-quality-score/SKILL.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\skills\design-quality-score\SKILL.md` (mention UX Maturity in rubric overview)

- [ ] **Step 1: Find current rubric mention**

Run: `grep -n "rubric\|7-category\|category" "C:/wamp64/www/website-skills/skills/design-quality-score/SKILL.md" | head -5`

- [ ] **Step 2: Update the rubric overview**

In SKILL.md, locate the description frontmatter line that mentions "7-category rubric." Replace `7-category rubric` with `7-category visual rubric + 8th UX-maturity (process) category`.

If the description does not mention `7-category` literally, instead append this paragraph just before the "## Use when" section:

```markdown

> **Updated 2026-05-04:** Scoring now includes an 8th additive category — UX Maturity (process) — sourced from the Synechron Enterprise UX 5-level model. See `references/enterprise-ux-maturity-checklist.md` and the new "Category 8" section in `references/rubric.md`. Premium-priced projects must score ≥ 8 on this category in addition to the visual rubric.

```

- [ ] **Step 3: Verify**

Run: `grep -c "UX Maturity\|enterprise-ux-maturity-checklist\|Category 8" "C:/wamp64/www/website-skills/skills/design-quality-score/SKILL.md"`
Expected: ≥ 1.

---

### Task 15: Commit Cluster C

- [ ] **Step 1: Stage and commit**

```bash
cd "C:/wamp64/www/website-skills"
git add skills/design-quality-score/
git commit -m "design-quality-score: add UX Maturity 8th category + scorer-disagreement protocol

Phase 2 UX upgrade per spec 2026-05-04-website-skills-uiux-phase2-design.md.
Adds Synechron 5-level maturity checklist as new reference + additive Category 8 in rubric.
Adds Fekeshazi research-as-arbiter rule for resolving scoring disagreements.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

- [ ] **Step 2: Verify**

Run: `git log -1 --stat`
Expected: 4 files changed (1 new + 3 modify).

---

## Cluster D — design-reference (3 file edits, 1 commit)

### Task 16: Create `levy-competitive-matrix.md`

**Files:**
- Create: `C:\wamp64\www\website-skills\skills\design-reference\references\levy-competitive-matrix.md`

- [ ] **Step 1: Write the file**

Source: `levy-ux-strategy-extraction.md` Part VII (Competitive Research) and matrix-attribute list.

Write:

```markdown
# Levy's Competitive Analysis Matrix
**Source:** Extracted from `levy-ux-strategy-extraction.md` (Part VII).
**Used by:** design-reference.

---

## Use this file when

- Building a `docs/design-reference.md` for a client who provided competitor URLs
- Preparing the competitive section of a proposal or strategic brief
- Auditing whether a project's "competitive analysis" actually has data

## The discipline

> "The Internet has been around for more than 20 years. Knowing what has actually worked or failed is crucial to identifying a competitive advantage."

You almost never enter a new market — you enter an existing one. Match user discovery + stakeholder name-drops + keyword search to find competitors.

## Competitor types

- **Direct competitors** — same/very similar value prop to your customers. Your customers are using them right now.
- **Indirect competitors** — similar value prop to a *different* segment, OR your exact segment without the exact same value prop.

## Target list size

**Minimum: 5 direct + 3 indirect.** Mix established and new entrants. Never stop on page 1 of search results — review at least 5 pages (top 50).

## The matrix — columns to capture

Use Google Sheets (free, cloud, shareable). One row per competitor. ~30 minutes per row first pass.

| # | Column | What to capture |
|---|---|---|
| 1 | URL of website / app store | Both Apple and Android URLs if multi-platform; if mobile and desktop differ greatly, give competitor TWO rows |
| 2 | Username / password | Throwaway global login for the team. Never use real social logins. Buy paid apps. |
| 3 | Purpose of site | 1–2 sentence value prop. Sources: About page, Crunchbase, app-store first 2 lines, social profiles, online annual report |
| 4 | Year founded | |
| 5 | Funding rounds | Crunchbase. Funded competitors have advantage. |
| 6 | Revenue streams | Transaction fee, ads, monthly fee, SaaS, data sales. Click "Advertise with Us" if unclear. |
| 7 | Monthly traffic | Compete.com, Quantcast, Alexa, App Annie, AppFigures, Mopapp, Distimo. Triangulate. |
| 8 | # SKUs / listings (optional) | Search a common term and use the count as proxy |
| 9 | Primary categories | Copy global navigation. For horizontal marketplaces, list "most popular" / "best selling." |
| 10 | Social networks | Active strategy, not just account presence |
| 11 | Content types | Text/photo/video balance, organization, scannability, detail-page depth |
| 12 | Personalization features | Favorites, watch lists, profiles, wish lists, custom UI, messaging, saved carts |
| 13 | Community / UGC features | Message boards, posts, comments. Editorial vs user-generated balance. |
| 14 | Competitive advantage | Top 3 differentiators per product, with concrete examples |
| 15 | Heuristic evaluation | Quick A–F grade with primary-goal task, nav consistency, find/search/browse, error feedback |
| 16 | Customer reviews | Recurring complaints from app stores, Quora, Twitter |
| 17 | General notes | |
| 18 | Questions to team | |
| 19 | Analysis | (Filled in during cross-row analysis pass) |

## Heuristic evaluation rubric

For column 15, use these questions to grade A–F:
- Does the experience let the user accomplish their primary goal? Intuitive?
- Are navigation, page/screen layouts, and visual design consistent?
- Is it easy to find/search/browse the content or services?
- Is feedback (errors, help, support) satisfactory?

## Why a UX person should run this (not a generic researcher)

- **Design enhancement** — UX spots nuance (a slightly better shade, a content message like "Saving…saved")
- **Simplicity** — UX thinks in clicks-to-task; spots interaction-pattern improvements
- **Cost** — same person researches and builds; faster
- **Tag team** — UX lead can mentor a junior researcher
- **UX innovation** — improving design is almost always possible

## Output document

After filling the matrix, distill into a brief that:
- Lists the top 3 differentiators *every* competitor has (table stakes)
- Lists 1–2 differentiators NO competitor has (the blue-ocean opportunity)
- Names the heuristic A–F leader and what they do that the others don't
- Recommends 3 features to poach from competitors and 1 from a non-competitor
```

- [ ] **Step 2: Verify**

Run: `grep -c "^| [0-9]" "C:/wamp64/www/website-skills/skills/design-reference/references/levy-competitive-matrix.md"`
Expected: 19 (the matrix rows).

---

### Task 17: Extend `design-reference/references/competitor-analysis-worksheet.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\skills\design-reference\references\competitor-analysis-worksheet.md` (restructure to use Levy matrix columns; preserve local adaptations)

- [ ] **Step 1: Read existing content**

Run: `cat "C:/wamp64/www/website-skills/skills/design-reference/references/competitor-analysis-worksheet.md"`

Note any sector-specific or local additions that must be preserved.

- [ ] **Step 2: Append a new section that maps to the Levy matrix**

Append at the end of the file:

```markdown

---

## Canonical worksheet format (added 2026-05-04 — Levy matrix alignment)

The canonical worksheet for any premium engagement now uses the 19-column matrix in `levy-competitive-matrix.md`. Follow that structure for new engagements.

### Migration of existing local additions

Any sector-specific columns previously used in this worksheet are preserved as a "Local additions" subsection appended to each row. Examples:
- **Africa-excellence engagements:** mobile-data-cost adaptation column, USSD/feature-phone fallback column
- **Hospitality engagements:** offline-booking partner column, multi-currency column
- **Education engagements:** accreditation-status column

### Pass criteria

A competitive analysis is complete when:
- ≥ 5 direct + 3 indirect competitors filled
- All 19 columns populated for at least the 5 direct competitors
- Heuristic A–F grade assigned to each
- A 1-page distilled brief produced naming top 3 table-stakes features, 1–2 blue-ocean gaps, and 3 features to poach
```

- [ ] **Step 3: Verify**

Run: `grep -c "Canonical worksheet format\|Levy matrix" "C:/wamp64/www/website-skills/skills/design-reference/references/competitor-analysis-worksheet.md"`
Expected: ≥ 2.

---

### Task 18: Update `design-reference/SKILL.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\skills\design-reference\SKILL.md` (mention the Levy matrix as canonical worksheet format)

- [ ] **Step 1: Append a "Canonical worksheet" subsection**

Append before the closing of the file:

```markdown

## Canonical worksheet format

For premium engagements ($20k+), use Levy's 19-column competitive matrix as the canonical format. See `references/levy-competitive-matrix.md`. Local sector adaptations live in the "Local additions" subsection of `references/competitor-analysis-worksheet.md`.

Minimum data set: 5 direct + 3 indirect competitors fully filled, with A–F heuristic grades and a 1-page distilled brief.
```

- [ ] **Step 2: Verify**

Run: `grep -c "levy-competitive-matrix\|19-column" "C:/wamp64/www/website-skills/skills/design-reference/SKILL.md"`
Expected: ≥ 1.

---

### Task 19: Commit Cluster D

- [ ] **Step 1: Stage and commit**

```bash
cd "C:/wamp64/www/website-skills"
git add skills/design-reference/
git commit -m "design-reference: adopt Levy 19-column competitive matrix as canonical worksheet

Phase 2 UX upgrade per spec 2026-05-04-website-skills-uiux-phase2-design.md.
Adds the matrix as a new reference; existing worksheet maps to it with local-additions section.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

- [ ] **Step 2: Verify**

Run: `git log -1 --stat`
Expected: 3 files changed (1 new + 2 modify).

---

## Cluster E — design-system (4 file edits, 1 commit)

### Task 20: Create `enterprise-data-viz-rules.md`

**Files:**
- Create: `C:\wamp64\www\website-skills\skills\design-system\references\enterprise-data-viz-rules.md`

- [ ] **Step 1: Write the file**

Source: `enterprise-ux-financial-insurance-extraction.md` Part X (Data Visualization & Dashboard Applications).

Write:

```markdown
# Enterprise Data Visualization Rules
**Source:** Extracted from `enterprise-ux-financial-insurance-extraction.md` (Synechron, 2018).
**Used by:** design-system. Particularly relevant when website-skills produces dashboards via the dashboards/ engine.

---

## The principle

> "The immediate purpose of data visualization is to **improve understanding** — not to make fancy charts/widgets."

> "Pick the chart type to suit the data and its purpose, not to stylize the dashboard."

## The hard rules (no exceptions on premium dashboards)

- **No 3D widgets.** Pie chart, bar chart, line chart — all 2D. Always.
- **No heavy shadows or gradients on chart elements.** They distort perception of size/quantity.
- **Color enhances meaning and clarity** — for highlighting and focus, not decoration.
- **Encode for the eye** — adequate context for the data; the brain organizes what it sees.

## Pre-attentive visual attributes (use intentionally)

The brain processes these *before* conscious attention. Use them to direct the user's eye to what matters:

| Attribute | Use for |
|---|---|
| **Size** | Quantity, weight, importance |
| **Color difference** | Categorical distinction; status (red/amber/green sparingly) |
| **Orientation** | Direction of trend |
| **Proximity** | Grouping (related items close together) |
| **Similarity / Difference** | Same shape = same kind; different shape = different kind |
| **Connections** | Relationship between data points (lines, links) |

## Chart type → data type mapping

| Data type | Right chart |
|---|---|
| Composition (whole + parts) | Stacked bar (only if categories ≤ 5); avoid pie if categories > 4 |
| Comparison across categories | Horizontal or vertical bar chart |
| Trend over time | Line chart |
| Distribution | Histogram or box plot |
| Correlation | Scatter plot |
| Geographic | Choropleth or simple map |
| Hierarchy | Treemap (only if depth ≤ 3) |

## Anti-patterns (must fail design review)

- Pie chart with > 4 slices
- 3D pie chart (any size)
- Bar chart with gradient fills
- Line chart with > 7 series on one axis
- Donut chart with center number unrelated to the chart total
- "Speedometer" gauges on data dashboards (engagement-driven, not insight-driven)
- Color used for decoration instead of meaning
- Same color used for two different categorical meanings on one screen

## Application notes

- **Internal dashboards** (back-office): efficiency above aesthetic. Density allowed if hierarchy is clear.
- **Executive dashboards:** fewer charts, more summary numbers; one "headline" KPI per screen.
- **Public-facing data viz** (marketing, transparency reports): the rules still apply; resist the urge to "make it pretty" with 3D or gradients.
```

- [ ] **Step 2: Verify**

Run: `grep -c "^- \*\*No " "C:/wamp64/www/website-skills/skills/design-system/references/enterprise-data-viz-rules.md"`
Expected: ≥ 2.

---

### Task 21: Extend `design-system/references/ux-quality-checklist.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\skills\design-system\references\ux-quality-checklist.md` (append "First-impression and orientation" section)

- [ ] **Step 1: Append**

Append at the end of the file:

```markdown

---

## First-impression and orientation (added 2026-05-04 from Deacon + Fekeshazi)

Sources: `deacon-ux-ui-strategy-extraction.md` Section 4 (UI Design Considerations); `fekeshazi-pm-ux-guide-extraction.md` Section 1.2 (5-10 minute rule).

### The 5–10 minute rule (Fekeshazi)
At first use, you have a maximum of 5–10 minutes to give users answers about how the app works and how they benefit. **Tutorials are futile.** The interface itself must explain.

**Audit:** can a first-time user accomplish the primary goal within 5 minutes without watching a tutorial or reading a help page?

### Consistency (Deacon)
- Colors, borders, font size, style, background images, effects — match across pages
- Doing similar tasks in similar/familiar ways
- Logo always returns to home
- Header, footer, body structure consistent across all pages

### Responsiveness (Deacon)
- Confirm submissions explicitly ("Saved", not silent success)
- Loading indicators for any operation > 1 second
- Never leave the user with a blank page or no path back
- Loading state messages: progress percentage if known, indeterminate spinner if not

### Familiar words (Deacon)
- Use sign-up, register, login — not invented vocabulary
- "Submit" or "Send" — not "Initiate transmission"
- Industry-standard terms reduce cognitive load on first visit

### Streaming (Deacon)
- Every page contains a link to contact information
- Throw away unwanted content; clutter doesn't improve the interface
- Sticky/scroll-aware footer with key links

### Pre-launch checklist
- [ ] First-time user can reach primary goal in ≤ 5 minutes without coaching
- [ ] No tutorials required (no overlay tour, no "5 things to know" modal)
- [ ] Color/font/spacing consistent across all primary templates
- [ ] Logo links home from every page
- [ ] Every form submission has explicit success/failure feedback
- [ ] Loading states present for all > 1s operations
- [ ] Standard vocabulary used throughout (sign-up / login / submit, not invented terms)
- [ ] Contact info reachable from every page
```

- [ ] **Step 2: Verify**

Run: `grep -c "First-impression and orientation\|5–10 minute rule" "C:/wamp64/www/website-skills/skills/design-system/references/ux-quality-checklist.md"`
Expected: ≥ 1.

---

### Task 22: Extend `design-system/references/ai-slop-prevention.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\skills\design-system\references\ai-slop-prevention.md` (append "Enterprise anti-patterns" section)

- [ ] **Step 1: Append**

Append at the end of the file:

```markdown

---

## Enterprise anti-patterns (added 2026-05-04 from Synechron Enterprise UX)

Source: `enterprise-ux-financial-insurance-extraction.md` Part I (diagnosis of why most enterprise apps fail).

These five patterns appear most often in B2B / SaaS / dashboard work. Detect early and fail loudly.

### 1. Feature overload
**Symptom:** every page is a wall of buttons, fields, tabs, dropdowns. The user can't tell what the primary task is.
**Detection cue:** > 7 primary actions visible above the fold on the main task page.
**Fix:** Identify the top 3 user goals. Surface those. Demote everything else to secondary navigation or settings.

### 2. Uninformed design
**Symptom:** the design was made by product owners + developers with zero user research.
**Detection cue:** no personas, no user interviews, no journey maps in project artifacts.
**Fix:** stop. Run discovery (see `enterprise-ux-maturity-checklist.md` Level 3 activities).

### 3. Inconsistent
**Symptom:** different fonts, different colors, different button styles across screens. No shared component vocabulary.
**Detection cue:** ≥ 3 button styles for "primary" action across the product.
**Fix:** establish design tokens; build a component library; refactor screens to use it.

### 4. Old-fashioned look
**Symptom:** decisions driven by the technology stack ("our framework only does X"), not by modern design language.
**Detection cue:** flat 1990s tables, no whitespace, default-OS controls only, no responsive design.
**Fix:** adopt a modern token system (typography, spacing, color) and a responsive layout grid.

### 5. Cluttered information
**Symptom:** content & info screens with no hierarchy strategy. Walls of text, dense tables, no scannable structure.
**Detection cue:** average page word count > 800 with no headings, lists, or visual breaks.
**Fix:** apply content hierarchy — H2 every 200–300 words, lists for ≥ 3 parallel items, callout boxes for the "one thing to remember."

### Audit checklist
- [ ] No page has > 7 primary actions above the fold
- [ ] Every project has personas + at least one user interview transcript on file
- [ ] Component library defines exactly 1 primary, 1 secondary, 1 tertiary button
- [ ] Layout is responsive on the 3 most-trafficked breakpoints
- [ ] Average paragraph ≤ 4 lines; hierarchy headings every 200–300 words
```

- [ ] **Step 2: Verify**

Run: `grep -c "Enterprise anti-patterns\|Feature overload\|Uninformed design" "C:/wamp64/www/website-skills/skills/design-system/references/ai-slop-prevention.md"`
Expected: ≥ 3.

---

### Task 23: Update `design-system/SKILL.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\skills\design-system\SKILL.md` (mention dashboard/data-viz coverage)

- [ ] **Step 1: Append**

Append before the closing of the file:

```markdown

## Dashboard and data-viz coverage

For projects that include dashboards (executive, operational, public-facing), additional rules apply. See `references/enterprise-data-viz-rules.md` — covers chart-type selection, pre-attentive visual attributes, and the no-3D / no-shadow rules. Premium-priced dashboards must comply.
```

- [ ] **Step 2: Verify**

Run: `grep -c "enterprise-data-viz-rules\|Dashboard and data-viz" "C:/wamp64/www/website-skills/skills/design-system/SKILL.md"`
Expected: ≥ 1.

---

### Task 24: Commit Cluster E

- [ ] **Step 1: Stage and commit**

```bash
cd "C:/wamp64/www/website-skills"
git add skills/design-system/
git commit -m "design-system: add data-viz rules + first-impression checklist + enterprise anti-patterns

Phase 2 UX upgrade per spec 2026-05-04-website-skills-uiux-phase2-design.md.
New reference for dashboard/chart rules.
ux-quality-checklist extended with 5-10 min rule + Deacon UI considerations.
ai-slop-prevention extended with 5 enterprise anti-patterns.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

- [ ] **Step 2: Verify**

Run: `git log -1 --stat`
Expected: 4 files changed (1 new + 3 modify).

---

## Cluster F — universal-guidelines (2 file edits, 1 commit)

### Task 25: Extend `UNIVERSAL-DESIGN-GUIDELINES.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\universal-guidelines\UNIVERSAL-DESIGN-GUIDELINES.md` (add new top-level section before the closing paragraph)

- [ ] **Step 1: Find current closing line**

Run: `tail -5 "C:/wamp64/www/website-skills/universal-guidelines/UNIVERSAL-DESIGN-GUIDELINES.md"`

The closing line is: `This document serves as a reference for all website projects. Reference these guidelines when making design decisions, optimizing for performance, ensuring accessibility, or planning content strategy.`

- [ ] **Step 2: Insert the new section above the closing paragraph**

Insert this content immediately *before* the final closing paragraph (between the `---` separator and the closing line):

```markdown

## World-class UX foundations (book-derived, added 2026-05-04)

Five UX/UI book extractions are now the upstream source for design decisions on premium projects. Canonical location: `book-extractions/`.

### The four cross-cutting rules

1. **Validated user research is non-negotiable** (Levy). No "Field of Dreams" launches — confront target customers with an MVP/landing page before scaling. Source: `book-extractions/levy-ux-strategy-extraction.md`.

2. **All 5 outcomes must hit, not 4 of 5** (Synechron Enterprise UX). Useful + Easy + Efficient + Pleasing + Accessible. One No = no premium launch. Source: `book-extractions/enterprise-ux-financial-insurance-extraction.md`.

3. **Recognition over recall + 4-stage cognitive affordance** (Branson). Show, don't make users remember. Every interactive element must pass Presence → Visibility → Recognizability → Intelligibility. Source: `book-extractions/branson-ux-ui-design-extraction.md`.

4. **Design is ongoing, not a project** (Fekeshazi). Plan for continuous design alongside continuous dev. A dev team without a design team is a few bricks short of a load. Source: `book-extractions/fekeshazi-pm-ux-guide-extraction.md`.

### Pointer to the engine's skills

The skills that operationalize these rules:
- `skills/premium-ui-ux-design/` — Levy 4 tenets, 5 outcomes, PM rules
- `skills/ux-psychology/` — Three Paradigms, working memory, 4-stage affordance, 3 levels of UX scope
- `skills/design-quality-score/` — UX Maturity 5-level checklist as 8th rubric category
- `skills/design-reference/` — Levy 19-column competitive matrix
- `skills/design-system/` — enterprise data-viz rules, first-impression checklist, enterprise anti-patterns

```

- [ ] **Step 3: Verify**

Run: `grep -c "World-class UX foundations" "C:/wamp64/www/website-skills/universal-guidelines/UNIVERSAL-DESIGN-GUIDELINES.md"`
Expected: 1.

Run: `grep -c "book-extractions/" "C:/wamp64/www/website-skills/universal-guidelines/UNIVERSAL-DESIGN-GUIDELINES.md"`
Expected: ≥ 4.

---

### Task 26: Extend `ux-laws-and-psychology.md`

**Files:**
- Modify: `C:\wamp64\www\website-skills\universal-guidelines\ux-laws-and-psychology.md` (append two new sections at end)

- [ ] **Step 1: Append**

Append at the end of the file:

```markdown

---

## Working-memory laws (added 2026-05-04 from Branson)

Source: `book-extractions/branson-ux-ui-design-extraction.md` Section 5.

### Miller's 7 ± 2 (1956)
Working memory holds about 7 chunks (often less), for ~30 seconds. Practice can extend; interruption shrinks fast.

**Web implications:**
- Primary navigation: ≤ 7 items
- Visible form fields per step: ≤ 7
- Phone-number-style strings chunked at 3-3-4 or 4-3

### Sweller's cognitive load theory (1988, 1994)
The load on working memory at a moment in time. Cascading menus and long flows risk overload.

**Design rule:** plot working-memory load over time. Whenever it reaches zero = task closure. Organize tasks to drive frequent closure. Break complex tasks into smaller activities, never one giant stacked structure.

### Stacking
When a task interrupts another, current context goes on a memory "stack." Stacks are small, short, and defective. After enough interruption the user forgets what they were doing.

**Design rule:** make every step independently completable. Save state automatically. Surface a clear "back to where you were" affordance after any interruption.

---

## Three Paradigms of HCI design (added 2026-05-04 from Branson)

Source: `book-extractions/branson-ux-ui-design-extraction.md` Section 1 (originally Harrison, Tatar, Sengers 2007).

When stakeholders disagree about "good design," they're often working in different paradigms.

1. **Engineering / Building** — productivity, eliminate errors, summative metrics. Dominates in back-office tools.
2. **Human Information Processing (HIP)** — fit machine to cognitive task; Miller's 7 ± 2 lives here. Dominates in information density.
3. **Design Thinking / Phenomenological** — emotional, social, situated experience. Dominates in landing/brand/hero work.

**Cockpit-voice example (one paragraph):** the same problem of pilot-warning voices analyzed three ways: (1) "use a female voice to cut through male-dominated comms" — engineering; (2) "female voices effectively differentiate signal from noise; familiar voices improve performance further" — HIP; (3) "the chosen voice's sultry tone reinforced cockpit-as-male, became inappropriate as women became pilots" — design thinking.

**Rule:** all three paradigms are complementary. A premium website typically requires all three applied to different surfaces.
```

- [ ] **Step 2: Verify**

Run: `grep -c "Working-memory laws\|Three Paradigms" "C:/wamp64/www/website-skills/universal-guidelines/ux-laws-and-psychology.md"`
Expected: 2.

---

### Task 27: Commit Cluster F

- [ ] **Step 1: Stage and commit**

```bash
cd "C:/wamp64/www/website-skills"
git add universal-guidelines/
git commit -m "universal-guidelines: add World-class UX foundations + working-memory laws + Three Paradigms

Phase 2 UX upgrade per spec 2026-05-04-website-skills-uiux-phase2-design.md.
UNIVERSAL-DESIGN-GUIDELINES gains the 4 cross-cutting rules + pointers to engine skills.
ux-laws-and-psychology gains Miller/Sweller/stacking rules and Three Paradigms framing.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

- [ ] **Step 2: Verify**

Run: `git log -1 --stat`
Expected: 2 files changed (2 modify).

---

## Cluster G — Verification (1 task, no commit)

### Task 28: End-to-end verification

- [ ] **Step 1: Verify all 21 file edits exist**

Run:

```bash
cd "C:/wamp64/www/website-skills"
for f in \
  skills/premium-ui-ux-design/references/levy-four-tenets.md \
  skills/premium-ui-ux-design/references/enterprise-five-outcomes.md \
  skills/premium-ui-ux-design/references/pm-collaboration-rules.md \
  skills/ux-psychology/references/three-paradigms-of-hci.md \
  skills/ux-psychology/references/three-levels-of-ux-scope.md \
  skills/design-quality-score/references/enterprise-ux-maturity-checklist.md \
  skills/design-reference/references/levy-competitive-matrix.md \
  skills/design-system/references/enterprise-data-viz-rules.md \
; do test -f "$f" && echo "OK: $f" || echo "MISSING: $f"; done
```

Expected: 8 lines, all "OK:".

- [ ] **Step 2: Verify all extensions added their marker phrases**

Run:

```bash
cd "C:/wamp64/www/website-skills"
grep -l "added 2026-05-04" \
  skills/ux-psychology/references/legacy-guidance.md \
  skills/design-quality-score/references/rubric.md \
  skills/design-quality-score/references/score-calibration.md \
  skills/design-reference/references/competitor-analysis-worksheet.md \
  skills/design-system/references/ux-quality-checklist.md \
  skills/design-system/references/ai-slop-prevention.md \
  universal-guidelines/UNIVERSAL-DESIGN-GUIDELINES.md \
  universal-guidelines/ux-laws-and-psychology.md
```

Expected: 8 file paths printed.

- [ ] **Step 3: Verify all 5 SKILL.md files reference at least one new artifact**

Run:

```bash
cd "C:/wamp64/www/website-skills"
for f in \
  skills/premium-ui-ux-design/SKILL.md \
  skills/ux-psychology/SKILL.md \
  skills/design-quality-score/SKILL.md \
  skills/design-reference/SKILL.md \
  skills/design-system/SKILL.md \
; do echo "=== $f ==="; grep -c "levy\|enterprise\|three-paradigms\|three-levels\|World-class\|Category 8\|UX Maturity\|Dashboard\|2026-05-04" "$f"; done
```

Expected: 5 sections, each with count ≥ 1.

- [ ] **Step 4: Verify commit history**

Run: `git log --oneline -10`
Expected: At least 6 new commits visible (Clusters A through F), all with the 2026-05-04 spec reference.

- [ ] **Step 5: Final report**

Print a one-paragraph summary:
- Number of new files created (expect 8)
- Number of files extended (expect 8)
- Number of SKILL.md files updated (expect 5)
- Number of commits made (expect 6)
- Any verification step that did not match expectation (should be none)

If any verification fails, do not declare the plan complete; create a follow-up task to fix and re-verify.

---

## Self-Review (executed by writing-plans skill)

**1. Spec coverage:** Each spec deliverable maps to a task:
- 8 new reference files → Tasks 1, 2, 3, 6, 7, 11, 16, 20 ✓
- 8 extended existing files → Tasks 8, 12, 13, 17, 21, 22, 25, 26 ✓
- 5 SKILL.md edits → Tasks 4, 9, 14, 18, 23 ✓
- Verification task → Task 28 ✓
- 6 commits → Tasks 5, 10, 15, 19, 24, 27 ✓

**2. Placeholder scan:** No "TBD", "TODO", "implement later" present. Each new file has full content provided in the task.

**3. Type consistency:** File paths consistent throughout. The same skill names referenced uniformly (e.g., `premium-ui-ux-design`, not `premium-ux-design` elsewhere).

**4. Source provenance:** Every new file cites its source extraction; every extension marks the addition with "added 2026-05-04 from <source>".

No issues to fix.
