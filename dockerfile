FROM php:5-apache

RUN docker-php-ext-install mysql

RUN sed -i 's#^\(\s*DocumentRoot\)\s.*#\1 /var/www/html#' /etc/apache2/sites-available/000-default.conf

COPY ./upload /var/www/html
RUN chown www-data:www-data -R /var/www/html

VOLUME /var/www/html/config
VOLUME /var/www/html/data/cache

COPY ./init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh

CMD /tmp/init.sh
EXPOSE 80
