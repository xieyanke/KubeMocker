package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		log.Printf("request url: \"%s\" not found\n", r.URL.Path)
		http.NotFound(w, r)
		return
	}

	log.Println("requesting url: /")
	hostName, _ := os.Hostname()
	fmt.Fprintf(w, "Hi, You are visiting host: %s", hostName)
}

func main() {
	servePort := 8080
	http.HandleFunc("/", indexHandler)
	fmt.Printf("KubeMocker starting on port: %d\n", servePort)

	http.ListenAndServe(fmt.Sprintf(":%d", servePort), nil)
}
