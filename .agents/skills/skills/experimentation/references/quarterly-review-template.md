# Quarterly Experimentation Review

**Read this when**: preparing the end-of-quarter experimentation review
for a retainer client or for the agency's cross-client review.

**Purpose**: A quarterly review turns experiments into institutional
learning. Without it, each test stays local to the client and local to
the month; with it, patterns become skill updates.

## Per-client quarterly review

Filed at `project-log/experiments/review-<YYYY-Qn>.md` in the client
project.

### Template

```markdown
# Experiment Review — <Client> — Q<n> <YYYY>

**Filed**: YYYY-MM-DD
**Owner**: <name>
**Tests run this quarter**: <count>
**Tests decided this quarter**: <count>

## Tests

| Slug | Primary metric | Decision | Lift (95% CI) | Notes |
|---|---|---|---|---|
| … | … | ship / kill / iterate | … | … |

## Wins shipped

- <Test slug>: <brief result and its implication>.

## Losses learnt

- <Test slug>: <what was learnt, regardless of whether the test was
  significant>.

## Patterns observed across tests

- <Pattern or repeated finding that warrants a skill update or a
  client-wide change>.

## Follow-ups

- <New tests proposed for next quarter>.
- <Changes to skills or references this review triggers>.
- <Updates to the client's strategy brief>.

## Client-facing summary

The 3–5 sentence version that can be dropped into the monthly report
for the last month of the quarter.
```

## Agency cross-client review

Filed at `dashboards/experimentation-learning-<YYYY-Qn>.md` once per
quarter.

### Purpose

The engine benefits when a pattern that worked for one client is tested
(not assumed) for another. The cross-client review consolidates
per-client reviews and decides what is now settled craft vs what is
still client-specific.

### Template

```markdown
# Cross-Client Experimentation Review — Q<n> <YYYY>

**Filed**: YYYY-MM-DD
**Clients reviewed**: <count>
**Tests decided this quarter (agency-wide)**: <count>

## What moved across clients

- <Pattern that appears to generalise; evidence from at least two
  clients>.

## What stayed local

- <Pattern that appears to be client-specific; call out the segment>.

## Skills updates triggered

- <Reference or SKILL update filed as a decision entry>.

## Open questions

- <Questions the engine cannot yet answer from the experiment pool>.

## Recommended tests for next quarter

- <Cross-client tests proposed; prioritised>.
```

## Cadence

- Per-client review: last week of the quarter; delivered to the client
  with the end-of-quarter monthly report.
- Cross-client review: first week of the new quarter; internal-only
  until Phase 12's public scorecard begins publishing quarterly
  aggregate data.

## Discipline rules

- No review skipped. A quarter with no tests produces a 1-page
  review explaining the traffic or priority constraint.
- Reviews are read by the programme lead before the first client
  engagement of the following quarter begins.
- Any cross-client pattern that has been observed three quarters in a
  row without a skill update is drift; the next update cycle must
  promote or discard it.
