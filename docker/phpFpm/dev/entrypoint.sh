#!/bin/bash sh
#if [ -f "vendor/autoload.php" ]; then
#    echo "Vendors are already installed";
#else
#    composer install --dev --no-scripts --no-suggest --optimize-autoloader --apcu-autoloader
#fi

#composer run-script post-install-cmd --no-interaction

if [ $USER_ID ] ; then
    echo "Chown app folder to user with id $USER_ID"
    chown -R $USER_ID /var/app/
fi

chmod -R 0777 /var/app/cache
chown www-data:www-data /var/app/cache

exec php-fpm