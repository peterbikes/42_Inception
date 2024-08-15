#!/bin/bash

wp core is-installed --path='/var/www/wordpress' --allow-root
wp core install --url="https://$WP_URL" \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	--skip-email \
	--path='/var/www/wordpress' \
	--allow-root

wp user list --field=user_login  --path='/var/www/wordpress' --allow-root | grep -q "^$WP_USER$"
wp user create 	$WP_USER $WP_USER_EMAIL \
	--role=author \
	--user_pass=$WP_USER_PASSWORD \
	--path='/var/www/wordpress' \
	--allow-root

/usr/sbin/php-fpm7.4 -F
