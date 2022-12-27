FROM debian

ENTRYPOINT ["bash", "-c", "/root/run.sh"]

RUN sed -i "s/deb\.debian\.org/mirrors\.163\.com/" /etc/apt/sources.list
RUN apt update && apt upgrade -y && apt install -y sudo libgbm1 libasound2 fonts-wqy-zenhei libnotify-bin firefox-esr locales;
RUN sed -i '/^#.* zh_CN.UTF-8 /s/^#//' /etc/locale.gen && locale-gen
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure --frontend noninteractive tzdata
COPY ./run_in_image.sh /root/run.sh
COPY ./QQ-v2.0.3-543_x64.deb /root/QQ-v2.0.3-543_x64.deb
RUN apt install -y /root/QQ-v2.0.3-543_x64.deb;
