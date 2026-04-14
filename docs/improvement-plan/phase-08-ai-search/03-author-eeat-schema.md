# 03 — Author E-E-A-T Schema: AuthorSchema Component and Author Box

## Skills Applied
- `seo` — `references/seo-reference.md` (E-E-A-T, Person schema, Author schema)
- `page-builder` — `references/page-patterns.md` (Author Box component)

## Current State

Blog articles have `author.name` and `author.url` in their `BlogPosting` schema. They do not have:
- A visible author box with photo, credentials, and social links
- An `author.sameAs` linking to external profiles (LinkedIn, GitHub)
- An `author.knowsAbout` listing topics of expertise
- A standalone `Person` JSON-LD schema block on the about page

Phase 6, file 01 specifies the `authorSchema` utility — this file specifies the visible Author Box component and the about page Person schema.

## Target State

1. An `AuthorBox.astro` component displayed at the bottom of every blog article
2. A standalone `Person` JSON-LD schema block on the about page
3. `sameAs` linking to all verified external profiles

## Why This Matters

E-E-A-T (Experience, Expertise, Authoritativeness, Trustworthiness) is Google's framework for evaluating content quality in high-stakes topics — technology advice, business strategy, financial decisions. The E-E-A-T signals Google (and AI systems) use include: is the author named? Can you verify their identity? Do they have external credentials? Are they cited elsewhere?

A visible Author Box with photo, credentials, role, and social links satisfies the first three of these. The `sameAs` links to LinkedIn and GitHub allow Google to cross-reference the author's identity and credentials. The `knowsAbout` array tells AI systems which topics this author is authoritative on.

## Step-by-Step Instructions

### Step 1 — Build the AuthorBox component

**File:** `src/components/AuthorBox.astro` (new file)

```astro
---
import { Image } from 'astro:assets';
import peterHeadshot from '@/assets/images/team/peter-headshot.jpg';

interface Props {
  lang?: 'en' | 'fr';
}

const { lang = 'en' } = Astro.props;

const content = {
  en: {
    writtenBy: 'Written by',
    name: 'Peter Bamuhigire',
    role: 'ICT Consultant & Software Developer',
    bio: 'Peter Bamuhigire has spent 15 years building technology systems for organisations across Uganda, East Africa, and Francophone Africa. He is founder of Chwezi Core Systems and the developer of Maduuka, Aqar, and Longhorn ERP. He writes about ICT consulting, software development, and technology strategy for African businesses.',
    linkedinLabel: 'LinkedIn',
    githubLabel: 'GitHub',
  },
  fr: {
    writtenBy: 'Écrit par',
    name: 'Peter Bamuhigire',
    role: 'Consultant ICT & Développeur logiciel',
    bio: "Peter Bamuhigire a passé 15 ans à développer des systèmes technologiques pour des organisations en Ouganda, en Afrique de l'Est et en Afrique francophone. Il est fondateur de Chwezi Core Systems et développeur de Maduuka, Aqar et Longhorn ERP. Il écrit sur le conseil ICT, le développement logiciel et la stratégie technologique pour les entreprises africaines.",
    linkedinLabel: 'LinkedIn',
    githubLabel: 'GitHub',
  }
};

const c = content[lang];
---

<div class="mt-12 pt-8 border-t border-navy-100">
  <p class="text-xs font-semibold text-navy-400 uppercase tracking-widest mb-4">{c.writtenBy}</p>
  <div class="flex items-start gap-5">
    <Image
      src={peterHeadshot}
      alt={`${c.name} — ${c.role}`}
      width={80}
      height={80}
      class="w-20 h-20 rounded-full object-cover flex-shrink-0"
      loading="lazy"
    />
    <div>
      <p class="font-bold text-navy-900 text-lg">{c.name}</p>
      <p class="text-sm text-navy-500 mb-3">{c.role}</p>
      <p class="text-sm text-navy-700 leading-relaxed mb-4">{c.bio}</p>
      <div class="flex gap-4">
        <a
          href="https://linkedin.com/in/peterbamuhigire"
          rel="noopener noreferrer"
          target="_blank"
          class="inline-flex items-center gap-1.5 text-sm font-medium text-gold-600 hover:text-amber-accent transition-colors"
          aria-label={`${c.name} on LinkedIn`}
        >
          <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/>
          </svg>
          {c.linkedinLabel}
        </a>
        <a
          href="https://github.com/peterbamuhigire"
          rel="noopener noreferrer"
          target="_blank"
          class="inline-flex items-center gap-1.5 text-sm font-medium text-gold-600 hover:text-amber-accent transition-colors"
          aria-label={`${c.name} on GitHub`}
        >
          <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
          </svg>
          {c.githubLabel}
        </a>
      </div>
    </div>
  </div>
</div>
```

