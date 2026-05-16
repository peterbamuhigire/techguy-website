# Chwezi Core Systems Website — Content Generation Prompt

> **Purpose:** Give this prompt to Claude Code inside a scaffolded Chwezi website project to generate all `docs/en/` content files for the company website.
>
> **Usage:**
>
> 1. Run `.\new-project.ps1 -ProjectName "chwezi-website"` (or `./new-project.sh chwezi-website`)
> 2. `cd chwezi-website`
> 3. Open Claude Code: `claude`
> 4. Paste this entire prompt

---

## Prompt

You are building the corporate website for **Chwezi Core Systems** — a Technology, Business & Security consultancy based in Kampala, Uganda, serving organisations across East Africa and beyond.

### Source Material

There is no existing codebase documentation for Chwezi. All company information is provided in this prompt. Do NOT fabricate services, products, or capabilities beyond what is described here.

### What You Are Generating

Generate all 11 content files in `docs/en/` for a **professional services website** that positions Chwezi as a trusted technology and security partner. This is a conversion-focused B2B site that speaks to business owners, executives, and IT decision-makers who need reliable technology infrastructure, business consulting, and security solutions.

### Brand Identity

- **Company name:** Chwezi Core Systems
- **Domain:** chwezicore.com
- **Tagline:** "Technology, Business & Security Consultants"
- **Industry:** ICT Consulting / Professional Services
- **Location:** Kampala, Uganda
- **Contact:** info@chwezicore.com | +256 784 464178
- **Primary audiences:**
  - Business owners and executives needing ICT strategy, ERP solutions, or digital transformation
  - Organisations requiring cybersecurity assessments, CCTV, or physical security systems
  - SMEs looking for affordable, proven software products (Maduuka, Aqar)
  - Companies needing reliable technical support and infrastructure management
- **Tone:** Professional, technically competent, confident. Not stiff or corporate — approachable experts who understand the East African business environment. Speak plainly about complex technology. Emphasise reliability, practical results, and long-term partnership.
- **Company positioning:** Present Chwezi as a company, not an individual. The founder is Peter Bamuhigire but the brand is the company.
- **Three pillars:** Technology, Business, Security — these are the company's core divisions and should structure the site navigation and messaging.

### Software Products

Chwezi develops and sells software products. Only two are fully commercial — all others are presented as "Coming Soon" on the product roadmap.

| Product | Status | Description |
|---------|--------|-------------|
| **Maduuka** | **Commercial** | Multi-tenant SaaS bookkeeping and business management platform for SMEs. Point of Sale, Inventory Management, Sales & Invoicing, Financial Management, Pharmacy Module, Restaurant Operations, Asset Management, Multi-Location Management. Web + Android app. |
| **Aqar** | **Commercial** | Property Management System for real estate professionals. Tenant management, lease tracking, property maintenance, financial reporting. |
| Other systems | **Coming Soon** | Present as a product roadmap section — "We're building more tools for African businesses. Stay tuned." No specific product names or details for unreleased products. |

**Important:** For Maduuka, you may reference its capabilities broadly (POS, inventory, bookkeeping, multi-branch) but do NOT link to or reference the Maduuka marketing website. Chwezi is the vendor; Maduuka is their product. For Aqar, describe it as a property management platform — do not fabricate features beyond what is stated above.

### Service Divisions

#### 1. Technology

**ERP Software & Enterprise Systems**
- Design, customise, and implement software solutions that streamline operations, improve data visibility, and support informed decision-making
- Systems covering finance, inventory, HR, operations, and reporting
- Tailored to organisational size and sector
- Implementation, training, and ongoing support

**Software Products**
- Maduuka — bookkeeping and POS for small and growing businesses (commercial)
- Aqar — property management system for real estate professionals (commercial)
- Product roadmap with more solutions coming soon

**Website Development**
- Professional design with search visibility optimisation
- Performance enhancement and security standards
- Use of generative AI to refine grammar, punctuation, SEO structure, and accessibility (AI-assisted, not AI-generated raw content)
- Responsive, mobile-first development

**ICT Strategy & Advisory**
- ICT governance and policy development
- Digital transformation strategy
- System audits and compliance assessments
- Procurement advisory — helping clients make informed technology investment decisions

**Technical Operational Support**
- Software and systems development
- Infrastructure and networking (LAN, WAN, servers, cloud)
- Cybersecurity implementation
- Helpdesk support, monitoring, and system maintenance

**ICT Recruitment Support**
- Role definition and organisational structure advisory
- Skills requirements analysis
- Recruitment planning for sustainable technology management

#### 2. Business Consulting

- Business process analysis and optimisation
- Digital transformation advisory
- Technology-aligned business strategy
- Operational efficiency consulting
- Help organisations align technology investments with business goals

