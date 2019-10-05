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
su -c 'PORT=80 SERVER=http://x-oracle-v0.nn9ed.ka0labs.org FLAG=nn9ed{y0u_b3tt3r_warmUp_your_w3b_j4king_sk1lls} nodejs main.js' xss
