# Photo Manager Skill

Handle all image assets — catalog, organize, and track for easy replacement.

Historical detailed guidance preserved from the pre-standardized version of the skill.
Use `photo-manager/SKILL.md` and the current photo-management references first.

## Core Principle

**NEVER use a photo without first checking its dimensions.** Every image placement must be dimension-aware.

## Photo Naming Convention (Critical for Automation)

Encourage clients to use **descriptive, purpose-specific photo names** instead of generic names like `IMG_001.jpg`. The workflow uses those names to infer likely photo purpose and placement.

### Recommended Naming Patterns

Claude recognizes and categorizes photos by name:

```
Logo-Light-Mode.png              → header/footer branding
Logo-Dark-Mode.png               → dark mode header/footer
Favicon.svg                      → browser tab icon

CEO-Headshot.jpg                 → team section leadership
Staff-Members.jpg                → about page team intro
Developer-Alice.jpg              → team grid member
Designer-Bob.jpg                 → team grid member

Hero-Office-Team.jpg             → homepage hero
Hero-Product-Launch.jpg          → feature page hero
Hero-About-Page.jpg              → about page hero

Service-Consulting.jpg           → services grid
Feature-Dashboard.png            → features section

Testimonial-Client-John.jpg      → testimonial card / supporting proof section
Testimonial-Company-Logo.png     → client logos section

Government-License.jpg           → trust/credentials section
ISO-Certification.png            → awards/certifications
Industry-Award-Badge.jpg         → credentials

Gallery-Project-01.jpg           → photo gallery pages
Gallery-Project-02.jpg           → photo gallery pages
Portfolio-Website-Redesign.jpg   → portfolio gallery
Slide-Product-Demo-01.jpg        → manually controlled gallery / lightbox sequence
Slide-Product-Demo-02.jpg        → manually controlled gallery / lightbox sequence
Carousel-Client-Testimonials.jpg → manual gallery / proof sequence (never auto-rotating)

Team-Retreat-Event.jpg           → culture/behind-scenes
Office-Culture-Photo.jpg         → about page
Product-Launch-Celebration.jpg   → timeline/history
```

### Naming Guidelines

1. **Use hyphens** — `Logo-Light-Mode.png` not `Logo_light_mode.png`
2. **Capitalize key words** — `CEO-Headshot.jpg` not `ceo-headshot.jpg`
3. **Be specific** — `Developer-Alice.jpg` not `team-photo.jpg`
4. **Include variants** — `Logo-Light-Mode.png`, `Logo-Dark-Mode.png` (Claude selects appropriately)
5. **One purpose per file** — Don't combine `Logo-And-Favicon.png` → split them
6. **Describe role** — `Testimonial-Client-John.jpg` tells Claude the photo's purpose
7. **Gallery collections** — Use `Gallery-*` or `Portfolio-*` for photos meant for gallery pages
8. **Gallery sequence candidates** — Use `Slide-*` or `Carousel-*` only for manually controlled galleries, lightboxes, or horizontal reels. Never imply auto-rotation.

### How Claude Uses These Names

1. **Reads the filename** — Interprets the purpose from the name
2. **Categorizes automatically** — Sorts into `hero/`, `team/`, `services/`, etc.
3. **Places intelligently** — No manual placement needed
4. **Updates catalog** — Records the recognized purpose in `_catalog.json`

### Gallery & Manual Sequence Photo Recognition

**Gallery Photos** (`Gallery-*`, `Portfolio-*`):
- Grouped as multi-image collections for photo gallery pages
- Sorted by number or name for display order
- Ideal for: Portfolio, case studies, project showcases, before/after galleries
- Example: `Gallery-Project-01.jpg`, `Gallery-Project-02.jpg`, `Gallery-Project-03.jpg` → sorted and displayed as multi-image gallery

**Manual Sequence Photos** (`Slide-*`, `Carousel-*`):
- Grouped as manually controlled gallery or lightbox candidates
- Displayed one at a time with explicit user controls only
- Ideal for: Product features, project walkthroughs, event highlights, before/after comparisons
- Example: `Slide-Product-Feature-01.jpg`, `Slide-Product-Feature-02.jpg` → next/previous lightbox sequence
- Example: `Carousel-Testimonials-01.jpg`, `Carousel-Testimonials-02.jpg`, `Carousel-Testimonials-03.jpg` → proof gallery with manual navigation only

