# E-Commerce Design & UX Reference
*Extracted from: "How to Create Selling E-Commerce Websites" — Smashing Magazine eBook #5 (Andrew, Chapman, Chudley et al., 2010/2011)*

---

## PART 1: GETTING STARTED — PRE-BUILD CLIENT QUESTIONS

### What to Ask Before Building Any E-Commerce Site

Before writing code or selecting a platform, answer these questions:

1. **What are you selling?** — Physical, digital, subscriptions, donations, services
2. **What shopping functionality?** — Single item vs. multi-product cart; variants (size/colour); categories; tags; related items; special offers
3. **How will you take payment?** — PayPal buttons, hosted payment gateway (pay page), or full API integration
4. **How will items be delivered?** — Shipping carriers; free shipping thresholds; digital download links; order tracking
5. **What reporting and admin functionality is needed?** — CSV export, stock control, partial fulfilment, invoice generation, accounting system integration (e.g. Xero API)

### Account and Order Tracking
- Must users register? Registration should be optional, prompted only at end of checkout
- Provide order status tracking: "processing" → "shipped" → "delivered"
- Account management must include password reset and contact detail updates

### Payment Methods

**PayPal / Hosted Services:** Easiest to launch; no credit check; low barrier. Use for early-stage stores.

**Internet Merchant Account:** Required for taking cards directly. Get a dedicated online merchant account — existing face-to-face accounts cannot be used for online transactions.

**Payment Gateway — Two Integration Types:**
| Type | Pros | Cons |
|------|------|------|
| Pay Page (user leaves to PSP) | Your site never touches card data; PSP handles 3-D Secure changes | Less control over UX; some brand disruption |
| API Integration | Full control over look and feel | You are responsible for card security; full PCI DSS compliance required |

**Rule:** Never store card data on your server, even encrypted, unless you absolutely need recurring billing — and even then, use the payment gateway's tokenisation service.

**PCI DSS Compliance:**
- Pay page only → complete SAQ A questionnaire
- API integration → full PCI DSS compliance + quarterly security scans

### Taxes and Currencies
- Account for local taxes/VAT in every region you sell to
- EU: charge VAT to UK buyers, EU buyers (unless they have a valid VAT number); no VAT outside EU
- Multi-currency: either set currencies in your merchant account, or display informational prices with a disclaimer that payment will be charged in your local currency

### Shipping
- Free shipping for orders above a threshold is standard practice and significantly boosts conversion (see Trust section below)
- Offer multiple carriers (standard post + priority courier)
- For digital products: secure the download behind a link or account page; issue license codes where needed

### Platform Selection Checklist
- Start simple; scale later — start with PayPal buttons if selling one product
- Hosted solutions (Shopify, FoxyCart, Big Cartel): lower upfront cost; monthly fee; limited customisation
- Off-the-shelf / open source (Magento, osCommerce): full control; check plugin architecture before modifying source code; check JavaScript dependency (basic purchasing must work without JS)
- Custom build: only when off-the-shelf cannot meet needs; define exact spec upfront to prevent scope creep; build only what you need now

---

## PART 2: 5 UNIVERSAL PRINCIPLES FOR SUCCESSFUL E-COMMERCE

### Principle 1: Design for the Customer, Not for Yourself
- Cart abandonment rate is ~60%, and most happens before checkout begins
- Every design decision must be measured by whether it helps the target customer complete a purchase
- Forcing visitors to think is a bad idea in e-tail

### Principle 2: Good UX is Like a Perfect Movie Score — Invisible
- The experience must make users not realise they are "using" it
- The right combination: usability + creative design + writing + psychology + metrics + strong brand = trust

### Principle 3: E-Commerce UX Pitfalls to Avoid

**Product Detail Page:**
- More user time is spent on the PD page than any other page
- Provide "no-click" alternate images (hover, not click, to see alternate view)
- Smart fields that prompt required actions before errors appear
- Zoom on hover, not a separate click

**Checkout:**
- As few steps as possible; never ask for credit card info "too soon" in the flow
- Never hide taxes and shipping costs — these feel like a trap to customers

**Security:**
- A footer link to a privacy policy is not enough — make security visible and prominent throughout

**Page Weight / Performance:**
- Every image, JS library, and asset adds to page weight
- Libraries (jQuery etc.) are often forgotten but always counted

