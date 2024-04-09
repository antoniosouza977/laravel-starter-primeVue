#!/bin/bash

composer install

php artisan config:clear
php artisan cache:clear
php artisan key:generate

php artisan migrate --force
php artisan db:seed

chmod 777 -R ./storage

echo "-----------------------"
echo "  Aplicação iniciada   "
echo "-----------------------"

exec php-fpm
