# Policy Pages Skill

Design Privacy Policies and Terms of Use that build user trust while protecting your business legally.

## Why Policies Matter

Two distinct purposes:

1. **Legal Protection** — Legally binding agreements and disclosures protecting your business
2. **User Trust** — Transparent communication showing respect for user data and rights

Generic, dense legal jargon kills trust. Modern policies must be: plain language, visually scannable, accessible, mobile-optimized, and contextual (information where users need it).

## Privacy Policy vs Terms of Use

| Document | Purpose | Legal Basis | Audience |
|----------|---------|------------|----------|
| **Privacy Policy** | What data you collect, how you use it, how you protect it, user rights | GDPR, CCPA, COPPA, PIPEDA, LGPD, Privacy Act 1988, PECR | Everyone (required by law in most jurisdictions) |
| **Terms of Use** | Rules governing website use, liability limits, dispute resolution | Contract law, consumer protection, ToS enforceability | Every website visitor (required to be binding) |

## Privacy Policy

### What to Include

Every privacy policy must address these 15 essential elements:

1. **Document identification** — When it was last updated
2. **Company information** — Legal name, physical address, contact info
3. **Information collected** — Data categories (name, email, IP, cookies, etc.)
4. **How information is collected** — Forms, cookies, pixels, third-party sources
5. **How information is used** — Service delivery, marketing, analytics, legal compliance
6. **Legal basis for processing** — Consent, contract, legal obligation, legitimate interest
7. **Data retention** — How long you keep each data type
8. **Third-party sharing** — Who you share with (vendors, advertisers, law enforcement)
9. **User rights** — Access, correction, deletion, portability, opt-out rights (varies by jurisdiction)
10. **Cookies and tracking** — What cookies you use, how to manage them
11. **Children's privacy** — COPPA requirements if collecting data from under-13s
12. **Security measures** — How you protect data (encryption, access controls)
13. **International transfers** — If collecting data globally (GDPR implications)
14. **Contact information** — How to reach your Data Protection Officer (DPO) if required
15. **Policy updates** — How you notify users of changes

### Design Principles

**Plain Language:**
- ❌ "We may leverage third-party intermediaries to facilitate data provisioning and orchestrate analytical aggregation"
- ✅ "We work with Google Analytics to understand how visitors use our site"

**Visual Hierarchy:**
- Use headings consistently (h2 for sections, h3 for subsections)
- Bold key terms when first introduced
- Use bullet points for lists (never paragraph lists)
- Use tables for comparison data (data types and retention periods)
- Add callout boxes for important notices (e.g., "Under GDPR, you have the right to...")

**Scannable Formatting:**
- Max 3-4 sentences per paragraph
- One idea per paragraph
- Use subheadings liberally
- Whitespace between sections
- Summary callout at top: "In short: We collect [X], use it for [Y], keep it [Z] long, and never sell it"

### Jurisdiction-Specific Requirements

**European Union (GDPR)**
- Name and contact info of Data Protection Officer (DPO) or representative
- Explicit consent statement for each processing purpose
- Right to access, correction, deletion, portability, objection
- Data transfer agreements (Standard Contractual Clauses)
- 72-hour breach notification requirement

**United States (CCPA/CPRA)**
- "California residents have the right to know what personal information is collected..."
- Right to delete, right to opt-out of sale, right to non-discrimination
- Notice at collection for each purpose
- Response deadline: 45 days (45-day extension if complex)
- California privacy notice format: specific categories, retention, purposes

**Canada (PIPEDA/PIPEDA-like provincial laws)**
- Express or implied consent required
- Individual must be able to identify purposes before consent
- Right to access and correction
- No use beyond stated purpose without consent

**Australia (Privacy Act 1988, Privacy Act)**
- Australian Privacy Principles (APPs) compliance
- Privacy Policy must be freely available
- Anonymized/de-identified data requirements
- No use/disclosure beyond stated purpose

**Children's Privacy (COPPA - US, similar in EU)**
- If collecting data from under-13s: parental consent required
- Clear statement: "We do not knowingly collect data from children under 13"
- Parental access/deletion rights

**Asia-Pacific (LGPD - Brazil, PDPA - Singapore/Thailand)**
- Transparency and accountability principles
- Lawful basis for processing
- Cross-border transfer restrictions

### Implementation Strategies

**Placement:**
- Footer link (small but always present)
- Separate page: `/privacy` or `/legal/privacy`
- Popup on first visit (optional, not required)
- In-app link (mobile apps must have in-app link)

**Acceptance & Consent:**

For signup forms:
```html
<label>
  <input type="checkbox" name="privacy_consent" required>
  I agree to the <a href="/privacy">Privacy Policy</a>
</label>
```

For just-in-time consent (GDPR):
```html
<div class="consent-notice">
  <h3>We use cookies to improve your experience</h3>
  <p>Our cookies help us analyze traffic and personalize content.</p>
  <button onclick="acceptCookies()">Accept</button>
  <a href="/privacy#cookies">Learn more</a>
</div>
```

