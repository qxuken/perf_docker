#!/usr/bin/env bash

IMAGE_PREFIX="perf"
BASE_PORT="301"
IMAGES=("go" "rust" "node" "gleam")
DOCKER_IMAGE_NAMES=()
DOCKER_CONTAINER_NAMES=()
DOCKER_CONTAINER_PORTS=()

for index in ${!IMAGES[@]}; do
	DOCKER_IMAGE_NAMES+=("${IMAGE_PREFIX}/${IMAGES[index]}")
	DOCKER_CONTAINER_NAMES+=("${IMAGE_PREFIX}-${IMAGES[index]}")
	DOCKER_CONTAINER_PORTS+=("$BASE_PORT$index")
done

for index in ${!IMAGES[@]}; do
	echo "image ${DOCKER_IMAGE_NAMES[index]} name ${DOCKER_CONTAINER_NAMES[index]} port ${DOCKER_CONTAINER_PORTS[index]}"
done

LOG_DIR="./log"
CURL_LOG="$LOG_DIR/curl.log"
BENCH_LOG="$LOG_DIR/bench.log"

echo "logs dir is $LOG_DIR, curl $CURL_LOG bench $BENCH_LOG"
