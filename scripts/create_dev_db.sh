#!/bin/bash
ROOTPASSWD=''
DBNAME=vagrant
DBUSER=vagrant_admin
DBPASSWD=admin01!
echo "Creating new db $DBNAME"
mysql -uroot -p$ROOTPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$ROOTPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%'
identified by '$DBPASSWD'"
