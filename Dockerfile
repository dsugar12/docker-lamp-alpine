FROM alpine:3.17.1

RUN   apk update && apk add --no-cache mariadb mariadb-client apache2 php81 php81-mysqli php81-apache2 openrc && openrc  && touch /run/openrc/softlevel

RUN sed s/skip-networking/#skip-networking/ /etc/my.cnf.d/mariadb-server.cnf >/etc/my.cnf.d/tempfile && mv /etc/my.cnf.d/tempfile /etc/my.cnf.d/mariadb-server.cnf

# initialize database first time only
# check for dir , exec mysql commands, etc.
#
#RUN /etc/init.d/mariadb setup

# add volume for DB
VOLUME  ["/var/lib/mysql"]

#RUN rc-service mariadb start && rc-service apache2 start

COPY app/run.sh /run.sh
COPY app/coin.php /var/www/localhost/htdocs/
COPY app/sales.php /var/www/localhost/htdocs/
COPY app/wrestler.php /var/www/localhost/htdocs/
COPY app/init.sql /

expose 80
expose 3306

ENTRYPOINT ["/run.sh"]