### Photos Without Descriptive Names

If a photo has a generic name (`IMG_001.jpg`, `photo1.png`):
- Claude will ask for clarification: "What is this photo for?"
- Or categorize as `misc/` with a placeholder
- Best to encourage descriptive naming upfront

---

## Step 1: Scan photo-bank/

```bash
# Get all images and their dimensions
for img in photo-bank/*.{jpg,jpeg,png,webp,svg}; do
  if [ -f "$img" ]; then
    identify -format "%f|%w|%h|%b\n" "$img"
  fi
done
```

If `identify` (ImageMagick) is not available, use Python:

```python
from PIL import Image
import os, json

photos = []
for f in os.listdir('photo-bank'):
    if f.lower().endswith(('.jpg', '.jpeg', '.png', '.webp')):
        img = Image.open(f'photo-bank/{f}')
        w, h = img.size
        size_kb = os.path.getsize(f'photo-bank/{f}') // 1024
        photos.append({
            'filename': f,
            'width': w,
            'height': h,
            'size_kb': size_kb,
            'aspect_ratio': f"{w//gcd(w,h)}:{h//gcd(w,h)}"
        })
        print(f"{f}: {w}x{h} ({size_kb}KB)")
```

## Step 2: Prepare the Images Directory

All photos go into a **single flat directory** — `src/assets/images/`. No subdirectories. This makes photo replacement trivial: the client drops a new file with the same name and rebuilds.

```
src/assets/images/
├── Logo-Light-Mode.png     # Branding
├── Hero-Office-Team.jpg    # Hero images
├── Team-John-Doe.jpg       # Team headshots
├── Service-Consulting.jpg  # Service images
├── Gallery-Project-01.jpg  # Gallery images
├── ...                     # All other photos
└── _catalog.json           # Master catalog (tracks category via metadata)
```

**Category is metadata, not a folder.** The `_catalog.json` tracks each photo's logical category (hero, team, services, gallery, etc.) but all files live side-by-side in one directory. This means:
- **Easy replacement** — client finds the exact file by name and replaces it
- **No path confusion** — one import path for all images
- **Astro handles optimization** — file location doesn't affect WebP/AVIF generation

## Step 2.5: Compress Photos (image-compression skill)

**Before copying**, run the **image-compression** skill to ensure no photo exceeds 500 KB:

1. Run `node scripts/compress-photos.mjs` (or the compression logic from image-compression/SKILL.md)
2. This reads from `photo-bank/`, compresses oversized photos, and writes to `src/assets/images/`
3. Photos already under 500 KB are copied as-is
4. Photos over 500 KB are resized (max 1920px) and compressed (quality 80 → 60)
5. Logos/SVGs are copied without lossy compression
6. **Originals in photo-bank/ are never modified**

After compression, all further steps work with the compressed copies in `src/assets/images/`.

## Step 3: Catalog

For each photo now in `src/assets/images/` (post-compression):
1. Determine the logical category based on filename hints and the page structure in `docs/pages.md`
2. Record in _catalog.json with category as metadata
3. Use the **compressed** dimensions and file sizes, not the originals

### Filename Conventions

Interpret filenames to determine category and usage:

**Branding:**
- `logo-*` → `branding/` (auto-detects best logo)
- `favicon-*`, `icon-*` → `branding/`

**HD / OG Image Candidates:**
- `*-HD.jpg`, `*-HD.png` → `og/` (high-definition images for Open Graph; prefer these for og:image tags)

**Page Heroes:**
- `hero-*`, `banner-*`, `bg-*` → `hero/`

**Team & People:**
- `team-*`, `staff-*`, `person-*`, `headshot-*` → `team/`

**Services & Products:**
- `service-*`, `product-*`, `work-*`, `feature-*` → `services/`

**Photo Collections:**
- `gallery-*`, `portfolio-*`, `project-*` → `gallery/` (multi-image galleries)
- `slide-*`, `carousel-*` → `gallery/` (manual sequence candidates)

**About & Culture:**
- `about-*`, `office-*`, `culture-*`, `event-*` → `about/`

**Testimonials & Social Proof:**
- `client-*`, `testimonial-*`, `quote-*` → `testimonials/`
- `award-*`, `certificate-*`, `license-*` → `testimonials/`

**Everything Else:**
- Unrecognized patterns → `misc/`

## Logo Auto-Detection & Selection

