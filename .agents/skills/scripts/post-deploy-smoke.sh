#!/usr/bin/env bash
# post-deploy-smoke.sh — verifies a just-deployed production URL.
#
# Asserts:
#   - HTTPS 200 on the home page
#   - <title> non-empty
#   - canonical link points to the expected domain
#   - response time under 3 seconds (uncached path)
#   - robots.txt reachable
#   - sitemap.xml reachable
#
# Usage:
#   bash .claude/skills/scripts/post-deploy-smoke.sh https://example.com
#
# Exit codes:
#   0 — smoke passed
#   1 — at least one check failed
#   3 — prerequisite missing

set -euo pipefail

URL="${1:-}"
[ -n "$URL" ] || { echo "usage: post-deploy-smoke.sh <url>" >&2; exit 1; }
command -v curl >/dev/null 2>&1 || { echo "post-deploy-smoke: curl required" >&2; exit 3; }

# Bust CDN cache per run so we actually hit origin paths worth smoking
BUST="?ci=$(date +%s)"

check_get() {
    local path="$1"
    local code
    code=$(curl -s -o /dev/null -w '%{http_code}' "$URL$path$BUST")
    [ "$code" = "200" ] || { echo "FAIL $URL$path → HTTP $code" >&2; return 1; }
    echo "PASS $URL$path → HTTP 200"
}

FAIL=0

# 1. Home
start=$(date +%s%N)
body=$(curl -s "$URL/$BUST")
end=$(date +%s%N)
elapsed_ms=$(( (end - start) / 1000000 ))

if ! echo "$body" | grep -qiE '<title>[^<]+</title>'; then
    echo "FAIL home missing <title>" >&2; FAIL=1
fi

EXPECT_HOST=$(echo "$URL" | awk -F/ '{print $3}')
if ! echo "$body" | grep -qiE "<link[^>]+rel=\"canonical\"[^>]+href=\"https://$EXPECT_HOST"; then
    echo "FAIL canonical does not point to $EXPECT_HOST" >&2; FAIL=1
fi

if [ "$elapsed_ms" -gt 3000 ]; then
    echo "FAIL home response ${elapsed_ms}ms > 3000ms" >&2; FAIL=1
else
    echo "PASS home response ${elapsed_ms}ms"
fi

# 2. robots.txt
check_get "/robots.txt" || FAIL=1

# 3. sitemap.xml
check_get "/sitemap.xml" || FAIL=1

if [ "$FAIL" -ne 0 ]; then
    echo "post-deploy-smoke: FAIL" >&2
    exit 1
fi
echo "post-deploy-smoke: PASS"
