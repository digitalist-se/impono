# Installing Impono with Docker.

Impono docker image uses the image impono-php as a base, the image is located here:
https://gitlab.wklive.net/wk-public/impono-php

Build the impono-php image with (git clone the repo and be in repo root)

``` 
docker build -t impono-php

```

When done with that, build the impono docker image (in impono repo root)

``` 
docker build -t impono

```

## Start the containers


`docker-compose up -d`

Create database

`docker exec -it impono_db_1 mysqladmin -uroot -ppassword create impono_db`

Run composer tasks for impono

`docker exec -it impono_app_1 composer install --no-dev`

## Start the web installer
Go to url http://localhost/install.php (or whatever domain you are using)
Follow instructions.

To add the config in the last step to the parameters.yml file in the impono image:

``` 
docker exec -it impono_app_1 bash
nano /var/www/config/app/parameters.yml

```

Or add the same changes on host in `docker-config/parameters.yml`

Then you should be able to login.


## Problems
If you have problem logging and just get "Containers" and a loading wheel, normally you auth token were not set 
correctly because of cache issue - delete auth_token from the browser, or start new browser session and run:

`docker exec -it impono_app_1 chmod 777 -R var/cache/prod`



## Useful docker commands

### build image
```docker build -t impono .```
### list running images
```docker ps```
### list images
```docker images```
### start image publish to prot 4000
```docker run --name impono -p 4000:80 impono```
### get into conatiner
```docker exec -i -t impono /bin/bash```
### remove all conatiners
```docker rm $(docker ps -a -q)```
### remove all images
```docker rmi $(docker images -q)```
### list docker volums
```docker volume ls```
### inspect
```docker volume inspect <volume>```
### clean docker images, networks, volumes
```docker system prune```


volumes should be are at /var/lib/docker/volumes/
