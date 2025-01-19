package main

import (
	"log"
	"lx/internal/env"
	"lx/internal/store"
)

func main() {

	store := store.NewStorage(nil)
	cfg := config{
		addr: env.GetString("ADDR", ":8080"),
	}

	app := &application{
		config: cfg,
		store:  store,
	}

	mux := app.mount()
	log.Fatal(app.run(mux))
}
