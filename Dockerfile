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
RUN mv /root/info.php /var/www/html
RUN mv /root/index.html /var/www/html
RUN mv /root/my_nginx.conf /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/my_nginx.conf /etc/nginx/sites-enabled/
# RUN service nginx restart

# Configure MySQL db (MariaDb)
RUN bash /root/mysqlconfig.sh

# Configure PHPMyAdmin
RUN cd /var/www/html/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -f phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin
RUN cp /root/config.inc.php /var/www/html/phpmyadmin/





# Every DF needs a CMD line
CMD service mysql start && service php7.3-fpm start && service nginx start


# infallible_colden
# https://dev.mysql.com/get/mysql-apt-config_0.8.16-1_all.deb


# docker build -t ftserver .
# docker run -p 80:80 -p 443:443 -d ftserver
# docker exec -it [CID] bash

# 2432f56dfb47