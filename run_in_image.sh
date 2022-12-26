#!/bin/bash
random_id=a$RANDOM
useradd "$random_id"
echo "${random_id}:123456" | chpasswd
mkdir -p "/home/${random_id}/"
chown "${random_id}:${random_id}" "/home/${random_id}/"
sudo -u "${random_id}" qq
