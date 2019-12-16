#!/bin/bash
apt-get update
apt-get install sudo
sudo apt-get install -y apt-utils
sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y vim
sudo apt-get install -y wget
sudo apt-get install -y nginx mysql-client postgresql-client php php7.0-fpm php7.0-pgsql php7.0-mysql php7.0-gd php7.0-xml php7.0-intl phpunit
service php7.0-fpm start


rm -rf /etc/php/7.0/fpm/php.ini
rm -rf /etc/nginx/sites-available/default


service nginx restart
service php7.0-fpm restart

