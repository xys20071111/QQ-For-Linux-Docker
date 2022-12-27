#!/bin/bash
random_id=a$RANDOM
useradd -u $UID "$random_id"
echo "${random_id}:123456" | chpasswd
mkdir -p "/home/${random_id}/"
chown "${random_id}:${random_id}" "/home/${random_id}/"
su -c "notify-send 如果你能看到这句话 那dbus就应该配置好了" $random_id
su -c "qq" $random_id
