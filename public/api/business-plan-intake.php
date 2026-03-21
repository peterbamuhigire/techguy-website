<?php
declare(strict_types=1);

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Method not allowed']);
    exit;
}

$projectRoot = dirname(__DIR__, 2);
require_once $projectRoot . '/vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$dotenv = Dotenv\Dotenv::createImmutable($projectRoot);
$dotenv->load();

$raw  = file_get_contents('php://input');
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
        'success'       => 'Thank you — your brief has been received. Peter will review your answers and send you a personalised quotation within 48 hours.',
        'invalid_input' => 'Please check your details and try again.',
        'rate_limit'    => 'Too many submissions. Please wait an hour before trying again.',
        'csrf_fail'     => 'Security check failed. Please refresh the page and try again.',
        'server_error'  => 'Something went wrong on our end. Please email peter@techguypeter.com directly.',
        'min_answers'   => 'Please answer at least three questions before submitting.',
    ],
    'fr' => [
        'success'       => 'Merci — votre dossier a bien été reçu. Peter examinera vos réponses et vous enverra un devis personnalisé dans les 48 heures.',
        'invalid_input' => 'Veuillez vérifier vos informations et réessayer.',
        'rate_limit'    => 'Trop de soumissions. Veuillez attendre une heure avant de réessayer.',
        'csrf_fail'     => 'Vérification de sécurité échouée. Veuillez actualiser la page et réessayer.',
        'server_error'  => 'Une erreur s\'est produite. Veuillez envoyer un e-mail directement à peter@techguypeter.com.',
        'min_answers'   => 'Veuillez répondre à au moins trois questions avant de soumettre.',
    ],
];

$msg = $messages[$lang];
$h   = fn(string $str): string => htmlspecialchars($str, ENT_QUOTES | ENT_HTML5, 'UTF-8');

$fakeOk = function () use ($msg): never {
    http_response_code(200);
    echo json_encode(['success' => true, 'message' => $msg['success']]);
    exit;
};

// --- Honeypot ---
if (!empty($data['website'])) {
    $fakeOk();
}

// --- Timing check ---
$loadedAt = isset($data['_loaded_at']) ? (int) $data['_loaded_at'] : 0;
if ($loadedAt > 0 && (time() - $loadedAt) < 3) {
    $fakeOk();
}

// --- CSRF ---
$csrfSecret     = $_ENV['CSRF_SECRET'] ?? '';
$submittedToken = $data['_csrf_token'] ?? '';
$submittedTs    = isset($data['_csrf_ts']) ? (int) $data['_csrf_ts'] : 0;
$expectedToken  = hash_hmac('sha256', (string) $submittedTs, $csrfSecret);
$tokenAge       = time() - $submittedTs;
if (empty($csrfSecret) || !hash_equals($expectedToken, $submittedToken) || $tokenAge > 3600 || $tokenAge < 0) {
    http_response_code(403);
    echo json_encode(['success' => false, 'message' => $msg['csrf_fail']]);
    exit;
}

// --- Rate limiting ---
$dataDir       = $projectRoot . '/data';
if (!is_dir($dataDir)) mkdir($dataDir, 0755, true);
$rateLimitFile = $dataDir . '/rate_limits_bp.json';
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
foreach ($limits as $ip => $ts) {
    $limits[$ip] = array_values(array_filter($ts, fn($t) => ($now - $t) < $window));
    if (empty($limits[$ip])) unset($limits[$ip]);
}
file_put_contents($rateLimitFile, json_encode($limits), LOCK_EX);

// --- Input validation ---
$name    = trim($data['name']    ?? '');
$email   = trim($data['email']   ?? '');
$phone   = trim($data['phone']   ?? '');
$company = trim($data['company'] ?? '');

