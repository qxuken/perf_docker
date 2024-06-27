package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	w.Header().Add("Made-With", "Go")
	w.Header().Add("Connection", "keep-alive")
	w.Header().Add("Keep-Alive", "timeout=5")
	fmt.Fprintf(w, "Hello, world!")
}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":3000", nil))
}
