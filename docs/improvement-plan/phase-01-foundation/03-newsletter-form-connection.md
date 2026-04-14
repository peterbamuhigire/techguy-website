# 03 — Wire the Newsletter Form to a Real Email Endpoint

## Skills Applied
- `form-ux-design` — form submission requirements, confirmation states
- `cro-audit` — `references/heuristic-checklist.md` Section 5 (Forms)

## Current State

`src/pages/en/blog.astro:276–293` (approximately):

```html
<form @submit.prevent="submitted = true" class="...">
  <input type="email" ... />
  <button type="submit">Subscribe</button>
</form>
<div x-show="submitted">
  Thank you for subscribing!
</div>
```

The form uses `@submit.prevent="submitted = true"`. This prevents the default form submission and sets a JavaScript variable to `true`, which triggers the "Thank you" message. No email address is ever sent to any backend. Any visitor who enters their email and clicks Subscribe receives a success confirmation but is never recorded anywhere.

This is also present in the French blog page at `src/pages/fr/blog.astro`.

## Current Score

CRO and lead generation: **5.5/10**
Trust and measurement maturity: **4.5/10**

## Target State

- Newsletter form submits to a real PHP endpoint (`/api/newsletter.php`) or a real email service provider (ESP) API
- Email addresses are stored in a list (Mailchimp, ConvertKit, or a local CSV/database)
- The confirmation message ("Thank you for subscribing") only appears after a successful server response
- An error message appears if submission fails
- Both EN and FR forms are wired

## Target Score

CRO and lead generation: **5.8/10**
Trust and measurement maturity: **5.0/10**

## Why This Matters

The `form-ux-design` skill requires: "All forms must actually submit." The CRO heuristic checklist item 5.8 states: "There is a clear confirmation state after successful form submission (what happens next, when, how)." A false confirmation that fires unconditionally — regardless of whether data was stored — violates both principles. If Peter refers to newsletter subscribers in a proposal ("over 200 people subscribe to our tech insights monthly"), that claim is false if the form has never submitted. The reputational risk is significant.

The `cro-audit` skill's split-test rules (Rule F1) also state that a micro-commitment before the email field increases opt-ins by +95%. While not required for this minimum fix, it is noted as a Phase 3 enhancement opportunity.

## Step-by-Step Instructions

### Option A: PHP Backend (Recommended — matches existing contact form pattern)

The site already has a working PHP contact form at `/api/contact.php`. Build a matching newsletter handler.

#### Step 1: Create `/api/newsletter.php`

Create the file at `public/api/newsletter.php` (or wherever the server serves PHP from — matching the location of `contact.php`). Full PHP code:

```php
<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: https://techguypeter.com');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Method not allowed.']);
    exit;
}

$input = json_decode(file_get_contents('php://input'), true);

if (!isset($input['email']) || !filter_var($input['email'], FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'A valid email address is required.']);
    exit;
}

$email = filter_var($input['email'], FILTER_SANITIZE_EMAIL);
$lang  = isset($input['lang']) && in_array($input['lang'], ['en', 'fr']) ? $input['lang'] : 'en';
$date  = date('Y-m-d H:i:s');

// Store to a local CSV file (replace with Mailchimp API call if preferred)
$csvFile = __DIR__ . '/newsletter-subscribers.csv';
$fileHandle = fopen($csvFile, 'a');
if ($fileHandle) {
    fputcsv($fileHandle, [$email, $lang, $date, $_SERVER['REMOTE_ADDR']]);
    fclose($fileHandle);
} else {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Could not save your subscription. Please try again.']);
    exit;
}

// Send notification email to Peter
$to      = 'peter@techguypeter.com';
$subject = 'New Newsletter Subscriber: ' . $email;
$body    = "New subscriber:\nEmail: $email\nLanguage: $lang\nDate: $date\n";
$headers = 'From: noreply@techguypeter.com' . "\r\n" . 'X-Mailer: PHP/' . phpversion();
@mail($to, $subject, $body, $headers);

echo json_encode(['success' => true, 'message' => 'You have been subscribed successfully.']);
exit;
```

#### Step 2: Update the EN Blog Form

In `src/pages/en/blog.astro`, find the newsletter form section. Replace the current `x-data` and form with:

