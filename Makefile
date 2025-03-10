# Variables
PYTHON = python
VENV = venv
MANAGE = $(VENV)/bin/python manage.py

# Installation
install:
	@echo "📦 Installation des dépendances..."
	python -m venv $(VENV)
	$(VENV)/bin/pip install -r requirements.txt

# Lancer le serveur
run:
	@echo "🚀 Démarrage du serveur Django..."
	$(MANAGE) runserver 0.0.0.0:8000

# Appliquer les migrations
migrate:
	@echo "🔄 Application des migrations..."
	$(MANAGE) migrate

# Créer une migration
makemigrations:
	@echo "📜 Création des migrations..."
	$(MANAGE) makemigrations

# Lancer les tests avec pytest et coverage
test:
	@echo "🧪 Lancement des tests avec pytest..."
	$(VENV)/bin/pytest --cov=config --cov-report=term-missing

# Lancer un shell Django
shell:
	@echo "🐍 Ouverture du shell Django..."
	$(MANAGE) shell

# Vérifier les erreurs avec flake8
lint:
	@echo "🔍 Vérification du code avec flake8..."
	$(VENV)/bin/flake8 app config

# Formater le code avec black
format:
	@echo "🎨 Formatage du code avec Black..."
	$(VENV)/bin/black app config

# Nettoyer les fichiers inutiles
clean:
	@echo "🧹 Nettoyage des fichiers inutiles..."
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf coverage.xml

# Exécuter Docker Compose
docker-up:
	@echo "🐳 Lancement des services Docker..."
	docker compose up -d

docker-down:
	@echo "🛑 Arrêt des services Docker..."
	docker compose down
