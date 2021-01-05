package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	fmt.Println("Running API server on port 8088...")
	var rtr *mux.Router = mux.NewRouter()
	SetupRoutes(rtr)
	log.Fatal(http.ListenAndServe(":8088", rtr))
}