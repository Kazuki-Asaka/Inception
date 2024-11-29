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

CMD [ "bash" ]