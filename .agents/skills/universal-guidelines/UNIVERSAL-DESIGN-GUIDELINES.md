---
title: Universal Website Design Guidelines
description: Best practices applicable across all industries, sectors, and website types
---

# Universal Website Design Guidelines

Core principles, standards, and best practices that apply to every website regardless of industry, purpose, or audience.

## Core Design Principles

### Purpose-Driven Design

Every website element must serve a clear purpose. Before adding any feature, ask: "Does this help users achieve their goals or advance business objectives?"

**Guidelines:**
- Define primary website goals before designing
- Align design decisions with user needs
- Remove elements that don't serve a clear purpose
- Prioritize content based on user intent
- Create user journeys that map to real-world scenarios

### Visual Hierarchy

Guide users' attention to what matters most through strategic arrangement of elements.

**Hierarchy Levels:**
1. **Primary**: Hero sections, main CTAs, headlines (draws attention immediately)
2. **Secondary**: Section headers, supporting images (supporting information)
3. **Tertiary**: Body text, secondary navigation (supporting details)
4. **Supplementary**: Footnotes, legal text (reference only)

**Techniques:**
- Size and scale (larger = more important)
- Color contrast (brighter/bolder = more attention)
- Positioning (top/center = priority)
- Whitespace (more space = emphasis)
- Typography weight (bold/italics = importance)
- Depth/layering (foreground > background)

### Consistency

Maintain uniformity across all pages and interactions to reduce cognitive load and build trust.

**Consistency Requirements:**
- Same navigation patterns throughout site
- Consistent button styles and behaviors
- Uniform heading hierarchy (H1 > H2 > H3)
- Standardized icon usage and sizing
- Predictable link styling (hover states, colors)
- Coherent color application (primary, secondary, accent)
- Consistent spacing and layout grids

---

## User Experience (UX) Fundamentals

### User-Centered Design

Design for the people who will actually use your site, not for stakeholders or personal preferences.

**User Research Methods:**
- User interviews and surveys
- Analytics data analysis
- Heatmap tracking and session recording
- Usability testing with real users
- Persona development and validation
- Journey mapping (current and desired state)

### Cognitive Load Reduction

Make interfaces easy to process by minimizing mental effort.