### Principle 4: Content + Social Media Drives Engagement
**Social media statistics (Cone research):**
- 93% of social media users believe a company should have a social presence
- 85% believe a company should also **interact** with customers on social media
- 60% of all online adults use social media
- 56% of users feel better served by companies they can interact with on social media

**Actions to take:**
- Add social sharing buttons on product and content pages (Twitter, Facebook, Delicious)
- Allow users to customise their experience (saved preferences, avatar on reviews)
- Create RSS feeds for blogs and content that changes regularly
- A/B test all promotions and content copy

### Principle 5: Use Colour and Typography to Influence Behaviour
- Design for the demographic (35–65 women ≠ 18–25 men)
- Fun copy beats dry copy — e.g. "Add More Twang to Your Thang" vs. "Shop New Banjo Supplies"
- If your brand uses red, use a different colour for error messages
- Maintain a living style guide covering both creative and copy standards

---

## PART 3: 12 TIPS FOR AN EXCELLENT CHECKOUT PROCESS

1. **Don't require registration to shop** — Move registration to after the order is placed; sign-up forms placed at the start of browsing lose customers before they've invested time

2. **Display stock levels prominently** — Show availability on the search results page, not only on the product page; offer pre-order when items are out of stock

3. **Allow easy order modification** — Remove items with a "remove" link, never by entering zero quantity; let quantity be edited in the cart

4. **Provide real-time support during checkout** — Live chat or phone assistance at the checkout stage; FAQ pages alone are insufficient for complex purchases

5. **Keep the Back button functional** — Never disable or auto-redirect on Back; preserve form data when the user navigates back so they don't re-fill

6. **Show photos, specs, and links in the basket** — Thumbnail images + size/colour/format details in the cart; link each item back to its product page

7. **Provide a progress indicator** — Label every step and show current position; users need to know how many steps remain and that they can still cancel

8. **Keep the checkout interface simple** — Remove navigation, category links, and promotional banners from checkout pages; provide only a "Return to Shopping" link and clear "Next" buttons

9. **Don't take the user out of checkout** — Use modal/floating windows for help text rather than new pages; opening a new page loses the checkout session

10. **Inform users about delivery times** — Show estimated delivery dates as early as the product page; use AJAX to update estimates dynamically as options are selected

11. **Tell customers what happens next** — Post-order confirmation: "Thank you" + what to expect (confirmation email, shipping notification timeline)

12. **Send a confirmation email** — Order details + delivery estimate; include a way to modify the order before dispatch; confirm size/colour/format specifically

---

## PART 4: CUSTOMER ENGAGEMENT — REVIEWS AND RATINGS

### Why Reviews Matter
- Hayneedle (Netshops) increased sales by **26%** after adding user feedback
- Reviewers are **twice as likely** to write positive reviews than negative ones
- No one trusts 100% positive reviews — John McAteer, Google Retail: "No one trusts all positive reviews"
- In tourism, **~60% of travellers** base decisions on online ratings research
- User-generated content keeps product pages fresh (young shoppers actively seek social content)

### Ratings System Design Rules
- Use standard metaphors: stars (1–5), thumbs up/down
- Enable one-click rating with star hover-preview
- Add labels to each star level ("Perfect", "Good", "Miserable")
- Show number of votes per rating; display distribution table (as iTunes does)
- Display ratings adjacent to product name for quick scanning
- Allow filtering and sorting search results by rating
- Show reviews on a single page (not paginated) — Google indexes everything together

### Getting Reviews
- Email customers to request reviews — timing matters: electronics = days; books = weeks/months
- Offer predefined pros/cons lists for quick review entry
- Let users preview their review before submitting
- Explain moderation policy clearly: state when reviews will be published

### Displaying Reviews
- Show reviewer name, location, rank, and type of user (heavy/occasional user)
- Show date of review — outdated reviews reduce trust
- Enable "Was this helpful?" voting on reviews
- Allow sorting by helpfulness, rating, date, and user type
- Indented replies to reviews create genuine conversation threads
- Keep reviews all on one page — more content = better SEO; users prefer scrolling over pagination

### Managing Negative Reviews
- Respond to negative reviews directly and professionally
- Moderate only genuinely abusive or untruthful content; do not delete critical but fair reviews
- Leave negative reviews visible — their presence validates positive reviews