The system scans PNG files with "logo" in the filename and selects the best candidate based on:
1. **Size preference**: Larger files (higher resolution) ranked higher
2. **Format preference**: PNG with transparency (RGBA) > PNG (RGB) > other formats
3. **Dimensions**: Wide logos (width > height) preferred for headers; square (1:1) for favicons

### Logo Processing Script

```python
from PIL import Image
import os
from pathlib import Path

def find_best_logo(photo_bank_path='photo-bank'):
    """Find and select the best logo from photo-bank"""
    logos = []

    for f in os.listdir(photo_bank_path):
        if 'logo' in f.lower() and f.lower().endswith(('.png', '.jpg', '.jpeg')):
            img_path = os.path.join(photo_bank_path, f)
            img = Image.open(img_path)
            w, h = img.size
            size_kb = os.path.getsize(img_path) // 1024

            # Score calculation (higher = better)
            score = 0
            score += size_kb * 0.5  # Prefer larger files (higher res)
            score += w * h * 0.001  # Prefer more pixels

            # Prefer PNG with transparency
            if f.lower().endswith('.png') and img.mode == 'RGBA':
                score += 50
            elif f.lower().endswith('.png'):
                score += 30

            # Prefer landscape for headers, square for favicon
            aspect_ratio = w / h
            if 1.5 <= aspect_ratio <= 3:  # Header logo
                score += 20
            elif 0.9 <= aspect_ratio <= 1.1:  # Square favicon
                score += 10

            logos.append({
                'filename': f,
                'path': img_path,
                'width': w,
                'height': h,
                'size_kb': size_kb,
                'format': img.format,
                'mode': img.mode,
                'aspect_ratio': f"{w//gcd(w,h)}:{h//gcd(w,h)}",
                'score': score
            })

    if not logos:
        print("⚠️  No logos found in photo-bank/")
        return None

    # Select best logo
    best_logo = max(logos, key=lambda x: x['score'])

    # Copy to flat images directory
    os.makedirs('src/assets/images', exist_ok=True)
    dest = 'src/assets/images/logo.png'

    # Convert to PNG if needed
    if best_logo['format'] != 'PNG':
        img = Image.open(best_logo['path'])
        img = img.convert('RGBA')
        img.save(dest, 'PNG')
    else:
        import shutil
        shutil.copy2(best_logo['path'], dest)

    print(f"✅ Selected logo: {best_logo['filename']}")
    print(f"   Dimensions: {best_logo['width']}x{best_logo['height']}")
    print(f"   Format: {best_logo['mode']}")
    print(f"   Copied to: {dest}")

    return best_logo

# Run the selection
best = find_best_logo()
```

### Logo Catalog Entry

Update `_catalog.json` with logo entry:

```json
{
  "branding": {
    "logo": {
      "id": "logo-primary",
      "original_filename": "logo-color.png",
      "source": "photo-bank/logo-color.png",
      "destination": "src/assets/images/logo.png",
      "category": "branding",
      "width": 600,
      "height": 150,
      "aspect_ratio": "4:1",
      "file_size_kb": 85,
      "format": "png",
      "mode": "RGBA",
      "used_in": ["header", "footer", "meta-og"],
      "role": "primary-brand-logo",
      "score": 245,
      "notes": "High-resolution logo with transparency, landscape format suitable for header use"
    }
  }
}
```

## Step 4: Generate _catalog.json

```json
{
  "generated_at": "2026-02-17T10:00:00Z",
  "photo_bank_path": "photo-bank/",
  "images_path": "src/assets/images/",
  "total_images": 12,
  "images": [
    {
      "id": "hero-main",
      "original_filename": "hero-office.jpg",
      "source": "photo-bank/hero-office.jpg",
      "destination": "src/assets/images/hero-office.jpg",
      "category": "hero",
      "width": 1920,
      "height": 1080,
      "aspect_ratio": "16:9",
      "file_size_kb": 342,
      "format": "jpg",
      "used_in": [],
      "role": "",
      "placeholder": false,
      "notes": "Wide office exterior shot"
    }
  ],
  "placeholders_needed": [
    {
      "role": "hero-background",
      "page": "index.astro",
      "recommended_dimensions": "1920x1080",
      "recommended_aspect_ratio": "16:9",
      "description": "Needs: impressive wide shot related to company"
    }
  ]
}
```

