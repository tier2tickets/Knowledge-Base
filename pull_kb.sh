#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
cd /var/www/kb
#git reset --hard
git pull
rm -r _build
sphinx-build -M dirhtml . _build
sphinx-build -M dirhtml . _build
echo RewriteEngine on > _build/dirhtml/.htaccess
echo RewriteCond %{REQUEST_FILENAME} !-f  >> _build/dirhtml/.htaccess
echo RewriteRule . / [L,R=302] >> _build/dirhtml/.htaccess
