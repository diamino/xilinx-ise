FROM ubuntu:14.04

# basic packages
RUN apt-get update && \
    apt-get -y install locales \
    libglib2.0-0 libsm6 libxi6 libxrender1 libxrandr2 \
    libfreetype6 libfontconfig1 wget gcc

# Set LOCALE to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

# adding scripts
ADD files /

RUN cd /root/install && \
    wget "http://host.docker.internal:8765/Xilinx_ISE_DS_14.7_1015_1.tar" && \
    tar xvf Xilinx_ISE_DS_14.7_1015_1.tar && \
    cd Xilinx_ISE_DS_14.7_1015_1/bin/lin64 && \
    DISPLAY=host.docker.internal:0 ./xsetup && \
    cd /root && \
    rm -rf /root/setup /root/install

# RUN cd /root/install && \
#     wget "http://host.docker.internal:8765/Xilinx_ISE_DS_14.7_1015_1.tar" && \
#     tar xvf Xilinx_ISE_DS_14.7_1015_1.tar && \
#     TERM=xterm /root/setup && \
#     cd.. && \
#     rm -rf /root/setup /root/install