#### 3. Security

**Cybersecurity & Digital Defence**
- Risk assessments
- Network security (firewalls, anti-malware, intrusion detection)
- Incident response planning
- Security policy development

**CCTV & Video Surveillance**
- Surveillance system design for monitoring, deterrence, and evidence collection
- Commercial, institutional, and residential environments
- Professional installation and maintenance

**Security Technologies**
- Access control systems
- Intruder detection
- Perimeter security
- Intercom systems

**Security Consultancy & Risk Audits**
- Security assessments and risk analysis
- Security policy development
- Advisory support for compliance
- Planning and assessment

**Executive Protection** *(Coming Soon)*
- Safeguarding high-profile individuals
- Present as an emerging service — "launching soon"

**Residential Security** *(Coming Soon)*
- Smart home security and automation integrations
- Physical security for homes and families
- Present as an emerging service — "launching soon"

### Key Differentiators

These should be woven throughout the site, not listed as bullet points:

1. **Integrated expertise** — Technology + Business + Security under one roof. Most consultancies specialise in one; Chwezi covers all three, which means joined-up solutions.
2. **Practical, regional understanding** — Deep knowledge of the East African business environment, regulatory landscape, and infrastructure realities.
3. **Own software products** — Not just advisors — Chwezi builds and sells production software (Maduuka, Aqar), proving technical capability.
4. **Full-cycle delivery** — From planning and strategy through implementation to ongoing support. Long-term partnership, not hit-and-run consulting.
5. **AI-augmented workflows** — Uses generative AI responsibly in website development and content processes, demonstrating modern practices.

### Content Direction for Each File

#### 1. `docs/en/company-profile.md`

- Position Chwezi as a technology and security consultancy with deep roots in East Africa
- Three-pillar structure: Technology, Business, Security
- Mission: Delivering solutions that enhance efficiency, security, and confidence in operations through innovative technology and unparalleled support
- Vision: The trusted technology partner for African organisations — making world-class ICT and security accessible
- Values: Technical Excellence, Integrity, Partnership, Practical Innovation, Security-First Thinking
- Key numbers: 3 service divisions, 2 commercial software products, full-cycle delivery (strategy → implementation → support)
- Contact: info@chwezicore.com, +256 784 464178, Kampala, Uganda
- Social media: leave as `[PLACEHOLDER]`

#### 2. `docs/en/pages.md`

Design a professional services website with these pages:

- **Home** — Hero with three-pillar value proposition (Technology, Business, Security), software products showcase (Maduuka + Aqar), key differentiators, client trust signals, consultation CTA
- **Technology** — Full technology services breakdown: ERP/enterprise systems, software products (Maduuka commercial, Aqar commercial, coming soon roadmap), website development, ICT strategy, technical support, recruitment support
- **Business** — Business consulting services: process optimisation, digital transformation, strategy advisory
- **Security** — Full security services: cybersecurity, CCTV/surveillance, access control, security consultancy, executive protection (coming soon), residential security (coming soon)
- **About** — Company story, mission, values, team, why Chwezi
- **Contact** — Contact form, email, phone, location, consultation request

Nav order: Home, Technology, Business, Security, About, Contact
Primary CTA: "Request a Consultation" or "Get in Touch" linking to /contact
Secondary CTA: "Explore Our Solutions" linking to /technology

#### 3. `docs/en/style-brief.md`

