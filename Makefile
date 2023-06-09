.ONESHELL:

# for local development and testing

format:
	python -m black src/

flake8:
	python -m flake8 src/

clean:
	rm -rf .pytest_cache
	rm -rf src/.pytest_cache

venv:
	virtualenv venv
	source venv/Scripts/activate
	pip install -r requirements.txt

requirements:
	pip install -r requirements.txt
	

runserver: venv/
	venv/Scripts/python src/manage.py runserver 0.0.0.0:8000

docker/runserver:
	python src/manage.py runserver 0.0.0.0:8000

secret: venv/
	source venv/Scripts/activate
	python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"

migrate: venv/
	source venv/Scripts/activate
	venv/Scripts/python src/manage.py migrate

docker/migrate:
	python src/manage.py migrate

migrations: venv/
	source venv/Scripts/activate
	venv/Scripts/python src/manage.py makemigrations

docker/migrations:
	python src/manage.py makemigrations

.PHONY: format
.PHONY: flake8
.PHONY: clean
.PHONY: venv
.PHONY: runserver
.PHONY: migrate
.PHONY: migrations
.PHONY: requirements
.PHONY: docker/runserver
.PHONY: docker/migrate
.PHONY: docker/migrations