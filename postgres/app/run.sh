#!/bin/sh
VOLUME_HOME="/var/lib/postgresql"
if [[ ! -d $VOLUME_HOME/data ]]; then
	su postgres -
	mkdir /var/lib/postgresql/data
	chmod 0700 /var/lib/postgresql/data
	initdb -D /var/lib/postgresql/data
        rc-service postgresql start 
   #mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'magyar12'"
   #mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"
   #mysql -uroot -e "CREATE DATABASE IF NOT EXISTS test"
   #mysql -uroot test < /init.sql
       psql -U postgres -c "create database test;"
       psql -U postgres test < /init.sql
       echo "=> Done!"
fi

rc-service postgresql start && rc-service apache2 start

while true
do
	echo 1
	sleep 3600
done
