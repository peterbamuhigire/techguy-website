# On-Page Content SEO Checklist

Actionable on-page SEO rules for every page built by the page-builder skill. These complement the technical SEO in the main SKILL.md with content-level optimisation that directly affects search rankings.

---

## URL Slug Optimisation

Every page URL must be SEO-friendly:

1. **Include the target keyword** in the URL slug. `/en/banana-tissue-culture` not `/en/page-3`.
2. **Localize every translated slug.** For each enabled language, write the slug in that language using its own keyword research and natural search terms. Do not reuse English slugs on French, Kiswahili, or other non-English pages unless the phrase is a proper noun, brand, acronym, or the dominant local search term.
3. **Keep it short** — under 60 characters for the slug portion. Cut words that add no meaning.
4. **Use hyphens** to separate words. Never underscores, spaces, or special characters.
5. **Remove stop words** if they add no clarity. `/en/banana-storage-methods` not `/en/the-best-banana-storage-methods`.
6. **Match the page title** — URL and title should clearly relate. A mismatch confuses both users and crawlers.
7. **No dynamic parameters** in static site URLs. Astro handles this by default.
8. **Lowercase only.** Never mixed case.
9. **Map language equivalents explicitly.** Language switchers, canonical tags, hreflang tags, internal links, and sitemap alternates must use a shared route map so `/en/inventory-management-system/` can correctly pair with a localized URL such as `/fr/logiciel-gestion-stock/` or the equivalent in any other supported language.

**Example:**
```
Good: /en/banana-fusarium-wilt-prevention
Good: /fr/prevention-fusariose-banane
Good: /sw/kuzuia-mnyauko-wa-ndizi
Bad:  /en/article?id=47
Bad:  /en/About_Our_Research_Into_The_Prevention_Of_Fusarium_Wilt
Bad:  /fr/banana-fusarium-wilt-prevention
```

---

## Keyword Placement Rules

Google assigns higher relevance scores when keywords appear in specific positions. Follow this priority order:

### 1. Page Title (`<title>` tag)
- Primary keyword **at the beginning** of the title, not the end.
- "Banana Tissue Culture Research | BIRDC" not "BIRDC | Our Tissue Culture Research"
- Already enforced in main SKILL.md (50-60 chars).

### 2. H1 Heading
- Must contain the primary keyword or a close variant.
- One H1 per page (already enforced).
- H1 should closely match the `<title>` tag content.

### 3. First 20 Words of Body Content
- The primary keyword must appear within the first sentence or first 20 words of body copy.
- Google scrutinises the opening text to determine page topic.
- Secondary keywords should appear within the first 200 words.

### 4. Subheadings (H2, H3)
- Include secondary/related keywords naturally in H2 and H3 headings.
- Do not stuff — headings must read naturally and be grammatically correct.
- Each H2/H3 should describe the section content accurately.

### 5. Image ALT Text and Filenames
- Primary keyword in at least one image ALT text per page.
- Related keywords in other image ALT texts.
- **File naming convention** (BEFORE upload): Use descriptive, keyword-rich filenames.
  - `banana-tissue-culture-laboratory.jpg` not `IMG_4523.jpg`
  - `matooke-flour-processing.jpg` not `photo-2.png`
  - The photo-manager skill should enforce this during cataloguing.

