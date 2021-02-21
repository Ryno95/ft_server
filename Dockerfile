# Basic LEMP stack + wordpress
# Base OS (L = Linux)
FROM debian:buster

# Copy needed files
COPY srcs/.  ./root/

# Update all system files and install wget to download zip/tar files
# Install open ssl
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install wget  && apt-get -y install vim-tiny

# Install EMP (E = "E"NGINX, M = MariaDB & P = PHP)
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php-fpm php-mysql

# Install WordPress
# RUN mkdir /var/www/html/wordpress && cd /var/www/html/wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzf latest.tar.gz && rm -f latest.tar.gz


# Configure NGINX
RUN rm -f /etc/nginx/sites-enabled/default
RUN cp /root/my_nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
# RUN service nginx restart

# Configure MySQL db (MariaDb)
RUN bash /root/mysqlconfig.sh


# RUN	service mysql start && \
# # echo "create user 'rynosaurus'@'localhost' identified by '950207rex'" | mysql -u root --skip-password && \
# echo "create database wordpress;"| mysql -u root --skip-password && \
# echo "grant all privileges wordpress.* TO 'rynosaurus'@'localhost' with grant option;"| mysql -u root --skip-password && \
# echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
# RUN service mysql restart



# Every DF needs a CMD line
CMD tail -f /dev/null


# infallible_colden
# https://dev.mysql.com/get/mysql-apt-config_0.8.16-1_all.deb


# docker build -t ftserver .
# docker run -p 80:80 -p 443:443 -d ftserver
# docker exec -it [CID] bash

# 2432f56dfb47