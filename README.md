# 新版 QQ for Linux 的Docker镜像

看到有新版的 QQ for Linux，但是只能登录一次，第二次登录就会出问题，于是做了个镜像，让每一次登录都被认为是在新设备上  
等到正式发布应该就不用--rm了, 也不用  
## 使用方法
先设置`xhost` (这一步每次开机都要运行)
```
xhost +
```
下载 QQ for Linux
```
wget https://dldir1.qq.com/qqfile/qq/QQNT/50eed662/QQ-v2.0.3-543_x64.deb
```
然后构建镜像
```
docker build -t qq-for-linux:latest ./
```
最后运行
```
docker run --rm -it -v /run/user/$(id -u)/bus:/run/user/$(id -u)/bus -v /run/dbus/system_bus_socket:/run/dbus/system_bus_socket -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp/.XIM-unix:/tmp/.XIM-unix -e DISPLAY=$DISPLAY --env DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" -e UID=$(id -u) --net=host qq-for-linux
```
## 已知问题及解决方法（如有）
图标显示不正确  
<<<<<<< HEAD
有些时候会失效，遇到这种情况请重新构建镜像试试  
无法使用输入法, 试试在`docker run`之后加上这些`-e XMODIFIERS="@im=ibus" -e QT_IM_MODULE="ibus" -e GTK_IM_MODULE="ibus"` 把ibus换成你的输入法，实在不行就复制粘贴吧，复制粘贴没问题
=======
镜像还是只能登录一次，每次使用前请重新构建镜像  
无法使用输入法, 复制粘贴吧，复制粘贴没问题
>>>>>>> 0510280 (调整本地化设置)
