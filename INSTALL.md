
nvm use
npm install -g phantomjs
Add PhantomJS to PATH > export PATH="$HOME/.nvm/versions/node/v6.2.2/lib/node_modules/phantomjs/lib/phantom/bin/:$PATH"
npm -g install phantomjs-prebuilt

yarn install
gulp build
composer install


ld frontend:

gulp build


This command builds whole application including backend and frontend. In next step create database and edit app/config/parameters.yml:

parameters:
  database_driver: pdo_mysql
  database_host: 127.0.0.1
  database_port: null
  database_name: <database_name>
  database_user: <user>
  database_password: <password>

##Create database schema:

bin/console doctrine:schema:create
At the end load data fixtures in order to work on prepared data examples.

php bin/console doctrine:fixtures:load
Data fixtures provides default user with following credentials:

login: user@example.com
password: testing
	
