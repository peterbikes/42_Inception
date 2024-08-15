#!/bin/bash

service mariadb start;

mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE \`${SQL_DATABASE}\`;"

mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "CREATE USER \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

mariadb-admin -uroot -p${SQL_ROOT_PASSWORD} shutdown

mysqld_safe
