COMPOSE_FILE = ./srcs/docker-compose.yml

all: up

up:
	docker compose -f $(COMPOSE_FILE) up -d --build

clean:
	docker compose -f $(COMPOSE_FILE) down

fclean:
	docker compose -f $(COMPOSE_FILE) down -v --rmi all
