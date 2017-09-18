#!/bin/bash

if [ -s ~/www/core ] && [ -s ~/www/core.to ]; then
	mv ~/www/core ~/www/public_html/cores/core.$(cat ~/www/core.to)
	rm ~/www/core.to
fi

DIRSIZE=$(du -s ~/www/public_html/cores/ | cut -f1);

if [ "$DIRSIZE" -gt "2097152" ]; then
	rm $(ls -rt --time=atime ~/www/public_html/cores/ | cut -d" " -f1-5)
fi

node --abort-on-uncaught-exception main.js
