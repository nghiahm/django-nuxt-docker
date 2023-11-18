.SILENT: # hidden output command

COMPOSE = docker compose -f docker-compose.dev.yml

destroy:
	@$(COMPOSE) down --rmi all --volumes --remove-orphans

build:
	@$(COMPOSE) build ${cmd}

remove:
	@make destroy
	docker system prune -a

start:
	@$(COMPOSE) up -d

stop:
	@$(COMPOSE) down

logs:
	@$(COMPOSE) logs -f $(cmd)

migrate:
	@$(COMPOSE) run --rm app python manage.py migrate

makemigrations:
	@$(COMPOSE) run --rm app python manage.py makemigrations ${cmd}

collectstatic:
	@$(COMPOSE) run --rm app python manage.py collectstatic --no-input

createsuperuser:
	@$(COMPOSE) run --rm app python manage.py createsuperuser

flush:
	@$(COMPOSE) run --rm app python manage.py flush --no-input

poetry_add:
	@$(COMPOSE) run --rm app poetry add ${cmd}

startapp:
	@$(COMPOSE) run --rm app python manage.py startapp ${cmd}

# npm_install:
# 	@$(COMPOSE) exec web npm install ${cmd}

run_app:
	@$(COMPOSE) run --rm app ${cmd}

run_web:
	@$(COMPOSE) run --rm web ${cmd}

exec_app:
	@$(COMPOSE) exec -it app bash

exec_web:
	@$(COMPOSE) exec -it web sh
