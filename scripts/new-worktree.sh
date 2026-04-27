#!/usr/bin/env bash
# Quickly create a git worktree for a new feature branch

set -euo pipefail

TICKET="${1:?Usage: new-worktree.sh <ticket> [base-branch]}"
BASE="${2:-$(git symbolic-ref --short HEAD)}"
REPO=$(basename "$(git rev-parse --show-toplevel)")
WORKTREE_PATH="$HOME/worktrees/$REPO/$TICKET"

git fetch origin

git worktree add "$WORKTREE_PATH" -b "feature/$TICKET" "origin/$BASE"

echo "Worktree ready at: $WORKTREE_PATH"
echo "cd $WORKTREE_PATH"
