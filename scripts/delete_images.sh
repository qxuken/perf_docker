#!/usr/bin/env bash

for docker_image_name in ${DOCKER_IMAGE_NAMES[@]}; do
	echo "Checking $docker_image_name"
	docker_image_id="$(docker images -q ${docker_image_name} 2>/dev/null)"
	if [ -n "$docker_image_id" ]; then
		echo "$docker_image_name exists, cleaning"
		docker image rm $docker_image_id
	fi
done
