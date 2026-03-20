<?php
declare(strict_types=1);

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Handle preflight
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

// --- 1. Method check ---
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Method not allowed']);
    exit;
}

// --- Bootstrap ---
$projectRoot = dirname(__DIR__, 2);
require_once $projectRoot . '/vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

$dotenv = Dotenv\Dotenv::createImmutable($projectRoot);
$dotenv->load();

// --- 2. Parse JSON body ---
$raw = file_get_contents('php://input');
$data = json_decode($raw, true);
if (!is_array($data)) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Invalid request body']);
    exit;
}

// --- Language ---
$lang = (isset($data['lang']) && in_array($data['lang'], ['en', 'fr'], true)) ? $data['lang'] : 'en';

$messages = [
    'en' => [
        'success'       => 'Thank you for your enquiry. Peter will be in touch within 48 hours to schedule your consultation. We look forward to working with you.',
        'invalid_input' => 'Please check your details and try again.',
        'rate_limit'    => 'Too many submissions. Please wait an hour before trying again.',
        'csrf_fail'     => 'Security check failed. Please refresh the page and try again.',
        'server_error'  => 'Something went wrong on our end. Please email peter@techguypeter.com directly.',
    ],
    'fr' => [
        'success'       => 'Merci pour votre message. Peter vous contactera dans les 48 heures pour planifier votre consultation.',
        'invalid_input' => 'Veuillez vérifier vos informations et réessayer.',
        'rate_limit'    => 'Trop de soumissions. Veuillez attendre une heure avant de réessayer.',
        'csrf_fail'     => 'Vérification de sécurité échouée. Veuillez actualiser la page et réessayer.',
        'server_error'  => 'Une erreur s\'est produite. Veuillez envoyer un email directement à peter@techguypeter.com.',
    ],
];

$msg = $messages[$lang];

// Helper: sanitise for HTML embedding
$h = fn(string $str): string => htmlspecialchars($str, ENT_QUOTES | ENT_HTML5, 'UTF-8');

// Fake 200 for silent rejects (bots can't adapt)
$fakeOk = function () use ($msg): never {
    http_response_code(200);
    echo json_encode(['success' => true, 'message' => $msg['success']]);
    exit;
};

// --- 3. Honeypot ---
if (!empty($data['website'])) {
    $fakeOk();
}

// --- 4. Timing check (< 3 seconds = bot) ---
$loadedAt = isset($data['_loaded_at']) ? (int) $data['_loaded_at'] : 0;
if ($loadedAt > 0 && (time() - $loadedAt) < 3) {
    $fakeOk();
}

// --- 5. CSRF validation ---
$csrfSecret = $_ENV['CSRF_SECRET'] ?? '';
if (empty($csrfSecret)) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $msg['server_error']]);
    exit;
}
$submittedToken = $data['_csrf_token'] ?? '';
$submittedTs    = isset($data['_csrf_ts']) ? (int) $data['_csrf_ts'] : 0;
$expectedToken  = hash_hmac('sha256', (string) $submittedTs, $csrfSecret);
$tokenAge       = time() - $submittedTs;
if (!hash_equals($expectedToken, $submittedToken) || $tokenAge > 3600 || $tokenAge < 0) {
    http_response_code(403);
    echo json_encode(['success' => false, 'message' => $msg['csrf_fail']]);
    exit;
}

// --- 6. Rate limiting (by hashed IP) ---
$dataDir = $projectRoot . '/data';
if (!is_dir($dataDir)) {
    mkdir($dataDir, 0755, true);
}
$rateLimitFile = $dataDir . '/rate_limits.json';
$ipHash        = hash('sha256', $_SERVER['REMOTE_ADDR'] ?? '');
$maxRequests   = (int) ($_ENV['RATE_LIMIT_MAX'] ?? 5);
$window        = (int) ($_ENV['RATE_LIMIT_WINDOW'] ?? 3600);
$now           = time();

