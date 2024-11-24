FROM debian:bullseye

RUN apt update
RUN apt install -y mariadb-server
RUN mkdir /run/mysqld; chmod 777 /run/mysqld;

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_USER_PASSWORD
ARG MYSQL_DATA_BASE
#make user


# RUN service mariadb start && \
# 	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" &&\
# 	mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' with grant option;" && \
# 	if ! mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "select user ,host from mysql.user where  user=${MYSQL_USER};"|grep -q ${MYSQL_USER} ;then\
# 		mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER ${MYSQL_USER} IDENTIFIED BY '${MYSQL_USER_PASSWORD}';" && \
# 		mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON *.* TO ${MYSQL_USER}@'%' with grant option;" && \
# 		mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;";\
# 	fi

RUN service mariadb start && \
	if ! mysql -u root -e "select user ,host from mysql.user where  user=${MYSQL_USER};"|grep -q ${MYSQL_USER} ;then\
		mysql -u root -e "CREATE USER ${MYSQL_USER} IDENTIFIED BY '${MYSQL_USER_PASSWORD}';" && \
		mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO ${MYSQL_USER}@'%' with grant option;" && \
		mysql -u root -e "FLUSH PRIVILEGES;";\
	fi

EXPOSE 3306


RUN service mariadb start

RUN	sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

CMD ["mariadbd"]