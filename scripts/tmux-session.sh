#!/usr/bin/env bash
# Create or attach to a named tmux session with a standard layout

SESSION="${1:?Usage: tmux-session.sh <session-name>}"

if tmux has-session -t "$SESSION" 2>/dev/null; then
  echo "Attaching to existing session: $SESSION"
  tmux attach-session -t "$SESSION"
  exit 0
fi

tmux new-session -d -s "$SESSION" -n "editor"
tmux new-window -t "$SESSION" -n "server"
tmux new-window -t "$SESSION" -n "shell"
tmux select-window -t "$SESSION:editor"

echo "Created session: $SESSION"
tmux attach-session -t "$SESSION"
