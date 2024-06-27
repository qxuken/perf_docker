for index in ${!IMAGES[@]}; do
	echo "${IMAGES[index]}" >>"$CURL_LOG"
	curl -i http://localhost:${DOCKER_CONTAINER_PORTS[index]} >>"$CURL_LOG" 2>>/dev/null
	echo "" >>"$CURL_LOG"
done

for index in ${!IMAGES[@]}; do
	echo "${IMAGES[index]}" >>"$BENCH_LOG"
	go-wrk -c 80 -d 5 "http://localhost:${DOCKER_CONTAINER_PORTS[index]}" >>"$BENCH_LOG"
	echo "" >>"$BENCH_LOG"
	sleep .5
done
