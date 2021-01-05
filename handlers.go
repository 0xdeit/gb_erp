package main

import (
	"encoding/json"
	"fmt"
	"net/http"
)

type Article struct {
	Brand string `json:"brand"`
	Name  string `json:"article_name"`
	Consumable bool `json:"is_consumable"`
}

func HomeHandler(w http.ResponseWriter, r *http.Request) {
	_, _ = fmt.Fprintf(w, "Home endpoint hit.")
}

func ArticlesHandler(w http.ResponseWriter, r *http.Request) {
	var articles []Article

	articles = append(articles, Article{"Wilton", "Cake Mix", true})

	enc := json.NewEncoder(w)
	_ = enc.Encode(&articles)
}
