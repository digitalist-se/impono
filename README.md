# Impono - Open Source Tag Manager

This project is based on SevenTag, when it was open source, from a backup done by tsteur.

Our goal is to make Impono Tag Manager the best open source tag manager available.
Development is supported by [Digitalist](https://digitalist.se/).

Impono uses Symfony, and a bunch of JavaScript frameworks and libraries - like Angular, Gulp, Bower etc.

(Documentation on the UI)[https://impono.org/how_to_use.html]

## How to install Impono with Vagrant
```
vagrant up`
nvm use (local)
yarn install (local) [you need yarn installed for this - you could also use npm install]
gulp build (local)
composer install (inside box)
bin/console a:i (inside box)
```

In browser: http://impono.test/install.php and follow instructions.

## How to install Impono with test user and data

Follow the inctructions to install with Vagrant, ssh into box, go to `/var/www/web` then:
```bin/console doctrine:fixtures:load```

Example user is user1@example.com and password istesting

## How to install in production.
We recomend that you use the offical docker image at [Docker Hub](https://hub.docker.com/r/digitalist/impono/).


### Docker compose example:

### Updating in production example:
```
docker-compose stop
docker-compose pull
docker volume prune -f
docker-compose up --force-recreate -d
docker exec -it application_app_1 composer bin/console a:i

docker cp copy/parameters.yml application_app_1:/var/www/app/config/parameters.yml
docker exec -it application_app_1 bin/console impono:republish -f
docker exec -it application_app_1 bin/console c:c
docker exec -it application_app_1 bin/console c:w
docker exec -it application_app_1 chmod 777 -R var
```

You could also use the code repo and add your settings to parameters.yml.

Impono follow the normal Symfony install procedure, see [Symfony documentation](https://symfony.com/doc/3.4/deployment.html).

## Problem with install?
If having problem with phantomjs not in PATH, try this:
```
sudo wget  https://github.com/Medium/phantomjs/releases/download/v1.9.19/phantomjs-1.9.8-linux-x86_64.tar.bz2
sudo tar xvjf phantomjs-1.9.8-linux-x86_64.tar.bz2 -C /usr/local/share/
sudo ln -s /usr/local/share/phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/
```

## Documentation
Documentation site is coming, for now see [api.html](..doc/api.html) in doc folder.

## Technology stack
PHP 7.1
MariaDB
Apache 2

## License
- Free Software Foundation’s [GNU AGPL, Version 3](LICENSE).


## API examples

### Example login
With an existing integration user

```
curl -X POST -d "client_id=12_5qpf73hq93swccow0844gko0g04g40s8soc0ssckoco4c0s0cc&client_secret=5rpg2t9bszs4g4o44gksgw8ggc8coo8408s080ko8kcgcwcggs&grant_type=client_credentials" http://impono.test/api/oauth/v2/token
```

or with JSON

```
curl -X POST -H "Content-Type: application/json" -d '{"client_id":"12_1n8epty5f9dwgo00048ggocksk0ogsogkw84w4c00w8w8080cs" , "client_secret":"4mko84fwz6gw8wc0sgc0sks8kksw480c4sw4g88wos4ggsksgw", "grant_type" : "client_credentials"}' http://impono.test/api/oauth/v2/token

```

Getting back:
```
{"access_token":"NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw","expires_in":3600,"token_type":"bearer","scope":"user"}%   
```

With this my Authorization: Bearer is `NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw` and I should use that to authorize requests.

### Example call

```
curl --header "Authorization: Bearer NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw" http://impono.test/api/containers
```

Getting back:

```
{"data":[{"id":11,"name":"Container name 10","description":"Container description 10","websites":[],"created_at":"2017-11-19T18:25:53+0000","updated_at":"2017-11-19T18:25:54+0000","has_unpublished_changes":true,"published_at":null,"permissions":["view","edit","publish","operator"]}],"total":1}%
```

So with this result - I can see that the user has access to one container, `Container name 10`

### Getting a tag

```
curl -X "GET" --header "Authorization: Bearer NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw" http://impono.test/api/tags/120
```

### Deleting a tag

```
curl -X "DELETE" --header "Authorization: Bearer NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw" http://impono.test/api/tags/120
```

### Info about your user

```
curl -X "GET" --header "Authorization: Bearer NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw" http://impono.test/api/users/me
```

### Logout your user

```
curl -X "GET" --header "Authorization: Bearer NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw" http://impono.test/api/users/me/logout
```
