# Secrets Exposure Response Playbook

What to do when `scripts/scan-secrets.sh` or any other channel surfaces a
credential in the repository.

## Scope

Treats as a "secret":

- API keys for third-party services (Stripe, SendGrid, Mailgun, Plausible
  Cloud, GA4 measurement protocol secrets, Twilio).
- Database credentials (connection strings, passwords).
- SSH private keys, signing keys, TLS private keys.
- Session or encryption keys that have been or will be used in production.
- `.env` files committed by accident.
- Tokens embedded in deploy scripts or CI workflows.

Public API keys that are designed to be client-side (Google Maps browser
key, Plausible site ID) are not secrets but still follow the "least scope"
principle — restrict by HTTP referrer or domain.

## Response Steps

Follow in order. Do not shortcut.

### 1. Rotate the credential

Revoke the compromised credential at the source (the service's dashboard or
API). Generate a new credential with the minimum scope required. Update the
production environment to use the new credential.

If the credential belongs to a third party who must rotate it (e.g. a
client's API key), contact them immediately.

### 2. Assess exposure

- When was the commit made?
- Has the repository been public since then?
- Who has forked, cloned, or pulled in the window?
- Does the service's audit log show suspicious use?

If there is any evidence of misuse, escalate to incident response in
`policy-pages/references/incident-response.md` and notify the client.

### 3. Remove from history

For private repositories, history rewrite is optional but recommended.
For public repositories with a credential older than 1 hour, history
rewrite is effectively pointless (the credential is already on clones); the
primary response is rotation.

History rewrite commands:

```bash
# Preferred for single-file removal
git filter-repo --path .env --invert-paths

# For a specific string across all history
git filter-repo --replace-text <(echo 'SECRET_STRING==>REDACTED')

# Force push after rewrite (coordinate with collaborators)
git push --force-with-lease origin --all
git push --force-with-lease origin --tags
```

`git filter-repo` is preferred over `git filter-branch`. Never use BFG
Repo-Cleaner for engine projects without a review.

### 4. Notify

- If a client credential was exposed, notify the client within 24 hours.
- If a user credential or PII was exposed, follow the jurisdiction's breach
  notification obligation (see
  `security-gate/references/compliance-matrix.md`).
- File a `project-log/decisions/<date>-secret-rotation-<name>.md` entry.

### 5. Prevent recurrence

- Add a pre-commit hook that runs `scripts/scan-secrets.sh` on staged files.
- Move the secret to the engine's secret management (GitHub Actions secrets,
  Doppler, 1Password CLI, or equivalent).
- Add the filename pattern to `.gitignore`.

## Pre-commit Hook

```bash
#!/usr/bin/env bash
# .git/hooks/pre-commit
set -e
bash .claude/skills/scripts/scan-secrets.sh --staged
```

Commit the hook installer to the repo so all operators share the same
protection. `scripts/install-hooks.sh` (optional) symlinks the hook.

## Detector Posture

`scripts/scan-secrets.sh` uses a curated rule set. It should catch at
minimum:

- AWS access keys (`AKIA[0-9A-Z]{16}`)
- GCP service-account JSON (`-----BEGIN PRIVATE KEY-----` inside a JSON)
- Stripe keys (`sk_live_[A-Za-z0-9]{24}`)
- Generic high-entropy strings in `.env` files
- Private key headers (`-----BEGIN RSA PRIVATE KEY-----`,
  `-----BEGIN OPENSSH PRIVATE KEY-----`, `-----BEGIN EC PRIVATE KEY-----`)

False positives can be annotated with `# scan-secrets:ignore` at the end
of the line; each ignore is reviewed quarterly.

## Reading

- GitHub Secret Scanning docs
- `policy-pages/references/incident-response.md` — jurisdiction-specific
  breach notification
- `security-gate/references/compliance-matrix.md` — breach SLA per
  jurisdiction.
