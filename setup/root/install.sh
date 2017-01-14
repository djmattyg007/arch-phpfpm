#!/bin/bash

# Exit script if return code != 0
set -e

source /root/functions.sh
pacman -Qi systemd || true

echo "Installing fake systemd package"
aur_start
pacman -Qi systemd || true
aur_build systemd-dummy
pacman -Qi systemd || true
aur_finish
pacman -Qi systemd || true

# Install any packages
source /root/phpfpm.sh

# Cleanup
pacman_cleanup
