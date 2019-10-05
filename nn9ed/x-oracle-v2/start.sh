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
su -c 'PORT=8000 SERVER=http://x-oracle-v2.nn9ed.ka0labs.org FLAG=nn9ed{css_fallback_rulez} nodejs main.js' xss
