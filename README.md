# Impono Tag Manager

This project is based on seventag, when it was open source. Our goal is to make
Impono Tag Manager the best open source tag manager available.

## Stable?
Not at all. We do use it for testing right now. Because of deleted documentation
by the company that did 7tag, many things are unknown. API is needed to be
documented fully (you get most of the API documentation at /api/doc). There are many unknowns unknown.

## How to install Impono with Vagrant

`vagrant up`
`nvm use` (locall)
`npm install` or `yarn install` (local)
`gulp build` (local)
`composer install` (inside box)
`bin/console doctrine:schema:create` (inside box)
`bin/console fos:user:create admin --super-admin` (inside box)
`bin/console c:c`
`bin/console c:w`

Create oauth2 client:

`mysql -uroot -ppassword impono < oauth/oauth2_client.sql`

In composer install the settings for the project is added in `app/config/parameters.yml`
- this could be needed to be edited later if you added wrong details.

Settings you should provide for the parameters are (this is for the vagrant box):

```
    database_host: 127.0.0.1
    database_name: impono
    database_user: root
    database_password: password
    seventag_domain: 'http://impono.dev'

```

The rest of the default settings should be ok.

`vagrant ssh`

Create database schema (standing in in `/srv/www/impono`):

`bin/console doctrine:schema:create`

At the end load data fixtures in order to work on prepared data examples.

`bin/console doctrine:fixtures:load`

Data fixtures provides default user with following credentials:

login: user1@example.com
password: testing


## Documentation

## Technology stack

## License
- Free Software Foundation’s [GNU AGPL, Version 3](LICENSE).


## Using API

API is just now undocumented, but here are some examples.

### Example login
With an existing integration user

```
curl -X POST -d "client_id=12_5qpf73hq93swccow0844gko0g04g40s8soc0ssckoco4c0s0cc&client_secret=5rpg2t9bszs4g4o44gksgw8ggc8coo8408s080ko8kcgcwcggs&grant_type=client_credentials" http://impono.dev/api/oauth/v2/token
```

or with JSON

```
curl -X POST -H "Content-Type: application/json" -d '{"client_id":"12_1n8epty5f9dwgo00048ggocksk0ogsogkw84w4c00w8w8080cs" , "client_secret":"4mko84fwz6gw8wc0sgc0sks8kksw480c4sw4g88wos4ggsksgw", "grant_type" : "client_credentials"}' http://impono.dev/api/oauth/v2/token

```

Getting back:
```
{"access_token":"NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw","expires_in":3600,"token_type":"bearer","scope":"user"}%   
```

With this my Authorization: Bearer is `NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw` and I should use that to authorize requests.

### Example call

```
curl --header "Authorization: Bearer NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw" http://impono.dev/api/containers
```

Getting back:

```
{"data":[{"id":11,"name":"Container name 10","description":"Container description 10","websites":[],"created_at":"2017-11-19T18:25:53+0000","updated_at":"2017-11-19T18:25:54+0000","has_unpublished_changes":true,"published_at":null,"permissions":["view","edit","publish","operator"]}],"total":1}%
```

So with this result - I can see that the user has access to one container, `Container name 10`

### Getting a tag

```
curl -X "GET" --header "Authorization: Bearer NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw" http://impono.dev/api/tags/120
```

### Deleting a tag

```
curl -X "DELETE" --header "Authorization: Bearer NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw" http://impono.dev/api/tags/120
```

### Info about your user

```
curl -X "GET" --header "Authorization: Bearer NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw" http://impono.dev/api/users/me
```

### Logout your user

```
curl -X "GET" --header "Authorization: Bearer NTY5OWM2OTBjYzdmOWQwMTFjZTQwZmYwZWU1Y2U5NWI1ZTU3MDU3NDI5MmIzYzc0YzY1YTUzMGZiZDdiMTZhYw" http://impono.dev/api/users/me/logout
```
