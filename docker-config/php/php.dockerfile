FROM php:8.0.12-fpm

RUN apt-get update \
    && docker-php-ext-install pdo_mysql mysqli

COPY . /var/www/public
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
EXPOSE 9000
CMD ["php-fpm"]