# Impono Tag Manager

This project is based on seventag, when it was open source. Our goal is to make
Impono Taga Manager the best open source tag manager available.

## How to install Impono
For now this, is just for development.
`vagrant up`
`nvm use`
`ant build`
`gulp build`

edit `app/config/parameters.yml`:

```
parameters:
  database_driver: pdo_mysql
  database_host: 127.0.0.1
  database_port: null
  database_name: <database_name>
  database_user: <user>
  database_password: <password>
```

Create database schema:

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
