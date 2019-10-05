#!/usr/bin/env bash

# start db
service mysql start

# initialize db
newUser='xss'
newDbPassword='secretpassword'
newDb='xss'
host='%'
commands="CREATE DATABASE \`${newDb}\`;CREATE USER '${newUser}'@'${host}' IDENTIFIED BY '${newDbPassword}';GRANT USAGE ON *.* TO '${newUser}'@'${host}' IDENTIFIED BY '${newDbPassword}';GRANT SELECT,INSERT,UPDATE,CREATE ON \`${newDb}\`.*
TO '${newUser}'@'${host}';FLUSH PRIVILEGES;"
echo "${commands}" | mysql

# run service
setcap 'cap_net_bind_service=+ep' `readlink -f \`which node\``
cd /home/xss/www
su -c 'PORT=80 SERVER=http://x-oracle-v1.nn9ed.ka0labs.org FLAG=nn9ed{t1ming_att4cks_ar3_th3_best_att4cks} nodejs main.js' xss
