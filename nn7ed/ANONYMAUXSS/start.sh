#!/bin/bash
service nginx start
cd /home/xss/www
su -c '/home/xss/node-v8.6.0-linux-x64/bin/node main.js' xss
