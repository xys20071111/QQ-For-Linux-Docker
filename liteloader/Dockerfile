FROM debian:bookworm
LABEL maintainer="xys20071111@hotmail.com"
ENTRYPOINT ["bash", "-c", "/root/run.sh"]

COPY ./qq.deb /root/qq.deb
COPY ./LiteLoaderQQNT.zip /root/LiteLoaderQQNT.zip
COPY ./run_in_image.sh /root/run.sh
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources && sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list.d/debian.sources
RUN apt update && \
    apt upgrade -y && \
    apt install -y sudo libgbm1 libasound2 fonts-wqy-zenhei libnotify-bin firefox-esr firefox-esr-l10n-zh-cn locales fonts-noto-color-emoji unzip /root/qq.deb;
RUN sed -i '/^#.* zh_CN.UTF-8 /s/^#//' /etc/locale.gen && locale-gen
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure --frontend noninteractive tzdata
RUN mkdir /opt/liteloader/ && \
    cd /opt/liteloader && \
    unzip /root/LiteLoaderQQNT.zip && \
    echo "require(String.raw\`/opt/liteloader\`)" > /opt/QQ/resources/app/app_launcher/liteloader.js && \
    sed -i 's/\.\/application\/app_launcher\/index\.js/\.\/app_launcher\/liteloader\.js/g' /opt/QQ/resources/app/package.json