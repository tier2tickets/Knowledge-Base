#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
cd /var/www/kb
git reset --hard
git pull
rm -r _build
sphinx-build -M dirhtml . _build > /dev/null 2>&1
sphinx-build -M dirhtml . _build

echo ErrorDocument 404 https://docs.tier2tickets.com > _build/dirhtml/.htaccess


echo Header set Cache-Control \"no-cache, no-store, must-revalidate\" >> _build/dirhtml/.htaccess
echo Header set Pragma \"no-cache\" >> _build/dirhtml/.htaccess
echo Header set Expires 0 >> _build/dirhtml/.htaccess
