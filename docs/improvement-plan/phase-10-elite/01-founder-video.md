# 01 — Founder Video: Script, Filming Guidance, and VideoObject Schema

## Skills Applied
- `brand-storytelling` — `references/story-templates.md` (Epiphany Bridge, video narrative)
- `seo` — `references/seo-reference.md` (VideoObject JSON-LD)
- `east-african-english` — formal register, British spelling

## Why a Founder Video

Video converts at 2-4x the rate of equivalent text for professional services. The reason is not novelty — it is trust transmission. A visitor who has read Peter's about page has read a description of Peter. A visitor who has watched 90 seconds of Peter speaking directly to camera has experienced Peter — his manner, his directness, his expertise. These are different things, and the second is significantly more persuasive.

The founder video is the single highest-trust element a professional services website can add. It is also the most difficult to produce well. This document gives everything needed to produce it well.

## Video Specifications

- **Format:** 90-120 seconds. No longer. Attention at 90 seconds is near 100%; at 3 minutes, it is under 30%.
- **Style:** Direct to camera, no cuts, no slides, no B-roll. One person, one camera, one message.
- **Audio:** Essential. A bad image with good audio is acceptable. Good image with bad audio is unwatchable. Use a lapel microphone or a close directional microphone.
- **Subtitles:** Required. A minimum of 85% of LinkedIn video views and 60% of website video views are played without sound. Subtitles are not optional.
- **Platform:** Film once, use in three places: homepage hero, about page, YouTube (as SEO asset).

## Production Requirements

**Camera:** Any modern smartphone (iPhone 12+, Samsung S21+) is sufficient. Do not use the front-facing camera. Use the rear camera.

**Tripod:** Required. No handheld. An UGX 25,000 tripod from Kampala market is sufficient.

**Lighting:** Film facing a window, in natural daylight, before 10:00am or after 16:00. This produces the most flattering and professional light with no equipment. Avoid overhead fluorescent lighting.

**Background:** Plain wall, bookshelf, or neat office environment. Clean and professional. No clutter. No moving background elements.

**Microphone:** A lapel microphone (UGX 50,000–150,000 from Kampala electronics market, or Amazon) connected to the phone delivers broadcast-quality audio. If unavailable, speak in a quiet room with no echo and position the phone 60-90cm from the face.

**Clothing:** Business attire. A well-fitted shirt or blazer, plain or subtle pattern. Avoid white (contrast with skin), red (bleeds on camera), or loud patterns (distracting).

## Full Script (90 seconds)

The script follows the Epiphany Bridge structure: who I help → the problem they face → my unique understanding of it → the specific way I can help → what to do next.

**Deliver this script with pauses. Do not rush it. 90 seconds of calm, measured delivery is more authoritative than 60 seconds spoken quickly.**

---

```
[Pause. Look directly at camera. Breathe.]

If your organisation operates across multiple African countries — or in both English and French-speaking markets — your technology is probably not keeping up with your ambitions.

Not because technology cannot solve the problem. It can. But most technology advice in Africa arrives in one of two forms: a vendor selling a product, or a consultant with a Western framework that was not designed for this market.

My name is Peter Bamuhigire.

I have spent 15 years building technology systems inside African organisations — pharmaceutical distribution across West Africa, property management in Uganda, agricultural research institutions, hotels, NGOs. In the environments where the internet goes down, where the team speaks two languages, where the staff cannot wait for an IT helpdesk that does not exist.

The practice I run from Kampala is built for exactly this situation: independent advice, no vendor affiliations, bilingual in English and French, and direct experience of what actually works — not what the textbook says should work.

The first conversation is a 30-minute diagnostic call. Not a sales call. By the end of it, you will know whether this practice is the right fit for your situation. And if it is not, I will tell you that too.

[Pause.]

The link is in the description. I look forward to the conversation.

[Hold. Natural ending.]
```

---

## Script Notes for Delivery

- **"If your organisation operates across multiple African countries"** — say this looking slightly above the camera, as if addressing a room. On "or in both English and French-speaking markets" — bring your gaze back to the lens.
- **"My name is Peter Bamuhigire"** — pause before this. It is the pivot from problem to person.
- **The list** ("pharmaceutical distribution... property management... hotels...") — say it slowly, as if you are recalling specific memories. This reads as genuine experience, not a rehearsed list.
- **"Not a sales call"** — emphasise "not". This is the single most important trust signal in the video.
- **The closing pause** — hold for 3 seconds after "I look forward to the conversation." Do not fill the silence.

