# Utilise l'image de base officielle d'Apache avec PHP
FROM php:7.4-apache

# Installe Composer
RUN apt-get update && apt-get install -y \
    unzip \
    && docker-php-ext-install pdo_mysql

# Installe Composer globalement
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copie les fichiers de l'application dans le répertoire approprié
COPY ./html /var/www/html

# Définir le répertoire de travail
WORKDIR /var/www/html

# Exécuter composer install pour installer les dépendances
RUN composer install

# Expose le port 80
EXPOSE 80
