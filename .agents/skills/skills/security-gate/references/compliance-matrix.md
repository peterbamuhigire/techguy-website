# Privacy and Cookie Compliance Matrix

Reference for the jurisdictions the engine commonly serves. Treat as an
operational checklist, not legal advice — consult a qualified lawyer for
client-specific questions.

The site's privacy policy, terms, cookie notice, and data-subject request
flow must reflect the rules for every jurisdiction the client operates in.
`policy-pages/SKILL.md` produces the public-facing documents; this matrix is
the source of truth for the rules those documents codify.

## Jurisdictions Covered

| Region | Law | In force | DPA |
|---|---|---|---|
| Uganda | Data Protection and Privacy Act 2019 (DPPA) | 2019 | Personal Data Protection Office (PDPO) |
| Kenya | Data Protection Act 2019 | 2019 | Office of the Data Protection Commissioner (ODPC) |
| Nigeria | Nigeria Data Protection Act 2023 (supersedes NDPR 2019) | 2023 | Nigeria Data Protection Commission (NDPC) |
| South Africa | Protection of Personal Information Act 2013 (POPIA) | 2021 (fully) | Information Regulator |
| Rwanda | Law on Protection of Personal Data and Privacy 2021 | 2023 | National Cyber Security Authority (NCSA) |
| Ghana | Data Protection Act 2012 | 2012 | Data Protection Commission |
| EEA / UK | GDPR + UK GDPR | 2018 | per member state |

## Rule Summary

### Lawful Basis for Processing

| Law | Required? | Bases |
|---|---|---|
| Uganda DPPA | yes | consent, contract, legal obligation, vital interest, public interest, legitimate interest |
| Kenya DPA | yes | same as GDPR |
| Nigeria DPA 2023 | yes | consent, contract, legal obligation, vital interest, public interest, legitimate interest |
| POPIA | yes | consent, contract, law, vital interest, public law duty, legitimate interest of responsible party |
| GDPR | yes | six bases (Art. 6) |

Implementation: the privacy policy names the basis for each processing
activity. Consent is never the default; contract or legitimate interest
usually applies to contact form processing.

### Consent

- Consent must be freely given, specific, informed, and unambiguous (GDPR
  standard; Uganda, Kenya, Nigeria, SA broadly align).
- Pre-ticked boxes are never valid consent.
- Consent for analytics is required in EEA/UK and in Kenya (ODPC guidance
  has strengthened since 2021); in Uganda, Nigeria, Ghana the consent bar
  is lower but the engine adopts the stricter standard by default.
- Consent must be as easy to withdraw as to give. Provide an obvious opt-out
  link in the cookie notice and in the privacy policy.

### Cookie Notice

The engine's cookie notice pattern:

- No non-essential cookies fire before consent.
- Notice appears at the bottom (not a modal that traps the user).
- Three buttons: Accept all / Reject all / Customise.
- "Reject all" is visually equivalent to "Accept all" — not hidden in a link.
- Granular per-purpose toggles in "Customise" (necessary, analytics,
  marketing, preferences).
- A persistent "Cookie settings" link in the footer lets the user change the
  decision later.
- The notice is served in every language the site ships.

### Data Subject Rights

| Right | Uganda | Kenya | Nigeria | POPIA | GDPR |
|---|---|---|---|---|---|
| Access | yes | yes | yes | yes | yes |
| Rectification | yes | yes | yes | yes | yes |
| Erasure | partial | yes | yes | yes | yes |
| Restriction | yes | yes | yes | yes | yes |
| Portability | yes | yes | yes | yes | yes |
| Object | yes | yes | yes | yes | yes |
| Automated decisions | yes | yes | yes | yes | yes |

The privacy policy describes how to exercise each right, the response SLA,
and the route to escalate to the regulator.

### Data Breach Notification

| Law | Notify DPA within | Notify subject |
|---|---|---|
| Uganda DPPA | 72 hours | when high risk |
| Kenya DPA | 72 hours | when high risk |
| Nigeria DPA 2023 | 72 hours | when high risk |
| POPIA | reasonable; usually 72h in practice | when reasonable |
| GDPR | 72 hours | when high risk |

The incident response playbook lives in
`deploy/references/rollback-runbook.md` for technical and in
`policy-pages/references/incident-response.md` for legal and communication.

### Cross-Border Transfer

- Uganda: transfer allowed if the receiving country provides adequate
  protection, with exceptions.
- Kenya: allowed with safeguards; ODPC has a list of exempt countries.
- Nigeria: NITDA publishes the approved list; standard contractual clauses
  accepted.
- POPIA: allowed if the receiving jurisdiction has comparable protection or
  the subject has consented or a binding contract is in place.
- GDPR: adequacy decisions, SCCs, BCRs, specific derogations.

Implementation: list every sub-processor in the privacy policy with the
country of processing and the transfer mechanism. Common sub-processors:
Google Analytics/Plausible (analytics), a hosting provider, an email
service, a form-delivery service.

### Children's Data

- Under-13 protection is standard across the engine jurisdictions; over-13
  age gating varies.
- When the site collects data from under-18 users, build in age-verification
  and add parental-consent language to the privacy policy.

### Data Retention

Retention limits are stated in the privacy policy per processing activity:

- Contact form submissions: 24 months, then anonymised.
- Analytics (pseudonymous): 26 months default (GA4 aligns here); shorter for
  stricter jurisdictions.
- Server logs: 90 days rolling.

### DPO or Contact Officer

- GDPR: required for large-scale processing; voluntary contact in the
  privacy policy for smaller operators.
- Kenya, Nigeria, Uganda, POPIA: named information officer required; the
  name and contact appear in the privacy policy.

### Registration with the DPA

Some jurisdictions require data controllers to register:

| Law | Registration required? |
|---|---|
| Uganda DPPA | yes (with PDPO) |
| Kenya DPA | yes (ODPC registration fee applies) |
| Nigeria DPA 2023 | yes (NDPC, annual) |
| POPIA | registration of the information officer |
| GDPR | no general registration; DPO notification required in some cases |

The engine's launch checklist includes "registration status" as a field.

## Compliance Implementation Checklist

- [ ] Legal basis stated for every processing activity.
- [ ] Privacy policy covers every jurisdiction.
- [ ] Cookie notice with equivalent accept/reject prominence.
- [ ] Cookie settings persistent link in footer.
- [ ] Data subject rights clearly described.
- [ ] Data breach contact and SLA stated.
- [ ] Cross-border transfers listed.
- [ ] Retention policy stated per processing activity.
- [ ] Information officer named with contact.
- [ ] Registration with DPA verified.
- [ ] Sub-processor list up to date.
- [ ] CMS or author flow to update policy dates when processing changes.

## Signed Off By

Fill per launch and file at
`project-log/launches/<project>/compliance.md`.

| Field | Value |
|---|---|
| Jurisdictions |  |
| DPO / information officer |  |
| Registration status per jurisdiction |  |
| Cookie notice tested | yes / no |
| Privacy policy localised to each language | yes / no |
| Sub-processor list current | yes / no |
| Incident response playbook rehearsed | yes / no |
| Legal review | yes / no / N/A |

## Reading

- Uganda DPPA 2019: https://pdpo.go.ug
- Kenya Data Protection Act 2019: https://www.odpc.go.ke
- Nigeria Data Protection Act 2023: https://ndpc.gov.ng
- POPIA: https://inforegulator.org.za
- GDPR official text: https://eur-lex.europa.eu/eli/reg/2016/679/oj
- `policy-pages/SKILL.md` — produces the public-facing documents.
- `sectors/legal/` — additional regulatory constraints for legal-sector sites.
