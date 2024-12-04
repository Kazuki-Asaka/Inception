FROM debian:bullseye

RUN apt update && \
	apt install -y nginx

#RUN apt install -y init systemd

COPY ./requirements/nginx/tools/nginx.conf /etc/nginx/nginx.conf

RUN apt install openssl
RUN mkdir /etc/nginx/ssl
RUN chmod 755 /etc/nginx/ssl
RUN openssl genrsa -out /etc/nginx/ssl/server.key 2048
RUN openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr -subj "/CN=localhost"
RUN openssl x509 -days 3650 -req -signkey /etc/nginx/ssl/server.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt
CMD ["nginx", "-g", "daemon off;"]