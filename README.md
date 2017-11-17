# Impono Tag Manager

This project is based on seventag, when it was open source. Our goal is to make
Impono Taga Manager the best open source tag manager available.

## How to install Impono
For now this, is just for development.
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
