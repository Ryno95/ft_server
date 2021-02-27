# Basic LEMP stack + wordpress
# Base OS (L = Linux)
FROM debian:buster

# Copy needed files
COPY srcs/.  ./root/

# Update all system files and install wget to download zip/tar files
# Install open ssl
RUN apt -y update
RUN apt -y upgrade
RUN apt -y install wget
RUN apt -y install vim-tiny
RUN apt -y install openssl

# Install EMP (E = "E"NGINX, M = MariaDB (MySQL) & P = PHP) & Wordpress
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php php-fpm php-mysql php-cli php-mbstring php-gd php-cgi

# Make & configure SSL certificate and key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl_key.key -out /etc/ssl/certs/ssl_key.crt -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=localhost"

# Configure NGINX
RUN rm -f /etc/nginx/sites-enabled/default
RUN mv /root/info.php /var/www/html
RUN mv /root/index.html /var/www/html
RUN mv /root/my_nginx.conf /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/my_nginx.conf /etc/nginx/sites-enabled/
# RUN service nginx restart

# Configure MySQL db (Mariadb)
RUN bash /root/mysqlconfig.sh

# Download and configure PHPMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
RUN tar xzfv phpMyAdmin-5.0.4-english.tar.gz -C /root 
RUN mkdir /var/www/html/phpmyadmin
RUN cp -a /root/phpMyAdmin-5.0.4-english/. /var/www/html/phpmyadmin/
RUN rm -rf /root/phpMyAdmin-5.0.4-english
RUN rm -rf phpMyAdmin-5.0.4-english.tar.gz
RUN mv /root/config.inc.php /var/www/html/phpmyadmin

# Download & configure WordPress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz -C /var/www/html/
RUN rm -rf latest.tar.gz
RUN mv /root/wp-config.php /var/www/html/wordpress/
RUN bash /root/wpsetup.sh
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# RUN service mysql restart && service nginx start
# RUN wp core install --path=/var/www/html/wordpress/ --url=localhost --title=My_LEMP_stack_+_Wordpress --admin_user=rynosaurus --admin_password=950207 --admin_email=rmeiboom@student.codam.nl --allow-root

# Grant permissions
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

# Every DF needs one and only one CMD line
# CMD tail -f /dev/null
# Start services and 
CMD service mysql restart && service php7.3-fpm start && nginx -g 'daemon off;'
# service mysql restart && service php7.3-fpm restart && service nginx restart


# infallible_colden
# https://dev.mysql.com/get/mysql-apt-config_0.8.16-1_all.deb


# docker build -t ftserver .
# docker run -p 80:80 -p 443:443 -d ftserver
# docker exec -it [CID] bash

# 2432f56dfb47