nvm use
npm install -g phantomjs
Add PhantomJS to PATH > export PATH="$HOME/.nvm/versions/node/v6.2.2/lib/node_modules/phantomjs/lib/phantom/bin/:$PATH"
npm -g install phantomjs-prebuilt
yarn install

bin/console doctrine:schema:create
bin/console fos:user:create admin --super-admin
mysql -uroot -ppassword impono < oauth/oauth2_client.sql
bin/console c:c
bin/console c:w
