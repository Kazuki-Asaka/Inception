FROM debian:bullseye

RUN apt update && \
	apt install -y curl && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN curl -O https://ja.wordpress.org/latest-ja.tar.gz && \
	tar xzf latest-ja.tar.gz && \
	mkdir -p /var/www/html && \
	mv wordpress/* /var/www/html && \
	rm -rf latest-ja.tar.gz wordpress

#docker configの作成をしてwp core install
RUN apt update &&\
	apt install -y php-fpm && \
	apt install -y php-mysql

RUN mkdir /run/php

COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "-F"]
