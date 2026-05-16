# Maduuka Marketing Website — Content Generation Prompt

> **Purpose:** Give this prompt to Claude Code inside a scaffolded Maduuka website project to generate all `docs/en/` content files from the existing system documentation.
>
> **Usage:**
>
> 1. Run `.\new-project.ps1 -ProjectName "maduuka-website"` (or `./new-project.sh maduuka-website`)
> 2. `cd maduuka-website`
> 3. Open Claude Code: `claude`
> 4. Paste this entire prompt

---

## Prompt

You are building the marketing website for **Maduuka** — a multi-tenant SaaS bookkeeping and business management platform for small and medium enterprises (SMEs) in East Africa and beyond.

### Source Documentation

Read the following files from the existing Maduuka system to extract accurate product information. Do NOT fabricate features — only document what actually exists:

**Core system docs (read all of these):**

- `C:/wamp64/www/Maduuka/MADUUKA_OVERVIEW.md` — comprehensive feature overview
- `C:/wamp64/www/Maduuka/docs/overview/PROJECT_BRIEF.md` — executive summary
- `C:/wamp64/www/Maduuka/docs/architecture/ARCHITECTURE.md` — system design
- `C:/wamp64/www/Maduuka/docs/architecture/TECH_STACK.md` — technology stack
- `C:/wamp64/www/Maduuka/README.md` — project overview

**Module documentation (read for feature details):**

- `C:/wamp64/www/Maduuka/docs/pharmacy/PHARMACY_MODULE_SUMMARY.md` — pharmacy module
- `C:/wamp64/www/Maduuka/PRODUCT_TYPES_QUICK_REFERENCE.md` — product types (stock, service, fee)
- `C:/wamp64/www/Maduuka/docs/business/BUSINESS_TYPES_AND_TEMPLATES.md` — business category templates

**Mobile app (for mobile features):**

- `C:/wamp64/www/Maduuka-App/README.md` — Android app overview

### What You Are Generating

Generate all 11 content files in `docs/en/` for a **marketing website** that sells Maduuka to prospective customers. This is NOT technical documentation — it is conversion-focused marketing copy that speaks to business owners.

### Brand Identity

- **Product name:** Maduuka (means "Shops" in Luganda)
- **Tagline:** Derive a compelling tagline from the documentation (e.g., "Your Complete Business Management Platform" or similar — read the docs first)
- **Industry:** SaaS / Business Management Software
- **Target market:** Small and medium businesses in East Africa (Uganda, Kenya, Tanzania, DRC, Rwanda) — expanding to other markets
- **Primary audience:** Business owners, shop managers, franchise operators, pharmacists, restaurant owners
- **Tone:** Professional, approachable, confident. Speak to business owners who may not be tech-savvy. Emphasise simplicity, reliability, and growth.
- **Developer/Company:** Peter Bamuhigire (sole developer — present as a company, not an individual)
- **Location:** Kampala, Uganda

### Content Direction for Each File

#### 1. `docs/en/company-profile.md`

- Position Maduuka as a technology company building business management tools for African SMEs
- Emphasise the mission: empowering small businesses with enterprise-grade tools at affordable prices
- Values: Simplicity, Reliability, Security, Growth
- Key numbers: extract from documentation (franchises served, modules available, languages supported, uptime)
- Social media: leave placeholders for now
- Contact: use Kampala, Uganda as location

#### 2. `docs/en/pages.md`

Design a marketing website with these pages:

- **Home** — hero with value proposition, feature highlights (POS, Inventory, Accounting), social proof, pricing CTA, testimonials
- **Features** — detailed breakdown of all modules with icons and descriptions
- **Pricing** — subscription tiers (leave pricing as placeholders, but structure for Free Trial / Starter / Professional / Enterprise)
- **Industries** — showcase the 4 supported business types: Retail/Shops, Pharmacy, Restaurant, Services
- **About** — company story, mission, the problem Maduuka solves
- **Contact** — contact form, location, demo request
- **Blog** (optional section placeholder)

Nav order: Home, Features, Industries, Pricing, About, Contact
Primary CTA: "Start Free Trial" linking to /contact or a signup page

#### 3. `docs/en/style-brief.md`

- Mood: Modern, trustworthy, African-tech. Think Flutterwave, Paystack, Chipper Cash — confident African tech companies
- Colours: Suggest bold, warm colours that reflect African tech (not generic blue SaaS). Consider deep greens, warm oranges, rich purples, or earthy tones
- Dark mode: yes (SaaS websites benefit from dark hero sections)
- Preferred style: Clean, spacious, modern SaaS marketing. Large typography, generous whitespace, subtle animations
- References: Look at flutterwave.com, paystack.com, mono.co for African SaaS inspiration
- Avoid: Generic corporate blue, stock photography of white people in offices, cluttered layouts

#### 4. `docs/en/services.md`

Present these as "modules" or "features" rather than "services":

1. **Point of Sale (POS)** — Touch-friendly checkout, barcode scanning, multiple payment methods (cash, bank, mobile money), receipt printing, session management with audit compliance
2. **Inventory Management** — Real-time stock tracking across multiple warehouses, batch/expiry management, automated reorder alerts, Bill of Materials (BOM) support
3. **Sales & Invoicing** — Invoice generation, payment tracking, credit sales management, customer profiles
4. **Financial Management** — Real-time account balances, transaction history, expense tracking, P&L reports, balance sheets
5. **Pharmacy Module** — Prescription management, controlled substance tracking, patient safety checks, FIFO batch selection, refill reminders
6. **Restaurant Operations** — Kitchen Order Tickets (KOT), table/area management, dine-in/takeaway/delivery, bill splitting
7. **Asset Management** — Full lifecycle tracking, automated depreciation, assignment tracking, disposal with gain/loss calculations
8. **Multi-Location Management** — Franchise isolation, per-branch reporting, centralised admin, subscription-based scaling

