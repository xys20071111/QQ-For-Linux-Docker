# 新版 QQ for Linux 的Docker镜像

看到有新版的 QQ for Linux，但是只能登录一次，第二次登录就会出问题，于是做了个镜像，让每一次登录都被认为是在新设备上  
等到正式发布应该就用不到这个了  
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
docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp/.XIM-unix:/tmp/.XIM-unix -e DISPLAY=$DISPLAY --net=host qq-for-linux
```
## 已知问题
QQ时不时就崩溃  
有些时候会失效，遇到这种情况请重新构建镜像试试  