---

## PART 5: SEARCH AND FILTERING UX

### Why Search Is Critical
- Effective search accelerates the sales process → fewer abandoned sessions
- Fast, precise searches increase customer trust

### Approaches to Search

**Parameter Search (Classic Advanced Search):**
- Often avoided by users because the word "advanced" implies complexity
- Works best with a very small number of focused fields
- Rename "Advanced Search" to "Better Search" or "Smart Search" or just "Search"

**Faceted Search (Recommended Standard):**
- User runs a simple keyword search first, then narrows on the results page
- Use drill-down links (single choice) or checkboxes (multiple non-overlapping)
- Faceted search is "the de facto standard for e-commerce"
- Show number of items in each facet option beside the link

### Faceted Search Architecture Rules
- Based on George A. Miller's research: humans can hold **7 ± 2 items** in working memory
- **Maximum 10 facets** — more will confuse users
- Hide additional facets behind a "More Filters" link
- Order facets by importance (most users use only the top few)
- Only show filter values that apply to available inventory
- If a facet has more than 7–8 options, hide extras under "More Options"
- Taxonomy must be mutually exclusive and exhaustive — no "Other" or "More" categories
- Category hierarchy should be **shallow** — avoid forcing users to drill too deep

### Search Enhancement Techniques
- Spell-check: handle misspellings silently; show corrected results automatically
- Auto-suggest: critical for unfamiliar product names
- Dynamic filtering: results update in real time as filters are applied
- Best-bets: surface most popular/relevant results for common queries ahead of raw relevance ranking
- Show query on results page; make refinement easy

### Search Usability Rules
- Search box must be in a predictable location (top of page, persistent)
- Results must be sorted by relevance (user-centric, not commercial interest first)
- Queries must be easy to refine and resubmit
- Allow users to undo any filter without losing their search
- Use input prompts and hints to guide data entry — but don't overload

---

## PART 6: 15 COMMON E-COMMERCE DESIGN MISTAKES

1. **Lack of detailed product information** — Sizes, materials, weight, dimensions, care instructions, descriptive language, fit/cut; descriptive words outperform technical terms
2. **Hiding contact information** — Phone, email, physical address, and contact form visible on every page (header, sidebar, or footer); more expensive products require more contact options
3. **Long or confusing checkout** — Ideal: single page for billing/shipping + confirmation page; two-column layout for billing/shipping to reduce apparent length
4. **Requiring an account to order** — Offer account save *at the end* of checkout, not before browsing
5. **Inadequate site search** — Must support keyword search + category/feature filtering + sort options (popular, price, newest)
6. **Poor customer service** — Ticketing system or clear contact triage; FAQ covering returns, replacements, common issues
7. **Tiny product images** — Target image zoom to at least **1024×768 pixels**
8. **Only one product image** — **4–5 images per product** is ideal (front, back, sides, detail shots, colour variants)
9. **Poor shopping cart design** — Adding item must return user to previous page (or use mini-cart); show shipping estimate before checkout; allow quantity edit and item removal
10. **Lack of payment options** — Accept all major credit cards; add PayPal; consider bank transfer/electronic cheque
11. **Not including related products** — Surface related items on every product page; manual curation beats algorithmic (spots outfits, functional bundles)
12. **Confusing navigation** — Every category must have at least several products; use horizontal navigation; avoid empty categories
13. **Not including shipping rates** — Real-time shipping calculator or flat rate; never "we'll email you a quote"
14. **Not including store policies** — Shipping policy, return policy, replacement policy — all in a visible FAQ or policies page
15. **Not putting focus on products** — Every design element must serve to showcase products; reduce bells and whistles that compete for attention

---

## PART 7: PRODUCT PHOTOGRAPHY — COMPLETE GUIDE

### Why Photos Are the Single Most Important Design Element
- Without touch, smell, or physical inspection, photos are the customer's only interaction with the product
- "Product photography could well be the single most important design aspect of any e-commerce website" — Peter Crawfurd
- A re-design triggered largely by new photography has doubled sales consistently from launch day

### The 3 Required Product Shot Types
1. **The Overall Shot** — Product seen as a whole; isolated, uncluttered
2. **The Action Shot** — Product in use, shown from a different angle, or with complementary products
3. **The Zoomed Shot** — Intricate details; materials; craftsmanship

