# Dynapharm Africa Website — Content Generation Prompt

> **Purpose:** Give this prompt to Claude Code inside a scaffolded Dynapharm website project to generate all `docs/en/` content files from the existing ERP system documentation and database.
>
> **Usage:**
>
> 1. Run `.\new-project.ps1 -ProjectName "dynapharm-website"` (or `./new-project.sh dynapharm-website`)
> 2. `cd dynapharm-website`
> 3. Open Claude Code: `claude`
> 4. Paste this entire prompt

---

## Prompt

You are building the public-facing marketing website for **Dynapharm** — an international health and wellness MLM (Multi-Level Marketing / Network Marketing) company that manufactures and distributes natural health products across Africa and beyond.

**CRITICAL:** This website is **franchise-neutral**. Dynapharm operates through independent franchises in many countries. This site represents the Dynapharm brand globally — it does NOT promote any single franchise, country office, or pricing. It is the umbrella brand site for Dynapharm International / Dynapharm Africa.

### Source Documentation

Read the following files and database tables from the existing Dynapharm ERP (DMS_web) to extract accurate product and business information. Do NOT fabricate products, ranks, or features — only document what actually exists:

**Core system docs (read all of these):**

- `C:/wamp64/www/DMS_web/README.md` — system overview
- `C:/wamp64/www/DMS_web/CLAUDE.md` — architecture and business context
- `C:/wamp64/www/DMS_web/docs/INDEX.md` — full documentation index
- `C:/wamp64/www/DMS_web/.github/copilot-instructions.md` — comprehensive development standards (first 60 lines for business context)
- `C:/wamp64/www/DMS_web/docs/testing/DYNAPHARM_BRAND_DESCRIPTION.md` — official brand copy, taglines, messaging pillars, tone guidelines (USE THIS for brand voice and about page content)

**MLM & distributor documentation (read for business model details):**

- `C:/wamp64/www/DMS_web/docs/distributors/README.md` — distributor system overview
- `C:/wamp64/www/DMS_web/docs/distributors/INDEX.md` — full distributor docs index
- `C:/wamp64/www/DMS_web/docs/distributors/DISTRIBUTOR_PERFORMANCE_REPORTS_PLAN.md` — BV, legs, generations, rank concepts
- `C:/wamp64/www/DMS_web/docs/bonus-system/plan.md` — bonus/commission workflow
- `C:/wamp64/www/DMS_web/docs/dpc/DPC_MANAGEMENT_IMPLEMENTATION.md` — Distribution Point Centre structure

**Product & health information:**

- `C:/wamp64/www/DMS_web/docs/diseases/README.md` — disease-to-product mapping system overview
- `C:/wamp64/www/DMS_web/database/schema/tbl_ranks.sql` — rank code definitions
- `C:/wamp64/www/DMS_web/database/schema/tbl_distributors.sql` — distributor data model
- `C:/wamp64/www/DMS_web/database/schema/tbl_diseases.sql` — health conditions model

**Database queries to run (for accurate product and rank data):**

```bash
# Get complete product catalogue
cd /c/wamp64/bin/mysql/mysql8.4.7/bin
./mysql -u root dynapharm_web -e "SELECT code, name FROM tbl_products WHERE franchise_id = 1 ORDER BY code;"

# Get rank hierarchy
./mysql -u root dynapharm_web -e "SELECT code, name, min_qualification_bv FROM tbl_ranks WHERE franchise_id = 1 ORDER BY id;"

# Get disease/health categories
./mysql -u root dynapharm_web -e "SELECT name FROM tbl_disease_categories ORDER BY name;"

# Get disease-to-product mappings (sample)
./mysql -u root dynapharm_web -e "SELECT dc.name as category, d.name as condition_name FROM tbl_diseases d JOIN tbl_disease_categories dc ON d.category_id = dc.id ORDER BY dc.name, d.name LIMIT 50;"

# Get franchise countries for global reach
./mysql -u root dynapharm_web -e "SELECT name, country FROM tbl_franchises ORDER BY name;"
```

### Product Images — Retrieval & Setup

Product images exist in the ERP at `C:/wamp64/www/DMS_web/uploads/product_images/`. There are ~101 PNG files. The filenames correspond to product codes with the `WK` prefix stripped:

- Product code `WK1201` → image file `1201.png`
- Product code `WK10801` → image file `10801.png`
- Product code `WK1802A` → image file `1802A.png`
- A few extra images have descriptive names (e.g., `blackganotongkat500.png`, `GanoSavon500.png`) — include these too

