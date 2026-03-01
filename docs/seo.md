---
site_url: "https://client-domain.com"
schema_type: "LocalBusiness"
google_site_verification: ""
default_og_image: "/og-image.png"
---

# SEO Configuration

Copy this file to `docs/seo.md` and fill in all sections. The SEO skill reads this during build to generate meta tags, structured data, and sitemaps.

---

## Site Configuration

**Site URL** (required):
Replace `https://client-domain.com` with the actual domain.

**Schema Type** (recommended):
Choose the most specific type for your business:
- `LocalBusiness` (generic fallback)
- `LegalService` (law firm)
- `MedicalBusiness` (healthcare)
- `FinancialService` (accounting, banking)
- `AutomotiveBusiness` (auto repair, dealership)
- `Restaurant` (food service)
- `RetailStore` (e-commerce)
- `ProfessionalService` (consulting, real estate)
- `EducationalOrganization` (school, university)
- `RealEstateAgent` (property/rental)
- `AccountingService` (CPA, bookkeeping)
- `GeneralContractor` (construction)

If unsure, use `LocalBusiness` or `ProfessionalService`.

**Google Site Verification Code** (optional):
If you've already verified ownership in Google Search Console, paste the verification code here. This is added to the `<head>` automatically.

---

## Per-Page Meta Tags

Every page needs:
1. **Unique title tag** (50-60 characters)
2. **Unique meta description** (150-160 characters)

Format: `title: "Page Title | Brand Name"`

Rules:
- Front-load primary keyword in title
- Include brand name at the end
- For homepage, include location if relevant: "Best Lawyers in Kampala | FirmName"
- Use natural language, not keyword stuffing
- Never copy meta from another page

### Homepage

**Title**: (50-60 chars)
```
Premier Legal Services in Kampala | CompanyName
```

**Description**: (150-160 chars)
```
Expert legal counsel in corporate law, litigation, and real estate. Trusted by 500+ clients across Uganda since 2010. Free initial consultation available.
```

### About

**Title**: (50-60 chars)
```
About CompanyName | 15 Years of Legal Excellence
```

**Description**: (150-160 chars)
```
Learn about our team of experienced attorneys and our commitment to justice. Serving clients across East Africa from our Kampala office since 2010.
```

### Services

**Title**: (50-60 chars)
```
Our Legal Services | Corporate, Litigation & Real Estate Law
```

**Description**: (150-160 chars)
```
Comprehensive legal services including corporate advisory, civil litigation, real estate transactions, regulatory compliance, and contract drafting for individuals and businesses.
```

### Contact

**Title**: (50-60 chars)
```
Contact CompanyName | Get Legal Help Today
```

**Description**: (150-160 chars)
```
Reach our Kampala office for expert legal consultation. Call +256 700 000000 or visit us at Plot 12, Kampala Road. Available Mon-Fri, 8am-5pm.
```

### [Add Additional Pages]

For each page on the site, add:

**Title**: [unique title, 50-60 chars]
**Description**: [unique description, 150-160 chars]

---

## Geo-Coordinates (Optional but Recommended)

If you want your business to appear in Google Maps and local search:

**Latitude**: 0.3136 (example: Kampala)
**Longitude**: 32.5811 (example: Kampala)

Find your coordinates:
1. Go to Google Maps
2. Right-click on your office location
3. Select the coordinates to copy them
4. Paste here (latitude first, then longitude)

---

## Key Points to Remember

✅ **Unique titles/descriptions on every page** — Google penalizes duplicates
✅ **Front-load keywords naturally** — "Best Lawyers in Kampala" not "Lawyers Best Kampala"
✅ **Think like a customer** — Your title/description appear in search results; write for humans, not robots
✅ **Character limits matter** — Google truncates titles at ~60 chars, descriptions at ~160 chars
✅ **Brand consistency** — Include company name in every title (helps brand recognition)
✅ **Call-to-action optional** — "Free consultation" or "Get help today" can increase clicks, but keep it natural

---

## Testing Your Work

Before delivery:

1. **Google Search Central:** https://search.google.com/test/rich-results
   - Paste your homepage URL
   - Should show Organization, WebSite, and WebPage structured data

2. **Title/Description char count:**
   - Titles: 50-60 (no more than 60)
   - Descriptions: 150-160 (no more than 160)

3. **Uniqueness:**
   - No two pages should have identical titles or descriptions

---

## FAQ

**Q: Do I need keywords in the title?**
A: Yes, but naturally. "Best Corporate Lawyers in Kampala" is good. "Corporate Lawyers Kampala Best Legal Services Law Firm" is keyword stuffing and will hurt you.

**Q: Can I use special characters?**
A: Avoid them. Stick to letters, numbers, spaces, and hyphens. Google may not display special characters correctly.

**Q: What if my business operates nationwide?**
A: Remove the location from homepage title. Use "Premier Legal Services in Uganda | CompanyName" instead of city-specific.

**Q: How often should I update these?**
A: Only when your business changes (new services, new location, new phone number). Don't change just for the sake of it — Google rewards consistency.

---

**Done?** Save this as `docs/seo.md` and run the SEO skill. It will generate meta tags, structured data, and an audit report automatically.
