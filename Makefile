COMPOSE_FILE = ./srcs/docker-compose.yml
build:
	docker compose -f $(COMPOSE_FILE) build
up:
	docker compose -f $(COMPOSE_FILE) up -d --build

clean:
	docker compose -f $(COMPOSE_FILE) down

fclean:
	docker compose -f $(COMPOSE_FILE) down -v --rmi all
	rm -rf ./data/sql_volume/*
	rm -rf ./data/wordpress_volume/*