**Step: Copy all product images into the website project:**

```bash
# Copy all product images to the photo-bank
cp C:/wamp64/www/DMS_web/uploads/product_images/*.png photo-bank/services/

# Rename with Product- prefix for the photo-manager skill
cd photo-bank/services/
for f in *.png; do
  mv "$f" "Product-$f"
done
```

After copying, generate a `docs/en/products-catalog.md` file (see below) that maps each product code to its image filename, category, display name, and auto-generated description.

### What You Are Generating

Generate all content files in `docs/en/` (then translate to `docs/fr/`) for a **marketing website** that presents Dynapharm Africa to three audiences:

1. **Prospective distributors** — people considering the business opportunity
2. **Health-conscious consumers** — people interested in natural health products
3. **Existing distributors** — people already in the network who want to share a professional brand site with prospects

This is NOT an ERP documentation site. It is a conversion-focused brand website that sells the Dynapharm Africa lifestyle, products, and business opportunity.

### Brand Identity

- **Company name:** Dynapharm Africa
- **Tagline:** "Health, Wealth, Freedom — The Dynapharm Way" (from official brand doc — or refine after reading brand description)
- **Industry:** Health & Wellness / MLM / Network Marketing
- **Founded:** [PLACEHOLDER — confirm founding year]
- **Headquarters:** Malaysia (global HQ); Dynapharm Africa operates across the continent
- **Global reach:** Operates in **40+ countries** worldwide. Do NOT list specific country names — just "40+ countries".
- **Primary audiences:**
  - Health-conscious individuals seeking natural supplements
  - Entrepreneurs looking for a low-barrier business opportunity
  - Existing distributors building their networks
- **Tone:** Aspirational, warm, trustworthy, community-driven. Speak to people who want better health AND financial independence. Avoid hype or "get rich quick" language — emphasise genuine wellness and sustainable business building. Read `DYNAPHARM_BRAND_DESCRIPTION.md` for official tone: inspirational, credible, empowering, African-centric.
- **Company positioning:** Present Dynapharm Africa as a company, not as an individual's business. The brand is larger than any franchise.
- **Franchise neutrality:** NEVER mention specific franchise names, country-specific pricing, or local contact details. Use "Dynapharm Africa" as the brand. Say "40+ countries" — never list them. Contact is email only: **info@dynapharmafrica.com**
- **Logo:** Already in `photo-bank/branding/` — `Logo-Full-Color.png` (colour version, ~387KB) and `Logo-Dark-Mode.png` (white version for dark backgrounds, ~37KB)
- **Languages:** Website is in **English and French** only (2 languages, not 3)
- **Brand pillars** (from official brand doc): **Health** (premium natural products), **Wealth** (proven business opportunity), **Freedom** (financial independence)

### Product Categories (extracted from actual catalogue)

Group the ~91 products into these marketing-friendly categories:

1. **Health Beverages** — Coffee mixes (with Ganoderma, Ginseng, Tongkat Ali, Green Tea), Chocolate mix, Cappuccino, Milk Tea, Red Coffee
2. **Nutritional Supplements** — Spirulina (tablets/powder), Bee Pollen, Multi-Vitamins, Goat's Milk Tablets, Soybean Powder, Pro-LSB
3. **Herbal & Traditional Medicine** — Yeegano, Yeegarlic, Yeeginkgo, Ginali, Tongkat Ali, Green Tea Extract, Milk Thistle, Dyna Serenoa, Eye-Max, Dyna RH
4. **Immune & Vitality Boosters** — Liquid Chlorophyll, Noni Juice, Mangosteen Drink, Dyna Tonic, Vitamin C (Dyna C), Ginseng, Sea Cucumber
5. **Personal Care** — Tea Tree Oil (lotion, feminine wash, toothpaste), Ganoderma skincare (lotion, shower gel, toothpaste), E-Vita Cream, Snail Aqua Cream
6. **Wellness Foods** — Instant Cereal with Spirulina & Noni, Wheatgrass with Chlorophyll, High Fiber Nutrition, Ginseng Honey Ginger, Herba Warisan
7. **Agriculture** — D.I. Grow bio-fertiliser (Red & Green variants, multiple sizes)
8. **Home & Lifestyle** — Mineral Pot (water filtration), Toothbrush sets