**Version Control:**
- Add "Last Updated: [DATE]" at top
- Include changelog: "Updated November 2024: Added AI processing section"
- Email notification of major changes (not required, best practice)

## Terms of Use

### What to Include

Every Terms of Use must address these 15+ essential elements:

1. **Acceptance of terms** — "By using this website, you agree to these terms"
2. **Service description** — What you're providing
3. **User eligibility** — Age requirement (13+, 18+, etc.), jurisdiction restrictions
4. **User rights granted** — "You may view and download content for personal use only"
5. **Prohibited uses** — No illegal activity, scraping, harassment, reverse engineering, etc.
6. **Intellectual property** — Copyright, trademarks; users retain content rights
7. **Warranties disclaimer** — "Services provided 'as is' without warranty"
8. **Limitation of liability** — Liability cap (often: not responsible for indirect/consequential damages)
9. **Indemnification** — "You agree to defend us against claims arising from your use"
10. **Termination rights** — "We may terminate your account at any time for any reason"
11. **Privacy/data handling** — Link to Privacy Policy
12. **Third-party links** — "We're not responsible for external sites"
13. **Dispute resolution** — Governing law, arbitration vs. courts, jurisdiction
14. **Severability** — "If one provision is invalid, the rest remains in effect"
15. **Changes to terms** — How you notify users of updates (email, website notice)

### Design Principles

**Multi-Layer Approach:**
- **Layer 1 - Summary:** Callout box with key points (3-5 bullet points)
- **Layer 2 - Full text:** Complete legal terms
- **Layer 3 - Just-in-time:** Context-specific notices (e.g., "By uploading, you grant us license to display" at upload form)

**Visual Hierarchy:**
- Numbered or bulleted sections for readability
- Bold key phrases: "**You agree that...**, **we are not liable for...**"
- Use icons or callout boxes to highlight important sections
- Tables for comparison (e.g., user rights vs. company rights)

**Plain Language with Legal Precision:**
- ❌ "Notwithstanding anything to the contrary herein contained..."
- ✅ "Even if something else in this agreement says otherwise..."

- ❌ "The Company shall not be liable for any consequential, incidental, indirect, special, or punitive damages..."
- ✅ "We're not responsible for lost profits, data loss, or other indirect damages"

### Jurisdiction-Specific Considerations

**United States**
- Specify governing law: "These terms are governed by [State] law"
- Arbitration clause: "Disputes will be resolved by binding arbitration, not court"
- Class action waiver (enforceable in some states, not all): "You waive the right to participate in class action lawsuits"
- Consumer protection: "Nothing here waives rights given to you by law"

**European Union**
- Consumer rights can't be waived (B2C contracts)
- Dispute resolution: "EU residents can use the online dispute resolution platform"
- GDPR link required: "See our Privacy Policy for GDPR rights"
- "Unfair terms" doctrine: terms must be fair and transparent

**United Kingdom**
- Consumer Rights Act: consumer rights can't be waived
- Data protection link required (UK GDPR)
- Plain language requirement: "These terms must be expressed in plain language"

**Canada**
- Specify governing law: typically "laws of [Province], Canada"
- Consumer protection laws vary by province
- Quebec: different civil law system (not common law)

