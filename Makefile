include .envrc 

MIGRATIONS_PATH = ./cmd/migrate/migrations

.PHONY: migrate-create 
migration: 
	@migrate create -seq -ext sql -dir $(MIGRATIONS_PATH) $(filter-out $@,$(MAKECMDGOALS))

.PHONY: migrate-up 
migration: 
	@migrate -path=$(MIGRATIONS_PATH) -database=$(DATABASE_URL) up

.PHONY: migrate-down 
migration: 
	@migrate -path=$(MIGRATIONS_PATH) -database=$(DATABASE_URL) down $(filter-out $@,$(MAKECMDGOALS))