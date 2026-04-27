#!/usr/bin/env bash
# Show your commits from the last working day across all local repos

SINCE="${1:-yesterday}"
AUTHOR=$(git config user.email)

echo "Commits by $AUTHOR since $SINCE:"
echo "---"

git log \
  --all \
  --since="$SINCE" \
  --author="$AUTHOR" \
  --oneline \
  --no-merges \
  --format="%Cgreen%ar%Creset  %s  %Cblue(%h)%Creset"
