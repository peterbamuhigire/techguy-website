# Digital Marketing & Social Media Strategy Service Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add Business Planning & Strategy and Digital Marketing & Social Media Strategy as distinct service offerings — updating the services page and creating a full dedicated page for the digital marketing service.

**Architecture:** Copy 4 new photos to src/assets/images/services/, update _catalog.json, rename "Business Consulting" to "Business Planning & Strategy" on services.astro, add a new Digital Marketing section with cool link, create digital-marketing-strategy.astro with full copy provided by client.

**Tech Stack:** Astro, Tailwind CSS v4 (navy/gold palette), Alpine.js, Astro Image component

---

### Task 1: Copy photos to assets and update catalog

**Files:**
- Copy: `photo-bank/marketing-digital-technology-business.jpg` → `src/assets/images/services/digital-marketing-1.jpg`
- Copy: `photo-bank/notebook-with-tools-notes-about-digital-marketing-concept.jpg` → `src/assets/images/services/digital-marketing-2.jpg`
- Copy: `photo-bank/man-holding-social-media-icons-with-smart-phone.jpg` → `src/assets/images/services/social-media-1.jpg`
- Copy: `photo-bank/hands-holding-smartphone-social-media-concept.jpg` → `src/assets/images/services/social-media-2.jpg`
- Modify: `src/assets/images/_catalog.json` — add 4 new entries

**Step 1: Copy photos**

```bash
cp "photo-bank/marketing-digital-technology-business.jpg" "src/assets/images/services/digital-marketing-1.jpg"
cp "photo-bank/notebook-with-tools-notes-about-digital-marketing-concept.jpg" "src/assets/images/services/digital-marketing-2.jpg"
cp "photo-bank/man-holding-social-media-icons-with-smart-phone.jpg" "src/assets/images/services/social-media-1.jpg"
cp "photo-bank/hands-holding-smartphone-social-media-concept.jpg" "src/assets/images/services/social-media-2.jpg"
```

**Step 2: Update _catalog.json** — add these 4 entries to the `images` array:

```json
{
  "filename": "digital-marketing-1.jpg",
  "path": "src/assets/images/services/digital-marketing-1.jpg",
  "dimensions": { "width": 2222, "height": 1390 },
  "alt": { "en": "Digital marketing technology and business growth concept", "fr": "Technologie de marketing numérique et croissance des affaires" },
  "role": "featured",
  "used_on": ["digital-marketing-strategy"],
  "notes": "Wide shot of digital marketing tech concept — used as hero/section image on digital marketing service page"
},
{
  "filename": "digital-marketing-2.jpg",
  "path": "src/assets/images/services/digital-marketing-2.jpg",
  "dimensions": { "width": 2222, "height": 1528 },
  "alt": { "en": "Notebook with digital marketing strategy notes and tools", "fr": "Cahier avec notes de stratégie de marketing numérique" },
  "role": "featured",
  "used_on": ["digital-marketing-strategy"],
  "notes": "Notebook and planning tools — used for strategy/planning sections on digital marketing page"
},
{
  "filename": "social-media-1.jpg",
  "path": "src/assets/images/services/social-media-1.jpg",
  "dimensions": { "width": 2222, "height": 1026 },
  "alt": { "en": "Man holding social media icons with smartphone", "fr": "Homme tenant des icônes de médias sociaux avec smartphone" },
  "role": "featured",
  "used_on": ["digital-marketing-strategy", "services"],
  "notes": "Smartphone with social media icons — used for social media strategy service section"
},
{
  "filename": "social-media-2.jpg",
  "path": "src/assets/images/services/social-media-2.jpg",
  "dimensions": { "width": 2222, "height": 1502 },
  "alt": { "en": "Hands holding smartphone with social media concept", "fr": "Mains tenant un smartphone avec concept de médias sociaux" },
  "role": "featured",
  "used_on": ["digital-marketing-strategy", "services"],
  "notes": "Hands holding phone — social media concept image for services page digital marketing section"
}
```

**Step 3: Commit**

```bash
git add src/assets/images/services/ src/assets/images/_catalog.json
git commit -m "feat: add digital marketing photos to asset catalog"
```

---

### Task 2: Update services.astro — rename Business Consulting + add Digital Marketing section

**Files:**
- Modify: `src/pages/en/services.astro`

**What to change:**

**2a. Rename import and update imports at top of file:**
- Add imports for the 4 new images:
```astro
import digitalMktImg from '@/assets/images/services/social-media-2.jpg';
```
(Use `social-media-2.jpg` as the services page thumbnail for digital marketing)

**2b. Rename Section 3 — change heading from "Business Consulting" to "Business Planning & Strategy"**

Change:
- `<h2>` heading text from `Business Consulting` to `Business Planning & Strategy`
- Update the paragraph text to focus on business planning, proposals, and strategic planning
- Update deliverables list to match the Business Planning & Strategy focus:
  - Business plan development (bankable plans for banks, DFIs, investors)
  - Strategic planning & objective setting
  - Business proposals & grant applications
  - Market research & feasibility studies
  - M&E framework design
  - Pitch deck development
  - Business process analysis

