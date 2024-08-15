FROM debian:bullseye

EXPOSE 9000

RUN apt update -y
RUN apt upgrade -y

RUN apt-get install wget php7.4 php-fpm php-mysql mariadb-client -y
RUN wget https://wordpress.org/wordpress-6.4.2.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4.2.tar.gz && rm wordpress-6.4.2.tar.gz

COPY conf/wp-config.php /var/www/wordpress
RUN	chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.4/fpm/pool.d
RUN mkdir -p /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update

COPY tools/wp-setup.sh wp-setup.sh

CMD [ "./wp-setup.sh" ]
