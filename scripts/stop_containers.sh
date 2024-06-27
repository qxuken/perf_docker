#!/usr/bin/env bash

echo "Stopping ${DOCKER_CONTAINERS_NAMES[@]}"
docker stop "${DOCKER_CONTAINER_NAMES[@]}"
echo "Removing ${DOCKER_CONTAINERS_NAMES[@]}"
docker rm "${DOCKER_CONTAINER_NAMES[@]}"