### Step 2 — Add AuthorBox to all blog articles (EN)

**For each article in `src/pages/en/blog/`:**

1. Import the component:
```astro
import AuthorBox from '@/components/AuthorBox.astro';
```

2. Add before the CTASection at the bottom of the article body:
```astro
<AuthorBox lang="en" />
```

### Step 3 — Add AuthorBox to all blog articles (FR)

**For each article in `src/pages/fr/blog/`:**
```astro
import AuthorBox from '@/components/AuthorBox.astro';
// ... in body:
<AuthorBox lang="fr" />
```

### Step 4 — Add Person JSON-LD schema to the about page

**File:** `src/pages/en/about.astro` — add before `</BaseLayout>`:

```astro
<script type="application/ld+json" set:html={JSON.stringify({
  "@context": "https://schema.org",
  "@type": "Person",
  "name": "Peter Bamuhigire",
  "url": "https://techguypeter.com/en/about/",
  "image": "https://techguypeter.com/images/peter-headshot.jpg",
  "jobTitle": "ICT Consultant & Software Developer",
  "description": "ICT consultant and software developer with 15 years of experience serving organisations across Uganda, East Africa, and Francophone Africa. Founder of Chwezi Core Systems. Developer of Maduuka, Aqar, and Longhorn ERP.",
  "worksFor": {
    "@type": "Organization",
    "name": "Chwezi Core Systems",
    "url": "https://techguypeter.com"
  },
  "knowsAbout": [
    "ICT Consulting",
    "Software Development",
    "ERP Systems",
    "Website Development",
    "Business Technology Strategy",
    "East African Technology Markets",
    "Francophone African Business",
    "Property Management Technology",
    "Cross-border Technology Implementation",
    "ITIL Service Management",
    "AWS Cloud Architecture",
    "Network Administration"
  ],
  "knowsLanguage": ["en", "fr"],
  "sameAs": [
    "https://linkedin.com/in/peterbamuhigire",
    "https://github.com/peterbamuhigire",
    "https://twitter.com/peterbamu"
  ],
  "alumniOf": [],
  "hasCredential": [
    {
      "@type": "EducationalOccupationalCredential",
      "name": "AWS Cloud Practitioner Essentials",
      "credentialCategory": "certification",
      "dateCreated": "2023"
    },
    {
      "@type": "EducationalOccupationalCredential",
      "name": "Google Project Management Professional Certificate",
      "credentialCategory": "certification",
      "dateCreated": "2022"
    },
    {
      "@type": "EducationalOccupationalCredential",
      "name": "Cisco Certified Network Associate (CCNA)",
      "credentialCategory": "certification",
      "dateCreated": "2020"
    },
    {
      "@type": "EducationalOccupationalCredential",
      "name": "ITIL Foundation Certificate in IT Service Management",
      "credentialCategory": "certification",
      "dateCreated": "2018"
    }
  ]
})} />
```

**File:** `src/pages/fr/about.astro` — add equivalent Person schema with `"inLanguage": "fr"` added to the script.

## Acceptance Criteria

- [ ] `src/components/AuthorBox.astro` created with `lang` prop, photo, bio, LinkedIn and GitHub links
- [ ] AuthorBox renders correctly with the existing headshot at `src/assets/images/team/peter-headshot.jpg`
- [ ] AuthorBox added to all 12 existing EN blog articles
- [ ] AuthorBox added to all new Phase 7 EN and FR articles
- [ ] FR AuthorBox displays bio in French ("Écrit par", French bio text)
- [ ] `Person` JSON-LD schema added to EN about page with `knowsAbout`, `hasCredential`, and `sameAs`
- [ ] `Person` JSON-LD schema added to FR about page
- [ ] Schema validated in Google Rich Results Test — Person type detected on about page
- [ ] `npm run build` passes with no errors

## Effort

**S** — 2 hours