- Mood: Professional, technical, trustworthy. Think clean engineering meets African confidence. Not cold or sterile — warm professionalism.
- Colours: Suggest a palette rooted in the current brand blue (#046BD2) but evolved — deep navy or midnight blue as primary, paired with a warm accent (amber, copper, or teal). Clean whites and light greys for breathing room. The blue should feel authoritative and secure.
- Dark mode: Optional dark hero sections — professional services sites benefit from a confident dark header transitioning to clean light content.
- Preferred style: Clean, spacious, modern. Large typography for credibility. Generous whitespace. Subtle geometric or circuit-inspired patterns (technology feel) without being gimmicky. Professional photography style.
- Typography: A strong, modern sans-serif for headings (confident, not playful). A clean, readable body font. Avoid decorative or overly light fonts.
- Photography direction: Technology infrastructure, server rooms, security cameras, professional office environments, Kampala cityscape, African business contexts. Real-world, not stock.
- References: Look at Andela.com, Interswitch.com, or similar African tech companies — professional, modern, confident.
- Avoid: Generic corporate stock photos (handshakes, people pointing at screens), cluttered layouts, overly technical jargon in design, cheap security company aesthetics (red/black aggressive styling).

#### 4. `docs/en/services.md`

Present as three divisions, each with detailed sub-services:

1. **Technology Solutions** — ERP implementation, software products (Maduuka — bookkeeping & POS for SMEs; Aqar — property management for real estate), website development (AI-assisted), ICT strategy & advisory, technical support & infrastructure, ICT recruitment support
2. **Business Consulting** — Business process analysis, digital transformation advisory, technology-aligned strategy, operational efficiency, procurement advisory
3. **Security Services** — Cybersecurity & digital defence (risk assessments, network security, incident response), CCTV & video surveillance (design, installation, maintenance), security technologies (access control, intruder detection, perimeter security), security consultancy & risk audits, executive protection (coming soon), residential security (coming soon)

Each sub-service should include 3-5 bullet points of specific capabilities. Mark "Coming Soon" services clearly with a badge or label.

#### 5. `docs/en/team-profiles.md`

- **Peter Bamuhigire** — Founder & Chief Technology Officer. Brief bio about building Chwezi to deliver integrated technology and security solutions for African organisations. Emphasise technical depth across software engineering, infrastructure, and security. Include LinkedIn placeholder.
- Add 3-4 placeholder team member slots:
  - Lead Software Engineer — `[PLACEHOLDER]`
  - Cyber Security Expert — `[PLACEHOLDER]`
  - Business Consultant — `[PLACEHOLDER]`
  - Technical Support Lead — `[PLACEHOLDER]`
- Mark all placeholders clearly as `[PLACEHOLDER — replace with real profile and photo]`

#### 6. `docs/en/contact.md`

- **Email:** info@chwezicore.com
- **Phone:** +256 784 464178 (also WhatsApp)
- **Location:** Kampala, Uganda (leave specific address as `[PLACEHOLDER]`)
- **Hours:** Monday–Friday 8:00 AM – 6:00 PM EAT, Saturday 9:00 AM – 1:00 PM
- Include a prominent "Request a Consultation" section — this is a consultancy, the primary conversion is booking a consultation
- Include separate enquiry paths:
  - "Technology Solutions" — for ICT, software, website projects
  - "Security Assessment" — for security audits, CCTV, access control
  - "Business Consulting" — for strategy, digital transformation
- Social media: `[PLACEHOLDER]`

#### 7. `docs/en/testimonials.md`

Create the file with a header and a note requesting real testimonials:

```markdown
# Testimonials

<!-- CLIENT ACTION REQUIRED: Please provide 3-5 real customer testimonials.
     Ideal sources: a Maduuka POS user, an Aqar property management client,
     a cybersecurity assessment client, a CCTV/access control client,
     an ICT strategy engagement client.
     Include: customer name, location, organisation, and their quote.
     We will rewrite for clarity and translate into all enabled languages. -->
```

Never fabricate testimonials — even as placeholders with realistic names. The client must provide real quotes.

#### 8. `docs/en/portfolio.md`

Reframe as "Case Studies" or "Projects" — create 4 placeholder case studies:

- **ERP Implementation for a Retail Chain** — deploying Maduuka across multiple branches, inventory accuracy improvements, bookkeeping time saved
- **Property Management Digitalisation** — implementing Aqar for a real estate company, streamlined tenant management and financial reporting
- **Corporate Cybersecurity Overhaul** — security assessment, firewall deployment, incident response plan, policy development for a mid-sized organisation
- **Integrated Security System for a Commercial Complex** — CCTV design, access control, perimeter security, monitoring setup

Include metrics placeholders: "Reduced manual bookkeeping by X hours/week", "Secured Y endpoints across Z locations", etc. Mark as `[PLACEHOLDER — replace with real project details]`.

#### 9. `docs/en/faq.md`

Write 12-15 FAQs covering:

**General:**
- What does Chwezi Core Systems do?
- Where is Chwezi based and what regions do you serve?
- How is Chwezi different from other ICT consultancies?
- Do you work with small businesses or only large organisations?

**Technology:**
- What is Maduuka and who is it for?
- What is Aqar and who is it for?
- Do you build custom software?
- Can you help us choose the right technology for our business?
- Do you provide ongoing support after implementation?

**Security:**
- What does a cybersecurity assessment involve?
- Do you install and maintain CCTV systems?
- Can you secure both our digital and physical infrastructure?
- What is your approach to security consulting?

**Engagement:**
- How does a typical consulting engagement start?
- What are your pricing models? (Answer: project-based, retainer, or subscription depending on service — contact for a quote)

Answer each FAQ clearly and concisely. Emphasise the consultation-first approach — Chwezi assesses needs before proposing solutions.

#### 10. `docs/en/about-story.md`

Tell the Chwezi story:

- **The Name:** "Chwezi" — reference the Chwezi Empire, one of East Africa's most advanced ancient civilisations known for their sophistication in governance and infrastructure. The name reflects a commitment to building sophisticated, enduring systems.
- **The Problem:** African organisations face fragmented technology — separate vendors for software, networking, security, and consulting. Expensive international firms that don't understand local realities. Or cheap providers that cut corners. No single partner who combines deep technical expertise with practical business understanding and security awareness.
- **The Solution:** Chwezi Core Systems — one partner covering Technology, Business, and Security. Built in East Africa, for East African businesses, with international standards.
- **The Approach:** Full-cycle delivery. Not just advice — implementation, support, and long-term partnership. Chwezi builds its own software (Maduuka, Aqar), proving that they practise what they preach.
- **Values:**
  - Technical Excellence — deep expertise, not surface-level knowledge
  - Integrity — honest assessments, realistic timelines, no overselling
  - Partnership — long-term relationships, not transactional engagements
  - Practical Innovation — adopt technology that solves real problems, not buzzword-driven trends
  - Security-First — every solution considers security from day one
- **Milestones:** leave as placeholders — founding date, first major client, Maduuka launch, Aqar launch, security division launch, key certifications
- **Vision:** The trusted technology and security partner for African organisations

#### 11. `docs/en/gallery.md`

Create placeholder entries across categories:

- **Technology** — Server room setups, network installations, software dashboards (Maduuka POS, Aqar interface) — mark as `[TECHNOLOGY PHOTO NEEDED]`
- **Security** — CCTV installations, access control systems, security assessments in progress — mark as `[SECURITY PHOTO NEEDED]`
- **Team** — Team at work, office environment, training sessions — mark as `[TEAM PHOTO NEEDED]`
- **Projects** — Client site installations, before/after technology implementations — mark as `[PROJECT PHOTO NEEDED]`
- **Office** — Chwezi office, Kampala context, workspace — mark as `[OFFICE PHOTO NEEDED]`

Include descriptions of what each photo should convey. Emphasise professional, real-world settings — not stock photography.

### Additional Files to Generate

#### `docs/i18n-config.md`

Update the i18n config to enable **2 languages: English (en) and French (fr)**. Set English as default. Disable Kiswahili (sw). Chwezi serves both anglophone and francophone East/Central African markets.

#### `docs/seo.md`

Fill in the SEO template with:

- Site URL: `https://chwezicore.com`
- Schema type: `ProfessionalService` + `Organization`
- Per-page meta titles and descriptions optimised for:
  - "ICT consultancy Uganda"
  - "technology consulting East Africa"
  - "cybersecurity services Uganda"
  - "CCTV installation Kampala"
  - "ERP implementation East Africa"
  - "business management software Uganda"
  - "property management system Africa"
  - "IT support services Kampala"
  - "security consulting Uganda"
  - "digital transformation consulting Africa"
  - "POS system Uganda" (for Maduuka)
  - "access control systems Uganda"

### Quality Standards

1. **Accuracy:** Only describe services and products documented in this prompt. Do not invent capabilities, certifications, or client numbers.
2. **Professional tone:** Write for decision-makers — business owners, IT managers, executives. "We assess your security posture and implement targeted protections" not "We do hacking stuff and fix computers."
3. **East African context:** Use examples relevant to the market — Kampala businesses, regional regulations, local infrastructure realities, East African Community context. Authentic, not tokenistic.
4. **Coming Soon clarity:** Executive Protection and Residential Security are clearly marked as emerging/coming soon. Future software products are "on the roadmap" — no names, no details, no timelines.
5. **Product accuracy:** Maduuka is a bookkeeping & POS platform for SMEs. Aqar is a property management system. Do not fabricate features for either beyond what is stated in this prompt.
6. **Placeholders clearly marked:** Use `[PLACEHOLDER]` for any content that needs real data (testimonials, exact milestones, team photos, certifications, client logos, specific address).
7. **British English:** As per the language-standards skill — colour, organisation, travelling, etc.
8. **Three-pillar consistency:** Every page should reinforce the Technology + Business + Security structure. This is the company's identity.

### After Generation

Once all files are generated:

1. Review each file for accuracy against this prompt — no invented services or inflated claims
2. Verify all "Coming Soon" services are properly labelled
3. Verify Maduuka and Aqar descriptions are accurate and not over-detailed
4. Update `docs/i18n-config.md` with the translation status table
5. Do NOT start building the website yet — content review comes first
6. Report a summary of what was generated and what needs human input:
   - Real testimonials from actual clients
   - Team member profiles and photos
   - Founding date and milestone dates
   - Certifications and credentials
   - Office photos, project photos, technology photos
   - Specific office address in Kampala
   - Social media links
   - Client logos for trust section (with permission)
