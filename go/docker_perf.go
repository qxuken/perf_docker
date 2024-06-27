package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	w.Header().Add("made-with", "go")
	fmt.Fprintf(w, "Hello, world!")
}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":3000", nil))
}

// Running 5s test @ http://localhost:3000
//   80 goroutine(s) running concurrently
// 546554 requests in 4.789773521s, 66.72MB read
// Requests/sec:		114108.53
// Transfer/sec:		13.93MB
// Avg Req Time:		701.086µs
// Fastest Request:	22.709µs
// Slowest Request:	23.01425ms
// Number of Errors:	0
//
// Docker
// Running 5s test @ http://localhost:3012
//   80 goroutine(s) running concurrently
// 243399 requests in 4.970831818s, 29.71MB read
// Requests/sec:		48965.45
// Transfer/sec:		5.98MB
// Avg Req Time:		1.633805ms
// Fastest Request:	92.959µs
// Slowest Request:	36.847125ms
// Number of Errors:	0
// idle: cpu 0, ram 2.85mb, load: cpu 154.5 ram 17.2mb
