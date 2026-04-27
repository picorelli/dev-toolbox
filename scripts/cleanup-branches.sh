#!/usr/bin/env bash
# Delete local branches that have already been merged into main/master

set -euo pipefail

BASE="${1:-main}"

echo "Cleaning up branches merged into '$BASE'..."

git fetch --prune

merged=$(git branch --merged "$BASE" | grep -v "^\*\|$BASE\|master\|main\|dev\|development" || true)

if [ -z "$merged" ]; then
  echo "Nothing to clean up."
  exit 0
fi

echo "Branches to delete:"
echo "$merged"
echo ""
read -rp "Proceed? [y/N] " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  echo "$merged" | xargs git branch -d
  echo "Done."
else
  echo "Aborted."
fi
