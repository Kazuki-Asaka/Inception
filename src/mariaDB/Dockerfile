FROM debian:bullseye

RUN apt update
RUN apt install -y mariadb-server
RUN mkdir /run/mysqld; chmod 777 /run/mysqld;

#make user

RUN service mariadb start && \
	if ! mysql -u root -e 'select user ,host from mysql.user where  user="test";'|grep -q 'test' ;then\
		mysql -u root -e "CREATE USER 'test'@'localhost' IDENTIFIED BY 'TEST';" && \
		mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'test'@'localhost';" && \
		mysql -u root -e "FLUSH PRIVILEGES;";\
	fi

CMD ["mariadbd"]