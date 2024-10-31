FROM debian:bullseye

RUN apt update && \
	apt install -y nginx

RUN apt install -y init systemd

COPY ./nginx.conf /etc/nginx/

CMD ["bash"]