**Strategies:**
- Chunk information into digestible pieces
- Use familiar patterns and conventions
- Limit choices (Hick's Law: too many options = paralysis)
- Provide clear feedback for every action
- Reduce required memory (recognition > recall)
- Use progressive disclosure for complex information
- Remove unnecessary visual elements

### Error Prevention & Recovery

Help users avoid mistakes and easily recover when they occur.

**Prevention Tactics:**
- Validate form inputs in real-time
- Use clear labels and helpful instructions
- Confirm destructive actions
- Provide default values where appropriate
- Use constraints (date pickers, dropdowns)
- Disable unavailable options

**Recovery Tactics:**
- Clear error messages with solutions
- Easy undo/redo functionality
- Save form data temporarily
- Provide multiple contact options
- 404 pages with navigation options
- Helpful error suggestions

### Feedback Systems

Users should always know the result of their actions.

**Feedback Examples:**
| Action | Feedback | Timing |
|--------|----------|--------|
| Click button | Visual change (color, scale, shadow) | Immediate |
| Form submit | Loading indicator with message | During processing |
| Success | Confirmation toast with checkmark | After completion |
| Error | Error message with solution | When issue occurs |
| Hover | Visual state change (color/underline) | On interaction |

---

## Visual Design Standards

### Color Theory & Application

Use color strategically to enhance usability and brand recognition.

**Color Distribution (60-30-10 Rule):**
- **Primary color**: 60% of design (brand dominance, main sections)
- **Secondary color**: 30% of design (support, accents)
- **Accent color**: 10% of design (CTAs, highlights, warnings)

**Accessibility Requirements:**
- Minimum contrast ratio: 4.5:1 for normal text (WCAG AA)
- Minimum contrast ratio: 3:1 for large text (WCAG AA)
- Minimum contrast ratio: 7:1 for body text (WCAG AAA - recommended)
- Don't rely solely on color to convey information
- Test in grayscale to verify differentiation
- Ensure colorblind users can distinguish elements

**Color Psychology by Intent:**
| Color | Psychology | Use Cases |
|-------|-----------|-----------|
| Blue | Trust, stability, calmness | Primary CTA, headers, corporate |
| Green | Growth, nature, healing | Success, eco-friendly, health |
| Red | Urgency, danger, energy | Warnings, limited-time offers |
| Orange | Warmth, enthusiasm, energy | Secondary CTA, adventure |
| Purple | Creativity, luxury, spirituality | Premium offerings, creative |
| Gray | Neutral, professional, safe | Backgrounds, secondary elements |

### Typography Best Practices

Choose and implement fonts that enhance readability and reinforce brand personality.

**Font Selection Rules:**
- Limit to 2-3 font families maximum (1 display + 1-2 body)
- Display font should have CHARACTER and personality
- Body font must prioritize readability over style
- Use system fonts or web fonts (Fontsource preferred)
- Ensure web font licenses for commercial use
- Test readability at various sizes (desktop + mobile)

**Typography Scale:**

```
Body Text:
- Size: 16px minimum (accessibility requirement)
- Line height: 1.5-1.6 (readability)
- Line length: 50-75 characters (comfortable reading)
- Weight: 400 (regular/normal)
- Letter spacing: 0 (normal)

Headings (Systematic Scaling):
- H1: 2.5rem (40px) | Line-height: 1.1 | Weight: 700 | Bold
- H2: 2rem (32px) | Line-height: 1.2 | Weight: 600 | Semibold
- H3: 1.5rem (24px) | Line-height: 1.3 | Weight: 600 | Semibold
- H4: 1.25rem (20px) | Line-height: 1.4 | Weight: 600 | Semibold
- H5: 1.125rem (18px) | Line-height: 1.4 | Weight: 600 | Semibold
- H6: 1rem (16px) | Line-height: 1.5 | Weight: 600 | Semibold

Small Text:
- Size: 14px | Line-height: 1.5 | Weight: 400
- Use only for: metadata, captions, secondary info
```

### Spacing & Layout Systems

Create visual rhythm and breathing room through consistent spacing.

**Spacing System (Base Unit: 8px):**

```css
--space-xs: 0.5rem;   /* 8px - tight spacing, small gaps */
--space-sm: 1rem;     /* 16px - default padding, small margins */
--space-md: 1.5rem;   /* 24px - standard padding, section gaps */
--space-lg: 2rem;     /* 32px - large gaps, component separation */
--space-xl: 3rem;     /* 48px - major section breaks */
--space-2xl: 4rem;    /* 64px - full-width section separation */
--space-3xl: 5rem;    /* 80px - page-level breaks */
```

**Layout Guidelines:**
- Use consistent padding/margins throughout site
- Implement grid system for alignment (8px grid ideal)
- Create visual rhythm with alternating patterns
- Leave adequate whitespace (minimum 20-30% of page)
- Stack sections with consistent gaps
- Maintain padding symmetry (equal top/bottom, left/right)

### Imagery & Icons

Use visuals that enhance communication and emotional connection.

**Image Guidelines:**
- Use authentic, high-quality images (minimum 1920px width)
- Optimize all images for web (compress, use WebP/AVIF)
- Provide descriptive alt text for accessibility
- Consider cultural appropriateness and diversity
- Maintain consistent photography style/lighting
- Use consistent image aspect ratios by section
- Avoid generic stock photos where possible

**Background Zoom & Image Motion Effects:**

Background zoom adds dynamism and depth to hero sections, cards, and galleries. Use Tailwind's `group-hover:scale-*` with `transition-transform` for smooth, performant effects.

- **Hover zoom on cards/images:** Wrap image in `overflow-hidden` container, apply `group-hover:scale-110 transition-transform duration-500 ease-out` to the image. Keep scale between 105-115% — more feels aggressive
- **Overlay fade with zoom:** Combine image zoom with overlay transition: `bg-black/40 group-hover:bg-black/20` reveals more image as it zooms
- **Text lift on zoom:** Add `group-hover:scale-105` to text overlay for subtle depth parallax
- **Responsive scaling:** Use `md:hover:scale-125` to increase zoom on larger screens where the effect has more visual impact
- **Performance:** Use `transition-transform` (GPU-accelerated), not `transition-all`. Apply `will-change-transform` only on elements that will animate. Optimize source image file sizes
- **Accessibility:** Always respect `prefers-reduced-motion` — disable zoom animations for users who request it. Ensure text contrast is maintained at both normal and zoomed states
- **When to use:** Hero sections, portfolio/gallery grids, feature cards over images, destination/product cards, team member photos
- **When to avoid:** Navigation elements, form areas, text-heavy sections, anywhere zoom could cause content reflow or reading difficulty

**Video Policy:**
- **NEVER upload video files to the repository or server** — video files are too large for static hosting
- **Host all videos on YouTube** — free, unlimited storage, global CDN, adaptive bitrate
- Clients upload their videos to their YouTube channel, then provide YouTube URLs in their docs
- Embed using `<iframe>` with `loading="lazy"` and `title` attribute for accessibility
- Use `youtube-nocookie.com` embed domain for privacy compliance
- Provide a poster/thumbnail image as fallback (shows before video loads)
- Always include `title` attribute describing the video content for screen readers
- Autoplay only with `muted` attribute; never autoplay with sound

**Icon Standards:**
- Use recognizable, standard icons (Lucide, Heroicons)
- Include text labels when icon meaning unclear
- Maintain consistent stroke weight (1.5-2px)
- Test for recognition with target users
- Provide tooltips for ambiguous icons
- Size appropriately (minimum 24px for touch targets)
- Use consistent icon styles throughout site

---

## Content Strategy

### Clear Information Architecture (IA)

Organize content logically so users can find what they need easily.

**IA Organization Methods:**
- **Topical**: Group by subject matter (best for comprehensive sites)
- **Task-based**: Organize by user goals (best for conversion-focused)
- **Audience**: Separate by user type (best for multi-audience sites)
- **Chronological**: Time-based ordering (best for news/events)
- **Alphabetical**: Simple listing (best for reference sites)

**IA Testing Methods:**
- Card sorting exercises (open, closed, hybrid)
- Tree testing (test structure without design)
- Analytics review (what pages do users visit?)
- Search log analysis (what do users search for?)

### Scannable Content

Users don't read—they scan. Design content for quick comprehension.

**Scannable Formatting Principles:**
- Descriptive headings and subheadings (tell story in headlines)
- Bullet points and numbered lists (break up paragraphs)
- Short paragraphs (3-4 lines maximum)
- Bold key phrases and terms
- Pull quotes for emphasis or validation
- Visual breakpoints every 200-300 words
- White space between sections
- Images/graphics to break up text

**Scannable Content Structure:**
```
Headline
↓
Subheading (value prop)
↓
2-3 Short paragraphs
↓
Bullet points (benefits/features)
↓
Visual break (image, graphic)
↓
Call-to-action or next section
```

### Clear Calls-to-Action (CTAs)

Tell users exactly what you want them to do next.

**CTA Best Practices:**
- Use action-oriented language ("Get Started," "Download," "Subscribe," "Reserve")
- Create urgency when appropriate ("Limited Time," "Act Now")
- Make buttons visually distinct (highest contrast)
- Position strategically (above fold, after value prop, in footer)
- Limit choices per section (1-2 primary CTAs maximum)
- Test different copy variations for higher conversion
- Include secondary CTA for users not ready

**CTA Copy Examples:**
| Goal | Bad Copy | Effective Copy |
|------|----------|----------------|
| Download | "Download" | "Get Free Template" |
| Newsletter | "Subscribe" | "Join 50K Subscribers" |
| Demo | "Learn More" | "See It In Action" |
| Contact | "Contact Us" | "Schedule Your Demo" |
| Purchase | "Buy Now" | "Get 30% Off Today" |

---

## Performance Optimization

### Core Web Vitals Targets

Speed impacts user experience, SEO ranking, and conversion rates.

**Core Web Vitals Benchmark:**

| Metric | Good | Needs Work | Poor |
|--------|------|-----------|------|
| **LCP** (Loading) | < 2.5s | 2.5-4.0s | > 4.0s |
| **FID** (Interactivity) | < 100ms | 100-300ms | > 300ms |
| **CLS** (Visual Stability) | < 0.1 | 0.1-0.25 | > 0.25 |

**Image Optimization:**
- Use WebP format (20-30% smaller than PNG/JPG)
- Provide AVIF fallback for modern browsers
- Compress all images (TinyPNG, ImageOptim)
- Use responsive images (srcset for different screen sizes)
- Lazy-load below-fold images
- Set explicit width/height to prevent layout shift

**Code Optimization:**
- Minify CSS and JavaScript
- Remove unused CSS (PurgeCSS, Tailwind)
- Defer non-critical JavaScript
- Async load third-party scripts
- Use critical CSS inline in `<head>`
- Remove render-blocking resources

### Mobile Performance

Mobile users expect speed even on slower connections.

**Mobile-Specific Optimization:**
- Target page weight: < 1.5MB total
- Minimize third-party scripts (each ~50-100KB)
- Use responsive images (mobile typically 30-50KB)
- Implement AMP for text-heavy content
- Test on real mobile devices (not just DevTools)
- Assume slower connections (4G/5G variability)
- Reduce animated GIFs (large file size)

---

## Accessibility Requirements

### WCAG 2.1 AA Compliance

Design for all users, regardless of ability. WCAG AA is the standard; AAA is ideal.

**Perceivable:**
- Text alternatives for all images and icons
- Captions and transcripts for multimedia
- Content adaptable (can be presented in multiple ways)
- Distinguishable content (high contrast, readable text)

**Operable:**
- All functionality keyboard-accessible
- Users have enough time to read/use content
- No content causes seizures or physical reactions
- Help users navigate and find content

**Understandable:**
- Text readable and understandable
- Content appears and operates predictably
- Help users avoid and correct mistakes
- Clear language, simple sentences

**Compatible:**
- Valid HTML code
- Compatible with assistive technologies
- Proper semantic markup

### Keyboard Navigation

Ensure all functionality is available via keyboard.

**Keyboard Requirements:**
- Logical, predictable tab order
- Visible focus indicators (2px outline minimum)
- Skip navigation links (skip to main content)
- No keyboard traps (user can exit any element)
- Accessible dropdown menus (arrow keys)
- Form controls accessible via Tab

### Screen Reader Compatibility

Structure content for assistive technology users.

**Implementation:**
- Semantic HTML (nav, main, article, aside, section)
- Proper heading hierarchy (H1 → H2 → H3, no skipping)
- ARIA labels for unlabeled elements
- Descriptive link text (not "click here")
- Form field labels associated with inputs
- Alt text for all meaningful images
- List markup for lists (ul, ol, li)

---

## Mobile-First Approach

### Responsive Design Strategy

Create experiences that work on every screen size.

**Breakpoint Strategy (Mobile-First):**

```css
/* Base: Mobile (320px) */
/* All base styles target mobile first */

/* Tablet (≥ 640px) */
@media (min-width: 640px) { }

/* Desktop (≥ 1024px) */
@media (min-width: 1024px) { }

/* Large Desktop (≥ 1280px) */
@media (min-width: 1280px) { }
```

**Responsive Testing:**
- Test at actual breakpoints (375px, 768px, 1280px)
- Test on real devices (not just browser emulation)
- Test landscape and portrait orientations
- Test with various zoom levels (200%)

### Touch-Friendly Interfaces

Design for fingers, not cursors.

**Touch Target Standards:**
- Minimum size: 44x44px (accessibility standard)
- Adequate spacing between tappable elements (8px minimum)
- Consider thumb reach (hot zones: center to lower center)
- Avoid hover-dependent interactions (mobile has no hover)
- Use appropriate touch feedback (haptic, visual change)

### Mobile Navigation Patterns

Simplify navigation for small screens.

**Mobile Navigation Options:**
- **Hamburger menu**: 5+ navigation items
- **Bottom navigation**: Primary actions (4-5 tabs)
- **Sticky header**: Logo + search + hamburger
- **Expandable sections**: Accordions for content
- **Simplified mega menus**: No nested dropdowns on mobile

---

## Trust & Credibility Signals

### Professional Design

First impressions matter—design quality signals credibility within 50 milliseconds.

**Trust-Building Design Elements:**
- Clean, modern, professional appearance
- Error-free content (no typos, outdated info)
- Professional imagery and photography
- Consistent branding throughout
- Fast load times (< 3 seconds)
- Mobile optimization
- Clear visual hierarchy

### Social Proof

Show that others trust and use your site.

**Social Proof Types:**
- Testimonials with real names and professional photos
- Client logos or "Featured In" logos
- Case studies with quantified results
- Review integrations (Google, Trustpilot, G2)
- Social media follower counts
- User statistics (customers served, years in business)
- "Trusted by X companies" messaging

### Transparency

Be open about who you are and what you do.

**Transparency Elements:**
- Clear "About" page with team photos
- Physical address (if applicable)
- Multiple contact methods
- Pricing information (when possible)
- Privacy policy (required)
- Terms of service (required)
- Returns/cancellation policy
- Company history and mission

### Security Signals

Reassure users their data is safe.

**Security Indicators:**
- SSL certificate (HTTPS, green lock)
- Trust badges (Norton, McAfee, BBB)
- Payment icons (Visa, Mastercard, PayPal, Apple Pay)
- Privacy certifications (SOC 2, GDPR compliant)
- Clear data handling policies
- Security seal placement (usually footer)

---

## Navigation Best Practices

### Intuitive Navigation

Users should never feel lost on your site.

**Navigation Principles:**
- Keep primary navigation visible and accessible
- Limit top-level items (5-7 maximum, 9 absolute max)
- Use descriptive labels (no jargon or abbreviations)
- Indicate current page location (highlight, underline)
- Provide breadcrumbs for deep sites (> 3 levels)
- Include site search for large sites (50+ pages)
- Maintain navigation in footer (footer links valuable for SEO)

### Consistent Structure

Navigation should behave predictably.

**Consistency Requirements:**
- Same position and prominence across pages
- Same order of navigation items
- Same styling for interactive elements
- Predictable dropdown behavior (no surprises)
- Standard link appearance and hover states
- Mobile and desktop navigation consistency

### Search Functionality

Help users find what they need quickly.

**Search Best Practices:**
- Prominent placement (header, above fold)
- Autocomplete suggestions
- Typo tolerance (fuzzy matching)
- Filter and sort options for results
- Show result counts ("42 results found")
- Highlight search terms in results
- Show "no results" suggestions

---

## Conversion Optimization

### Clear Value Proposition

Tell users immediately why they should stay.

**Value Proposition Components:**
- **Headline**: What you offer (clear, specific)
- **Subheadline**: Who it's for (target audience)
- **Visual**: Show, don't just tell (image or video)
- **Benefits**: Why it matters (not features, benefits)
- **Social Proof**: Who trusts you (logos, testimonials)
- **CTA**: What to do next (specific, action-oriented)

**Value Prop Formula:**
```
[Product/Service Name] helps [Target Audience] achieve [Specific Benefit]
by [Key Differentiator] unlike [Alternative].
```

### Progressive Engagement

Guide users from awareness to action through natural progression.

**Engagement Funnel:**
```
Awareness → Interest → Desire → Action
    ↓          ↓         ↓        ↓
Landing → Content → Benefits → CTA
 Page     Pages
```

**Tactics:**
- Start with low-commitment actions (newsletter, follow)
- Build trust before asking for big commitments
- Use exit-intent popups for abandonment
- Offer time-limited incentives for conversions
- Reduce friction in conversion forms

### Form Optimization

Make forms easy to complete.

**Form Best Practices:**
- Only ask for essential information
- Use appropriate field types (email, number, date)
- Provide inline validation (real-time feedback)
- Group related fields logically
- Show progress for multi-step forms
- Use clear, specific error messages
- Enable browser autofill
- Single column layout on mobile

---

## SEO Fundamentals

### Technical SEO

Ensure search engines can crawl and index your site.

**Technical Requirements:**
- XML sitemap (updated, submitted to GSC)
- Robots.txt file (guiding crawlers)
- Canonical URLs (avoiding duplicate content)
- Proper URL structure (descriptive, hierarchical)
- Mobile-first indexing ready
- Fast loading speed (< 2.5s LCP)
- Structured data (schema.org markup)

### On-Page SEO

Optimize individual pages for relevant search terms.

**Critical On-Page Elements:**

| Element | Best Practice | Example |
|---------|---------------|---------|
| Title Tag | 50-60 chars, keyword first | "Best SEO Tools 2026 \| Company Name" |
| Meta Desc. | 150-160 chars, compelling | "Discover the 10 best SEO tools for 2026. Free comparison chart..." |
| H1 | One per page, includes keyword | "Best Free SEO Tools for Small Business" |
| Content | 1000+ words, addresses intent | Comprehensive, thorough coverage |
| Internal Links | Relevant, descriptive anchor text | "Learn more about SEO strategies" |
| Image Alt Text | Descriptive, keyword included | "Best SEO tools dashboard screenshot" |

### Content SEO

Create content that answers user questions and ranks.

**Content Strategy:**
- Target user search intent (what problem is user solving?)
- Answer questions comprehensively (not just summaries)
- Use natural language (not keyword stuffing)
- Update content regularly (shows freshness to engines)
- Build topic clusters (pillar + child content)
- Earn quality backlinks (link building strategy)

---

## Maintenance & Governance

### Regular Audits

Continuously evaluate and improve.

**Audit Schedule:**

| Frequency | Focus Area |
|-----------|-----------|
| Weekly | Analytics review, uptime monitoring |
| Monthly | Content freshness, broken link check |
| Quarterly | Security scan, performance review, user feedback |
| Annually | Full redesign evaluation, strategy update |

### Content Governance

Keep content accurate, consistent, and up-to-date.

**Governance Requirements:**
- Define content owners (who updates what)
- Establish update schedules
- Create style guides (tone, terminology)
- Implement approval workflows
- Archive outdated content (mark as old)
- Regular content audits

### Security Maintenance

Protect your site and user data.

**Security Checklist:**
- [ ] Regular software/CMS updates
- [ ] Strong password policies (unique, 16+ chars)
- [ ] SSL certificate maintenance and renewal
- [ ] Automated backup strategy (tested regularly)
- [ ] Security monitoring and alerts
- [ ] DDoS protection enabled
- [ ] Regular malware scanning

### Performance Monitoring

Track and maintain site speed.

**Monitoring Tools:**
- Google PageSpeed Insights
- Lighthouse (built into Chrome DevTools)
- WebPageTest (detailed analysis)
- GTmetrix (performance recommendations)
- Chrome UX Report (real user data)
- Custom RUM (Real User Monitoring)

### Analytics & Improvement

Use data to guide decisions.

**Key Metrics by Category:**

| Category | Metrics | What It Means |
|----------|---------|---------------|
| Traffic | Users, Sessions, Pageviews | How many people visit |
| Acquisition | Source, Channel, Campaign | How users find you |
| Behavior | Bounce Rate, Pages/Session, Time | What users do on site |
| Conversions | Goal Completions, Conversion Rate | How many achieve goals |
| Technical | Page Speed, Errors, Uptime | Site health |

**Continuous Improvement Cycle:**
```
Measure → Analyze → Hypothesize → Test → Implement → Repeat
```

---

## Quick Reference Checklist

### Pre-Launch Verification

**Design & UX**
- [ ] Clear visual hierarchy throughout all pages
- [ ] Consistent branding and design patterns
- [ ] Intuitive navigation structure tested with users
- [ ] Mobile-responsive on all screen sizes
- [ ] All interactive elements provide clear feedback

**Content**
- [ ] Value proposition clear above fold
- [ ] Unique title and description on every page
- [ ] Content scannable (headings, lists, short paragraphs)
- [ ] No placeholder text or lorem ipsum
- [ ] All external links functional and descriptive

**Performance**
- [ ] PageSpeed score > 90 (mobile and desktop)
- [ ] All images optimized and lazy-loaded
- [ ] CSS/JavaScript minified and deferred
- [ ] Core Web Vitals pass thresholds
- [ ] Loading time < 2.5 seconds

**Accessibility**
- [ ] Color contrast meets WCAG AA (4.5:1)
- [ ] All images have descriptive alt text
- [ ] Keyboard navigation fully functional
- [ ] Focus indicators visible
- [ ] Forms labeled properly with proper associations

**Technical SEO**
- [ ] XML sitemap submitted to Search Console
- [ ] Robots.txt configured correctly
- [ ] Canonical tags implemented
- [ ] Structured data added (schema.org)
- [ ] SSL certificate valid (HTTPS)

**Trust & Legal**
- [ ] Privacy policy page present and linked
- [ ] Terms of service present and linked
- [ ] Contact information visible and accessible
- [ ] Trust badges/certifications displayed
- [ ] Company information accurate and current

**Analytics & Monitoring**
- [ ] Analytics tracking installed and verified
- [ ] Goals/conversions configured
- [ ] Search Console verified
- [ ] Uptime monitoring configured
- [ ] Backup system in place and tested


## World-class UX foundations (book-derived, added 2026-05-04)

Five UX/UI book extractions are now the upstream source for design decisions on premium projects. Canonical location: `book-extractions/`.

### The four cross-cutting rules

1. **Validated user research is non-negotiable** (Levy). No "Field of Dreams" launches — confront target customers with an MVP/landing page before scaling. Source: `book-extractions/levy-ux-strategy-extraction.md`.

2. **All 5 outcomes must hit, not 4 of 5** (Synechron Enterprise UX). Useful + Easy + Efficient + Pleasing + Accessible. One No = no premium launch. Source: `book-extractions/enterprise-ux-financial-insurance-extraction.md`.

3. **Recognition over recall + 4-stage cognitive affordance** (Branson). Show, don't make users remember. Every interactive element must pass Presence → Visibility → Recognizability → Intelligibility. Source: `book-extractions/branson-ux-ui-design-extraction.md`.

4. **Design is ongoing, not a project** (Fekeshazi). Plan for continuous design alongside continuous dev. A dev team without a design team is a few bricks short of a load. Source: `book-extractions/fekeshazi-pm-ux-guide-extraction.md`.

### Pointer to the engine's skills

The skills that operationalize these rules:
- `skills/premium-ui-ux-design/` — Levy 4 tenets, 5 outcomes, PM rules
- `skills/ux-psychology/` — Three Paradigms, working memory, 4-stage affordance, 3 levels of UX scope
- `skills/design-quality-score/` — UX Maturity 5-level checklist as 8th rubric category
- `skills/design-reference/` — Levy 19-column competitive matrix
- `skills/design-system/` — enterprise data-viz rules, first-impression checklist, enterprise anti-patterns

---

This document serves as a reference for all website projects. Reference these guidelines when making design decisions, optimizing for performance, ensuring accessibility, or planning content strategy.
