#!/usr/bin/env bash

# wrapper for cron (optional)
# /usr/local/bin/docker-watch-cron.sh

# CONTAINER: Container name to watch.
# DIR: Path to container compose file

export CONTAINER="site-scams-encyapps-com"
export DIR="/mnt/docker/site-scams-encyapps-com"


status=$(docker inspect -f '{{.State.Status}}' "$CONTAINER" 2>/dev/null || true)

echo -e "\n Status of ${CONTAINER}: ${status}\n"

case "$status" in
    running|restarting)   # up or starting → nothing to do
        exit 0
        ;;
    *)  # any other state → down/up cycle
        echo "$(date '+%Y-%m-%d %H:%M:%S') – $CONTAINER status: $status – restarting stack"
        cd "$DIR"

        # Bring the stack down
        docker compose down

        # Verify the container is no longer listed as running
        # (max 30 seconds, polling every second)
        for i in {1..30}; do
            if ! docker ps -q -f "name=$CONTAINER" > /dev/null; then
                break
            fi
            sleep 1
        done

        # One‑second pause as requested
        sleep 1

        # Bring the stack back up in detached mode
        docker compose up -d
        ;;
esac
