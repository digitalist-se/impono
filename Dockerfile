# parent image
FROM digitalist/impono-php

WORKDIR /var/www/

# copy and add needed content
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
RUN composer install --no-scripts --no-autoloader --no-interaction -o --no-dev
RUN export SYMFONY_ENV=prod && composer dump-autoload --optimize

RUN chmod +x bin/console
# Make port 80 available to the world outside this container
EXPOSE 80
