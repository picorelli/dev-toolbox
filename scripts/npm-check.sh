#!/usr/bin/env bash
# List outdated packages across all workspaces in a monorepo

set -euo pipefail

ROOT=$(git rev-parse --show-toplevel)

echo "Checking outdated packages in: $ROOT"
echo "---"

find "$ROOT" -name "package.json" \
  -not -path "*/node_modules/*" \
  -not -path "*/.git/*" \
  | while read -r pkg; do
    dir=$(dirname "$pkg")
    name=$(jq -r '.name // "unknown"' "$pkg")
    echo ""
    echo "📦 $name ($dir)"
    (cd "$dir" && npm outdated --depth=0 2>/dev/null || true)
  done
