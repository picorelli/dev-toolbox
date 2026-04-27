#!/usr/bin/env bash
# Rename the current git branch locally and on remote
OLD=$(git symbolic-ref --short HEAD)
NEW="${1:?Usage: rename-branch.sh <new-name>}"
git branch -m "$OLD" "$NEW"
git push origin ":$OLD" "$NEW"
git branch --set-upstream-to="origin/$NEW" "$NEW"
echo "Renamed $OLD → $NEW"