$errors = [];
if (strlen($name) < 2 || strlen($name) > 200)                                     $errors[] = 'name';
if (!filter_var($email, FILTER_VALIDATE_EMAIL) || strlen($email) > 254)           $errors[] = 'email';
if ($phone !== '' && !preg_match('/^[\+\d\s\-\(\)]{7,20}$/', $phone))             $errors[] = 'phone';

if (!empty($errors)) {
    http_response_code(422);
    echo json_encode(['success' => false, 'message' => $msg['invalid_input'], 'fields' => $errors]);
    exit;
}

// --- Collect business plan intake answers ---
$questions = [
    'en' => [
        'q1'  => 'Your Business',
        'q2'  => 'The Problem You Are Solving',
        'q3'  => 'Your Product or Service',
        'q4'  => 'Your Customers',
        'q5'  => 'How You Make Money',
        'q6'  => 'Your Competition',
        'q7'  => 'Your Finances',
        'q8'  => 'What You Need From Us',
        'q9'  => 'The People Behind the Business',
        'q10' => 'Anything That Affects What We Can Write',
    ],
    'fr' => [
        'q1'  => 'Votre entreprise',
        'q2'  => 'Le problème que vous résolvez',
        'q3'  => 'Votre produit ou service',
        'q4'  => 'Vos clients',
        'q5'  => 'Comment vous générez des revenus',
        'q6'  => 'Votre concurrence',
        'q7'  => 'Votre situation financière',
        'q8'  => 'Ce que vous attendez de nous',
        'q9'  => 'L\'équipe dirigeante',
        'q10' => 'Tout ce qui peut influencer le document',
    ],
];

$qLabels  = $questions[$lang];
$answers  = [];
$answered = 0;
foreach (array_keys($qLabels) as $key) {
    $val           = trim($data[$key] ?? '');
    $answers[$key] = $val;
    if (strlen($val) >= 20) $answered++;
}

if ($answered < 3) {
    http_response_code(422);
    echo json_encode(['success' => false, 'message' => $msg['min_answers']]);
    exit;
}

// --- Spam scan ---
$fullText     = $name . ' ' . implode(' ', $answers) . ' ' . $company;
$spamPatterns = [
    '/\b(viagra|cialis|casino|lottery|prize|winner|click here|buy now|free money|earn \$)\b/i',
    '/https?:\/\/[^\s]+.*https?:\/\//i',
    '/<[^>]+>/i',
    '/[\x00-\x08\x0B\x0C\x0E-\x1F]/',
];
foreach ($spamPatterns as $pattern) {
    if (preg_match($pattern, $fullText)) $fakeOk();
}

// --- SMTP config ---
$smtpHost       = $_ENV['SMTP_HOST']       ?? '';
$smtpPort       = (int) ($_ENV['SMTP_PORT'] ?? 587);
$smtpUser       = $_ENV['SMTP_USERNAME']   ?? '';
$smtpPass       = $_ENV['SMTP_PASSWORD']   ?? '';
$fromEmail      = $_ENV['SMTP_FROM_EMAIL'] ?? $smtpUser;
$fromName       = $_ENV['SMTP_FROM_NAME']  ?? 'TechGuy Peter';
$recipientEmail = $_ENV['SMTP_RECIPIENT']  ?? 'peter@techguypeter.com';

if (empty($smtpHost) || empty($smtpUser) || empty($smtpPass)) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $msg['server_error']]);
    exit;
}

$submittedAt    = date('D j M Y, H:i T');
$phoneDisplay   = $phone ?: '—';
$companyDisplay = $company ?: '—';

// --- Build admin email ---
$answerRowsHtml = '';
foreach ($qLabels as $key => $label) {
    $ans        = $answers[$key];
    $ansDisplay = $ans ? $h($ans) : '<em style="color:#94a3b8;">— Not answered —</em>';
    $qNum       = strtoupper(str_replace('q', 'Q', $key));
    $answerRowsHtml .= <<<ROW
<tr>
  <td colspan="2" style="padding:14px 0 4px;border-top:1px solid #f1f5f9;">
    <span style="font-size:12px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">{$qNum} — {$h($label)}</span>
  </td>
</tr>
<tr>
  <td colspan="2" style="padding:0 0 14px;font-size:14px;color:#1e293b;line-height:1.6;white-space:pre-wrap;">{$ansDisplay}</td>
</tr>
ROW;
}