### When to Trigger a Photo Re-Shoot
- Conversion rate below 0.5%
- Current photos are the first version
- Photos don't match the quality level of the redesigned site

### 4-Step Photography Process

**Step 1 — Prepare the Product:**
- Inspect carefully for tears, stains, chips, wrinkles
- Solid objects (cups, toys): quick polish; easy
- Clothing/textiles: hours of ironing and arrangement; collar must be straight

**Step 2 — Light:**
- Small products (≤ camera size): EZcube light tent + two 30W bulbs either side
- Larger items (clothing): two 60W soft boxes either side
- Use a light reflector to eliminate shadows and highlight areas
- Reflector surfaces: silver (most reflective), gold (warm glow), white (softer)

**Step 3 — Set Your Camera:**
- ISO: as low as possible (100–200) for maximum sharpness and minimum grain
- Set image size to maximum resolution (most cameras default to ~1500×850)
- Adjust white balance to match your lighting (incandescent, fluorescent, daylight)
- Use a tripod — essential for consistency between shots; mark tripod foot positions with tape for session-to-session consistency
- Use a gray card for accurate, consistent colour rendering
- For overhead shots, use a horizontal tripod extension to prevent linear distortion

**Step 4 — Edit Photos:**
- Remove background (masking); use Photoshop CS4+ "Refine Edge" for curved edges
- White/neutral background = most versatile; will not clash with any site design
- Selective/soft focus can add depth to food, jewellery, and watch photography
- Maintain consistent lighting style across all product photos — consistency draws attention to products, not to inconsistency

### Photography Rules for Selling

