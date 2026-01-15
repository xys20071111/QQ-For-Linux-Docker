FROM debian:latest
LABEL maintainer="xys20071111@hotmail.com"
ENTRYPOINT ["bash", "-c", "/usr/local/bin/run.sh"]

COPY ./qq.deb /root/qq.deb
COPY ./run_in_image.sh /usr/local/bin/run.sh
RUN useradd user &&\
    mkdir -p /home/user/ &&\
    echo "user:123456" | chpasswd &&\
    chown user:user /home/user/
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources && sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list.d/debian.sources
RUN apt update && \
    apt upgrade -y && \
    apt install -y sudo libgbm1 libasound2 fonts-wqy-zenhei libnotify-bin firefox-esr firefox-esr-l10n-zh-cn locales fonts-noto-color-emoji libcurl4 /root/qq.deb;
RUN sed -i '/^#.* zh_CN.UTF-8 /s/^#//' /etc/locale.gen && locale-gen
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure --frontend noninteractive tzdata
USER user
