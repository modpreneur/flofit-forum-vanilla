#!/bin/bash sh

rm -f /etc/nginx/sites-available/symfony.conf
cp /var/app/docker/nginx/vanilla.conf /etc/nginx/sites-available/vanilla.conf

exec nginx