$adminSubject = ($lang === 'fr')
    ? 'Nouveau dossier Plan d\'Affaires — ' . $name
    : 'New Business Plan Intake — ' . $name;

$adminHtml = <<<HTML
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f4f6f8;font-family:Arial,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f4f6f8;padding:32px 0;">
    <tr><td align="center">
      <table width="620" cellpadding="0" cellspacing="0" style="background:#ffffff;border-radius:8px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.08);">
        <tr><td style="background:linear-gradient(135deg,#0C2340 0%,#1a3a5c 100%);padding:32px 40px;">
          <h1 style="margin:0;color:#F0C243;font-size:20px;font-weight:700;letter-spacing:0.5px;">New Business Plan &amp; Strategy Intake</h1>
          <p style="margin:8px 0 0;color:#94a3b8;font-size:14px;">TechGuy Peter — techguypeter.com</p>
        </td></tr>
        <tr><td style="background:#f0f4f8;padding:16px 40px;border-bottom:1px solid #e2e8f0;">
          <p style="margin:0;font-size:14px;color:#334155;">
            <strong style="color:#0C2340;">{$h($name)}</strong> &lt;{$h($email)}&gt; submitted the business planning intake form.
          </p>
        </td></tr>
        <tr><td style="padding:32px 40px 16px;">
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
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Phone / WhatsApp</td>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:14px;color:#1e293b;">{$h($phoneDisplay)}</td>
            </tr>
            <tr>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Organisation</td>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:14px;color:#1e293b;">{$h($companyDisplay)}</td>
            </tr>
            <tr>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Language</td>
              <td style="padding:10px 0;border-bottom:1px solid #f1f5f9;font-size:14px;color:#1e293b;">{$h(strtoupper($lang))}</td>
            </tr>
            <tr>
              <td style="padding:10px 0;font-size:13px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">Questions Answered</td>
              <td style="padding:10px 0;font-size:14px;color:#1e293b;">{$answered} of 10</td>
            </tr>
          </table>
        </td></tr>
        <tr><td style="padding:0 40px 16px;">
          <div style="background:#fff8e1;border-left:4px solid #F0C243;padding:12px 16px;border-radius:0 6px 6px 0;">
            <p style="margin:0;font-size:13px;color:#92400e;font-weight:600;">Action required: Review answers below and prepare a personalised business planning quotation. Reply directly to this email to respond to {$h($name)}.</p>
          </div>
        </td></tr>
        <tr><td style="padding:0 40px 32px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            {$answerRowsHtml}
          </table>
        </td></tr>
        <tr><td style="background:#f8fafc;padding:16px 40px;border-top:1px solid #e2e8f0;">
          <p style="margin:0;font-size:12px;color:#94a3b8;">
            Submitted: {$submittedAt} &middot; IP hash: {$h($ipHash)} &middot; Service: Business Planning &amp; Strategy
          </p>
        </td></tr>
      </table>
    </td></tr>
  </table>
</body>
</html>
HTML;

// --- Build client confirmation email ---
$clientAnswerRowsHtml = '';
foreach ($qLabels as $key => $label) {
    $ans        = $answers[$key];
    $ansDisplay = $ans ? nl2br($h($ans)) : '<em style="color:#94a3b8;">—</em>';
    $clientAnswerRowsHtml .= <<<ROW
<tr>
  <td style="padding:12px 0 4px;border-top:1px solid #f1f5f9;" colspan="2">
    <span style="font-size:12px;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:0.5px;">{$h($label)}</span>
  </td>
</tr>
<tr>
  <td style="padding:0 0 12px;font-size:14px;color:#334155;line-height:1.6;" colspan="2">{$ansDisplay}</td>
</tr>
ROW;
}

