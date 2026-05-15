#!/bin/bash
# Run this script from the compose-rich-editor directory.
# It will:
#   1. Authenticate with GitHub (opens browser)
#   2. Fork the repo under your account
#   3. Push the fix branch

set -e

echo "=== Step 1: Authenticate with GitHub ==="
gh auth login --web --git-protocol https

echo ""
echo "=== Step 2: Fork the repo ==="
gh repo fork --remote=true

echo ""
echo "=== Step 3: Push the fix branch ==="
git push fork fix/clamping-offset-mapping

echo ""
echo "=== Done! ==="
FORK_URL=$(gh repo view --json url -q .url 2>/dev/null || git remote get-url fork)
echo "Your fork: $FORK_URL"
echo "Branch: fix/clamping-offset-mapping"
echo ""
echo "Now update your project's libs.versions.toml to use your fork via JitPack."
echo "See instructions in the terminal output."

