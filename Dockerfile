# Utiliser une image officielle de Python
FROM python:3.11

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier des dépendances
COPY requirements.txt requirements.txt

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du projet
COPY . .

# Exposer le port 8000
EXPOSE 8000

# Commande par défaut pour exécuter le serveur Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

