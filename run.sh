#!/usr/bin/env bash

source ./constants.sh

# Setup
source ./scripts/stop_containers.sh
source ./scripts/delete_images.sh
source ./scripts/create_images.sh
source ./scripts/run_containers.sh

# Wait for server to go up
sleep .5

mkdir "$LOG_DIR" 2>/dev/null

truncate -s 0 "$CURL_LOG"
truncate -s 0 "$BENCH_LOG"

source ./scripts/bench.sh

# Cleanup
source ./scripts/stop_containers.sh
source ./scripts/delete_images.sh
