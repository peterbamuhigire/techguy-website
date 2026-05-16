# Local SEO Guide for African Businesses

Comprehensive local SEO strategy for businesses serving specific geographic areas. Critical for "near me" queries, voice search, and AI search platforms that pull from Google Business Profiles.

Source: *The SEO Book* (Tobias Ebner & Levin Granitza), Chapter 3: Local SEO.

---

## Why Local SEO Matters in Africa

Internet penetration is growing rapidly across East Africa. More businesses and consumers search online for local services. Ranking for "[service] + [location]" queries captures high-intent traffic from people ready to buy.

**Key statistics:**
- 82% of smartphone users search for local businesses using voice search
- "Near me" searches have doubled year-over-year
- Local search results are the primary source for voice assistant answers
- Google uses Google Business Profiles (GMB) to answer "near me" queries

---

## Google Business Profile (Critical)

### Setup Checklist
1. Claim or create profile at business.google.com
2. Verify via postcard, phone, or email
3. Complete ALL fields — incomplete profiles rank lower:
   - Business name (exact match with website)
   - Full address (street, city, region, country)
   - Phone number (local format)
   - Website URL
   - Business hours (including holidays)
   - Primary category (most specific available)
   - Secondary categories (up to 9 additional)
4. Add photos: minimum 10 (office exterior, interior, team, work samples)
5. Write business description using target keywords naturally

### Ongoing Optimisation
- Post updates weekly (offers, news, projects, events)
- Include photos with every post
- Link posts to relevant website pages
- Respond to ALL reviews within 24-48 hours (positive and negative)
- Add products/services with descriptions and pricing
- Keep business hours accurate (especially holidays)
- Use Q&A section to pre-answer common customer questions

### Review Strategy
- Request reviews from satisfied clients after project completion
- Make it easy: provide direct link to Google review page
- Respond professionally to negative reviews (shows you care)
- Never buy fake reviews or self-rate (Google detects and penalises)
- Target steady growth: 2-4 new reviews per month is sustainable

### Categories for Common Business Types
| Business Type | Primary Category | Secondary Categories |
|--------------|-----------------|---------------------|
| IT Company | Information Technology Company | Software Company, Web Designer |
| Law Firm | Law Firm | Legal Services, Immigration Attorney |
| Restaurant | Restaurant | African Restaurant, Takeaway |
| Healthcare | Hospital / Medical Clinic | Doctor, Medical Centre |
| Education | School / Educational Institution | Training Centre, Tutoring Service |
| Tour/Travel | Tour Agency | Travel Agency, Safari Tour Agency |

---

## NAP Consistency

Name, Address, Phone must be **identical** across every platform:

### Where to Check
- Website header and footer
- Contact page
- Structured data (JSON-LD)
- Google Business Profile
- Bing Places
- Social media profiles (Facebook, LinkedIn, Instagram)
- Online directory listings
- Email signatures

### Common Mistakes
- Abbreviating "Street" vs "St." inconsistently
- Using different phone number formats (+256 vs 0 prefix)
- Old address on some directories after a move
- Different business name variations ("Ltd" vs "Limited" vs omitted)
- Missing suite/floor numbers on some listings

**Rule**: Pick ONE exact format for name, address, and phone. Use it everywhere. Check quarterly.

---

## Citation Building for East Africa

### Key Directories (Submit to All)
- Google Business Profile (essential)
- Bing Places for Business (powers AI search: ChatGPT, Claude, Perplexity)
- Yellow Pages Uganda / Kenya / Tanzania
- Uganda Business Directory
- LinkedIn Company Page
- Facebook Business Page

### Industry Directories
| Industry | Directories |
|----------|------------|
| Software / IT | Clutch.co, GoodFirms, TopDevelopers.co |
| Legal | Martindale, local bar association directory |
| Healthcare | Healthgrades equivalent, medical board directory |
| Tourism | TripAdvisor, Viator, local tourism board |
| Education | local education ministry directory |