**Australia**
- Australian Consumer Law applies (can't exclude liability for death/injury)
- Competition and Consumer Act requirements
- Specify: "These terms are governed by the laws of [State]"

**Asia-Pacific (Singapore, Thailand, Hong Kong)**
- Arbitration clauses common and enforceable
- Specify seat of arbitration and applicable law
- Note: substantive consumer protections may apply regardless of terms

### Implementation Strategies

**Placement:**
- Footer link (required)
- Separate page: `/terms` or `/legal/terms`
- Must-read before signup: require explicit acceptance with checkbox
- In-app: mobile apps must have in-app link

**Acceptance Mechanism:**

Required checkbox at signup:
```html
<label>
  <input type="checkbox" name="terms_acceptance" required>
  I have read and agree to the <a href="/terms">Terms of Use</a>
</label>
```

Record acceptance:
```
- timestamp: 2024-11-15T10:30:00Z
- user_id: 12345
- ip_address: 192.168.1.1
- terms_version: 2024-11-15
```

Just-in-time notice (e.g., at file upload):
```html
<div class="notice">
  <strong>By uploading, you agree that:</strong>
  <ul>
    <li>The content doesn't violate anyone's rights</li>
    <li>We can store and display it</li>
  </ul>
  <a href="/terms#user-content">Full terms</a>
</div>
```

**Version Control:**
- Maintain version numbers: "Terms of Use v3.2 (Updated November 2024)"
- Keep archive of all versions (on `/legal/archive` or similar)
- Notify existing users of material changes (best practice, sometimes required by law)
- Email template: "We've updated our Terms. [Link to what changed]. If you don't agree, you can delete your account."

## Accessibility Requirements

- Use semantic HTML: `<h2>`, `<h3>`, proper heading hierarchy
- Alt text on diagrams (e.g., "Flow chart showing data sharing with payment processor")
- Don't rely on color alone (use text, icons, structure)
- Font: minimum 16px body text, sans-serif preferred
- Line height: minimum 1.5x font size
- Use sufficient color contrast (4.5:1 for body text)
- Keyboard navigable: all links clickable via Tab key
- Screen reader compatible: proper ARIA labels on form inputs

## Mobile Optimization

- **Single column layout** on mobile (never horizontal scroll)
- **Responsive text:** use relative units (rem, em, %)
- **Tap targets:** buttons and links minimum 44×44px
- **Touch-friendly:** don't require hover states
- **Progressive disclosure:** collapse sections by default on mobile
- **Print-friendly:** media queries for printing (users print policies often)

## Common Mistakes to Avoid

| ❌ Mistake | ✅ Correct Approach |
|-----------|-------------------|
| Dense legal text with no formatting | Headings, bullet points, callout boxes, tables |
| Hiding privacy policy in footer only | Footer link PLUS prominent page at /privacy |
| Copying another company's policy | Customize to YOUR data practices (Google's policy isn't yours) |
| Outdated dates and version numbers | Update date whenever policy changes, even minor ones |
| Broken links to Privacy Policy in ToS | Test all internal links from terms to privacy |
| No way for users to opt-out | Provide opt-out/unsubscribe mechanisms for email/cookies/tracking |
| Policy says one thing, site does another | Audit: does your site match your policy? (e.g., if you say "no tracking," verify no trackers) |
| No acceptance mechanism for ToS | Require checkbox at signup with timestamp record |
| Using overly technical language | Explain technical terms: "**Cookies** are small files stored on your device..." |
| Not accounting for different jurisdictions | Add jurisdiction-specific sections (e.g., "California Residents" section for CCPA) |

## Audit Checklist

Before launching, verify:

**Privacy Policy:**
- [ ] All data types you collect are listed
- [ ] All third parties who access data are named
- [ ] Legal basis for each processing purpose is stated
- [ ] User rights (access, deletion, etc.) are listed with instructions for exercising them
- [ ] Cookie types and opt-out mechanisms are explained
- [ ] Jurisdiction-specific requirements met (GDPR/CCPA/etc.)
- [ ] Contact info for privacy inquiries is included
- [ ] Document is dated and versioned
- [ ] All links work (to /cookies, /contact, etc.)
- [ ] Mobile-friendly and accessible
- [ ] Written in plain language (no legal jargon)

**Terms of Use:**
- [ ] User eligibility stated (age, geography restrictions)
- [ ] Permitted uses are clear
- [ ] Prohibited uses are explicit (no illegal activity, no scraping)
- [ ] Your IP rights stated
- [ ] Users' content rights stated (do they retain ownership?)
- [ ] Liability limitations included
- [ ] Dispute resolution method specified
- [ ] Governing law specified
- [ ] Requires acceptance via checkbox at signup
- [ ] Acceptance recorded (timestamp, IP, version)
- [ ] Old versions archived
- [ ] Mobile-friendly and accessible
- [ ] Plain language (explain legal terms)

## Maintenance & Updates

**Regular Audit (Quarterly):**
- Do you collect new data types not listed?
- Have you added new third-party integrations?
- Have regulations changed in your jurisdictions?
- Have users complained about unclear sections?

**Update Triggers:**
- New data collection practice
- New third-party vendor
- Regulatory change
- User complaint or legal inquiry
- Major feature update

**Notification:**
- Add "Updated [DATE]" at top
- If major change: email existing users
- Archive old version at `/legal/archive/privacy-v2-2024-01.html`
- Change version number: v3.2 → v3.3

## Reference Files

For detailed implementation guidance, see:
- `privacy-policy-detailed.md` — 15 essential elements with examples, plain language guidelines, legal requirements by jurisdiction
- `terms-of-use-detailed.md` — 15+ elements with implementation examples, jurisdiction-specific guidance, dispute resolution options

Read these when customizing your specific policy documents for your business model and jurisdictions.

## Next Steps

1. Copy `privacy-policy-detailed.md` and `terms-of-use-detailed.md` → customize for your business
2. Write Privacy Policy using the 15 essential elements checklist
3. Write Terms of Use specifying your service, user rights, and liability limits
4. Run accessibility audit (Lighthouse, WAVE)
5. Test mobile rendering
6. Add links to both policies in footer + in signup forms
7. Record acceptance timestamps for both documents
8. Schedule quarterly review

---

**REQUIRED:** Every website must have both documents. These are legal minimums, not optional extras. Build trust through transparency.