```html
<div
  x-data="{
    email: '',
    state: 'idle',
    message: '',
    async submit() {
      if (!this.email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.email)) {
        this.state = 'error';
        this.message = 'Please enter a valid email address.';
        return;
      }
      this.state = 'loading';
      try {
        const res = await fetch('/api/newsletter.php', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ email: this.email, lang: 'en' })
        });
        const data = await res.json();
        if (data.success) {
          this.state = 'success';
          this.message = 'Thank you. Your first edition will arrive shortly.';
          if (typeof gtag !== 'undefined') {
            gtag('event', 'newsletter_subscribe', { 'event_category': 'engagement', 'event_label': 'blog_en' });
          }
        } else {
          this.state = 'error';
          this.message = data.message || 'Something went wrong. Please try again.';
        }
      } catch(e) {
        this.state = 'error';
        this.message = 'Network error. Please try again.';
      }
    }
  }"
  @submit.prevent="submit()"
>
  <form class="flex flex-col sm:flex-row gap-3">
    <input
      type="email"
      x-model="email"
      placeholder="Your email address"
      class="flex-1 px-4 py-3 rounded-lg border border-navy-200 focus:outline-none focus:ring-2 focus:ring-gold-400"
      :disabled="state === 'loading' || state === 'success'"
      required
    />
    <button
      type="submit"
      class="px-6 py-3 bg-amber-accent hover:bg-amber-accent/90 text-white font-semibold rounded-lg transition-all duration-200 disabled:opacity-60"
      :disabled="state === 'loading' || state === 'success'"
    >
      <span x-show="state !== 'loading'">Send me tech insights</span>
      <span x-show="state === 'loading'">Subscribing…</span>
    </button>
  </form>
  <p x-show="state === 'success'" class="mt-3 text-green-600 text-sm" x-text="message"></p>
  <p x-show="state === 'error'" class="mt-3 text-red-600 text-sm" x-text="message"></p>
  <p class="mt-2 text-navy-400 text-xs">No spam. Unsubscribe at any time.</p>
</div>
```

#### Step 3: Apply the Same Fix to FR Blog

In `src/pages/fr/blog.astro`, apply the identical form structure with:
- `lang: 'fr'` in the JSON body
- French placeholder text: `"Votre adresse e-mail"`
- French button text: `"Recevoir les actualités tech"`
- French confirmation: `"Merci. Votre première édition arrivera bientôt."`
- French error: `"Quelque chose s'est mal passé. Veuillez réessayer."`

#### Step 4: Secure the CSV file

If using the CSV storage approach, ensure the file is outside the web root or protected by the server:

Add to `.htaccess` in the api directory:
```apache
<Files "newsletter-subscribers.csv">
  Order allow,deny
  Deny from all
</Files>
```

### Option B: Mailchimp API Integration (if preferred over PHP CSV)

If Peter has a Mailchimp account:

1. Get the API key from Mailchimp → Account → Extras → API Keys
2. Get the List (Audience) ID from Mailchimp → Audience → Settings → Audience name and defaults
3. Replace the CSV storage block in `newsletter.php` with:

```php
$mailchimpApiKey = 'YOUR_MAILCHIMP_API_KEY';
$mailchimpListId = 'YOUR_LIST_ID';
$dataCenter = explode('-', $mailchimpApiKey)[1]; // e.g., 'us21'

$apiUrl = "https://{$dataCenter}.api.mailchimp.com/3.0/lists/{$mailchimpListId}/members";

$data = json_encode([
    'email_address' => $email,
    'status'        => 'subscribed',
    'merge_fields'  => ['LANG' => $lang]
]);

$ch = curl_init($apiUrl);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Content-Type: application/json',
    'Authorization: apikey ' . $mailchimpApiKey
]);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

if ($httpCode !== 200 && $httpCode !== 201) {
    $responseData = json_decode($response, true);
    if (isset($responseData['title']) && $responseData['title'] === 'Member Exists') {
        // Already subscribed — treat as success
    } else {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Could not subscribe. Please try again.']);
        exit;
    }
}
```

## Acceptance Criteria

- [ ] Submitting a real email address to the EN blog newsletter form results in the email being stored (CSV or Mailchimp)
- [ ] Peter receives a notification email when a new subscriber signs up
- [ ] The confirmation message only appears after a successful server response (not unconditionally)
- [ ] An error message appears if the server returns an error
- [ ] The FR blog form is equally functional
- [ ] Invalid email addresses are rejected with a clear error message
- [ ] The CTA button text reads "Send me tech insights" (EN) not "Subscribe"
- [ ] `npm run build` completes without errors

## Effort

**S — 3 hours** (PHP endpoint: 1 hour; EN form update: 1 hour; FR form update: 30 minutes; testing: 30 minutes)
