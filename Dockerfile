# parent image
FROM eboost/php7fpm

WORKDIR /var/www/

# copy content
ADD app/ /var/www/app
ADD web /var/www/web
ADD bin /var/www/bin
ADD vendor /var/www/vendor
ADD src /var/www/src
ADD var /var/www/var
RUN chmod u+x /var/www/bin/console
# Make port 80 available to the world outside this container
EXPOSE 80