$limits = [];
if (file_exists($rateLimitFile)) {
    $limits = json_decode(file_get_contents($rateLimitFile), true) ?? [];
}
$timestamps = array_filter($limits[$ipHash] ?? [], fn($t) => ($now - $t) < $window);
if (count($timestamps) >= $maxRequests) {
    http_response_code(429);
    echo json_encode(['success' => false, 'message' => $msg['rate_limit']]);
    exit;
}
$timestamps[]    = $now;
$limits[$ipHash] = array_values($timestamps);
// Prune old IPs to keep file small
foreach ($limits as $ip => $ts) {
    $limits[$ip] = array_values(array_filter($ts, fn($t) => ($now - $t) < $window));
    if (empty($limits[$ip])) unset($limits[$ip]);
}
file_put_contents($rateLimitFile, json_encode($limits), LOCK_EX);

// --- 7. Input validation ---
$errors = [];
$name    = trim($data['name'] ?? '');
$email   = trim($data['email'] ?? '');
$phone   = trim($data['phone'] ?? '');
$company = trim($data['company'] ?? '');
$service = trim($data['service'] ?? '');
$message = trim($data['message'] ?? '');
$contactMethod = trim($data['contact_method'] ?? '');

if (strlen($name) < 2 || strlen($name) > 200) {
    $errors[] = 'name';
}
if (!filter_var($email, FILTER_VALIDATE_EMAIL) || strlen($email) > 254) {
    $errors[] = 'email';
}
if ($phone !== '' && !preg_match('/^[\+\d\s\-\(\)]{7,20}$/', $phone)) {
    $errors[] = 'phone';
}
if (strlen($message) < 5 || strlen($message) > 5000) {
    $errors[] = 'message';
}
$allowedServices = ['Software Development', 'ICT Consulting & Strategy', 'Business Consulting', 'Property Management Technology', 'Other', 'Développement Logiciel', 'Conseil & Stratégie TIC', 'Conseil aux Entreprises', 'Technologie de Gestion Immobilière', 'Autre', ''];
if (!in_array($service, $allowedServices, true)) {
    $service = '';
}
$allowedMethods = ['phone', 'whatsapp', 'email', ''];
if (!in_array($contactMethod, $allowedMethods, true)) {
    $contactMethod = '';
}

if (!empty($errors)) {
    http_response_code(422);
    echo json_encode(['success' => false, 'message' => $msg['invalid_input'], 'fields' => $errors]);
    exit;
}

// --- 8. Spam content scan ---
$fullText = $name . ' ' . $message . ' ' . $company;
$spamPatterns = [
    '/\b(viagra|cialis|casino|lottery|prize|winner|click here|buy now|free money|earn \$)\b/i',
    '/https?:\/\/[^\s]+.*https?:\/\//i',  // multiple URLs
    '/<[^>]+>/i',                           // HTML tags
    '/\x00-\x08\x0B\x0C\x0E-\x1F/',       // control chars
];
foreach ($spamPatterns as $pattern) {
    if (preg_match($pattern, $fullText)) {
        $fakeOk();
    }
}

// --- 9. Send emails ---
$smtpHost      = $_ENV['SMTP_HOST'] ?? '';
$smtpPort      = (int) ($_ENV['SMTP_PORT'] ?? 587);
$smtpUser      = $_ENV['SMTP_USERNAME'] ?? '';
$smtpPass      = $_ENV['SMTP_PASSWORD'] ?? '';
$fromEmail     = $_ENV['SMTP_FROM_EMAIL'] ?? $smtpUser;
$fromName      = $_ENV['SMTP_FROM_NAME'] ?? 'TechGuy Peter';
$recipientEmail = $_ENV['SMTP_RECIPIENT'] ?? 'peter@techguypeter.com';

if (empty($smtpHost) || empty($smtpUser) || empty($smtpPass)) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $msg['server_error']]);
    exit;
}

