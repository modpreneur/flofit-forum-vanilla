#!/bin/bash sh

mkdir -p /var/app/cache

chmod -R 0777 /var/app/cache
chown -R www-data:www-data /var/app/cache

exec php-fpm
