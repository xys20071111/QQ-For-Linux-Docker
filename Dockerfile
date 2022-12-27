FROM debian

ENTRYPOINT ["bash", "-c", "/root/run.sh"]
ENV XMODIFIERS="@im=ibus"
ENV QT_IM_MODULE="ibus"
ENV GTK_IM_MODULE="ibus"

RUN sed -i "s/deb\.debian\.org/mirrors\.163\.com/" /etc/apt/sources.list
RUN apt update && apt upgrade -y && apt install -y wget sudo libgbm1 libasound2 fonts-wqy-zenhei libnotify-bin;
COPY ./run_in_image.sh /root/run.sh
COPY ./QQ-v2.0.3-543_x64.deb /root/QQ-v2.0.3-543_x64.deb
RUN apt install -y /root/QQ-v2.0.3-543_x64.deb;
