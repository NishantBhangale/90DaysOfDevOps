package main

import (
	"fmt"
	"log"
	"net/http"
)

// handler handles incoming web requests and replies with a message
func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello! You have successfully built a Go web app.")
}

func main() {
	// Route requests to the root URL (/) to our handler function
	http.HandleFunc("/", handler)

	log.Println("Starting server on port 8080...")
	
	// Start the web server on port 8080
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}

