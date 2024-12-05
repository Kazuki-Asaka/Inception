COMPOSE_FILE = ./srcs/docker-compose.yml
up:
	docker compose -f $(COMPOSE_FILE) up -d --build

clean:
	docker compose -f $(COMPOSE_FILE) down

fclean:
	docker compose -f $(COMPOSE_FILE) down -v --rmi all
