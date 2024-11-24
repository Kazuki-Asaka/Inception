#!/bin/bash

cd /var/www/html && \
wp config create \
    --dbname="${MYSQL_DATA_BASE=mariadb}" \
    --dbuser="${MYSQL_USER}" \
    --dbpass="${MYSQL_USER_PASSWORD}" \
    --dbhost="mariadb:3306" \
    --path="/var/www/html" \
    --allow-root || { echo config create failed 1>&2;  exit 1; }

wp core install --path="/var/www/html" \
                --allow-root || { echo core install failed 1>&2;  exit 1; }

php-fpm7.4 -F