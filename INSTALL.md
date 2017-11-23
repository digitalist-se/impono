nvm use
npm install -g phantomjs
Add PhantomJS to PATH > export PATH="$HOME/.nvm/versions/node/v6.2.2/lib/node_modules/phantomjs/lib/phantom/bin/:$PATH"
npm -g install phantomjs-prebuilt
yarn install

bin/console doctrine:schema:create
bin/console fos:user:create admin --super-admin
mysql -uroot -ppassword impono < ../oauth/oauth2_client.sql
```
INSERT INTO `oauth2_client` VALUES (NULL, NULL, '3bcbxd9e24g0gk4swg0kwgcwg4o8k8g4g888kwc44gcc0gwwk4', 'a:0:{}', '4ok2x70rlfokc8g0wws8c8kwcokw80k44sg48goc0ok4w0so0k', 'a:2:{i:0;s:8:\"password\";i:1;s:13:\"refresh_token\"}', '', '', 'client', NULL);
```
bin/console c:c
bin/console c:w