### Citation Audit Process
1. Search your business name + city in Google
2. List every directory where you appear
3. Compare NAP on each listing against your canonical format
4. Correct any inconsistencies immediately
5. Submit to directories where you're not yet listed
6. Set calendar reminder: re-audit quarterly

---

## Schema Markup for Local SEO

### LocalBusiness/ProfessionalService Schema
```json
{
  "@type": "ProfessionalService",
  "name": "Company Name",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "Plot 123, Example Road",
    "addressLocality": "Kampala",
    "addressRegion": "Central Region",
    "addressCountry": "UG"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": 0.3476,
    "longitude": 32.5825
  },
  "telephone": "+256-XXX-XXXXXX",
  "openingHours": "Mo-Fr 08:00-17:00",
  "areaServed": [
    { "@type": "Country", "name": "Uganda" },
    { "@type": "Country", "name": "Kenya" },
    { "@type": "Country", "name": "Tanzania" }
  ],
  "priceRange": "$$"
}
```

**Critical fields**: `address`, `geo`, `telephone`, `areaServed`, `openingHours` — missing any of these reduces local ranking potential.

---

## Local Landing Pages

### When to Create
- Business serves multiple distinct cities or regions
- Each location has different services, staff, or specialisations
- Targeting "service + city" keywords for multiple locations

### Quality Rules
- Each page must have **unique content** (not just city name swapped)
- Include location-specific testimonials and case studies
- Mention local landmarks, neighbourhoods, or relevant local context
- Include unique LocalBusiness schema with correct geo-coordinates per location
- Embed a Google Map for the specific location
- Include local phone number and address

### What to Avoid
- Doorway pages: thin pages with only a city name changed (Google penalises these)
- Duplicate content across location pages
- Fake addresses or virtual offices listed as physical locations
- Pages for locations where you have no real presence

---

## Content Strategy for Local Ranking

1. **Location in titles**: "Website Design in Kampala, Uganda" (primary keyword + city + country)
2. **Location in descriptions**: "Serving businesses across East Africa" (region targeting)
3. **Local case studies**: Mention client locations and local context
4. **Local testimonials**: Include client names, companies, and locations
5. **Community involvement**: Highlight local partnerships, events, sponsorships
6. **Local keyword variations**: "website designers Uganda" alongside "web developer Kampala"
7. **Multi-language local content**: Location pages in all enabled languages (en, fr, sw)

---

## Voice Search & Local SEO

Voice searches are predominantly local. Optimise for how people speak:

### Voice Query Patterns
| Typed Search | Voice Search Equivalent |
|-------------|----------------------|
| "IT consultant Kampala" | "Where can I find an IT consultant near Kampala?" |
| "website design Uganda" | "Who does website design in Uganda?" |
| "best restaurant Kampala" | "What's the best restaurant near me?" |

### Optimisation Steps
1. Complete Google Business Profile (voice assistants pull from GMB)
2. Use natural question phrases in FAQ page headings
3. Provide concise answers (30 words for quick snippet, then expanded detail)
4. Include "near me" context in content naturally
5. Ensure mobile-first design (voice search = mobile search)
6. Page loads under 3 seconds (voice results load faster than average)

---

## Local SEO Audit Checklist

Run this audit quarterly alongside the main SEO audit:

- [ ] Google Business Profile complete and verified
- [ ] NAP consistent across website, GMB, directories, and structured data
- [ ] Geo meta tags present (geo.region, geo.placename, ICBM)
- [ ] LocalBusiness/ProfessionalService schema with geo-coordinates
- [ ] Location keywords in page titles, descriptions, and H1 tags
- [ ] Contact page has full address, phone, map embed
- [ ] Listed in minimum 5 relevant directories
- [ ] Reviews: minimum 10 on Google, responded to within 48 hours
- [ ] Local content updated within last 3 months
- [ ] Bing Places listing created and verified
- [ ] Location pages exist for each area served (if multi-location)
- [ ] All location pages have unique content and schema