### MLM Rank Structure (from actual database)

Present the rank progression as a journey of achievement:

| Code | Rank Name | Marketing Description |
|------|-----------|----------------------|
| DI | Distributor | Your starting point — begin your wellness business |
| M | Manager | Lead a growing team and earn management bonuses |
| SM | Senior Manager | Proven leader with expanding network |
| RM | Ruby Manager | Regional influence and premium rewards |
| PM | Pearl Manager | Elite performer with significant network |
| DM | Diamond Manager | Top-tier leadership and lifestyle rewards |
| CDM | Crown Diamond Manager | The pinnacle — Dynapharm's highest honour |

### Health & Wellness Categories (from diseases module)

The ERP maps products to 11 health categories. Present these as "Wellness Solutions" on the website:

1. Cardiovascular Health
2. Digestive and Gut Health
3. Energy and Vitality
4. Eye Health and Vision
5. General Health Issues
6. Immune System Support
7. Joint and Bone Health
8. Sexual and Reproductive Health
9. Skin Conditions
10. Stress, Mood and Mental Wellness
11. Weight Management

**IMPORTANT:** Do NOT make medical claims. Use language like "supports", "promotes", "traditional use for" — never "cures", "treats", or "prevents". These are food supplements, not medicines.

### Content Direction for Each File

#### 1. `docs/en/company-profile.md`

- Position Dynapharm Africa as a health and wellness company with deep roots in natural, traditional remedies
- Malaysian origins with a strong African presence — emphasise the Africa growth story
- Mission: Empowering people with natural health products and entrepreneurial opportunity
- Vision: A healthier world where everyone has access to nature's best supplements and the opportunity to build a sustainable business
- Values: Quality, Integrity, Community, Natural Wellness, Entrepreneurship
- Key numbers: 90+ products, active distributors across the continent, presence in **40+ countries**, 11 wellness categories, 7 achievement ranks
- Contact: **info@dynapharmafrica.com** (this is the ONLY contact — no phone, no address, no social media links)
- Do NOT list specific countries — say "operating in 40+ countries across Africa and beyond"
- Use content from `DYNAPHARM_BRAND_DESCRIPTION.md` for the brand pillars (Health, Wealth, Freedom)

#### 2. `docs/en/pages.md`

Design a website with these pages:

- **Home** — Hero with aspirational health + wealth message, product category highlights, "Why Dynapharm" trust section, business opportunity teaser, testimonials, global presence map
- **Products** — Interactive product catalogue (see detailed spec below)
- **Business Opportunity** — The MLM business model explained clearly and honestly: how it works, rank progression, earning potential (without specific numbers), what a typical day looks like, registration process, support and training
- **Wellness Guide** — Health categories mapped to product recommendations (the 11 wellness categories); educational content about natural health; NOT medical advice
- **About** — Company history, mission, values, global reach, manufacturing quality, certifications
- **Contact** — Simple enquiry form (sends to info@dynapharmafrica.com); "Interested in becoming a distributor?" CTA; no phone/address/social media

Nav order: Home, Products, Business Opportunity, Wellness Guide, About, Contact
Primary CTA: "Start Your Journey" or "Become a Distributor" linking to /contact
Secondary CTA: "Explore Products" linking to /products

##### Products Page — Interactive Catalogue (DETAILED SPEC)

The Products page is the centrepiece of the website. It must feel like browsing a polished e-commerce catalogue — but without prices (franchise-neutral).

**Layout:**

1. **Category filter bar** at the top — horizontal tabs or pill buttons showing the 8 product categories. One tab is "All Products" (default). Clicking a category filters the grid instantly (Alpine.js, no page reload). Include a product count badge per category.

2. **Product grid** below — responsive card grid (2 columns on mobile, 3 on tablet, 4 on desktop). Each card shows:
   - Product image (from `photo-bank/services/Product-{code}.png`)
   - Product display name (cleaned-up, title-case version of the database name — e.g., "Instant Coffee Mix with Ginkgo & Ginseng" not "INSTANT COFFEE MIX W/ GINKGO & GINSENG 20S X 21G")
   - Category tag/badge
   - A subtle "View Details" prompt or the card itself is clickable

3. **Product detail modal** — when a card is clicked, an Alpine.js modal opens showing:
   - Larger product image
   - Full display name
   - Category badge
   - **Auto-generated description** (see description rules below)
   - Key ingredients list (extracted from the product name)
   - A "Contact your distributor" or "Find a DPC near you" CTA button
   - Close button (X) and click-outside-to-close

