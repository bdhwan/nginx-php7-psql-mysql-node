FROM ubuntu:16.04
MAINTAINER bdhwan@gmail.com



RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install sudo
RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y vim
RUN sudo apt-get install -y gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN sudo npm install -g npm
RUN sudo npm install -g pm2
RUN sudo pm2 install pm2-logrotate
RUN pm2 set pm2-logrotate:max_size 101M


RUN sudo apt-get install -y mysql-client


RUN sudo apt-get install -y php7.0-curl

RUN sudo apt-get install -y nginx postgresql-client php php7.0-fpm php7.0-pgsql php7.0-mysql php7.0-gd php7.0-xml php7.0-intl phpunit 
RUN sudo apt-get install -y php7.0-mbstring 


RUN sudo apt-get install -y php7.0-zip


RUN rm -rf /etc/php/7.0/fpm/php.ini
RUN rm -rf /etc/nginx/sites-available/default
RUN rm -rf /etc/php/7.0/fpm/pool.d/www.conf


ADD conf/php.ini /etc/php/7.0/fpm/php.ini
ADD conf/default /etc/nginx/sites-available/default
ADD conf/www.conf /etc/php/7.0/fpm/pool.d/www.conf


ADD check.sh /home/check.sh
ADD add_env.sh /home/add_env.sh


WORKDIR /home

CMD ["/bin/bash", "-c", "source /home/add_env.sh && sh /home/check.sh && /usr/sbin/service php7.0-fpm start && nginx -g 'daemon off;'"]