Extract accurate feature details from the system documentation. Each module description should include 4-6 bullet points of actual capabilities.

#### 5. `docs/en/team-profiles.md`

- Peter Bamuhigire — Founder & Lead Developer. Brief bio about building Maduuka to solve real problems for African businesses. Include LinkedIn placeholder.
- Add 2-3 placeholder team member slots for future expansion

#### 6. `docs/en/contact.md`

- Location: Kampala, Uganda (leave specific address as placeholder)
- Phone: placeholder
- Email: placeholder (<info@maduuka.com> or similar)
- Hours: Monday-Friday 8:00 AM - 6:00 PM EAT, Saturday 9:00 AM - 1:00 PM
- Include a "Request a Demo" section — this is a SaaS product, demos are the primary conversion path
- Include a "Support" section for existing customers

#### 7. `docs/en/testimonials.md`

Create the file with a header and a note requesting real testimonials:

```markdown
# Testimonials

<!-- CLIENT ACTION REQUIRED: Please provide 3-5 real customer testimonials.
     Ideal sources: a retail shop owner, a pharmacy manager, a restaurant owner,
     a franchise operator with multiple branches, a distributor/network marketer.
     Include: customer name, location, business type, and their quote.
     We will rewrite for clarity and translate into all enabled languages. -->
```

Never fabricate testimonials — even as placeholders with realistic names. The client must provide real quotes.

#### 8. `docs/en/portfolio.md`

Reframe as "Case Studies" or "Success Stories" — create 3 placeholder case studies:

- A grocery store chain managing 5 branches
- A pharmacy implementing controlled substance tracking
- A restaurant group using KOT and table management

Include metrics placeholders: "Reduced stock discrepancies by X%", "Saved Y hours per week on bookkeeping", etc.

#### 9. `docs/en/faq.md`

Write 10-12 FAQs covering:

- What is Maduuka?
- What types of businesses can use Maduuka?
- How does multi-branch management work?
- Is my data secure?
- What payment methods does the POS support?
- Can I use Maduuka offline? (mention the mobile app's offline-first design)
- How do I get started?
- What languages does Maduuka support? (English, French, Arabic, Swahili, Spanish)
- Is there a mobile app? (yes — Android, with iOS planned)
- How does pricing work?
- Can I import my existing data?
- Do you offer training and support?

Answer each FAQ accurately based on the system documentation.

#### 10. `docs/en/about-story.md`

Tell the Maduuka origin story:

- Problem: African SMEs struggle with disconnected tools — separate POS, separate inventory spreadsheets, separate accounting. Or expensive foreign software that doesn't understand African business (mobile money, franchise models, local languages)
- Solution: Maduuka — a single, affordable platform built IN Africa FOR African businesses
- Mission: Empower every small business with the tools they need to grow
- Vision: The operating system for African commerce
- Values: Simplicity (easy for non-tech users), Security (bank-grade data isolation), Flexibility (modular — use only what you need), Local-First (built for African markets)
- Milestones: leave as placeholders but structure for: founding date, first customer, first 50 franchises, mobile app launch, 5-language support, pharmacy module launch

#### 11. `docs/en/gallery.md`

Create placeholder entries for:

- Dashboard screenshots (category: "Platform")
- POS interface screenshots (category: "POS")
- Inventory management views (category: "Inventory")
- Mobile app screenshots (category: "Mobile")
- Financial reports (category: "Reports")

Mark as `[SCREENSHOT NEEDED]` with descriptions of what each should show.

### Additional Files to Generate

#### `docs/i18n-config.md`

Update the i18n config to enable all 3 languages (en, fr, sw). Set English as default. Note that the Maduuka system itself supports 5 languages but the marketing website starts with 3.

#### `docs/seo.md`

Fill in the SEO template with:

- Site URL: `https://maduuka.com` (placeholder)
- Schema type: `SoftwareApplication`
- Per-page meta titles and descriptions optimised for:
  - "bookkeeping software Uganda"
  - "POS system East Africa"
  - "inventory management software Africa"
  - "small business management platform"
  - "pharmacy management software"
  - "restaurant POS system"

### Quality Standards

1. **Accuracy:** Every feature mentioned must exist in the Maduuka codebase documentation. Do not invent features.
2. **Marketing tone:** Write for business owners, not developers. "Track your stock in real time across all your shops" not "Real-time inventory synchronisation via database triggers."
3. **East African context:** Use examples relevant to the market — mobile money (MTN, Airtel), Uganda shillings, Kampala locations, franchise models common in the region.
4. **Placeholders clearly marked:** Use `[PLACEHOLDER]` for any content that needs real data (testimonials, exact metrics, team photos, pricing).
5. **British English:** As per the language-standards skill — colour, organisation, travelling, etc.

### After Generation

Once all files are generated:

1. Review each file for accuracy against the Maduuka documentation
2. Update `docs/i18n-config.md` with the translation status table
3. Do NOT start building the website yet — content review comes first
4. Report a summary of what was generated and what needs human input (photos, real testimonials, pricing, exact contact details)