**NO prices anywhere** — the site is franchise-neutral and prices vary by country.

##### Product Description Generation Rules (CRITICAL)

Generate a short description (2-3 sentences) for each product based STRICTLY on the ingredients and product type visible in the product name. Do NOT research or add external claims. Do NOT make health/medical claims.

**Rules:**

1. **Identify the product type** from the name: coffee mix, capsule, tablet, powder, lotion, toothpaste, cream, juice, syrup, ointment, wash, gel, fertiliser, etc.
2. **Extract the key ingredients** from the name: Ganoderma, Ginseng, Tongkat Ali, Spirulina, Chlorophyll, Bee Pollen, Noni, Green Tea, Goat's Milk, Sea Cucumber, Milk Thistle, Guarana, Soybean, Kacip Fatimah, Tea Tree Oil, Maca, Ginkgo, Wheatgrass, Mangosteen, etc.
3. **Write a factual description** that says what the product IS (form, ingredients) and how it is typically used — NOT what it does medically.
4. **Use safe, general language:**
   - OK: "A nourishing coffee blend featuring Ganoderma and Green Tea"
   - OK: "Contains Spirulina, a nutrient-rich superfood"
   - OK: "Traditionally valued for its natural properties"
   - OK: "A convenient way to incorporate [ingredient] into your daily routine"
   - NOT OK: "Boosts immunity", "Fights cancer", "Cures diabetes", "Lowers blood pressure"
   - NOT OK: "Clinically proven", "Scientifically shown to"
5. **Strip packaging details** from the display name: remove "20S X 21G", "150ML", "100S", "30S", "4 LTRS" etc. These can go in a small "Size" field if needed but not in the main name.
6. **Clean up abbreviations** in display names: "W/" → "with", "W/GANO" → "with Ganoderma", "D.I." → "DI" or spell it out contextually.

**Example descriptions:**

| Product Name (DB) | Display Name | Description |
|---|---|---|
| INSTANT COFFEE MIX W/ GINKGO & GINSENG 20S X 21G | Instant Coffee Mix with Ginkgo & Ginseng | A smooth instant coffee blend enriched with Ginkgo and Ginseng. A flavourful way to enjoy these traditionally valued herbs as part of your daily coffee routine. |
| SPIRULINA TABLETS 300S | Spirulina Tablets | Convenient tablets made from Spirulina, a nutrient-dense blue-green algae naturally rich in protein, vitamins, and minerals. An easy addition to your daily nutrition. |
| D.I. GROW (RED) 4 LTRS | DI Grow Bio-Fertiliser (Red) | A liquid bio-fertiliser formulated to support plant growth and flowering. Suitable for fruits, vegetables, and flowering plants. Available in multiple sizes. |
| TEA TREE OIL FEMININE WASH 250ML | Tea Tree Oil Feminine Wash | A gentle personal care wash formulated with Tea Tree Oil, known for its natural cleansing properties. Designed for daily feminine hygiene. |
| YEEGANO CAPSULE 90S | Yeegano Capsule | A herbal supplement capsule featuring Ganoderma (Lingzhi mushroom), a traditional ingredient valued in Asian wellness practices for centuries. |

#### 3. `docs/en/style-brief.md`

- Mood: Natural, vibrant, aspirational. Think lush greens meeting warm earth tones. Clean and modern but with organic warmth — not clinical or sterile
- Colours: Suggest a palette rooted in nature — deep leafy greens, warm gold/amber accents, clean whites, and rich earth browns. The green should feel like chlorophyll (a signature Dynapharm ingredient). Avoid cold corporate blues or generic MLM reds
- Dark mode: optional — light mode primary (health/wellness sites feel better in light, airy layouts)
- Preferred style: Clean, spacious, with large product photography. Generous whitespace. Sections that breathe. Subtle leaf/nature motifs in backgrounds or dividers. Smooth scroll animations
- Hero style: Full-width lifestyle imagery — healthy African families, vibrant communities, nature/agriculture scenes. NOT stock photos of white models
- Typography: A confident, modern sans-serif for headings with a warm, readable body font. Avoid overly decorative fonts
- Photography direction: Real African contexts — markets, homes, farms, community gatherings, healthy families. Dynapharm products in natural settings. Avoid sterile white-background product shots where possible
- References: Look at successful wellness/supplement brands (Herbalife's product pages, Forever Living's opportunity sections) but with distinctly African visual identity
- Avoid: MLM clichés (luxury cars, mansions, "freedom" stock photos), clinical/pharmaceutical aesthetics, cluttered product grids, aggressive sales pop-ups

