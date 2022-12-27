#!/bin/bash
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE="ibus"
export GTK_IM_MODULE="ibus"
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
random_id=a$RANDOM
useradd -u $UID "$random_id"
echo "${random_id}:123456" | chpasswd
mkdir -p "/home/${random_id}/"
chown "${random_id}:${random_id}" "/home/${random_id}/"
su -c "notify-send 如果你能看到这句话 那dbus就应该配置好了" $random_id
su -c "qq" $random_id