// Build admin notification email
$submittedAt = date('D j M Y, H:i T');
$ipDisplay   = $_SERVER['REMOTE_ADDR'] ?? 'unknown';
$serviceDisplay = $service ?: '—';
$phoneDisplay   = $phone ?: '—';
$companyDisplay = $company ?: '—';
$contactMethodDisplay = $contactMethod ?: '—';

$adminHtml = <<<HTML
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f4f6f8;font-family:Arial,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f4f6f8;padding:32px 0;">
    <tr><td align="center">
      <table width="600" cellpadding="0" cellspacing="0" style="background:#ffffff;border-radius:8px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.08);">
        <!-- Header -->
        <tr><td style="background:linear-gradient(135deg,#0C2340 0%,#1a3a5c 100%);padding:32px 40px;">
          <h1 style="margin:0;color:#F0C243;font-size:22px;font-weight:700;letter-spacing:0.5px;">New Consultation Enquiry</h1>
          <p style="margin:8px 0 0;color:#94a3b8;font-size:14px;">TechGuy Peter — techguypeter.com</p>
        </td></tr>
        <!-- Quick summary -->
        <tr><td style="background:#f0f4f8;padding:16px 40px;border-bottom:1px solid #e2e8f0;">
          <p style="margin:0;font-size:14px;color:#334155;">
            <strong style="color:#0C2340;">{$h($name)}</strong> &lt;{$h($email)}&gt; submitted the contact form.
          </p>
        </td></tr>
        <!-- Data table -->
        <tr><td style="padding:32px 40px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;width:38%;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Full Name</td>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:14px;color:#1e293b;">{$h($name)}</td>
            </tr>
            <tr>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Email</td>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:14px;color:#1e293b;"><a href="mailto:{$h($email)}" style="color:#1a56db;">{$h($email)}</a></td>
            </tr>
            <tr>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Phone</td>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:14px;color:#1e293b;">{$h($phoneDisplay)}</td>
            </tr>
            <tr>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Company</td>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:14px;color:#1e293b;">{$h($companyDisplay)}</td>
            </tr>
            <tr>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Service Interest</td>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:14px;color:#1e293b;">{$h($serviceDisplay)}</td>
            </tr>
            <tr>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Preferred Contact</td>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:14px;color:#1e293b;">{$h($contactMethodDisplay)}</td>
            </tr>
          </table>
          <!-- Message box -->
          <div style="margin-top:24px;background:#f8fafc;border-left:4px solid #F0C243;padding:16px 20px;border-radius:0 6px 6px 0;">
            <p style="margin:0 0 8px;font-size:12px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Project Description</p>
            <p style="margin:0;font-size:14px;color:#334155;line-height:1.6;">{$h($message)}</p>
          </div>
        </td></tr>
        <!-- Footer -->
        <tr><td style="background:#f8fafc;padding:16px 40px;border-top:1px solid #e2e8f0;">
          <p style="margin:0;font-size:12px;color:#94a3b8;">
            Submitted: {$submittedAt} &middot; IP: {$h($ipHash)} &middot; Language: {$h($lang)}
          </p>
          <p style="margin:4px 0 0;font-size:12px;color:#94a3b8;">Reply directly to this email to respond to {$h($name)}.</p>
        </td></tr>
      </table>
    </td></tr>
  </table>
</body>
</html>
HTML;

// Build user confirmation email — language-aware
$confirmSubject = ($lang === 'fr')
    ? 'Votre demande a bien été reçue — Peter Bamuhigire'
    : 'Your enquiry has been received — Peter Bamuhigire';

$confirmAlt = ($lang === 'fr')
    ? "Bonjour {$name},\n\nMerci pour votre message. Peter vous contactera dans les 48 heures pour planifier votre consultation.\n\nPeter Bamuhigire\npeter@techguypeter.com\n+256 784 464178"
    : "Dear {$name},\n\nThank you for your enquiry. Peter will be in touch within 48 hours.\n\nPeter Bamuhigire\npeter@techguypeter.com\n+256 784 464178";

