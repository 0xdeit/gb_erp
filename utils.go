package main

import (
	"fmt"
	"github.com/joho/godotenv"
	"log"
	"os"
)

func DatabaseConnectionString(filename string) string {
	err := godotenv.Load(filename)

	if err != nil {
		log.Fatal("Error loading .env file")
	}

	dbuser := os.Getenv("POSTGRES_USER")
	dbpass := os.Getenv("POSTGRES_PASSWORD")
	dbname := os.Getenv("POSTGRES_DB")
	dbhost := os.Getenv("POSTGRES_HOST")
	dbport := os.Getenv("POSTGRES_PORT")

	return fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=disable", dbuser, dbpass, dbhost, dbport, dbname)
}