| Principle | Application |
|-----------|-------------|
| Show product benefits | Let photography demonstrate the product doing its job (don't tell, show) |
| Don't give reasons not to buy | Remove anything in the photo that could trigger objection (e.g. a vase in a flower photo for hospital delivery) |
| Show product in use | Communicates purpose; helps users see it fits their life |
| Sell a lifestyle | Place product in aspirational context; users buy into the life the product represents |
| Match imagery to brand | Mental disconnect when photos don't match brand values |
| Avoid clichéd stock shots | Users dislike stock photography; prefer "real" photos even if less polished |
| Convey scale | Include a known-size reference object in the frame |
| Show details | Large zoomable photos let customers check the specific features that are their personal "deal-breakers" |
| Encourage interaction | Zoom and rotate functions lead to higher engagement and purchase confidence |
| Be stylistically consistent | Consistent lighting style = consistent brand; John Lewis takes up to 30 minutes per product to style consistently |
| Shoot from the best angle | Three-quarter angle = power and scale (automotive); eye-level = relatable; low angle = imposing |
| Unusual vantage points | An everyday object becomes interesting when shot from an unusual angle |
| Show packaging | Show what arrives in the box — sets correct expectations |

### Photo Guidelines by Approach
- White background: professional, clean, non-distracting (gallery pages)
- Natural environment: shows product purpose and suitability
- Model shots: keep product as the hero; crop tight enough that environment doesn't distract from subject
- Never mislead: don't include props (ties, cufflinks, accessories) in photos if they aren't included in the product

---

## PART 8: CONVERSION RATE OPTIMISATION (CRO)

### The AIDA Framework for Page Design
**Attention → Interest → Desire → Action**

- **Attention:** First thing a new visitor sees must grab them — headline, hero image
- **Interest:** Explain how the product helps them; copy does this work
- **Desire:** Story about how the product benefited someone like them; benefits (not features) sell
- **Action:** Clear CTA at the end of the flow; "Order now", "Sign up here"

**Design rule:** Never design a website first and fill with words. Write the copy first, then build a design that delivers it.

### 8 Design-to-Sell Tips

1. **Subliminal Suggestion:** Images prime behaviour; choose images that embody the feeling you want to evoke. Clichéd stock photos send wrong signals. Every image must have a job.

2. **Prevent Choice Paralysis:** Too many options → users avoid choosing (Paradox of Choice, Barry Schwartz). Guide users with a recommended/highlighted default ("Most popular"). Tell users what each option is great for.

3. **Show the Product:** Show screenshots for software; show large product images for physical goods. Appearance signals usability (aesthetic-usability effect).

4. **Let People Try It:** Freemium, demo, or trial — once users invest time, they're more likely to convert. Free tier creates reliance → upgrade pathway.

5. **AIDA (as above)**

6. **Guide Attention:** Use arrows, aligned content flow, and images pointing toward CTAs. Structure page content to flow linearly toward the conversion action.

7. **Always Provide Next Actions (ABC — Always Be Closing):** No dead ends; every page suggests where to go next. Next-action link copy examples: "Ready to order? Click here", "Learn more", "Take the tour", "Shop now"

8. **The Gutenberg Rule:** Eyes scan western pages left-to-right, top-to-bottom; attention ends at **bottom-right** (Terminal Area). Place CTAs in bottom-right. Bottom-left (Weak Fallow Area) gets least attention.

### 7 Additional Conversion Tips

1. **A/B Testing:** Use Google Website Optimizer (free) or Visual Website Optimizer; test one variable at a time; always test A and B simultaneously; wait for statistical confidence before concluding
2. **Footnotes:** Use only for genuine supplementary technical detail; never hide critical price/condition information in tiny footnotes — it destroys trust when customers discover it
3. **Testimonials:** Always include attribution (name, company, city); speech marks alone improve believability; add case studies describing the process
4. **Scannable Feature Lists:** Slice marketing pitch into bite-sized chunks with headings, icons, and white space; people scan before they read
5. **Streamline Sign-Up Forms:** Only required fields; validate with AJAX in real time; show green tick on valid fields; remove navigation from sign-up page
6. **White Space:** Separate elements so users can focus on individual areas; cluttered pages reduce scannability
7. **Typography:** Use large headings; dark text on light background (not inverted) unless your audience is very design-forward; use high contrast for scan targets, lower contrast for body copy

---

## PART 9: TRUST AND CREDIBILITY SIGNALS

### Core Trust Principles
- Professional design differentiates legitimate businesses from amateurs
- 49% of US internet users are unwilling to use native online payment methods like PayPal (Foresee Institute study)
- Trust has both functional and emotional dimensions

### Trust-Building Techniques
- **Money-back guarantee:** Reduces purchase risk; in Europe required by law; display in shopping cart by default
- **Free shipping:** Most impactful single factor in the Foresee study — decisive for **34% of all users** in 10,500 transactions across 30 online stores
- **Transparent shipping costs:** Hidden shipping charges are the primary trust-killer; display final price early
- **Contact information:** Phone, email, physical address on every page; multiple contact channels
- **Team photos:** Show who is behind the business
- **Tell your story:** Authentic narrative builds emotional connection
- **Security badges/SSL indicators:** Visible throughout checkout
- **Third-party ratings:** Display ratings from external platforms (Google, Trustpilot, industry aggregators) — more trustworthy than a proprietary system
- **Verified reviews:** Amazon's "Verified Purchase" tag meaningfully increases review credibility

### On Shipping Costs
- The most important single feature improving conversion was offering free shipping (34% decisive factor)
- Strategies if you can't offer entirely free shipping:
  - Minimum order threshold for free shipping (show progress toward threshold)
  - First-order free shipping (investment in acquiring customer data)
  - Time-limited free shipping promotions with a countdown
  - Flat rate labelled "Small Order Fee" (not a surprise)

---

## PART 10: POST-PURCHASE CONVERSION STRATEGY

### The Thank-You Page (Most Neglected Conversion Tool)
After a completed purchase the customer has:
- Agreed with your payment and delivery methods
- Stated their preferences
- Given you their data
- Given you their trust

Use the Thank-You Page to:
- Advertise newsletter signup with explicit value proposition
- Show a 60-minute countdown with free shipping on their next order
- Show products other customers bought with this item (Amazon-style)
- Offer a coupon for an upcoming sale
- Preview next week's hot deals
- Lead to account area to save shipping address for faster future orders
- Ask for a review or testimonial

### Behavioural Targeting and Personalisation
- Use concrete purchase data (not just browsing data) to personalise follow-up
- Store session configurations and previous product comparisons
- Tell users that preferences are saved in cookies; don't silently restore abandoned carts (privacy concern with shared devices)
- Basic personalisation starts with email + password; use first conversion to trigger second (e.g. discount coupon requiring additional info)

### Good Service as Viral Marketing — "Cognitive Relief"
A loyal and satisfied customer:
- Ignores alternative choices (automatic repeat purchase)
- Returns to your store over and over
- Spreads word of mouth

> "Whatever optimization methods you are using, you should never compromise your quality of service and the performance of your store. The more responsive you are, the less reasons your customers will have to switch retailers. If you need a reason for Amazon's success, this is it."

---

## PART 11: A/B AND MULTIVARIATE TESTING — COMPLETE GUIDE

### What Is A/B Testing
Two versions (A = control, B = variation) run simultaneously; split traffic 50/50; measure conversions; keep winner.

**What to test:**
- CTA button wording, size, colour, and placement
- Headline or product description
- Form length and field types
- Layout and page style
- Product pricing and promotional offers
- Images on landing and product pages
- Amount of text on the page (short vs. long)

### Do's and Don'ts

**Don'ts:**
- Never test A this week and B next week — always run simultaneously
- Don't conclude before statistical confidence is reached (use a calculator)
- Don't test variations on returning visitors who know the old design — use new visitors only
- Don't let gut feeling override test results (a "ugly" red button on a green site may win)

**Do's:**
- Show repeat visitors the same variation every time
- Keep variation consistent across the entire site (all instances of the element)
- Run many tests — positive results compound into large gains
- Know your test duration calculator to avoid ending too early or too late

### 5-Step Multivariate Testing Process

1. **Identify the challenge** — define one clear goal (sign-ups, downloads, purchases, bounce rate)
2. **Form a hypothesis** — use your own critical review, web analytics data, and usability testing to list reasons for low conversion
3. **Create variations** — for A/B: change one element; for multivariate: change multiple elements and let the tool create all combinations
4. **Run the test and analyse results** — traffic splits equally across all combinations; track which version reaches the defined goal (e.g. "Thank You" page visit = purchase)
5. **Learn from results** — implement the winner; document the insight; use findings for the next test

### Multivariate Test Case Study Results
Software download page; control conversion rate: 39.4%

| Variation | Conversion | Improvement | Confidence |
|-----------|-----------|-------------|------------|
| "Download for Free" in red, default link | 63.2% | **+60%** | 99% |
| "Download" large font + link in red | 56.5% | +43% | 98% |
| "Download for Free" in red + link in red | 54.2% | +38% | 95% |

Key learnings:
- The word "FREE" is a very powerful attention grabber
- Best place to display "Free" is near or on the CTA
- Make "Free" clickable — don't frustrate users who click it expecting a link
- Red gets attention, but only converts when combined with persuasive copy
- Larger CTA signals importance to the visitor

### CRO Statistics from Re-Design Evidence
- Schwans: **45% conversion rate** (simple layout + great product photos + easy navigation)
- ProFlowers: **24.4% conversion rate** (simple layout + wide selection + ongoing conversion testing)
- Roamans: **18.4% conversion rate** (big clear homepage photos + clear offer text + simple horizontal navigation)
- Redesign that fixed fundamental problems: **doubled sales from launch day**
- 37Signals: **+30% sign-ups** from a single headline text change

### Button Wording Test Results (MarketingExperiments)
Testing email campaign CTA for paid subscriptions:
- "Continue here" → baseline
- "Continue to article" → **+3.3% conversions**
- "Click to continue" → **+10% conversions**

### Ad CTA: Amazon-style Order Button
Adding an Amazon-style order button doubled sales on one client's website (Al Carlton case study).

---

## PART 12: LAYOUT AND RE-DESIGN PRINCIPLES

### When to Consider a Re-Design
1. Your current design is the first version
2. Original layout was based primarily on creativity/aesthetics (not usability)
3. You have few or mediocre product photos
4. Your conversion rate is below **0.5%** — indicates fundamental problems

### Layout Best Practices
- Keep it simple — eliminate unnecessary clicks
- Use **horizontal navigation** — heat maps show that vertical navigation bars are frequently skipped if not in the centre of the screen
- Let products get attention, not the design
- Build an email opt-in into the store — "frightening percentage" of visitors find the store great but aren't ready to buy and never return; save 10% + email capture = bridge
- Ensure photos and layout don't clash

### Trust-Building Design Principles
- Professional, simple design separates legitimate business from amateurs
- Users must always feel in control — expert users want search filters; new users want menu navigation
- Ad-to-landing-page consistency is critical — the landing page must match the ad's promise exactly
- Segment ad content for novices (basic explanation) vs. experts (technical differentiators)
- Don't make design elements look like advertisements — users ignore ad-like elements even when they contain useful information (banner blindness)
- Product page → add to cart should be **maximum two clicks** from internal search result

---

## PART 13: VIDEO IN E-COMMERCE

### Why Video Works
- In Germany, nearly **60% of retailers** planned to increase video efforts (BVDW survey)
- Personal, handmade videos often perform better than polished studio productions (more honest, more authentic)
- Product videos show products in action — more immersive than static images

### Video Best Practices
- Authentic video (real people, real reactions) outperforms traditional advertising
- Community-style video (allow users to vote on best video) builds engagement
- Video does not require enormous budget — sales staff explaining product advantages on camera converts
- Show product in real-world use: outdoor gear on a trail, furniture in a living room

---

## PART 14: INFORMATION ARCHITECTURE AND NAVIGATION

### Core Navigation Rules
- Horizontal navigation outperforms vertical navigation (heat maps confirm)
- Every navigation category must contain at least several products
- Empty categories and single-item categories destroy credibility — merge or remove
- User must be able to understand page layout within first few seconds; any confusion = exits and high bounce rates

### User Control Principle
- Always keep the user in control: expert users need search + filters; new users need browsing hierarchy
- The user always has a question at each stage of the buying process; the design must prioritise answering that question
- "Deliver the right information at the right time" is the core usability principle for e-commerce

---

## PART 15: DESIGN PRINCIPLES SUMMARY CHECKLIST

### Before Launch — Pre-Build
- [ ] What are we selling? Physical / digital / subscriptions?
- [ ] What payment gateway / PSP are we using?
- [ ] Is PCI DSS compliance addressed?
- [ ] Are local tax calculations handled?
- [ ] Are shipping options and costs calculated in real-time?
- [ ] Is guest checkout available (no forced registration)?
- [ ] Does the system work without JavaScript enabled?

### Product Pages
- [ ] 4–5 product images minimum (overall, action, zoomed, colour variants)
- [ ] Images can be zoomed to at least 1024×768px
- [ ] Hover to see alternate view (no click required)
- [ ] Detailed product information: size, material, weight, dimensions, care
- [ ] Stock level shown on listing AND product page
- [ ] Pre-order option for out-of-stock items
- [ ] Related products shown
- [ ] Ratings and reviews displayed adjacent to product name
- [ ] Add-to-cart returns user to previous page or uses mini-cart

### Checkout
- [ ] Guest checkout available (no forced registration before purchase)
- [ ] Progress indicator showing all steps
- [ ] Cart shows thumbnail, specs, and links for each item
- [ ] Back button works and preserves form data
- [ ] All navigation and promotional elements removed from checkout pages
- [ ] No external page redirects during checkout (use modals for help)
- [ ] Delivery estimates shown (updated dynamically with AJAX)
- [ ] Final order confirmation page before submission
- [ ] Thank-you page with order details + next steps
- [ ] Confirmation email sent with order details + modification window

### Trust
- [ ] Contact info (phone, email, address) visible on every page
- [ ] Money-back guarantee displayed
- [ ] Shipping costs shown early (preferably on product page)
- [ ] Security indicators visible during checkout
- [ ] Store policies (returns, shipping, privacy) accessible from every page
- [ ] Third-party reviews/ratings integrated or displayed
- [ ] Team photos and company story on About page

### Conversion
- [ ] AIDA structure applied to landing and product pages
- [ ] CTAs placed at end of content flow (bottom-right per Gutenberg Rule)
- [ ] No dead-end pages; every page has a next-action link
- [ ] Testimonials with attribution (name, company, city)
- [ ] Feature lists are scannable (headings, icons, white space)
- [ ] Sign-up/registration form is minimal (only required fields)
- [ ] A/B testing framework set up

### Photography
- [ ] Products shot on neutral/white background
- [ ] Consistent lighting style across all products
- [ ] 3 shot types per product: overall, action, detail zoom
- [ ] Photos show benefits, not just features
- [ ] No misleading props in product photos
- [ ] Scale reference included where size is a concern