## Production Checklist

Before filming:
- [ ] Tripod set up, camera level, background clean
- [ ] Test lighting (no shadows on face, no blown-out window behind)
- [ ] Microphone tested (record 30 seconds and listen back — is it clear?)
- [ ] Script memorised to the point of natural delivery (not word-perfect)
- [ ] Phone fully charged

During filming:
- [ ] Record at least 3 takes
- [ ] On each take, hold silence for 5 seconds at the start and 5 seconds at the end
- [ ] Do not stop a take mid-sentence — finish each take and start again

After filming:
- [ ] Review all 3 takes — choose the one with the most natural delivery (not the most perfect words)
- [ ] Add subtitles (use CapCut free app or Submagic free tier)
- [ ] Export at minimum 1080p (1920×1080)

## Placement on Website

**Homepage (`/en/index.astro`):**
Add below the hero section as an optional autoplay video (muted, no sound on autoplay — sound on click):

```astro
<section class="py-12 bg-warm-white">
  <div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
    <p class="text-navy-500 text-sm uppercase tracking-widest font-semibold mb-6">In Peter's own words</p>
    <div class="relative rounded-2xl overflow-hidden shadow-2xl aspect-video bg-navy-900">
      <video
        class="w-full h-full object-cover"
        controls
        poster="/images/video-poster.jpg"
        preload="none"
      >
        <source src="/videos/peter-bamuhigire-intro.mp4" type="video/mp4" />
        <track kind="subtitles" src="/videos/peter-bamuhigire-intro-en.vtt" srclang="en" label="English" default />
      </video>
    </div>
  </div>
</section>
```

**File locations:**
- Video: `public/videos/peter-bamuhigire-intro.mp4`
- Subtitles (EN): `public/videos/peter-bamuhigire-intro-en.vtt`
- Poster image: `public/images/video-poster.jpg` (a frame from the video — best expression)

**About page (`/en/about.astro`):**
Add below the hero section, before the career timeline.

## VideoObject JSON-LD Schema

Add to the homepage and about page wherever the video is embedded:

```javascript
const videoSchema = {
  "@context": "https://schema.org",
  "@type": "VideoObject",
  "name": "Peter Bamuhigire — ICT Consultant, Kampala Uganda",
  "description": "Peter Bamuhigire introduces his ICT consulting and software development practice — who he works with, what he has built, and how the first conversation works.",
  "thumbnailUrl": "https://techguypeter.com/images/video-poster.jpg",
  "uploadDate": "2026-09-01",
  "duration": "PT1M45S",
  "contentUrl": "https://techguypeter.com/videos/peter-bamuhigire-intro.mp4",
  "embedUrl": "https://www.youtube.com/embed/[YOUTUBE_ID]",
  "inLanguage": "en",
  "author": {
    "@type": "Person",
    "name": "Peter Bamuhigire",
    "url": "https://techguypeter.com/en/about/"
  },
  "publisher": {
    "@type": "Organization",
    "name": "Peter Bamuhigire — ICT Consulting & Software Development",
    "url": "https://techguypeter.com"
  }
};
```

## YouTube as SEO Asset

After producing the video, upload to YouTube:
- **Title:** `Peter Bamuhigire — ICT Consultant & Software Developer, Kampala Uganda`
- **Description:** Full script text + link to website + link to contact page
- **Tags:** ICT consultant Uganda, software developer Uganda, IT consultant Kampala, ICT consulting East Africa, Peter Bamuhigire
- **Category:** Science & Technology
- **Subtitles:** Upload the .vtt file as English captions

The YouTube video also creates a second indexable asset for the "Peter Bamuhigire" branded keyword cluster.

## Acceptance Criteria

- [ ] Founder video filmed (90-120 seconds, direct to camera)
- [ ] Audio quality is clear — lapel or directional microphone used
- [ ] English subtitles added
- [ ] Video file exported at 1080p minimum
- [ ] Video uploaded to YouTube with optimised title, description, and tags
- [ ] Video embedded on homepage below hero section
- [ ] Video embedded on about page below hero
- [ ] Poster image (video thumbnail) saved at `public/images/video-poster.jpg`
- [ ] `VideoObject` JSON-LD schema added to homepage and about page
- [ ] `npm run build` passes with no errors

## Effort

**L** — 1 week (script preparation, filming day, post-production, upload, implementation)