if ($lang === 'fr') {
    $confirmSubject = 'Votre dossier a bien été reçu — Plan d\'Affaires & Stratégie';
    $confirmAlt     = "Bonjour {$name},\n\nMerci d'avoir complété notre questionnaire de prise en charge. Peter examinera votre dossier et vous enverra un devis personnalisé dans les 48 heures.\n\nPeter Bamuhigire\npeter@techguypeter.com\n+256 784 464178";
    $confirmHtml = <<<HTML
<!DOCTYPE html>
<html lang="fr">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f4f6f8;font-family:Arial,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f4f6f8;padding:32px 0;">
    <tr><td align="center">
      <table width="620" cellpadding="0" cellspacing="0" style="background:#ffffff;border-radius:8px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.08);">
        <tr><td style="background:linear-gradient(135deg,#0C2340 0%,#1a3a5c 100%);padding:40px;">
          <h1 style="margin:0;color:#F0C243;font-size:26px;font-weight:700;">Peter Bamuhigire</h1>
          <p style="margin:8px 0 0;color:#94a3b8;font-size:14px;">Consultant en Stratégie d'Entreprise &amp; Plans d'Affaires &mdash; Kampala, Ouganda</p>
        </td></tr>
        <tr><td style="padding:32px 40px 8px;">
          <p style="margin:0 0 16px;font-size:16px;color:#1e293b;">Bonjour {$h($name)},</p>
          <p style="margin:0 0 16px;font-size:15px;color:#334155;line-height:1.6;">
            Merci d'avoir complété notre questionnaire de prise en charge. Vos réponses ont bien été reçues et serviront de base à votre dossier client. Peter examinera vos réponses et vous enverra un <strong>devis personnalisé dans les 48 heures</strong>.
          </p>
          <p style="margin:0 0 24px;font-size:15px;color:#334155;line-height:1.6;">
            Pour toute question urgente, contactez Peter directement sur WhatsApp au <strong>+256 784 464178</strong>.
          </p>
          <div style="background:#f0f4f8;border-radius:8px;padding:20px 24px;margin-bottom:8px;">
            <p style="margin:0;font-size:13px;color:#0C2340;font-weight:700;">Récapitulatif de vos réponses</p>
            <p style="margin:4px 0 0;font-size:12px;color:#64748b;">Ceci est votre copie — conservez cet e-mail pour référence.</p>
          </div>
        </td></tr>
        <tr><td style="padding:0 40px 32px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            {$clientAnswerRowsHtml}
          </table>
        </td></tr>
        <tr><td style="padding:0 40px 32px;">
          <div style="text-align:center;">
            <a href="https://techguypeter.com/fr/business-planning-consulting-service/" style="display:inline-block;background:#F0C243;color:#0C2340;font-weight:700;font-size:15px;padding:14px 32px;border-radius:6px;text-decoration:none;">En savoir plus sur nos services</a>
          </div>
        </td></tr>
        <tr><td style="background:#f8fafc;padding:24px 40px;border-top:1px solid #e2e8f0;text-align:center;">
          <p style="margin:0;font-size:13px;color:#94a3b8;">Peter Bamuhigire &middot; peter@techguypeter.com &middot; +256 784 464178</p>
          <p style="margin:6px 0 0;font-size:12px;color:#cbd5e1;">Ceci est une confirmation automatique de vos réponses. Ne répondez pas à cet e-mail.</p>
        </td></tr>
      </table>
    </td></tr>
  </table>
</body>
</html>
HTML;
} else {
    $confirmSubject = 'Your brief has been received — Business Planning & Strategy';
    $confirmAlt     = "Dear {$name},\n\nThank you for completing our business planning intake questionnaire. Peter will review your answers and send you a personalised quotation within 48 hours.\n\nPeter Bamuhigire\npeter@techguypeter.com\n+256 784 464178";
    $confirmHtml = <<<HTML
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f4f6f8;font-family:Arial,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f4f6f8;padding:32px 0;">
    <tr><td align="center">
      <table width="620" cellpadding="0" cellspacing="0" style="background:#ffffff;border-radius:8px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.08);">
        <tr><td style="background:linear-gradient(135deg,#0C2340 0%,#1a3a5c 100%);padding:40px;">
          <h1 style="margin:0;color:#F0C243;font-size:26px;font-weight:700;">Peter Bamuhigire</h1>
          <p style="margin:8px 0 0;color:#94a3b8;font-size:14px;">Business Planning &amp; Strategy Consultant &mdash; Kampala, Uganda</p>
        </td></tr>
        <tr><td style="padding:32px 40px 8px;">
          <p style="margin:0 0 16px;font-size:16px;color:#1e293b;">Dear {$h($name)},</p>
          <p style="margin:0 0 16px;font-size:15px;color:#334155;line-height:1.6;">
            Thank you for completing our business planning intake questionnaire. Your answers have been received and will form the foundation of your client brief. Peter will review your responses and send you a <strong>personalised quotation within 48 hours</strong>.
          </p>
          <p style="margin:0 0 24px;font-size:15px;color:#334155;line-height:1.6;">
            For urgent matters, feel free to contact Peter directly on WhatsApp at <strong>+256 784 464178</strong>.
          </p>
          <div style="background:#f0f4f8;border-radius:8px;padding:20px 24px;margin-bottom:8px;">
            <p style="margin:0;font-size:13px;color:#0C2340;font-weight:700;">Your Submitted Brief</p>
            <p style="margin:4px 0 0;font-size:12px;color:#64748b;">This is your copy — keep this email for your records.</p>
          </div>
        </td></tr>
        <tr><td style="padding:0 40px 32px;">
          <table width="100%" cellpadding="0" cellspacing="0">
            {$clientAnswerRowsHtml}
          </table>
        </td></tr>
        <tr><td style="padding:0 40px 32px;">
          <div style="text-align:center;">
            <a href="https://techguypeter.com/en/business-planning-consulting-service/" style="display:inline-block;background:#F0C243;color:#0C2340;font-weight:700;font-size:15px;padding:14px 32px;border-radius:6px;text-decoration:none;">Learn More About Our Services</a>
          </div>
        </td></tr>
        <tr><td style="background:#f8fafc;padding:24px 40px;border-top:1px solid #e2e8f0;text-align:center;">
          <p style="margin:0;font-size:13px;color:#94a3b8;">Peter Bamuhigire &middot; peter@techguypeter.com &middot; +256 784 464178</p>
          <p style="margin:6px 0 0;font-size:12px;color:#cbd5e1;">This is an automated copy of your submitted brief. Please do not reply to this email.</p>
        </td></tr>
      </table>
    </td></tr>
  </table>
</body>
</html>
HTML;
}

// --- Send admin email ---
try {
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
    $mail->Subject = $adminSubject;
    $mail->Body    = $adminHtml;
    $mail->AltBody = "New business plan intake from: {$name} <{$email}>\nPhone: {$phoneDisplay}\nOrganisation: {$companyDisplay}\nAnswered: {$answered}/10 questions\nLanguage: {$lang}\n\n--- Brief ---\n" . implode("\n\n", array_map(
        fn($k) => strtoupper($qLabels[$k]) . ":\n" . ($answers[$k] ?: '— Not answered —'),
        array_keys($qLabels)
    ));
    $mail->send();

} catch (Exception $e) {
    error_log('Business plan intake admin email failed: ' . $e->getMessage());
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $msg['server_error']]);
    exit;
}

// --- Send client confirmation (best-effort) ---
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
    error_log('Business plan intake client confirmation failed: ' . $e->getMessage());
}

echo json_encode(['success' => true, 'message' => $msg['success']]);
