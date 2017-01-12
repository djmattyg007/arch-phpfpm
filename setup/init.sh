#!/bin/bash

if [[ -n "${TZ}" ]]; then
    sed -i -r "s/^;? ?date\.timezone =.*$/date.timezone = ${TZ}/" /etc/php/php.ini
else
    sed -i -r 's/^;? ?date\.timezone =.*$/date.timezone = UTC/' /etc/php/php.ini
    export TZ=UTC
fi

mkdir -p /run/php-fpm
exec chpst -u http:http /usr/bin/php-fpm --nodaemonize --fpm-config /etc/php/php-fpm.conf
