FROM php:8.2-apache
 
RUN docker-php-ext-install mysqli
 

RUN sed -i 's/Listen 80$/Listen 8080/' /etc/apache2/ports.conf \
 && sed -i 's/<VirtualHost \*:80>/<VirtualHost *:8080>/' /etc/apache2/sites-available/000-default.conf \
 && a2enmod rewrite
 
WORKDIR /var/www/html
COPY --chown=www-data:www-data . /var/www/html/
 

RUN mkdir -p /var/run/apache2 /var/lock/apache2 /var/log/apache2 \
 && chown -R www-data:www-data /var/run/apache2 /var/lock/apache2 /var/log/apache2
 
USER www-data
EXPOSE 8080
CMD ["apache2-foreground"]
 