FROM debian:bullseye

RUN apt update && \
	apt install -y nginx

#RUN apt install -y init systemd

COPY ./src/nginx/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]