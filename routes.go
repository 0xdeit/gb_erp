package main

import (
	"fmt"

	"github.com/gorilla/mux"
)

func SetupRoutes(router *mux.Router){
	fmt.Println("Setting up routes...")
	router.HandleFunc("/api", HomeHandler).Methods("GET")
	router.HandleFunc("/api/articles", ArticlesHandler).Methods("GET")
	fmt.Println("routes have been setup...")
}

