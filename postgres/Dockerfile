FROM alpine:3.17.1

RUN   apk update && apk add --no-cache postgresql15 apache2 php81 php81-apache2 php81-pgsql openrc && openrc  && touch /run/openrc/softlevel
#RUN   apk update && apk add --no-cache mariadb mariadb-client apache2 php81 php81-mysqli php81-apache2 openrc && openrc  && touch /run/openrc/softlevel

#RUN sed s/skip-networking/#skip-networking/ /etc/my.cnf.d/mariadb-server.cnf >/etc/my.cnf.d/tempfile && mv /etc/my.cnf.d/tempfile /etc/my.cnf.d/mariadb-server.cnf

# add volume for DB
VOLUME  ["/var/lib/postgresql"]

#RUN rc-service mariadb start && rc-service apache2 start

RUN mkdir /run/postgresql
RUN chown postgres:postgres /run/postgresql/

COPY app/run.sh /run.sh
COPY app/coin.php /var/www/localhost/htdocs/
COPY app/sales.php /var/www/localhost/htdocs/
COPY app/wrestler.php /var/www/localhost/htdocs/
COPY app/init.sql /

COPY conf/postgresql.conf /etc/postgresql15/postgresql.conf
RUN chown postgres:postgres /etc/postgresql15/postgresql.conf
COPY conf/pg_ident.conf /etc/postgresql15/pg_ident.conf
RUN chown postgres:postgres /etc/postgresql15/pg_ident.conf
COPY conf/pg_hba.conf /etc/postgresql15/pg_hba.conf
RUN chown postgres:postgres /etc/postgresql15/pg_hba.conf

expose 80
expose 5432

ENTRYPOINT ["/run.sh"]
