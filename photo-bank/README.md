# Photo Bank

Drop client photos here with descriptive names. Organise into subdirectories by category.

## Directory Structure

```
photo-bank/
  branding/     <- Logos, brand marks, favicons (e.g., Logo-Light.png, Logo-Dark.png)
  hero/         <- Hero/banner images (wide, min 1600px width)
  team/         <- Team member headshots (square preferred, min 400x400)
  services/     <- Service/product images
  gallery/      <- Portfolio/gallery images
  about/        <- About page images (office, workspace, culture)
  testimonials/ <- Client photos/logos for testimonials
  misc/         <- Anything that doesn't fit above
```

## Naming Convention

Use descriptive, hyphenated names. The photo-manager skill auto-categorises based on names.

| Prefix | Example | Use |
|--------|---------|-----|
| `Logo-` | `Logo-Light-Mode.png` | Company logos |
| `Hero-` | `Hero-Office-Exterior.jpg` | Hero/banner images |
| `Team-` | `Team-John-Doe.jpg` | Team member headshots |
| `Service-` | `Service-Consulting.jpg` | Service illustrations |
| `Gallery-` | `Gallery-Project-01.jpg` | Portfolio/gallery items |
| `About-` | `About-Office-Interior.jpg` | About page images |
| `Client-` | `Client-Acme-Corp.jpg` | Client logos/testimonials |
| `Slide-` | `Slide-Feature-01.jpg` | Carousel/slider images |

## Photo Requirements

- **Format:** JPG or PNG (WebP also accepted)
- **Hero images:** Minimum 1600px wide, landscape orientation
- **Team headshots:** Minimum 400x400px, square crop preferred
- **Logos:** PNG with transparent background, both light and dark versions
- **General:** No upscaling - Claude measures dimensions before placement
- **File size:** Keep originals under 2MB each; Astro compresses during build

## Important

- Photos are SHARED across all language versions (en, fr, sw)
- Claude Code copies photos from here to `src/assets/images/` - originals stay untouched
- Never rename photos after the first build without updating the catalog
