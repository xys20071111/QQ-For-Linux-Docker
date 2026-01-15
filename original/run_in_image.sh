#!/bin/bash
useradd -u $UID user
echo "user:123456" | chpasswd
chown user:user /home/user/
chown user:user /run/user/$(id -u user)
su -c "notify-send 如果你能看到这句话 那dbus就应该配置好了" user
su -c "qq --no-sandbox" user