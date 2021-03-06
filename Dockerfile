FROM ubuntu:latest

USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_CTYPE=C.UTF-8

RUN dpkg --add-architecture i386

RUN apt-get update &&\
apt-get dist-upgrade -y &&\
apt-get install ruby build-essential git python3 python3-pip libc6:i386 libncurses5:i386 libstdc++6:i386 socat tmux strace ltrace -y

RUN gem install one_gadget

RUN cd /opt &&\
git clone https://github.com/pwndbg/pwndbg && \
cd pwndbg &&\
./setup.sh

RUN python3 -m pip install --upgrade pip && \
python3 -m pip install git+https://github.com/Gallopsled/pwntools.git@dev 
CMD [ "tmux", "-u" ]