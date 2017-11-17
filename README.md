# Impono Tag Manager

This project is based on seventag, when it was open source. Our goal is to make
Impono Tag Manager the best open source tag manager available.

## Stable?
Not at all. We do use it for testing right now. Because of deleted documentation 
by the company that did 7tag, many things are unknown. API is needed to be 
documented. And so on. But. We are using release 0.0.5 right now for production
use. So it do work. But there are many unknowns unknown.

## How to install Impono with Vagrant

`vagrant up`
`nvm use`
`npm install` or `yarn install`
`gulp build`
`composer install`

In composer install the settings for the project is added in `app/config/parameters.yml` 
- this could be needed to be edited later if you added wrong details.

Settings you should provide for the parameters are (this is for the vagrant box):

```
    database_host: 127.0.0.1
    database_name: tag_manager_admin
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

