# Client Content Templates

These templates help you provide the information needed to build your website. Copy each template file into your project's `docs/` folder, fill it in, and the AI will use your content to generate every page.

## How to Use

1. Copy the template files you need into your project's `docs/` folder
2. Open each file in any text editor and replace the `{placeholder text}` with your actual information
3. For templates with repeatable blocks (team members, services, testimonials), copy the block and paste it below the original for each additional entry
4. Place all photos in your project's `photo-bank/` folder — in the templates, just write the filename (e.g., `peter.jpg`)
5. Save and you're done — the AI reads these files when building your site

## Template Categories

### Core (Required)

These three files are essential. The AI cannot build a good website without them.

| Template | What It Captures | Filename in `docs/` |
|---|---|---|
| [company-profile.md](company-profile.md) | Company name, contact details, social media, what you do, who you serve | `docs/company-profile.md` |
| [pages.md](pages.md) | Which pages to build and what goes on each one | `docs/pages.md` |
| [style-brief.md](style-brief.md) | Design preferences — colours, mood, websites you admire | `docs/style-brief.md` |

### Recommended

Fill these in for a much better website. If you skip them, the AI will work with what it has from the core files, but the result won't be as detailed or accurate.

| Template | What It Captures | Filename in `docs/` |
|---|---|---|
| [services.md](services.md) | Every service/product you offer with descriptions and photos | `docs/services.md` |
| [team-profiles.md](team-profiles.md) | Team members — name, role, bio, photo filename | `docs/team-profiles.md` |
| [contact.md](contact.md) | Business hours, locations, directions, contact form preferences | `docs/contact.md` |

### Optional

These add richness. If you don't provide them, the AI will either generate sensible content from your other files or skip the section entirely.

| Template | What It Captures | Filename in `docs/` |
|---|---|---|
| [testimonials.md](testimonials.md) | Client quotes with names, roles, and photos | `docs/testimonials.md` |
| [portfolio.md](portfolio.md) | Past projects/work with descriptions and photos | `docs/portfolio.md` |
| [faq.md](faq.md) | Frequently asked questions and answers | `docs/faq.md` |
| [about-story.md](about-story.md) | Origin story, mission, vision, values, milestones | `docs/about-story.md` |
| [gallery.md](gallery.md) | Photo gallery with captions and categories | `docs/gallery.md` |

### Other Templates (In Skill Directories)

These templates live in their respective skill folders and are used during the build process:

| Template | Location | When to Use |
|---|---|---|
| SEO Configuration | `seo/docs-seo-template.md` | After pages are planned — add meta titles and descriptions |
| Brand Colours | `sector-strategies/templates/branding-colors-template.md` | If you have specific brand colours with hex codes |
| Sector Brief | `sector-strategies/templates/{sector}/sector-brief-template.md` | For industry-specific design direction |

### Project Log (Required for Retainer / Monthly Reports)

Every client project must maintain a `project-log/` directory at the project root (alongside `docs/` and `photo-bank/`). This is the source of truth for monthly reports, retainer activity tracking, decision history, and incident records. The `monthly-report` skill reads from this directory.

| Template | Location | When to Use |
|---|---|---|
| Project Log | [project-log-template.md](project-log-template.md) | Copy to `project-log/README.md` at project kickoff. Initialise `project-log/CHANGELOG.md` with the first kickoff entry the same day. |

Structure: `project-log/CHANGELOG.md` (append-only daily entries), `project-log/monthly/YYYY-MM.md` (monthly roll-ups, source for monthly reports), `project-log/decisions/` (ADRs), `project-log/incidents/` (outages and security events).

## Photo References

Across all templates, photos are referenced by filename only (e.g., `peter.jpg`, `office-front.jpg`). All photos must be placed in your project's `photo-bank/` folder. The AI automatically finds and processes them from there.

**Photo naming tips:**
- Use descriptive names: `peter-mukisa.jpg` not `IMG_20240315.jpg`
- Use hyphens, not spaces: `team-group.jpg` not `team group.jpg`
- Include context: `project-kololo-exterior.jpg` not `photo1.jpg`

## What If I Skip a Template?

| If You Skip... | What Happens |
|---|---|
| company-profile.md | **Site cannot be built properly.** This is required. |
| pages.md | AI builds a standard set (Home, About, Services, Contact) |
| style-brief.md | AI chooses design based on your industry and sector brief |
| services.md | AI writes generic service descriptions from company-profile.md |
| team-profiles.md | No team section — or AI creates placeholder from company profile |
| contact.md | AI uses contact info from company-profile.md (no business hours) |
| testimonials.md | No testimonials section on the site |
| portfolio.md | No portfolio/projects section on the site |
| faq.md | No FAQ section (misses Google "People also ask" opportunity) |
| about-story.md | AI writes About page from company-profile.md (less detailed) |
| gallery.md | No gallery page — photos still used contextually on other pages |

## Quick Start

For the fastest path to a good website, fill in these 5 files:

1. `company-profile.md` — who you are
2. `pages.md` — what you want
3. `style-brief.md` — how it should look
4. `services.md` — what you offer
5. `team-profiles.md` — who your people are

Everything else improves the result but isn't required.