#### 4. `docs/en/services.md`

Reframe as "What We Offer" — Dynapharm's value propositions:

1. **Natural Health Products** — 90+ scientifically formulated products using natural ingredients like Spirulina, Ganoderma, Tongkat Ali, Bee Pollen, Noni, and Chlorophyll. Manufactured to international quality standards. Available across Africa.
2. **Business Opportunity** — Start your own wellness business with low initial investment (Distributor Registration Kit). Earn through personal sales and team building. No experience required — full training provided.
3. **Training & Development** — Comprehensive training for new distributors: product knowledge, sales techniques, network building, leadership development. Both online and in-person at DPCs.
4. **Wellness Solutions** — Products mapped to 11 health categories. Personalised wellness recommendations through trained distributors. Whole-person approach: nutrition, energy, immunity, beauty.
5. **Community & Support** — Join a network of 6,000+ distributors. Mentorship from upline leaders. Regular events, conferences, and recognition ceremonies. A culture of mutual support and celebration.
6. **Global Reach, Local Presence** — Operating in 40+ countries with local Distribution Point Centres (DPCs). Products available in your market, supported in your language.

Extract accurate ingredient and product details from the database queries. Each section should include 4-6 bullet points of real capabilities.

#### 5. `docs/en/team-profiles.md`

- **Company Leadership** — Leave as placeholders for Dynapharm International leadership
  - CEO / Founder: [PLACEHOLDER]
  - Africa Regional Director: [PLACEHOLDER]
  - 2-3 additional leadership slots
- **Featured Distributors** — Create 3-4 placeholder profiles for top-performing distributors:
  - A Crown Diamond Manager from East Africa
  - A Diamond Manager who started as a student
  - A Manager who built a team while working full-time
  - A Senior Manager in West Africa
- Mark all as `[PLACEHOLDER — replace with real profiles and photos]`

#### 6. `docs/en/contact.md`

- **Email is the ONLY contact method:** info@dynapharmafrica.com
- No phone number, no physical address, no WhatsApp, no social media links
- Simple, clean contact page with:
  - A contact/enquiry form that sends to info@dynapharmafrica.com
  - "Interested in Becoming a Distributor?" — prominent section
  - "Already a Distributor?" — brief note to contact their local DPC
- Do NOT include country lists, maps, or "find your nearest office" sections
- Keep it minimal and professional

#### 7. `docs/en/testimonials.md`

Create the file with a header and a note requesting real testimonials:

```markdown
# Testimonials

<!-- CLIENT ACTION REQUIRED: Please provide 3-5 real customer/distributor testimonials.
     Ideal sources: distributors from Senegal, Uganda, Mozambique, and Lesotho.
     Mix of product testimonials (Spirulina, Chlorophyll, Ganoderma Coffee, D.I. Grow)
     and business opportunity testimonials (rank achievements, team building).
     Include: person's full name, country, and their quote.
     We will rewrite for clarity and translate into all enabled languages. -->
```

Never fabricate testimonials — even as placeholders with realistic names. The client must provide real quotes.

#### 8. `docs/en/portfolio.md`

Reframe as "Success Stories" / "Impact Stories":

- **From Distributor to Diamond** — A placeholder story of rank progression over 3-5 years, emphasising personal growth, team building, and the specific ranks achieved (DI → M → SM → RM → DM)
- **Community Health Transformation** — A DPC that brought wellness products to a rural area; measurable impact on community health awareness
- **Agricultural Success with D.I. Grow** — A farming community that adopted D.I. Grow bio-fertiliser; crop yield improvements
- **Women's Empowerment Through Wellness Business** — Women distributors building financial independence

Include metrics placeholders: "Built a team of X distributors", "Achieved [Rank] in Y months", "Serves Z customers monthly", etc.

#### 9. `docs/en/faq.md`

Write 15+ FAQs covering three categories:

**About Dynapharm:**
- What is Dynapharm?
- Where does Dynapharm operate?
- How long has Dynapharm been in business?
- Are Dynapharm products safe? What certifications do you have?
- What makes Dynapharm different from other health supplement companies?

