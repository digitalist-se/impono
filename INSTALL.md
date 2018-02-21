# Install for dev.

## Requirements
* node.js
* nvm.sh (https://github.com/creationix/nvm)
* php 7.0 or above
* yarn (https://yarnpkg.com/lang/en/docs/install/)

## Installing
Working locally with the Vagrantbox, you preferably run the part to the console commands outside the box, and the rest must be done inside the box.

* `nvm use`
* `npm install -g phantomjs`
* Add PhantomJS to PATH:
* `export PATH="$HOME/.nvm/versions/node/v6.9.5/lib/node_modules/phantomjs/lib/phantom/bin/:$PATH"`
* `npm -g install phantomjs-prebuilt`
* `yarn install`
* `bin/console doctrine:schema:create`
* `bin/console fos:user:create admin --super-admin`
* `mysql -uroot -ppassword impono_db < oauth/oauth2_client.sql`
* `bin/console c:c`
* `bin/console c:w`
