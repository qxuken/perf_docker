#!/usr/bin/env bash

for index in ${!DOCKER_IMAGE_NAMES[@]}; do
	echo "Building ${DOCKER_IMAGE_NAMES[index]}"
	docker build -t ${DOCKER_IMAGE_NAMES[index]} ./${IMAGES[index]}
done
