#!/bin/bash

#wp core download --path="/var/www/html" --allow-root || { echo "Core download failed" 1>&2; exit 1; }

echo $MYSQL_DATA_BASE 1>&2
echo $MYSQL_USER 1>&2
echo $MYSQL_USER_PASSWORD 1>&2

cd /var/www/html && \
wp core config\
    --dbname="${MYSQL_DATA_BASE}" \
    --dbuser="${MYSQL_USER}" \
    --dbpass="${MYSQL_USER_PASSWORD}" \
    --dbhost=mariadb:3306 \
    --path="/var/www/html" \
    --allow-root || { echo config create failed 1>&2;  exit 1; }


wp core install --path="/var/www/html" \
                --allow-root || { echo core install failed 1>&2;  exit 1; }

php-fpm7.4 -F