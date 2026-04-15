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

$raw = file_get_contents('php://input');
$data = json_decode($raw, true);

if (!is_array($data)) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Invalid request body']);
    exit;
}

$lang = in_array(($data['lang'] ?? 'en'), ['en', 'fr'], true) ? $data['lang'] : 'en';
$email = trim((string) ($data['email'] ?? ''));
$messages = [
    'en' => [
        'success' => 'Thank you. You are on the list.',
        'invalid' => 'Please enter a valid email address.',
        'duplicate' => 'That address is already subscribed.',
        'error' => 'Could not save your subscription right now.',
    ],
    'fr' => [
        'success' => 'Merci. Votre inscription est prise en compte.',
        'invalid' => 'Veuillez saisir une adresse e-mail valide.',
        'duplicate' => 'Cette adresse est deja inscrite.',
        'error' => "Impossible d'enregistrer votre inscription pour le moment.",
    ],
];

$msg = $messages[$lang];

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    http_response_code(422);
    echo json_encode(['success' => false, 'message' => $msg['invalid']]);
    exit;
}

$projectRoot = dirname(__DIR__, 2);
$dataDir = $projectRoot . '/data';
if (!is_dir($dataDir) && !mkdir($dataDir, 0755, true) && !is_dir($dataDir)) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $msg['error']]);
    exit;
}

$file = $dataDir . '/newsletter-signups.csv';
$normalisedEmail = strtolower($email);
$existing = [];

if (file_exists($file)) {
    $handle = fopen($file, 'rb');
    if ($handle) {
        while (($row = fgetcsv($handle)) !== false) {
            if (!empty($row[0])) {
                $existing[strtolower($row[0])] = true;
            }
        }
        fclose($handle);
    }
}

if (isset($existing[$normalisedEmail])) {
    echo json_encode(['success' => true, 'message' => $msg['duplicate']]);
    exit;
}

$handle = fopen($file, 'ab');
if ($handle === false) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $msg['error']]);
    exit;
}

if (filesize($file) === 0) {
    fputcsv($handle, ['email', 'language', 'subscribed_at']);
}

fputcsv($handle, [$normalisedEmail, $lang, gmdate('c')]);
fclose($handle);

echo json_encode(['success' => true, 'message' => $msg['success']]);
