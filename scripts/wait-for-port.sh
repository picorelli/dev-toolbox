#!/usr/bin/env bash
# Wait for a TCP port to become available
HOST="${1:-localhost}"
PORT="${2:?Usage: wait-for-port.sh <port>}"
TIMEOUT="${3:-30}"
elapsed=0
while ! nc -z "$HOST" "$PORT" 2>/dev/null; do
  [ $elapsed -ge $TIMEOUT ] && echo "Timeout waiting for $HOST:$PORT" && exit 1
  sleep 1; elapsed=$((elapsed + 1))
done
echo "$HOST:$PORT is ready (${elapsed}s)"
