#!/bin/sh
VOLUME_HOME="/var/lib/mysql"
if [[ ! -d $VOLUME_HOME/mysql ]]; then
   /etc/init.d/mariadb setup
   rc-service mariadb start 
   mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'magyar12'"
   mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"
   mysql -uroot -e "CREATE DATABASE IF NOT EXISTS test"
   mysql -uroot test < /init.sql
   echo "=> Done!"
fi

rc-service mariadb start && rc-service apache2 start

while true
do
	echo 1
	sleep 3600
done
