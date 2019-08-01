#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
cd /var/www/kb/git
git reset --hard
git pull
rm -r _build
sphinx-build -M dirhtml . _build
sphinx-build -M dirhtml . _build