## Step 5: Dimension-Aware Placement

When the page-builder needs an image for a specific slot:

1. **Determine slot requirements:**
   - Hero backgrounds: min 1600px wide, 16:9 or wider
   - Team headshots: min 400x400, square (1:1) preferred
   - Service cards: min 600px wide, 4:3 or 3:2
   - Gallery thumbnails: min 400px, flexible
   - Testimonial avatars: min 100x100, square
   - Logo/icon: flexible, any size

2. **Find best matching photo from catalog** based on:
   - Category match
   - Aspect ratio compatibility
   - Sufficient resolution (don't upscale)

3. **Update catalog** with `used_in` and `role` fields

4. **If no suitable photo exists:**
   - Add entry to `placeholders_needed` array
   - In the page, use a solid-color div or gradient matching design system
   - Add an HTML comment: `<!-- PLACEHOLDER: replace with {description} -->`
   - NEVER use stock photo URLs or external placeholder services

## Replacement Guide

After the site is built, provide the user with a replacement checklist:

```markdown
## Photos to Replace

### Hero Images
- [ ] `src/assets/images/hero-office.jpg` (1920x1080, 16:9)
      Used on: Homepage hero
      Current: Placeholder gradient
      Need: Wide shot of company office or related imagery

### Team Photos
- [ ] `src/assets/images/team-john.jpg` (800x800, 1:1)
      Used on: Team page, About page sidebar
      Current: Using photo from photo-bank
      Need: Professional headshot, square crop

### How to Replace
1. Prepare your photo at the recommended dimensions
2. Name it exactly as shown above
3. Drop it into `src/assets/images/` (all photos live in ONE flat directory)
4. Run `npm run build` to regenerate optimized versions
5. Astro will auto-generate WebP/AVIF and responsive sizes
```

## Rules

1. **NEVER modify original photos in photo-bank/.** Always copy, never move or edit.
2. **ALWAYS measure before placing.** A 400x400 image in a 1920px hero slot = blurry disaster.
3. **Astro handles optimization.** Don't manually resize or convert formats. Just provide the originals at sufficient resolution.
4. **Keep the catalog updated.** Every image addition or change must be reflected in _catalog.json.
5. **Descriptive IDs.** Use kebab-case IDs that describe the content: `team-john-doe`, `hero-about-page`, `service-consulting`.
6. **Preserve originals in `photo-bank/`.** `photo-bank/` remains the raw asset archive; `src/assets/images/` contains processed working copies for the site. Never delete originals automatically.

## OG Image Selection (Mandatory Per Page)

Every page and blog post MUST have a unique `og:image`. Never rely on a single site-wide default.

**Selection priority:**
1. **HD photos** — search photo-bank for `*-HD.jpg` / `*-HD.png` files first; these are uploaded specifically for social sharing
2. **Hero images** — the page's hero/banner image, if ≥1200px wide
3. **Featured image** — for blog posts, the article's featured image
4. **Best available** — highest-resolution photo from the page's content category

**Requirements:**
- Minimum 1200×630px (ideal OG image dimensions)
- Must be relevant to the page content
- Pass to BaseLayout via `ogImage` prop: `<BaseLayout ogImage={selectedImage.src}>`
- Record in `_catalog.json` with `"role": "og-image"` and `"used_in": ["og:image"]`

## Image Emotional Quality Gates

Before using any image on the website, verify these three checks:

1. **Will it evoke a positive emotion?** Avoid images that could trigger unintended negative associations (e.g., hospital imagery that evokes illness rather than care). Every image must evoke an emotion that helps sell.
2. **Is the meaning unambiguous?** Make sure the image can't be misinterpreted. A fallen chess queen could mean "winning" to you and "losing" to the visitor.
3. **Does it match the colour palette?** Especially critical for hero/header images. A dominant colour that clashes with the design system undermines the first impression.

## Team Photo Quality Rules

Team headshots must meet these standards:

**Required:**
- High resolution (min 400x400)
- Plain or uncluttered background
- Face takes up most of the frame (not standing far from camera)
- Friendly, approachable facial expression
- Facing straight at the camera or towards the adjacent text/CTA on the page

**Banned:**
- Low resolution or pixelated photos
- Busy or distracting backgrounds
- Shadows on the face
- Looking away from the text content
- Other people or animals in the photograph
- Face taking up too little space (full-body shot where face is tiny)
