.PHONY: install
install:
	@echo "📦 Installation des dépendances..."
	python -m pip install -r requirements.txt

.PHONY: run
run:
	@echo "🚀 Démarrage du serveur Django..."
	python manage.py runserver 0.0.0.0:8000

.PHONY: migrate
migrate:
	@echo "🔄 Application des migrations..."
	python manage migrate

.PHONY: makemigrations
makemigrations:
	@echo "📜 Création des migrations..."
	python manage.py makemigrations

.PHONY: test
test:
	@echo "🧪 Lancement des tests avec pytest..."
	pytest tests --cov=config --cov-report=term-missing

.PHONY: shell
shell:
	@echo "🐍 Ouverture du shell Django..."
	python manage.py shell

.PHONY: clean
clean:
	@echo "🧹 Nettoyage des fichiers inutiles..."
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf coverage.xml

.PHONY: docker_up
docker_up:
	@echo "🐳 Lancement des services Docker..."
	docker compose up

.PHONY: docker_down
docker_down:
	@echo "🛑 Arrêt des services Docker..."
	docker compose down
