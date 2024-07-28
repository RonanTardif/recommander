# Dockerfile

# Utiliser une image Python officielle
FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Installer pyenv
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev && \
    curl https://pyenv.run | bash

ENV PATH="/root/.pyenv/bin:/root/.pyenv/shims:${PATH}"

# Installer Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="$HOME/.poetry/bin:$PATH"

# Copier les fichiers de l'application dans le conteneur
COPY . .

# Installer les dépendances
RUN poetry install --no-dev --no-interaction --no-ansi

# Exposer le port utilisé par Flask
EXPOSE 8080

# Démarrer l'application Flask
CMD ["poetry", "run", "python", "src/app.py"]
