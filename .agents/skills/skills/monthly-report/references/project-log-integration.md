# Project Log Integration

The `monthly-report` skill does not interview the agency or guess at what happened. It reads from `project-log/` inside the client project and synthesises the report from the logged entries.

This file describes the contract between the monthly-report skill and the project-log directory.

---

## Input: the project-log directory

Every client project has a `project-log/` directory at its root:

```
project-log/
├── README.md           ← convention, copied from templates/project-log-template.md
├── CHANGELOG.md        ← append-only daily entries, newest first
├── decisions/          ← ADR-format decision records
│   └── YYYY-MM-DD-name.md
├── incidents/          ← incident records
│   └── YYYY-MM-DD-name.md
└── monthly/            ← monthly roll-ups (output of this skill's roll-up step)
    └── YYYY-MM.md
```

The format of each file is defined in `templates/project-log-template.md`. This skill expects that format — if a client project's log diverges, it is the agency's job to bring the log back to format before running the monthly report.

---

## Workflow when generating a monthly report

1. **Confirm the target month.** Default is the calendar month just ended. The skill asks the user to confirm (e.g., "Generating report for March 2026 — correct?").
2. **Load the daily entries for the month.** Parse `CHANGELOG.md`, filter by date headings inside the target month. If the log covers a long history, only load the relevant slice.
3. **Load the metrics snapshots.** Pull every metrics-snapshot block inside the target month plus the last metrics snapshot from the previous month (for MoM comparison).
4. **Load decisions and incidents in the target month.** Read every file in `decisions/` and `incidents/` dated inside the target month.
5. **Load the prior monthly roll-up if it exists.** `monthly/YYYY-MM.md` for the prior month — to write "next month plan" references that align with what was previously promised.
6. **Generate the monthly roll-up file.** Write `monthly/YYYY-MM.md` using the template in `templates/project-log-template.md`. This file is the raw material for the client-facing report.
7. **Generate the client-facing report.** Using the commentary formulas in `commentary-formulas.md` and the QA checklist in `report-qa-checklist.md`, produce the final report. The final report can draw from the roll-up plus any additional context the user provides.
8. **Run the QA checklist.** Confirm every metric has a source, every claim is grounded in a log entry, nothing is fabricated.
9. **Deliver.** Output as markdown ready for PDF export or email.

---

## What to do when the log is incomplete

The log is the source of truth. If it is thin, the report is thin.

- **Log has entries but is missing metrics snapshots.** Ask the user for the metric values and the source (GA4, Search Console, CRM). Add a retrospective metrics entry to the log dated today, marked as retroactive. Then generate the report.
- **Log has no entries for the target month.** Stop and tell the user. Do not fabricate activity. Ask what was done that month; capture it as a retroactive entry in the log dated today, then generate the report.
- **Log is missing entirely.** Stop. Tell the user they need to initialise the project log from `templates/project-log-template.md`. Refuse to generate a monthly report that cannot be sourced from a log.

A monthly report sourced from memory or guesses is worse than no report — it erodes the agency's credibility when the client later asks "why is X in the report when we didn't do that?" Hold the line.

---

## What belongs in the report vs. the log

Not everything in the log reaches the client-facing report. Three rules:

1. **Log everything. Report what matters to the client.** Internal notes ("client seemed frustrated on the call"), staff-side observations, and bookkeeping entries stay in the log. The client report covers the work done on their site and the outcomes achieved.
2. **Report the metric deltas that move the client's business.** Sessions and impressions are context; leads, conversions, organic-search visibility on target keywords, and page-level performance on money pages are the headline.
3. **Honest about wins and losses.** If a metric fell, report it with the reason. The log contains the reason; the report explains it without spin.

---

## The commentary layer

The `monthly-report` skill does not just list log entries — it writes plain-English commentary explaining what the numbers mean for the client's business. That commentary is generated from the log (the facts) plus `commentary-formulas.md` (the translation rules) plus the client's commercial context (which the agency knows from the engagement).

The log is what happened. The commentary is what it meant. The report is both, together.

---

## Seeding the project log at kickoff

Part of project kickoff (Phase 6 delivery work) is initialising `project-log/`:

1. Create `project-log/` directory
2. Copy `templates/project-log-template.md` → `project-log/README.md`
3. Create `project-log/CHANGELOG.md` and write the kickoff entry (see the template for format)
4. Create the empty directories: `decisions/`, `incidents/`, `monthly/`

The deploy skill's launch checklist should confirm the log exists and has a kickoff entry before go-live. A project without a log cannot generate monthly reports — and monthly reports are how retainers are sold.

---

## Quality rules

- **Dates are absolute.** ISO format (YYYY-MM-DD). Relative dates ("last Tuesday") break the reader and break the roll-up.
- **Entries name specifics.** Pages, features, metrics, numbers. Vague entries produce vague reports.
- **Every metric in the report traces back to a log snapshot.** The report cannot claim "sessions up 22%" unless a log entry dated inside the month supplies the numbers.
- **No contradicting entries.** If something was done and then undone, log both and cross-link them. The report explains the story.
- **No retroactive rewriting.** Entries are append-only. Corrections are new dated entries that reference the entry they correct.
