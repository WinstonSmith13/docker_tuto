FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
    unzip \
    && docker-php-ext-install pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./html /var/www/html

WORKDIR /var/www/html

RUN composer install

EXPOSE 80
