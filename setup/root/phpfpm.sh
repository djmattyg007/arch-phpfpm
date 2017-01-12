#!/bin/bash

# Exit script if return code != 0
set -e

echo "Installing PHP packages..."
pacman -S --noconfirm php php-fpm php-apcu php-intl

# Configure PHP
sed -i -r 's/^;? ?expose_php =.*$/expose_php = Off/' /etc/php/php.ini
sed -i -r 's/^;? ?log_errors_max_len =.*$/log_errors_max_len = 4096/' /etc/php/php.ini
sed -i -r 's/^;? ?max_execution_time =.*$/max_execution_time = 120/' /etc/php/php.ini
sed -i -r 's/^;? ?max_input_vars =.*$/max_input_vars = 10000/' /etc/php/php.ini
sed -i -r 's/^;? ?display_errors =.*$/display_errors = Off/' /etc/php/php.ini
sed -i -r 's/^;? ?upload_max_filesize =.*$/upload_max_filesize = 8M/' /etc/php/php.ini
cat > /etc/php/conf.d/50-conf.ini <<EOF
extension=bcmath.so
extension=bz2.so
extension=exif.so
extension=iconv.so
extension=intl.so
EOF

# Configure php-fpm
sed -i -r 's/^;?error_log =.*$/error_log = \/dev\/stderr/' /etc/php/php-fpm.conf
sed -i -r 's/^;?daemonize =.*$/daemonize = no/' /etc/php/php-fpm.conf
sed -i -r 's/^;?systemd_interval =.*$/systemd_interval = 0/' /etc/php/php-fpm.conf
sed -i -r 's/^;?listen =.*$/listen = 9000/' /etc/php/php-fpm.d/www.conf
sed -i -r 's/^;?pm\.status_path =.*$/pm.status_path = \/status/' /etc/php/php-fpm.d/www.conf
sed -i -r 's/^;?ping\.path =.*$/ping.path = \/ping/' /etc/php/php-fpm.d/www.conf
sed -i -r 's/^;?access\.log =.*$/access.log = \/dev\/stdout/' /etc/php/php-fpm.d/www.conf
sed -i -r 's/^;?chdir =.*$/chdir = \/srv\/http/' /etc/php/php-fpm.d/www.conf
