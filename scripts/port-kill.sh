#!/usr/bin/env bash
# Kill whatever process is listening on a given port

PORT="${1:?Usage: port-kill.sh <port>}"

PID=$(lsof -ti tcp:"$PORT")

if [ -z "$PID" ]; then
  echo "Nothing listening on port $PORT."
  exit 0
fi

echo "Killing PID $PID on port $PORT..."
kill -9 "$PID"
echo "Done."
