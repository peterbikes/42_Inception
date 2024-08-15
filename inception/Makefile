all: check_env
	sudo sed -i '1s/localhost/psotto-m.42.fr/' /etc/hosts
	mkdir -p /home/psotto-m/data/mariadb /home/psotto-m/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

up: check_env
	docker compose -f ./srcs/docker-compose.yml up -d
 
down:
	sudo clear
	docker compose -f ./srcs/docker-compose.yml down
 
rebuild: check_env
	docker compose -f srcs/docker-compose.yml build --no-cache

fclean:
	sudo sed -i '0,/psotto-m.42.fr/s//localhost/' /etc/hosts
	@if [ -n "$$(docker ps -q)" ]; then \
        docker stop $$(docker ps -q); \
    fi
	sudo rm -rf ~/data
	docker system prune -a --volumes -f

check_env:
	@if [ ! -f ./srcs/.env ]; then \
		echo "Error: env file not found. Exiting."; \
        exit 1; \
    fi

