#!/usr/bin/env bash
set -euo pipefail

echo "[INFO] $(date -Is) - Pruning stopped containers older than 5m/1h"
docker container prune -f --filter "until=5m"

echo "[INFO] $(date -Is) - Pruning unused images older than 5m/24h"
docker image prune -a -f --filter "until=5m"


# En un Swarm grande esto es sensato: system prune limpia varias cosas de golpe (incluye redes/build cache) y Docker lo presenta como una herramienta más “global” (menos granular).
#echo "[INFO] $(date -Is) - Pruning unused networks"
#docker network prune

#echo "[INFO] $(date -Is) - Pruning build cache"
#docker builder prune

#echo "[INFO] $(date -Is) - System prune (no volumes)"
#docker system prune