if ($lang === 'fr') {
$confirmHtml = <<<HTML
<!DOCTYPE html>
<html lang="fr">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f4f6f8;font-family:Arial,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f4f6f8;padding:32px 0;">
    <tr><td align="center">
      <table width="600" cellpadding="0" cellspacing="0" style="background:#ffffff;border-radius:8px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.08);">
        <tr><td style="background:linear-gradient(135deg,#0C2340 0%,#1a3a5c 100%);padding:40px;">
          <h1 style="margin:0;color:#F0C243;font-size:26px;font-weight:700;">Peter Bamuhigire</h1>
          <p style="margin:8px 0 0;color:#94a3b8;font-size:14px;">Consultant IT &amp; Développeur Logiciel &mdash; Kampala, Ouganda</p>
        </td></tr>
        <tr><td style="padding:40px;">
          <p style="margin:0 0 16px;font-size:16px;color:#1e293b;">Bonjour {$h($name)},</p>
          <p style="margin:0 0 16px;font-size:15px;color:#334155;line-height:1.6;">
            Merci de nous avoir contactés. Votre demande a bien été reçue et Peter vous répondra dans les <strong>48 heures</strong> pour planifier une consultation à un moment qui vous convient.
          </p>
          <p style="margin:0 0 32px;font-size:15px;color:#334155;line-height:1.6;">
            En attendant, vous pouvez également le contacter sur WhatsApp au <strong>+256 784 464178</strong> pour toute question urgente.
          </p>
          <div style="background:#f8fafc;border:1px solid #e2e8f0;border-radius:8px;padding:24px;">
            <p style="margin:0 0 16px;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Récapitulatif de votre demande</p>
            <p style="margin:0 0 8px;font-size:14px;color:#334155;"><strong>Service :</strong> {$h($serviceDisplay)}</p>
            <p style="margin:0;font-size:14px;color:#334155;"><strong>Message :</strong> {$h(mb_substr($message, 0, 200))}...</p>
          </div>
          <div style="margin-top:32px;text-align:center;">
            <a href="https://techguypeter.com" style="display:inline-block;background:#F0C243;color:#0C2340;font-weight:700;font-size:15px;padding:14px 32px;border-radius:6px;text-decoration:none;">Visiter TechGuyPeter.com</a>
          </div>
        </td></tr>
        <tr><td style="background:#f8fafc;padding:24px 40px;border-top:1px solid #e2e8f0;text-align:center;">
          <p style="margin:0;font-size:13px;color:#94a3b8;">Peter Bamuhigire &middot; peter@techguypeter.com &middot; +256 784 464178</p>
          <p style="margin:6px 0 0;font-size:12px;color:#cbd5e1;">Ceci est une confirmation automatique. Veuillez ne pas répondre à cet e-mail.</p>
        </td></tr>
      </table>
    </td></tr>
  </table>
</body>
</html>
HTML;
} else {
$confirmHtml = <<<HTML
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f4f6f8;font-family:Arial,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f4f6f8;padding:32px 0;">
    <tr><td align="center">
      <table width="600" cellpadding="0" cellspacing="0" style="background:#ffffff;border-radius:8px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.08);">
        <tr><td style="background:linear-gradient(135deg,#0C2340 0%,#1a3a5c 100%);padding:40px;">
          <h1 style="margin:0;color:#F0C243;font-size:26px;font-weight:700;">Peter Bamuhigire</h1>
          <p style="margin:8px 0 0;color:#94a3b8;font-size:14px;">ICT Consultant &amp; Software Developer &mdash; Kampala, Uganda</p>
        </td></tr>
        <tr><td style="padding:40px;">
          <p style="margin:0 0 16px;font-size:16px;color:#1e293b;">Dear {$h($name)},</p>
          <p style="margin:0 0 16px;font-size:15px;color:#334155;line-height:1.6;">
            Thank you for reaching out. Your enquiry has been received and I will get back to you within <strong>48 hours</strong> to schedule a consultation at a time that suits you.
          </p>
          <p style="margin:0 0 32px;font-size:15px;color:#334155;line-height:1.6;">
            In the meantime, feel free to connect with me on WhatsApp at <strong>+256 784 464178</strong> for urgent matters.
          </p>
          <div style="background:#f8fafc;border:1px solid #e2e8f0;border-radius:8px;padding:24px;">
            <p style="margin:0 0 16px;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Your enquiry summary</p>
            <p style="margin:0 0 8px;font-size:14px;color:#334155;"><strong>Service:</strong> {$h($serviceDisplay)}</p>
            <p style="margin:0;font-size:14px;color:#334155;"><strong>Message:</strong> {$h(mb_substr($message, 0, 200))}...</p>
          </div>
          <div style="margin-top:32px;text-align:center;">
            <a href="https://techguypeter.com" style="display:inline-block;background:#F0C243;color:#0C2340;font-weight:700;font-size:15px;padding:14px 32px;border-radius:6px;text-decoration:none;">Visit TechGuyPeter.com</a>
          </div>
        </td></tr>
        <tr><td style="background:#f8fafc;padding:24px 40px;border-top:1px solid #e2e8f0;text-align:center;">
          <p style="margin:0;font-size:13px;color:#94a3b8;">Peter Bamuhigire &middot; peter@techguypeter.com &middot; +256 784 464178</p>
          <p style="margin:6px 0 0;font-size:12px;color:#cbd5e1;">This is an automated confirmation. Please do not reply to this email.</p>
        </td></tr>
      </table>
    </td></tr>
  </table>
</body>
</html>
HTML;
}