### 6. Body Content
- Use the primary keyword naturally 2-4 times in body text (never forced).
- Use LSI/related terms throughout (covered by content-writing skill's "niche vocabulary" section).
- Bold or italicise the keyword on first use in the body for slight emphasis signal.

---

## Internal Linking Strategy

Internal links distribute PageRank and help Google understand site structure. Use **hierarchical linking**, not flat mesh linking.

### Hierarchical Linking Rules

1. **Homepage gets the most internal links.** Every page links to home via logo/nav.
2. **Key pages** (services, products, research) get links from multiple other pages.
3. **Non-relevant pages** (privacy policy, terms of use, contact, about) should primarily link back to the homepage — don't funnel PageRank to pages that won't rank for target keywords.
4. **Every page** should be reachable within 2 clicks from the homepage (already in main SKILL.md).

### Anchor Text Rules

- **Use descriptive, keyword-rich anchor text.** "Learn about our banana tissue culture programme" not "Click here."
- **Vary anchor text** — don't use the exact same text for every link to a page.
- **Never use** "Click here," "Read more," "Learn more" as sole anchor text. These tell Google nothing about the linked page.
- The visible link text should accurately describe the destination page content.

### Content Cross-Linking

- When one page mentions a topic covered in depth on another page, link to it.
- Blog posts should link to relevant service/product pages (and vice versa).
- Aim for 2-5 internal links per page of body content (not counting navigation).

---

## Outbound Links

Linking to authoritative external sources signals trustworthiness:

- Link to 1-2 high-authority external sources per page where relevant (research papers, government sites, industry bodies).
- Use `rel="noopener"` and `target="_blank"` for external links.
- Do NOT add `rel="nofollow"` to editorial links to trusted sources — Google uses these to understand topic context.
- Avoid linking to competitors or low-quality sites.

---

## Content Length Guidelines

Google correlates content depth with quality for informational queries:

| Page Type | Minimum Words | Ideal Range | Notes |
|-----------|--------------|-------------|-------|
| Homepage | 300 | 400-600 | Concise value prop + key sections |
| Service/product page | 500 | 600-1000 | Features, benefits, process |
| About page | 400 | 500-800 | Story, team, credentials |
| Blog post / article | 1000 | 1500-2500 | Thorough topic coverage |
| Cornerstone content | 2000 | 2500-4000 | Definitive resource on topic |
| Contact page | 150 | 200-400 | Address, hours, form, map |

- Thin pages (<300 words of unique content) may not rank.
- Word count alone does not guarantee ranking — quality and relevance matter more.
- Never pad content to hit word counts. Every sentence must add value.

---

## Meta Description Two-Part Structure

Write meta descriptions in two parts for optimal display on both mobile and desktop:

1. **First 120 characters** — the mobile-visible portion. Must contain:
   - Primary keyword
   - Core value proposition or USP
   - Enough context to be compelling standalone

2. **Characters 121-155** — the desktop extension. Add:
   - Call-to-action
   - Secondary keyword or differentiator
   - Additional detail

**Example:**
```
Mobile (120 chars):
"BIRDC develops disease-resistant banana cultivars through tissue culture research for East African smallholder farmers."

Full desktop (155 chars):
"BIRDC develops disease-resistant banana cultivars through tissue culture research for East African smallholder farmers. Explore our programmes."
```

---

## Image SEO (Beyond ALT Text)

The main SKILL.md covers ALT text. These additional rules improve image search visibility:

1. **Descriptive filenames** — Set before upload. `banana-black-sigatoka-leaf.jpg` not `DSC_0042.jpg`.
2. **File size** — Compress to under 200KB for web. Astro's Image component handles WebP/AVIF conversion.
3. **Dimensions** — Match the display size. Don't serve a 4000px image in a 800px container (photo-manager handles this via `_catalog.json`).
4. **Captions** — Visible text captions below images are read 2x more than body copy and provide additional keyword context for Google.
5. **One image per key section** — Pages with images rank better than text-only pages. Aim for at least one relevant image per major section.
6. **Lazy loading** — All below-fold images use `loading="lazy"` (already enforced by page-builder).

---

## On-Page SEO Audit Checklist

Run this checklist for every page before publishing:

### Title & Meta
- [ ] Title tag: 50-60 chars, primary keyword at start, unique per page
- [ ] Meta description: 150-155 chars, two-part structure, includes CTA
- [ ] URL slug: short, keyword-included, hyphens, no stop words
- [ ] Multilingual slugs localized for every enabled language, with equivalent routes mapped for switcher, canonical, hreflang, sitemap, and internal links

### Content
- [ ] Primary keyword in first 20 words of body
- [ ] H1 contains primary keyword, matches title closely
- [ ] H2/H3 headings contain secondary/related keywords naturally
- [ ] Content meets minimum word count for page type
- [ ] LSI/niche vocabulary used throughout (see content-writing skill)
- [ ] Primary keyword bolded/emphasised on first use

### Links
- [ ] 2-5 internal links in body content with keyword-rich anchor text
- [ ] 1-2 outbound links to authoritative sources
- [ ] No "click here" or "read more" as anchor text
- [ ] All pages reachable within 2 clicks from homepage

### Images
- [ ] Descriptive filenames (not IMG_xxxx)
- [ ] ALT text on every image, primary keyword in at least one
- [ ] At least one image per major section
- [ ] Captions where appropriate

### Technical (verified by main SKILL.md)
- [ ] Canonical URL set
- [ ] Hreflang tags for all language versions
- [ ] JSON-LD schema appropriate for page type
- [ ] Page loads in under 3 seconds
- [ ] Mobile-friendly
