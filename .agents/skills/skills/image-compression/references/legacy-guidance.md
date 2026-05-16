# Image Compression — Static Website Edition

Compress all photos at build time so no source image exceeds **500 KB**. Astro then generates optimised WebP/AVIF variants from these already-compressed sources.

## When to Use

- **Always** — before copying photos from `photo-bank/` to `src/assets/images/`
- Integrated into the **photo-manager** pipeline (Step 2.5: between scanning and cataloguing)
- When the user drops new photos into `photo-bank/` and triggers a rebuild

## Pipeline Position

```
photo-bank/ (raw originals — may be 5-25 MB each)
    ↓
[image-compression]  ← THIS SKILL
    ↓
src/assets/images/ (compressed to ≤500 KB, flat directory)
    ↓
Astro build (generates WebP/AVIF, responsive srcsets, lazy loading)
    ↓
dist/ (final optimised output)
```

## Core Rules

1. **Max file size: 500 KB** — no photo in `src/assets/images/` may exceed this
2. **Max dimensions: 1920px** on the longest edge (heroes may be 2560px if needed)
3. **Never upscale** — if an image is smaller than 1920px, keep original dimensions
4. **Maintain aspect ratio** — always
5. **Prefer JPEG** for photos (smaller than PNG for photographic content)
6. **Keep PNG** for logos, icons, and images requiring transparency
7. **Quality starting point: 80** — reduce in steps of 5 until size target is met
8. **Minimum quality: 60** — never go below this (quality loss becomes visible)
9. **Originals are sacred** — never modify files in `photo-bank/`; compress during copy

## Compression Strategy

### Decision Tree

```
For each photo in photo-bank/:
  1. Read dimensions and file size
  2. Is it ≤ 500 KB already?
     YES → Copy as-is to src/assets/images/
     NO  → Continue to step 3
  3. Is the longest edge > 1920px?
     YES → Resize to 1920px max (maintains aspect ratio)
     NO  → Keep original dimensions
  4. Compress at quality 80 → check size
     ≤ 500 KB? → Done, copy to src/assets/images/
     > 500 KB? → Reduce quality by 5, repeat
  5. If quality reaches 60 and still > 500 KB:
     → Try WebP format (typically 25-35% smaller than JPEG)
     → If still > 500 KB at WebP quality 60, log a warning
```

### File Type Rules