// Send via PHPMailer
try {
    // Admin notification (critical — must succeed)
    $mail = new PHPMailer(true);
    $mail->isSMTP();
    $mail->Host       = $smtpHost;
    $mail->SMTPAuth   = true;
    $mail->Username   = $smtpUser;
    $mail->Password   = $smtpPass;
    $mail->SMTPSecure = ($smtpPort === 465) ? PHPMailer::ENCRYPTION_SMTPS : PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port       = $smtpPort;
    $mail->CharSet    = 'UTF-8';

    $mail->setFrom($fromEmail, $fromName);
    $mail->addReplyTo($email, $name);
    $mail->addAddress($recipientEmail, 'Peter Bamuhigire');
    $mail->isHTML(true);
    $mail->Subject = 'New Consultation Enquiry — ' . $name;
    $mail->Body    = $adminHtml;
    $mail->AltBody = "New enquiry from: {$name} <{$email}>\nPhone: {$phoneDisplay}\nCompany: {$companyDisplay}\nService: {$serviceDisplay}\nPreferred contact: {$contactMethodDisplay}\n\nMessage:\n{$message}";
    $mail->send();

} catch (Exception $e) {
    error_log('Contact form admin email failed: ' . $e->getMessage());
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $msg['server_error']]);
    exit;
}

// User confirmation (best-effort — don't fail the form if this doesn't send)
try {
    $mail2 = new PHPMailer(true);
    $mail2->isSMTP();
    $mail2->Host       = $smtpHost;
    $mail2->SMTPAuth   = true;
    $mail2->Username   = $smtpUser;
    $mail2->Password   = $smtpPass;
    $mail2->SMTPSecure = ($smtpPort === 465) ? PHPMailer::ENCRYPTION_SMTPS : PHPMailer::ENCRYPTION_STARTTLS;
    $mail2->Port       = $smtpPort;
    $mail2->CharSet    = 'UTF-8';

    $mail2->setFrom($fromEmail, $fromName);
    $mail2->addAddress($email, $name);
    $mail2->isHTML(true);
    $mail2->Subject = $confirmSubject;
    $mail2->Body    = $confirmHtml;
    $mail2->AltBody = $confirmAlt;
    $mail2->send();
} catch (Exception $e) {
    error_log('Contact form user confirmation failed: ' . $e->getMessage());
}

echo json_encode(['success' => true, 'message' => $msg['success']]);
