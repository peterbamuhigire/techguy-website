# TechGuy Peter — Personal Portfolio & Blog

The professional website for **Peter Bamuhigire**, an ICT consultant, software developer, and business strategist based in Kampala, Uganda with 15+ years of experience across 10+ African countries.

Live at **[techguypeter.com](https://techguypeter.com)**

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | [Astro](https://astro.build/) v5 — static site generator, zero JS by default |
| Styling | [Tailwind CSS](https://tailwindcss.com/) v4 with custom design tokens |
| Interactivity | [Alpine.js](https://alpinejs.dev/) v3 — mobile menu, modals, forms |
| Animations | [GSAP](https://gsap.com/) v3 — scroll-triggered fade/slide effects |
| Typography | [Playfair Display](https://fontsource.org/fonts/playfair-display) (headings) + [DM Sans](https://fontsource.org/fonts/dm-sans) (body), self-hosted via Fontsource |
| Icons | [Lucide](https://lucide.dev/) — SVG icon set |
| SEO | Sitemap, hreflang, Article JSON-LD, Open Graph, breadcrumbs |

Everything is self-hosted. No external CDN requests for fonts, scripts, or analytics.

---

## Site Structure

```
techguypeter.com
├── /en/                    English (default)
│   ├── /                   Homepage
│   ├── /about/             Professional background & story
│   ├── /services/          IT consulting, software dev, business consulting
│   ├── /websites/          Portfolio of websites built (6 projects)
│   ├── /portfolio/         Software & SaaS products (Maduuka, Aqar, etc.)
│   ├── /blog/              Technical articles (4 published)
│   │   ├── /erp-implementation-mistakes/
│   │   ├── /website-costs-uganda/
│   │   ├── /custom-software-africa/
│   │   └── /choose-it-consultant/
│   └── /contact/           Contact form + details
│
├── /fr/                    French (formal francophone African)
│   └── (mirror of all English pages)
│
└── /                       Redirects to /en/
```

**23 pages** across 2 languages. Blog articles are published in both English and French simultaneously.

---

## Bilingual Support

The site serves two audiences:

- **English** — British spelling, East African professional register. Targets Uganda, Kenya, Tanzania, Rwanda.
- **French** — Formal francophone African (vouvoiement). Targets Senegal, DRC, Cameroon, Cote d'Ivoire, Guinea.

All translations live in `src/utils/i18n.ts` (120+ keys). Content source files are in `docs/en/` and `docs/fr/`. French articles are adapted, not translated — restructured for natural French flow with francophone African business examples.

---

## Design

Navy, gold, and burnt orange palette inspired by authority, warmth, and African earth tones. Dark hero sections with light content areas. Subtle geometric SVG patterns (linen weave, circles, crosshatch, diamonds) add texture without distraction.

- **Mobile-first** — designed for 375px, enhanced at 768px and 1280px+
- **Performance target** — under 500KB first load, Lighthouse 95+
- **Accessibility** — skip-to-content, semantic HTML, ARIA labels, 4.5:1 contrast, keyboard-navigable

---

## Development

### Prerequisites

- Node.js 18+
- npm

### Commands

```bash
npm install              # Install dependencies
npm run dev              # Dev server at localhost:4321
npm run build            # Build to dist/
npm run preview          # Preview production build
```

### Project Layout

```
docs/
  en/                    English content (markdown + frontmatter)
  fr/                    French content
  i18n-config.md         Language configuration
  seo.md                 SEO meta tags & structured data
photo-bank/              Source photos (unprocessed originals)
public/                  Static assets (favicon, og-image, robots.txt)
src/
  assets/images/         Processed photos + _catalog.json
  components/            Astro components (Header, Footer, WebsiteCard, etc.)
  layouts/               BaseLayout with SEO, breadcrumbs, structured data
  pages/
    en/                  English pages
    fr/                  French pages
  styles/global.css      Design tokens, geo-patterns, prose styles
  utils/i18n.ts          Translation keys & helper functions
.claude/skills/          Build instructions (git submodule)
```

### Content Workflow

All text content lives in `docs/{lang}/*.md` files. The website reads from these markdown files — no content is hardcoded in components. To update content:

1. Edit the relevant markdown file in `docs/en/` or `docs/fr/`
2. Run `npm run build`
3. Deploy the updated `dist/` directory

### Photo Workflow

Photos are catalogued in `src/assets/images/_catalog.json` with dimensions, roles, and bilingual alt text. Astro's `<Image>` component handles WebP/AVIF conversion and responsive srcsets automatically.

To replace a photo: drop a new file with the same filename into `src/assets/images/` and rebuild.

---

## Deployment

Static site — no server-side runtime, no database, no CMS.

```
Local:   edit → build → git push
Server:  git pull → npm run build → Nginx serves dist/
```

---

## Author

**Peter Bamuhigire**
ICT Consultant & Software Developer
Kampala, Uganda

- [techguypeter.com](https://techguypeter.com)
- [LinkedIn](https://www.linkedin.com/in/bamuhigire/)
- [GitHub](https://github.com/Chwezi)
- peter@techguypeter.com
- +256 784 464178
