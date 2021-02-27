

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
service mysql restart && service nginx start
wp core install --path=/var/www/html/wordpress/ --url=localhost --title=My Wordpress LEMP Stack --admin_user=rynosaurus --admin_password=950207 --admin_email=rmeiboom@student.codam.nl --allow-root
