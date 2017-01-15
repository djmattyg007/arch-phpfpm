#!/bin/bash

# Exit script if return code != 0
set -e

source /root/functions.sh

echo "Installing fake systemd package"
aur_start
aur_build systemd-dummy
aur_finish

# Install any packages
source /root/phpfpm.sh

# Cleanup
pacman_cleanup
