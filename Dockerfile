# parent image
FROM impono-php


WORKDIR /var/www/

# copy and add needed content
COPY oauth/oauth2_client.sql /var/www/oauth2_client.sql
COPY composer.json ./
COPY composer.lock ./
COPY app app
COPY docker-config/parameters.yml app/config/parameters.yml
COPY docker-config/config_install.yml app/config/config_install.yml
COPY web html
RUN ln -s html web
RUN mkdir bin
COPY bin/console bin/console
COPY bin/symfony_requirements bin/symfony_requirements

COPY src src
RUN mkdir -p var/cache
RUN chmod 777 -R ./var
RUN chmod 777 -R ./web/containers
RUN export SYMFONY_ENV=prod
# https://www.sentinelstand.com/article/composer-install-in-dockerfile-without-breaking-cache
RUN composer install --no-scripts --no-autoloader --no-interaction -o --no-dev
RUN export SYMFONY_ENV=prod && composer dump-autoload --optimize
# && \
#RUN export SYMFONY_ENV=prod && composer run-script post-install-cmd

RUN chmod +x bin/console
# Make port 80 available to the world outside this container
EXPOSE 80
