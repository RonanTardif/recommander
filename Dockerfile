# Utiliser l'image de base Python
FROM python:3.9-slim-buster

# Mettre à jour les paquets et installer les dépendances nécessaires
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
    liblzma-dev \
    git && \
    rm -rf /var/lib/apt/lists/*

# Installer pyenv
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH

RUN curl https://pyenv.run | bash

# Ajouter pyenv à PATH
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# Installer Python avec pyenv
RUN pyenv install 3.9.7
RUN pyenv global 3.9.7

# Mettre à jour pip et installer les dépendances
RUN pip install --upgrade pip

# Copier le code dans le conteneur
WORKDIR /app
COPY . /app

# Installer les dépendances avec Poetry
RUN pip install poetry
RUN poetry config virtualenvs.create false \
    && poetry install --no-dev --no-interaction --no-ansi

# Exposer le port de l'application
EXPOSE 5000

# Définir la commande par défaut
CMD ["poetry", "run", "flask", "run", "--host=0.0.0.0"]