| Input | Output | Notes |
|-------|--------|-------|
| `.jpg` / `.jpeg` | `.jpg` | Compress with Sharp JPEG encoder |
| `.png` (photo) | `.jpg` | Convert to JPEG (photos don't need transparency) |
| `.png` (logo/icon) | `.png` | Keep PNG, optimise with Sharp PNG encoder |
| `.webp` | `.webp` | Re-encode if oversized |
| `.svg` | `.svg` | Copy as-is (vector, already tiny) |

**How to detect PNG type**: If filename contains `logo`, `icon`, `favicon`, or `brand` → keep PNG. Otherwise → convert to JPEG.

## Implementation — Sharp (Node.js)

Sharp is already available in Astro projects (it's Astro's default image service). Use it directly.

### Install (if not already present)

```bash
npm install sharp
```

### Compression Script

Create `scripts/compress-photos.mjs`:

```javascript
import sharp from 'sharp';
import { readdir, stat, mkdir, copyFile } from 'fs/promises';
import { join, extname, basename } from 'path';

const SOURCE = 'photo-bank';
const DEST = 'src/assets/images';
const MAX_SIZE = 500 * 1024; // 500 KB
const MAX_DIMENSION = 1920;
const QUALITY_START = 80;
const QUALITY_MIN = 60;
const QUALITY_STEP = 5;

// Patterns that indicate PNG should stay PNG
const KEEP_PNG_PATTERNS = /logo|icon|favicon|brand/i;

async function getAllImages(dir) {
  const entries = [];
  const items = await readdir(dir, { withFileTypes: true });
  for (const item of items) {
    const fullPath = join(dir, item.name);
    if (item.isDirectory()) {
      entries.push(...await getAllImages(fullPath));
    } else if (/\.(jpe?g|png|webp)$/i.test(item.name)) {
      entries.push(fullPath);
    } else if (/\.svg$/i.test(item.name)) {
      entries.push({ path: fullPath, svg: true });
    }
  }
  return entries;
}

async function compressImage(sourcePath, destPath) {
  const fileStats = await stat(sourcePath);
  const name = basename(sourcePath);
  const ext = extname(sourcePath).toLowerCase();

  // SVGs: copy as-is
  if (typeof sourcePath === 'object' && sourcePath.svg) {
    await copyFile(sourcePath.path, destPath);
    return { file: name, action: 'copied (SVG)', size: fileStats.size };
  }

  // Already under 500 KB? Copy as-is
  if (fileStats.size <= MAX_SIZE) {
    await copyFile(sourcePath, destPath);
    return {
      file: name,
      action: 'copied (already under 500 KB)',
      original: fileStats.size,
      final: fileStats.size,
    };
  }

  // Determine output format
  const keepPng = ext === '.png' && KEEP_PNG_PATTERNS.test(name);
  const format = keepPng ? 'png' : 'jpeg';
  const outputExt = keepPng ? '.png' : '.jpg';
  const outputPath = destPath.replace(/\.[^.]+$/, outputExt);

  // Get original dimensions
  const metadata = await sharp(sourcePath).metadata();
  const needsResize =
    metadata.width > MAX_DIMENSION || metadata.height > MAX_DIMENSION;

  let quality = QUALITY_START;
  let buffer;

  while (quality >= QUALITY_MIN) {
    let pipeline = sharp(sourcePath);

    if (needsResize) {
      pipeline = pipeline.resize({
        width: MAX_DIMENSION,
        height: MAX_DIMENSION,
        fit: 'inside',
        withoutEnlargement: true,
      });
    }

    if (format === 'jpeg') {
      pipeline = pipeline.jpeg({ quality, mozjpeg: true });
    } else {
      pipeline = pipeline.png({ quality, effort: 10 });
    }

    buffer = await pipeline.toBuffer();

    if (buffer.length <= MAX_SIZE) break;
    quality -= QUALITY_STEP;
  }

  // If still too large, try WebP
  if (buffer.length > MAX_SIZE) {
    let pipeline = sharp(sourcePath);
    if (needsResize) {
      pipeline = pipeline.resize({
        width: MAX_DIMENSION,
        height: MAX_DIMENSION,
        fit: 'inside',
        withoutEnlargement: true,
      });
    }
    buffer = await pipeline.webp({ quality: QUALITY_MIN }).toBuffer();
    const webpPath = destPath.replace(/\.[^.]+$/, '.webp');
    await sharp(buffer).toFile(webpPath);
    return {
      file: name,
      action: `compressed → WebP (quality ${QUALITY_MIN})`,
      original: fileStats.size,
      final: buffer.length,
      saved: `${Math.round((1 - buffer.length / fileStats.size) * 100)}%`,
      warning: buffer.length > MAX_SIZE ? 'STILL OVER 500 KB' : null,
    };
  }

  await sharp(buffer).toFile(outputPath);
  return {
    file: name,
    action: `compressed (quality ${quality}, ${format})`,
    original: fileStats.size,
    final: buffer.length,
    saved: `${Math.round((1 - buffer.length / fileStats.size) * 100)}%`,
  };
}

// Main
async function main() {
  await mkdir(DEST, { recursive: true });

  const images = await getAllImages(SOURCE);
  const results = [];

  console.log(`\nCompressing ${images.length} images...\n`);

  for (const img of images) {
    const sourcePath = typeof img === 'object' ? img.path : img;
    const name = basename(sourcePath);
    const destPath = join(DEST, name);

    try {
      const result = await compressImage(sourcePath, destPath);
      results.push(result);

      const sizeKB = (r) => `${Math.round(r / 1024)} KB`;
      if (result.original) {
        console.log(
          `  ${result.file}: ${sizeKB(result.original)} → ${sizeKB(result.final)} (${result.saved || 'n/a'}) ${result.warning || '✓'}`
        );
      } else {
        console.log(`  ${result.file}: ${result.action}`);
      }
    } catch (err) {
      console.error(`  ERROR: ${name}: ${err.message}`);
      results.push({ file: name, action: 'FAILED', error: err.message });
    }
  }

  // Summary
  const totalOriginal = results.reduce((s, r) => s + (r.original || 0), 0);
  const totalFinal = results.reduce((s, r) => s + (r.final || 0), 0);
  const warnings = results.filter((r) => r.warning);

  console.log(`\n--- Summary ---`);
  console.log(`  Images processed: ${results.length}`);
  console.log(
    `  Total size: ${Math.round(totalOriginal / 1024)} KB → ${Math.round(totalFinal / 1024)} KB`
  );
  console.log(
    `  Total saved: ${Math.round((1 - totalFinal / totalOriginal) * 100)}%`
  );
  if (warnings.length > 0) {
    console.log(`\n  ⚠ ${warnings.length} images still over 500 KB:`);
    warnings.forEach((w) => console.log(`    - ${w.file}`));
  }
}

main();
```

### Run It

```bash
node scripts/compress-photos.mjs
```

Or add to `package.json`:

```json
{
  "scripts": {
    "compress": "node scripts/compress-photos.mjs",
    "prebuild": "node scripts/compress-photos.mjs"
  }
}
```

## Integration with Photo Manager

The photo-manager skill should call image compression **before** cataloguing:

```
Step 1: Scan photo-bank/ (get dimensions, file sizes)
Step 2: Prepare src/assets/images/ directory
Step 2.5: Run image compression (THIS SKILL)
  → Copies + compresses all photos to src/assets/images/
  → Logos/SVGs copied as-is
  → Photos resized to max 1920px and compressed to ≤ 500 KB
Step 3: Generate _catalog.json from src/assets/images/ (post-compression dimensions)
Step 4: Dimension-aware placement proceeds as normal
```

**Important**: The `_catalog.json` must record the **compressed** dimensions and file sizes, not the originals from `photo-bank/`.

## Expected Results

| Input | Typical Output |
|-------|----------------|
| 5 MB JPEG (4000x3000) | ~250-350 KB JPEG (1920x1440) at quality 80 |
| 2 MB JPEG (3000x2000) | ~200-300 KB JPEG (1920x1280) at quality 80 |
| 800 KB JPEG (1920x1080) | ~300-400 KB JPEG (1920x1080) at quality 80 |
| 300 KB JPEG (1200x800) | 300 KB — copied as-is (already under limit) |
| 1.5 MB PNG (logo, 800x200) | ~50-100 KB PNG optimised |
| 15 KB SVG | 15 KB — copied as-is |

## Quality Benchmarks

At quality 80 (our starting point), JPEG compression is visually lossless for website use:
- **Quality 80-85**: Indistinguishable from original on screen
- **Quality 70-80**: Very slight loss, invisible at website viewing sizes
- **Quality 60-70**: Noticeable only in side-by-side comparison with original
- **Below 60**: Visible artefacts — we never go this low

## Anti-Patterns

- ❌ Compressing in `photo-bank/` (originals are sacred)
- ❌ Upscaling small images to fill large slots
- ❌ Using quality below 60 (visible degradation)
- ❌ Converting logos/icons from PNG to JPEG (loses transparency)
- ❌ Skipping compression because "Astro will handle it" (Astro optimises format, not source size)
- ❌ Running compression without checking if the image is already small enough

## Troubleshooting

**Sharp not installed?** Run `npm install sharp`. It's a native module — if build fails on Windows, ensure Python and Visual Studio Build Tools are available, or use the pre-built binary.

**Image still over 500 KB at quality 60?** This happens with very detailed photos. Options:
1. Reduce `MAX_DIMENSION` to 1600px for that specific image
2. Accept the WebP fallback (25-35% smaller than JPEG)
3. Ask the user for a smaller source photo

**PNG logo comes out huge?** PNG compression is less effective than JPEG. For large logos:
1. Check if the logo has unnecessary resolution (a 4000px logo is overkill)
2. Resize to max 800px width for header use
3. Consider SVG format if available (infinitely scalable, tiny file size)
