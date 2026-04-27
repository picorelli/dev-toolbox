#!/usr/bin/env bash
# Verify required tools are installed and show versions

tools=(git node npm yarn docker gh jq curl)

echo "Tool versions:"
echo "---"

for tool in "${tools[@]}"; do
  if command -v "$tool" &>/dev/null; then
    version=$("$tool" --version 2>&1 | head -1)
    printf "%-10s %s\n" "$tool" "$version"
  else
    printf "%-10s %s\n" "$tool" "NOT FOUND"
  fi
done
