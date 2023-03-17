FROM php:5-apache

RUN docker-php-ext-install mysql

RUN sed -i 's#^\(\s*DocumentRoot\)\s.*#\1 /var/www/html#' /etc/apache2/sites-available/000-default.conf

COPY ./upload /var/www/html
RUN chown www-data:www-data -R /var/www/html

EXPOSE 80
