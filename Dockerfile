# Utilise l'image officielle PHP avec Apache.
FROM php:8.2-apache

# Active mod_rewrite pour les routes REST
RUN a2enmod rewrite

# Copie tout le code source dans le dossier web du conteneur
COPY . /var/www/html/

# Change le dossier de travail
WORKDIR /var/www/html/

# Installe les dépendances PHP avec Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer install

# Expose le port (Railway utilisera PORT en variable d'env)
EXPOSE 8080
