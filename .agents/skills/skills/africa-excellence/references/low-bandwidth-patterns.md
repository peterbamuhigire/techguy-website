# Low-Bandwidth Patterns

**Read this when**: building or reviewing a site whose primary audience
uses 3G or 4G mobile networks in Africa.

**Purpose**: Performance patterns that go beyond the global defaults.
The Phase 10 performance gate enforces the numeric thresholds; this
reference defines the pattern practice that gets sites there on real
African networks.

## Baseline reality

- Primary network profile: 3G, 1,638 Kbps down, 300 ms RTT, 4× CPU
  slowdown. (See `deploy/references/africa-calibration.md`.)
- Per-route total first-load budget: **350 KB**.
- Real-world variance: networks routinely drop to EDGE for seconds at
  a time. The site must degrade gracefully, not catastrophically.

If the site is good on a 3G phone in Kampala, it is good everywhere.
The reverse is not true.

## Images

- **AVIF first, WebP fallback, JPEG last.** The AVIF saving versus WebP
  on real photographs is typically 30%+. Configure Sharp or equivalent
  in the build step.
- **Responsive image sets.** Every `<img>` uses `srcset` with at least
  three sizes matching the viewport breakpoints. No client gets a
  2,000-pixel hero on a 360-pixel screen.
- **Dimensions always declared.** Every image has `width` and `height`
  attributes or CSS equivalents so the browser can reserve space and
  avoid CLS.
- **Lazy-load everything below the fold.** Attribute `loading="lazy"`
  on the `<img>` and on any `<iframe>`.
- **Reserve the hero.** The single hero image may be eager-loaded with
  `fetchpriority="high"`; everything else waits.
- **No GIFs.** Replace with short muted MP4 or WebM at < 100 KB. Or
  remove.

## Fonts

- **Self-host.** Never load fonts from a third-party CDN. Third-party
  CDNs add a second connection; on African 3G that connection is
  expensive.
- **Subset per shipped language.** A site that ships only in English +
  Kiswahili does not need the full Latin extended set; subset with
  `unicode-range` and ship only what you need.
- **Two typefaces maximum.** One heading family, one body family.
  Three is indulgent; four is drift.
- **Font-display swap.** Never block paint on font; accept the
  flash-of-unstyled-text as part of the Africa contract.
- **Preload the critical subset.** `<link rel="preload" as="font"
  crossorigin>` for the above-the-fold text weights only.

## CSS

- **Critical CSS inlined in `<head>`.** Target ≤ 14 KB (so it fits in
  the first TCP window). Include the tokens, the above-the-fold layout,
  and the primary typography.
- **Rest lazy.** Non-critical CSS loads async via `media="print"`
  trick or `link rel="preload"` with onload swap. JavaScript is not
  required for this.
- **No unused CSS.** Run `purgecss` or Tailwind JIT aggressively.
- **No CSS-in-JS at runtime.** Extract to a stylesheet at build time.

## JavaScript

- **Zero JS by default.** Static sites should not ship JS unless it
  powers a feature. Astro, Eleventy, and Hugo all make this natural.
- **Islands when JS is required.** Hydrate only the interactive island
  (search bar, form validation, menu toggle). Do not rehydrate the
  whole page.
- **No frameworks just to have a framework.** A menu toggle is 20
  lines of vanilla JS. React is 45 KB compressed.
- **Defer third-party.** Analytics, chat widgets, etc., load after
  page-idle or after user interaction.
- **No auto-playing video.** Ever. Tap-to-play at minimum.

## Preload and prefetch

- **Preload.** The hero image, the critical font, and the primary
  stylesheet if it is external.
- **Prefetch.** Only next-page navigation when you are confident about
  destination (e.g. the primary CTA's target). Speculative prefetch on
  a 3G connection spends data the user may not have.
- **DNS-prefetch.** For any third-party domain that will be contacted
  after interaction.

## Service worker

- **Optional, but considered.** For sites where offline-first
  materially helps (docs, reference, read-later content), a small
  service worker caching the static shell is worth the complexity.
- **No service worker just for "offline".** A one-page marketing site
  has no meaningful offline benefit; the complexity cost outweighs.

## `Save-Data` handling

When `navigator.connection.saveData === true`:

- Skip non-critical third-party scripts entirely.
- Serve a smaller hero image.
- Defer analytics to page-idle.
- Do not degrade content or primary visuals; content comes first.

## Video

- Never autoplay.
- Compress aggressively (H.264 with a reasonable bitrate; AV1 where
  supported).
- Provide a poster image so users on metered networks see a still
  first.
- Offer a text or image alternative above the player for users who
  opt out.

## Ads and third-party widgets

- Not permitted by default on engine-built sites. If a client's model
  requires ads, file a decision entry.
- Chat widgets (Intercom, Drift, etc.): load after 5 s page-idle or on
  user interaction.

## Verification

At launch, in addition to the Phase 10 perf-gate:

- Load the homepage on a real Android mid-range device (Infinix, Tecno,
  Samsung A-series) on a real 3G connection in at least one target
  market.
- Confirm LCP ≤ 2.5 s, INP ≤ 200 ms.
- Time to primary CTA interaction ≤ 3 s.
- No layout shift after 1 s.
- Pull the plug on Wi-Fi mid-load; confirm the partially-loaded page
  remains interactive.

## Budget discipline

- Page weight is tracked per route in `reports/bundle/`.
- Any route over 350 KB first-load fails the gate.
- Route-weight regressions > 10% between builds require a decision
  entry before merging to main.
