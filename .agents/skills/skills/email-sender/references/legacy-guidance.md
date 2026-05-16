# Email Sender: PHP Contact Form with SMTP

Send emails from static Astro websites using PHP + PHPMailer via the client's own domain SMTP server. Fully self-hosted, no external services (no reCAPTCHA, no third-party APIs).

## Prerequisites

- Apache with PHP 8.x (WAMP, XAMPP, or production server)
- Domain SMTP credentials (host, port, username, password)
- SPF/DKIM/DMARC records configured on domain
- Composer (PHP package manager)

## Architecture

```
Browser (Alpine.js fetch POST with JSON)
  → /api/contact.php (in dist/, copied from public/)
    → Honeypot check (silent reject with fake 200)
    → Timing check: >3s since page load (silent reject)
    → CSRF token validation (stateless HMAC, no sessions)
    → IP rate limiting (flat-file JSON, 5/hour default)
    → Input validation + sanitisation
    → Spam content scan (regex patterns, silent reject)
    → PHPMailer → SMTP → admin notification + user confirmation
    → JSON response { success, message } in user's language
```

**Key principle:** Silent rejects return fake HTTP 200 so bots can't adapt their behaviour.

## File Structure

```
project-root/
├── composer.json              ← PHPMailer + phpdotenv
├── vendor/                    ← Composer packages (gitignored)
├── .env                       ← SMTP credentials (gitignored)
├── .env.example               ← Template (committed)
├── data/                      ← Rate limit storage (gitignored, auto-created)
│   └── rate_limits.json       ← IP → timestamps (auto-managed)
├── public/
│   └── api/
│       ├── .htaccess          ← Restrict to PHP execution only
│       ├── csrf-token.php     ← GET → { token, ts } (HMAC-signed)
│       └── contact.php        ← POST → validate → email → JSON response
└── src/pages/{lang}/
    └── contact.astro          ← Alpine.js form with x-data handler
```

Astro copies `public/api/` → `dist/api/` during build. PHP runs from `dist/api/` at runtime, referencing `vendor/` and `.env` from the project root via `dirname(__DIR__, 2)`.

## Step 1: Composer Dependencies

```json
{
    "require": {
        "phpmailer/phpmailer": "^6.9",
        "vlucas/phpdotenv": "^5.6"
    }
}
```

```bash
composer install
```

## Step 2: Environment Configuration

**.env** (never committed):

```bash
SMTP_HOST=mail.privateemail.com
SMTP_PORT=587
SMTP_USERNAME=info@domain.com
SMTP_PASSWORD=actual-password
SMTP_FROM_EMAIL=info@domain.com
SMTP_FROM_NAME=CompanyName
SMTP_RECIPIENT=info@domain.com
CSRF_SECRET=random-64-char-string
RATE_LIMIT_MAX=5
RATE_LIMIT_WINDOW=3600
```

**.gitignore** additions:

```
vendor/
data/
```

## Step 3: CSRF Token Endpoint

`public/api/csrf-token.php` — stateless HMAC token generation:

```php
<?php
$projectRoot = dirname(__DIR__, 2);
require_once $projectRoot . '/vendor/autoload.php';
$dotenv = Dotenv\Dotenv::createImmutable($projectRoot);
$dotenv->load();

$timestamp = time();
$token = hash_hmac('sha256', (string) $timestamp, $_ENV['CSRF_SECRET']);
echo json_encode(['token' => $token, 'ts' => $timestamp]);
```

**Why stateless:** No PHP sessions needed. Token = HMAC(timestamp, secret). Server validates by recomputing the HMAC. Tokens expire after 1 hour.

## Step 4: Contact Form Handler

`public/api/contact.php` — the main endpoint. Processes in strict order:

### Validation Pipeline

1. **Method check** — POST only, 405 on GET
2. **Parse JSON** — `json_decode(file_get_contents('php://input'))`
3. **Honeypot** — hidden `website` field; bots fill it → fake 200
4. **Timing** — `_loaded_at` timestamp; submissions < 3 seconds → fake 200
5. **CSRF** — HMAC validation + 1-hour expiry → 403 on failure
6. **Rate limit** — IP hashed, stored in `data/rate_limits.json` → 429
7. **Input validation** — name (2-200 chars), email (filter_var), message (10-5000 chars), phone regex, enum whitelists → 422 with field-level errors
8. **Spam scan** — regex for spam keywords, multiple URLs, XSS, control chars → fake 200

### Sending Emails

Uses `PHPMailer` with STARTTLS on port 587:

- **Admin email:** Branded HTML with gradient header, data table, message box, metadata footer. Reply-To set to submitter's email for easy response.
- **User confirmation:** Branded HTML with gradient header, thank-you message, 6 key product selling points with icons, CTA button to website. All content in user's selected language.

### Bilingual Response Messages

```php
$messages = [
    'en' => ['success' => '...', 'invalid_input' => '...', 'rate_limit' => '...', ...],
    'fr' => ['success' => '...', 'invalid_input' => '...', 'rate_limit' => '...', ...],
];
$lang = in_array($data['lang'], ['en', 'fr']) ? $data['lang'] : 'en';
```

### HTML Sanitisation

All user input sanitised with `htmlspecialchars()` before embedding in HTML emails:

```php
$h = fn(string $str) => htmlspecialchars($str, ENT_QUOTES | ENT_HTML5, 'UTF-8');
```

