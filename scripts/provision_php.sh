#!/bin/bash

echo "Php8 provisioning - begin"
sudo apt-get install php8.0 -y #install php
sudo apt-get install php8.0-mysql php8.0-pdo -y #install 
sudo phpenmod mysql 
sudo phpenmod pdo_mysql
sudo service apache2 restart #restart apache
echo "Php8 provisioning - end"
