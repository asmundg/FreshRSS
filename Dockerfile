FROM php:5-apache

RUN apt-get update \
    && apt-get install -y zlib1g-dev \
    && docker-php-ext-install mbstring pdo_mysql zip \
    && rm -r /var/www/html && ln -sf /var/www/p /var/www/html

COPY . /var/www
COPY php.ini /usr/local/etc/php/
RUN chown -R www-data /var/www/data

VOLUME ["/var/www/data"]
