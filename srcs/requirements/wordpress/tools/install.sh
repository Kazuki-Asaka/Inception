#!/bin/bash

#wp core download --path="/var/www/html" --allow-root || { echo "Core download failed" 1>&2; exit 1; }

echo $MYSQL_DATA_BASE 1>&2
echo $MYSQL_USER 1>&2
echo $MYSQL_USER_PASSWORD 1>&2

if [ !  -f /var/www/html/wordpress/wp-config.php ];then

	cd /var/www/html/wordpress && \
	wp core config\
    	--dbname="${MYSQL_DATA_BASE}" \
    	--dbuser="${MYSQL_USER}" \
    	--dbpass="${MYSQL_USER_PASSWORD}" \
    	--dbhost=mariadb:3306 \
    	--path="/var/www/html/wordpress" \
    	--allow-root || { echo config create failed 1>&2;  exit 1; }


	wp core install --title=${TITLE} \
        	        --admin_user=${WORDPRESS_ADMIN_USER} \
                	--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
                	--admin_email=${WORDPRESS_ADMIN_EMAIL} \
                	--skip-email \
                	--url=http://${DOMAIN_NAME} \
                	--path="/var/www/html/wordpress" \
                	--allow-root || { echo core install failed 1>&2;  exit 1; }

	wp user create ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} --role=editor --user_pass=${WORDPRESS_USER_PASSWORD} --allow-root
fi

php-fpm7.4 -F
