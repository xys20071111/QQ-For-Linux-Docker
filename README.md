# 新版 QQ for Linux 的Docker镜像

<del>
看到有新版的 QQ for Linux，但是只能登录一次，第二次登录就会出问题，于是做了个镜像，让每一次登录都被认为是在新设备上
</del>

正式版已经发布了，这个镜像仅用于隔离QQ

## 使用方法

### 使用预构建镜像

先设置`xhost` (这一步每次开机都要运行)

```
xhost +SI:localuser:$(whoami)
```

运行

```
docker run  --name qq \
            --rm -d --cap-add=SYS_ADMIN --security-opt=no-new-privileges \
            -v 保存数据的位置:/home/user \
            -v /run/user/$(id -u)/bus:/run/user/$(id -u)/bus \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -e DISPLAY=$DISPLAY --env DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" -e UID=$(id -u) \
            -e LANG -e XMODIFIERS -e QT_IM_MODULE -e GTK_IM_MODULE \
            xys20071111/qq-for-linux:latest
```

### 手动构建 (原版)

先设置`xhost` (这一步每次开机都要运行)

```
xhost +SI:localuser:$(whoami)
```

去QQ官网下载 QQ for Linux的deb安装包，重命名为`qq.deb`然后放到`original`目录里，
构建镜像

```
docker build -t qq-for-linux:latest ./original
```

最后运行

```
docker run  --name qq \
            --rm -d --cap-add=SYS_ADMIN --security-opt=no-new-privileges \
            -v 保存数据的位置:/home/user \
            -v /run/user/$(id -u)/bus:/run/user/$(id -u)/bus \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -e DISPLAY=$DISPLAY --env DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" -e UID=$(id -u) \
            -e LANG -e XMODIFIERS -e QT_IM_MODULE -e GTK_IM_MODULE \
            qq-for-linux:latest
```

### 手动构建 (安装liteloader)

先设置`xhost` (这一步每次开机都要运行)

```
xhost +SI:localuser:$(whoami)
```

去QQ官网下载 QQ for
Linux的deb安装包，重命名为`qq.deb`然后放到`liteloader`目录里\
然后去[这里](https://github.com/LiteLoaderQQNT/LiteLoaderQQNT)下载liteloader.zip，放到`liteloader`目录里
构建镜像

```
docker build -t qq-for-linux:latest-liteloader ./liteloader
```

最后运行

```
docker run  --name qq \
            --rm -d --cap-add=SYS_ADMIN --security-opt=no-new-privileges \
            -v 保存数据的位置:/home/user \
            -v /run/user/$(id -u)/bus:/run/user/$(id -u)/bus \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -e DISPLAY=$DISPLAY --env DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" -e UID=$(id -u) \
            -e LANG -e XMODIFIERS -e QT_IM_MODULE -e GTK_IM_MODULE \
            qq-for-linux:latest-liteloader
```

## 已知问题及解决方法（如有）

无法使用基于ibus的输入法,我把输入法引擎换成了fcitx就好了

## Q&A

### 为什么要做这个镜像？

<del>Windows底下我管不了你QQ，Linux底下我还管不了你QQ了?</del>\
最开始是因为没有新版QQ的内测权限，于是用Docker卡bug来登陆，现在就只是用来隔离QQ,防止扫盘

### 为什么要安装Firefox?

不装Firefox打不开外部网页

## 致谢
感谢 [@cs231giCjh3](https://github.com/cs231giCjh3) 在权限限制方面的建议

