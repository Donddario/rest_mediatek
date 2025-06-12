# Utilise l'image officielle PHP avec Apache
FROM php:8.2-apache

# Active mod_rewrite pour les routes REST
RUN a2enmod rewrite

# Installe les extensions nécessaires pour Composer
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    zip \
    libzip-dev \
    && docker-php-ext-install zip

# Copie tout le code source dans le dossier web du conteneur
COPY . /var/www/html/

# Change le dossier de travail
WORKDIR /var/www/html/

# Installe Composer depuis l’image officielle
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Installe les dépendances PHP
RUN composer install

# Expose le port
EXPOSE 8080
