# 新版 QQ for Linux 的Docker镜像

<del>
看到有新版的 QQ for Linux，但是只能登录一次，第二次登录就会出问题，于是做了个镜像，让每一次登录都被认为是在新设备上   
</del>  

正式版已经发布了，这个镜像仅用于隔离QQ  
## 使用方法
先设置`xhost` (这一步每次开机都要运行)
```
xhost +
```
下载 QQ for Linux
```
wget https://dldir1.qq.com/qqfile/qq/QQNT/64bd2578/linuxqq_3.0.0-565_amd64.deb
```
然后构建镜像
```
docker build -t qq-for-linux:latest ./
```
最后运行
```
docker run --name qq --rm -d -v 保存数据的位置:/home/user -v /run/user/$(id -u)/bus:/run/user/$(id -u)/bus -v /run/dbus/system_bus_socket:/run/dbus/system_bus_socket -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --env DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" -e UID=$(id -u) -e LANG -e XMODIFIERS -e QT_IM_MODULE -e GTK_IM_MODULE --net=host qq-for-linux
```

## 已知问题及解决方法（如有）
图标显示不正确   
无法使用输入法,我把输入法引擎换成了fcitx就好了
