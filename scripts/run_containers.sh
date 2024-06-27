#!/usr/bin/env bash

for docker_image_name in ${DOCKER_IMAGE_NAMES[@]}; do
	echo "Checking $docker_image_name"
	docker_image_id="$(docker images -q ${docker_image_name} 2>/dev/null)"
	if [ -z "$docker_image_id" ]; then
		echo "Image with name $docker_image_name does not exists, exiting..." >&2
		exit 69
	fi
done

for index in ${!IMAGES[@]}; do
	echo "Starting ${DOCKER_IMAGE_NAMES[index]}"
	docker run -d -p "${DOCKER_CONTAINER_PORTS[index]}:3000" --name "${DOCKER_CONTAINER_NAMES[index]}" ${DOCKER_IMAGE_NAMES[index]}
done