Keep the existing gold callout box linking to `/en/business-planning-consulting-service/` — update its text to "Full Business Planning Service →"

**2c. Add new Service 5 — Digital Marketing & Social Media Strategy**

Insert a new section AFTER the Business Planning section (before Property Management), using `bg-warm-cream` (alternating). The section should have:
- Section id: `digital-marketing`
- Image on the left (desktop), text on right (same alternating pattern as ICT Consulting)
- Heading: "Digital Marketing & Social Media Strategy"
- Paragraph: intro copy from the client's content (condensed for services page)
- Deliverables list:
  - Social media strategy & content planning
  - Digital marketing strategy (full-funnel)
  - Platform playbooks (WhatsApp, Facebook, Instagram, LinkedIn, TikTok)
  - WhatsApp Business marketing systems
  - Content marketing roadmaps
  - ROI measurement frameworks
  - Training & capacity building
- A "cool link" callout box (gold bordered, same style as business planning callout) linking to `/en/digital-marketing-strategy/`:
  - Label: "Full Digital Marketing Service"
  - Description: "A complete digital marketing operation — not a collection of disconnected tactics. Social media strategy, platform playbooks, WhatsApp marketing, and training for East African businesses."
  - Link text: "Explore Digital Marketing Services →"
- Standard amber CTA button: "Book a Consultation →"

**Step 1: Make all changes to services.astro**

See exact code in Task 2 implementation notes below.

**Step 2: Verify build**
```bash
npm run build 2>&1 | tail -20
```
Expected: no errors

**Step 3: Commit**
```bash
git add src/pages/en/services.astro
git commit -m "feat: rename business consulting to Business Planning & Strategy, add digital marketing service"
```

---

### Task 3: Create digital-marketing-strategy.astro

**Files:**
- Create: `src/pages/en/digital-marketing-strategy.astro`

**Page structure** (follow business-planning-consulting-service.astro as template):

1. **HERO** — dark navy, geo-pattern overlay
   - Badge: "Digital Marketing & Social Media Strategy"
   - H1: "Stop guessing. Start growing."
   - Subheading: "I help businesses across Uganda and East Africa build digital marketing and social media strategies that generate real, measurable results — not just likes and impressions."
   - Two CTA buttons: "Get a Free Audit →" (amber-accent) + "See How I Can Help ↓" (ghost/outline)
   - Image: `digital-marketing-1.jpg`

2. **WHO I AM** — warm-white section, 2-col grid (text left, image right)
   - Heading: "Hi, I'm Peter."
   - 3 paragraphs from client copy (the intro/positioning section)
   - Image: `digital-marketing-2.jpg`

3. **WHAT I DO** — intro heading on warm-cream, then 4 service cards below (2x2 grid on desktop, stack on mobile):
   - Service 1: Social Media Strategy (icon: chart/bar, image: social-media-1.jpg)
   - Service 2: Digital Marketing Strategy (icon: megaphone/speaker)
   - Service 3: Platform Playbooks (icon: device/phone)
   - Service 4: Training (icon: academic cap)

   Each card: heading, sub-heading, deliverables list (checkmarks), "This service is right for you if:" highlighted box

4. **HOW I WORK** — dark navy section, 4-step horizontal timeline (same visual as services.astro process steps)
   - Step 1: Free Audit
   - Step 2: Strategy
   - Step 3: Delivery
   - Step 4: Review and Optimise

5. **WHY WORK WITH ME** — warm-white, 2x2 grid of reason cards (icon + title + body)
   - I know this market
   - You deal with me directly
   - I focus on outcomes, not activity
   - I am honest with you
   - I am precise and fast (5th card, full-width or centered)

6. **SECTORS** — warm-cream, simple list/grid of 8 sectors with icons

7. **CTA** — dark navy
   - Heading: "Ready to grow?"
   - Body copy from client
   - Primary CTA: "Request Your Free Audit →" (links to /en/contact/)
   - Secondary CTA: "Book a 20-minute call →" (links to /en/contact/)

**Step 1: Write the full page file** (complete Astro component)

**Step 2: Verify build**
```bash
npm run build 2>&1 | tail -20
```

**Step 3: Commit**
```bash
git add src/pages/en/digital-marketing-strategy.astro
git commit -m "feat: add digital marketing & social media strategy dedicated service page"
```

---

### Task 4: Update docs/en/services.md

**Files:**
- Modify: `docs/en/services.md`

Update the services.md to reflect:
- Business Consulting renamed to "Business Planning & Strategy" with updated focus
- New "Digital Marketing & Social Media Strategy" service added with 4 sub-services

**Step 1: Update the file**

**Step 2: Commit**
```bash
git add docs/en/services.md
git commit -m "docs: update services to reflect Business Planning & Strategy and Digital Marketing offerings"
```

---

### Task 5: Final build verification

```bash
npm run build 2>&1 | tail -30
```

Expected: Build completes with no errors. Pages generated:
- /en/services/
- /en/digital-marketing-strategy/
- /en/business-planning-consulting-service/

Check that:
- services page loads with 5 services including both new ones
- digital-marketing-strategy page loads with full content
- Links from services page to digital-marketing-strategy work
- No broken image imports