**Products:**
- What types of products does Dynapharm offer?
- What is Ganoderma and why is it in so many Dynapharm products?
- What is D.I. Grow and how does it work?
- Are Dynapharm products medicines?
- How do I know which products are right for me?
- Where can I buy Dynapharm products?

**Business Opportunity:**
- How do I become a Dynapharm distributor?
- What is the Distributor Registration Kit?
- How does the MLM business model work at Dynapharm?
- What are the ranks and how do I advance? (List all 7: DI, M, SM, RM, PM, DM, CDM)
- What is Business Volume (BV) and why does it matter?
- How do I earn with Dynapharm? (Personal sales, team bonuses, rank bonuses)
- Do I need experience to start?
- What training and support is provided?
- What is a Distribution Point Centre (DPC)?

Answer each FAQ accurately based on the ERP documentation. For the business model questions, use the actual rank codes and BV concepts from the database. Keep answers honest and balanced — no hype.

#### 10. `docs/en/about-story.md`

Tell the Dynapharm story:

- **Origins:** Founded in Malaysia with a vision to bring natural health products to the world. Rooted in traditional Asian herbal wisdom — Ganoderma (Lingzhi), Tongkat Ali, Spirulina, Chlorophyll — ingredients used for centuries.
- **The Africa Chapter:** Expansion into Africa — bringing world-class health supplements to a continent hungry for natural wellness alternatives. Dynapharm found a natural fit: African communities value natural remedies and entrepreneurial spirit.
- **The Model:** MLM as a vehicle for economic empowerment — not just selling products but building entrepreneurs. Low barrier to entry. No formal qualifications needed. Just a desire to help people live healthier and a willingness to learn.
- **Products:** From a handful of products to 90+ items spanning beverages, supplements, personal care, and even agriculture (D.I. Grow). Every product is manufactured to international quality standards.
- **Impact:** Distributors across 40+ countries earning income while improving their communities' health. DPCs serving as local wellness hubs.
- **Values:**
  - Quality First — every product meets international standards
  - Natural Always — sourced from nature, backed by science
  - People Before Profit — distributors are partners, not salespeople
  - Community Impact — healthy people build healthy communities
- **Brand pillars:** Health, Wealth, Freedom (from `DYNAPHARM_BRAND_DESCRIPTION.md` — weave these throughout)
- **Milestones:** leave as placeholders — founding year, expansion milestones, product catalogue growth
- **Vision:** "A world where natural health and financial independence are within everyone's reach"

#### 11. `docs/en/gallery.md`

Create placeholder entries across categories:

- **Products** — Hero shots of flagship products (Spirulina, Chlorophyll, Ganoderma Coffee, D.I. Grow, Noni Juice) — mark as `[PRODUCT PHOTO NEEDED]`
- **Events** — Distributor conferences, training sessions, rank achievement ceremonies — mark as `[EVENT PHOTO NEEDED]`
- **Community** — Distributors in their communities, DPC interiors, product demonstrations — mark as `[COMMUNITY PHOTO NEEDED]`
- **Agriculture** — D.I. Grow in action, farms, crop comparisons — mark as `[AGRICULTURE PHOTO NEEDED]`
- **Lifestyle** — Healthy families, morning routines with Dynapharm products, active lifestyles — mark as `[LIFESTYLE PHOTO NEEDED]`
- **Global Reach** — Maps, country offices, DPC locations — mark as `[GLOBAL PHOTO NEEDED]`

Include descriptions of what each photo should convey. Emphasise authentic African settings, real people, and genuine product use.

#### 12. `docs/en/products-catalog.md` (NEW — additional file)

This is the structured product data file that drives the Products page. Generate it by querying the database and processing every product.

**Format:** YAML frontmatter with a `products` array. Each entry contains:

```yaml
products:
  - code: "WK1201"
    name: "Instant Coffee Mix with Ginkgo & Ginseng"
    category: "Health Beverages"
    image: "Product-1201.png"
    ingredients:
      - Ginkgo
      - Ginseng
    description: "A smooth instant coffee blend enriched with Ginkgo and Ginseng. A flavourful way to enjoy these traditionally valued herbs as part of your daily coffee routine."
    size: "20 sachets x 21g"
```

**Generation process:**

