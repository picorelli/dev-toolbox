#!/usr/bin/env bash
# Remove stopped containers, dangling images, unused networks and volumes

set -euo pipefail

echo "Stopping all running containers..."
docker ps -q | xargs -r docker stop

echo "Removing stopped containers..."
docker container prune -f

echo "Removing dangling images..."
docker image prune -f

echo "Removing unused networks..."
docker network prune -f

echo "Removing unused volumes..."
docker volume prune -f

echo ""
docker system df
