build:
	docker compose build
up:
	docker compose up -d

clean:
	docker compose down

fclean:
	docker compose down -v --rmi all
	rm -rf ./data/sql_volume/*
	rm -rf ./data/wordpress_volume/*