1. Query ALL products: `SELECT code, name FROM tbl_products WHERE franchise_id = 1 ORDER BY code;`
2. For each product:
   - Strip `WK` prefix from code to derive image filename → `Product-{stripped_code}.png`
   - Verify the image exists at `C:/wamp64/www/DMS_web/uploads/product_images/{stripped_code}.png`
   - Clean up the display name (title case, expand abbreviations, remove size/quantity)
   - Extract size/quantity info into a separate `size` field
   - Assign to one of the 8 categories based on product type
   - Extract ingredient names into the `ingredients` array
   - Generate a 2-3 sentence description following the description rules above
   - If no image exists for a product, set `image: null` and add a comment
3. Also list the categories with display names and optional icons:

```yaml
categories:
  - id: "health-beverages"
    name: "Health Beverages"
    description: "Nourishing coffee blends, teas, and chocolate drinks enriched with natural ingredients"
    icon: "coffee"
    count: 12
  - id: "nutritional-supplements"
    name: "Nutritional Supplements"
    # ... etc for all 8
```

**Skip the Distributor Registration Kit** (WK10801) — it is not a consumer product.

### Additional Files to Generate

#### `docs/i18n-config.md`

Update the i18n config to enable **2 languages: English (en) and French (fr)**. Set English as default. Disable Kiswahili (sw). The website serves Dynapharm Africa's anglophone and francophone markets.

#### `docs/seo.md`

Fill in the SEO template with:

- Site URL: `https://dynapharmafrica.com`
- Schema type: `Organization` + `Product` (for product pages)
- Per-page meta titles and descriptions optimised for:
  - "Dynapharm products Africa"
  - "natural health supplements Africa"
  - "MLM business opportunity Africa"
  - "Ganoderma coffee Africa"
  - "Spirulina supplements"
  - "D.I. Grow bio fertiliser"
  - "become a distributor Dynapharm"
  - "network marketing health products"
  - "Chlorophyll drink benefits"
  - "natural wellness products Africa"

### Quality Standards

1. **Accuracy:** Every product mentioned must exist in the Dynapharm product catalogue (from database queries). Every rank must match the actual rank codes (DI, M, SM, RM, PM, DM, CDM). Do not invent products or ranks.
2. **Franchise neutrality:** NEVER mention specific franchise names (no "Dynapharm Uganda" or "Dynapharm Egypt"). Use "Dynapharm Africa" or "your local Dynapharm office". No country-specific pricing. No country lists. Only contact: info@dynapharmafrica.com. Say "40+ countries" when referencing reach.
3. **No medical claims:** Products "support wellness", they do not "cure" or "treat" anything. Use careful, compliant language throughout.
4. **Marketing tone:** Write for real people — aspiring entrepreneurs and health-conscious families. "Support your immune system naturally with Spirulina" not "Spirulina platensis provides immunomodulatory polysaccharides."
5. **African context:** Use examples and language relevant to Africa — communities, families, local markets, farming. Authentic, not tokenistic. Do NOT name specific countries.
6. **Balanced MLM presentation:** Present the business opportunity honestly. Emphasise effort, training, and gradual growth. Avoid income guarantees, lifestyle promises, or "unlimited earning potential" language. Success requires work.
7. **Placeholders clearly marked:** Use `[PLACEHOLDER]` for any content that needs real data (testimonials, exact milestones, leadership photos, event dates, certifications).
8. **British English:** As per the language-standards skill — colour, organisation, travelling, etc.

### After Generation

Once all files are generated:

1. **Copy product images** from the ERP into the website project:
   ```bash
   # Copy all product images
   cp C:/wamp64/www/DMS_web/uploads/product_images/*.png photo-bank/services/

   # Rename with Product- prefix for the photo-manager skill
   cd photo-bank/services/
   for f in *.png; do
     mv "$f" "Product-$f"
   done
   cd ../..
   ```
2. **Verify image coverage** — cross-reference `docs/en/products-catalog.md` against actual files in `photo-bank/services/`. Report any products missing images.
3. Review each content file for accuracy against the Dynapharm product database and ERP documentation
4. Verify all product descriptions follow the "no medical claims" rules — flag any that slip into health benefit language
5. Update `docs/i18n-config.md` with the translation status table
6. Do NOT start building the website yet — content review comes first
7. Report a summary of what was generated and what needs human input:
   - Products with missing images (list codes)
   - Products where the image filename didn't match the expected pattern
   - Real testimonials from actual distributors
   - Company leadership profiles and photos
   - Founding date and milestone dates
   - Certifications and quality standard documentation
   - Lifestyle/hero/event photos for non-product pages
