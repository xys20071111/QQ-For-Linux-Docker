FROM debian
LABEL maintainer="xys20071111@hotmail.com"
ENTRYPOINT ["bash", "-c", "/root/run.sh"]

COPY ./linuxqq_3.1.1-11223_amd64.deb /root/linuxqq_3.0.0-571_amd64.deb
COPY ./run_in_image.sh /root/run.sh
RUN sed -i "s/deb\.debian\.org/mirrors\.163\.com/" /etc/apt/sources.list
RUN apt update && \
    apt upgrade -y && \
    apt install -y sudo libgbm1 libasound2 fonts-wqy-zenhei libnotify-bin firefox-esr firefox-esr-l10n-zh-cn locales fonts-noto-color-emoji /root/linuxqq_3.0.0-571_amd64.deb;
RUN sed -i '/^#.* zh_CN.UTF-8 /s/^#//' /etc/locale.gen && locale-gen
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure --frontend noninteractive tzdata