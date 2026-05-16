# QA Matrix

Use this matrix before every website launch.
This is the minimum verification standard for premium delivery.

The matrix is designed to catch the failures clients actually notice:

- broken layouts
- incomplete content
- dead links
- slow pages
- inaccessible interactions
- missing metadata
- broken forms
- unverified analytics

## QA Rules

- Every row needs an owner.
- Every failure must be logged, not remembered.
- If a failure blocks the main customer journey, launch is blocked.
- Manual spot-checking is not enough on its own.
- Automated checks should catch what they can before manual QA begins.

## Severity Definitions

- `Blocker` - launch must stop
- `Major` - must be fixed before launch unless explicitly approved as an exception
- `Minor` - can ship only with explicit acceptance and a fix date

## Matrix

| Area | What to verify | Method | Minimum standard | Severity if failed | Owner |
|---|---|---|---|---|---|
| Responsive behavior | Layout, spacing, menus, forms, media, language switcher | Manual + E2E smoke | Core pages work on defined devices | Blocker | QA lead |
| Content completeness | Placeholder removal, proof assets, legal pages, contact details, copy approval | Manual content pass | No unresolved launch-blocking placeholders | Blocker | Content lead |
| Link integrity | Navigation, footer, internal links, CTA links, downloads | Automated + manual sample | No broken critical links | Blocker | Production lead |
| Performance | LCP, CLS, image sizing, unused JS risk, load time | Lighthouse/PageSpeed + browser checks | Meets agreed baseline for the project | Major | Production lead |
| Accessibility | Keyboard flow, labels, landmarks, contrast, alt text, focus states | Automated audit + manual keyboard pass | No critical accessibility failures on core flows | Major | QA lead |
| SEO implementation | Titles, descriptions, canonicals, robots, sitemap, schema, hreflang where relevant | Automated + manual source check | Priority pages have correct metadata and crawl signals | Major | SEO lead |
| Analytics events | Page view, core CTA events, form submission events, consent behavior if used | Manual verification in analytics/debug tools | Core events fire exactly once | Major | SEO/analytics owner |
| Form handling | Validation, successful submission, failure messaging, spam controls, inbox/CRM delivery | Manual + E2E where possible | Every production form works end to end | Blocker | Production lead |
| Browser verification | Core pages and forms in supported browsers | Manual smoke | Supported browsers complete core flows | Major | QA lead |

## Browser And Device Baseline

Use this minimum matrix unless a client requires more:

### Desktop

- Chrome current
- Edge current
- Firefox current
- Safari current on macOS if the project's audience makes it relevant

### Mobile

- iPhone Safari current
- Android Chrome current

### Breakpoints

- 375px
- 768px
- 1280px

## Core Pages To Verify

At minimum:

- homepage
- top service page
- about page
- contact page
- any booking, enquiry, or lead form flow
- any page with language switching if multilingual

## Core Flow Checks

- Navigation opens, closes, and routes correctly
- Language switching preserves the intended destination
- Primary CTA works from homepage and service page
- Contact form validates and submits successfully
- Confirmation state is visible and understandable
- Footer links and legal links resolve correctly

## QA Sign-Off Table

| Date | Area | Status | Findings count | Approved by | Notes |
|---|---|---|---|---|---|

## Release Decision Rule

If responsive behavior, forms, navigation, or essential SEO signals fail on a priority page,
the project does not pass Gate 6 or Gate 7.