## Step 5: Alpine.js Form Handler

The Astro contact page uses `x-data="contactForm('en')"`:

```javascript
Alpine.data('contactForm', (lang) => ({
  state: 'idle',           // idle | submitting | success | error
  responseMessage: '',
  fieldErrors: [],
  csrfToken: '', csrfTs: 0,
  loadedAt: Math.floor(Date.now() / 1000),
  formData: { name: '', email: '', phone: '', business_type: '', branches: '', message: '', demo: false, website: '' },

  async init() {
    const res = await fetch('/api/csrf-token.php');
    const data = await res.json();
    this.csrfToken = data.token;
    this.csrfTs = data.ts;
  },

  validate() { /* client-side validation */ },

  async submitForm() {
    if (!this.validate()) return;
    this.state = 'submitting';
    const res = await fetch('/api/contact.php', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ ...this.formData, lang, _csrf_token: this.csrfToken, _csrf_ts: this.csrfTs, _loaded_at: this.loadedAt }),
    });
    const data = await res.json();
    this.state = data.success ? 'success' : 'error';
    this.responseMessage = data.message;
  },
}));
```

### Form UI States

- **idle** — form visible, ready for input
- **submitting** — button shows spinner, disabled
- **success** — form hidden, green banner with message
- **error** — red banner with message, form still visible

### Honeypot Field

Hidden via CSS (not `display:none` which some bots detect):

```html
<div class="absolute opacity-0 -z-10 h-0 overflow-hidden" aria-hidden="true">
  <input type="text" name="website" x-model="formData.website" tabindex="-1" autocomplete="off" />
</div>
```

## Step 6: Email Templates

### Admin Notification Email

- Sea-blue gradient header (`#0C4A6E` → `#0369A1`)
- Quick summary bar with name + email
- Data table: Name, Email, Phone, Business, Branches, Demo (badge), Message
- Metadata footer: IP, timestamp, language
- Reply-To set to submitter's email

### User Confirmation Email

- Gradient header with company name + tagline
- Personal greeting + thank-you + 24-hour promise
- **6 key selling points** with icon tiles (customise per client):
  1. All-in-One Platform
  2. Built for Africa / Industry-specific
  3. Enterprise-Grade, SME Prices
  4. Industry-Specific Modules
  5. Bank-Grade Security
  6. Offline-First Mobile App
- CTA button linking to website
- No-reply notice in footer

**All content bilingual** — switch on `$lang` variable.

## Spam Prevention Summary

| Layer | Check | Failure Response | Why |
|-------|-------|-----------------|-----|
| Honeypot | Hidden `website` field filled | Fake 200 | Bots auto-fill all fields |
| Timing | Submission < 3s after load | Fake 200 | Humans can't fill forms that fast |
| Content | Spam keywords, URLs, XSS | Fake 200 | Known spam patterns |
| Rate limit | >5 per IP per hour | Real 429 | Prevents abuse floods |
| CSRF | Invalid HMAC or expired | Real 403 | Prevents cross-site forgery |

## Deployment Checklist

- [ ] `composer install` run on server
- [ ] `.env` configured with real SMTP credentials
- [ ] `CSRF_SECRET` set to a unique random string
- [ ] `npm run build` copies `public/api/` → `dist/api/`
- [ ] `vendor/` accessible from `dist/api/` via `dirname(__DIR__, 2)`
- [ ] `data/` directory writable by PHP (auto-created)
- [ ] SPF/DKIM/DMARC records configured on domain
- [ ] Test: valid submission → admin email + user confirmation
- [ ] Test: honeypot filled → fake success, no email
- [ ] Test: fast submit → fake success, no email
- [ ] Test: 6th submit → 429 rate limit
- [ ] Test: invalid CSRF → 403

## Contact Form UX Rules

A contact form that is difficult to spot or use costs valuable enquiries. Apply these rules:

1. **Make forms look like forms** — placeholder text must be visually distinct from body text (grey, italic). Input fields need visible borders (thin border, white background). The submit button must look like a button (contrast colour, prominent).
2. **Ask only for absolutely necessary data** — multiple fields make the task seem complicated. Name, email, message is usually enough. Only add phone if truly needed. If requesting sensitive info, explain why.
3. **Remove the Subject field** — set it to a fixed value in the form handler (e.g., "New enquiry"). For forms on different pages, use page-specific subjects automatically (e.g., "New enquiry: Website Design").
4. **Include forms on service pages** — don't force visitors to navigate to the Contact page. Place a compact enquiry form at the bottom of each service page so visitors can act on the spot.
5. **Add your photo and response time** — a photo of a real person and "We typically respond within 24 hours" makes the form feel human, not robotic.

## Troubleshooting

| Problem | Cause | Fix |
|---------|-------|-----|
| "CSRF secret not configured" | `.env` missing or `CSRF_SECRET` empty | Configure `.env` at project root |
| 500 on form submit | `vendor/` not found | Run `composer install`; verify `dirname(__DIR__, 2)` resolves correctly |
| Emails go to spam | No SPF/DKIM/DMARC | Configure domain authentication records |
| "Method not allowed" | Browser sending GET | Ensure form uses `fetch` POST, not native form action |
| `data/rate_limits.json` permission error | PHP can't write to `data/` | `chmod 755 data/` or fix folder permissions |
