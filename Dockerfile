FROM lscr.io/linuxserver/plex

RUN echo "deb http://raspbian.raspberrypi.org/raspbian/ bullseye main contrib non-free rpi" > /etc/apt/sources.list.d/raspi.list
RUN echo "deb-src http://raspbian.raspberrypi.org/raspbian/ bullseye main contrib non-free rpi" >> /etc/apt/sources.list.d/raspi.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 9165938D90FDDD2E
RUN apt-get update && apt-get -y upgrade && apt-get -y install git sudo make

RUN apt-get install -y lsb-release build-essential python3 python3-yaml libass-dev libaom-dev libxvidcore-dev libvorbis-dev libv4l-dev libx265-dev libx264-dev libwebp-dev libspeex-dev librtmp-dev libopus-dev libmp3lame-dev libdav1d-dev libopencore-amrnb-dev libopencore-amrwb-dev libsnappy-dev libsoxr-dev libssh-dev libxml2-dev libvpx6 libvpx-dev libraspberrypi-dev
RUN cd /opt && git clone https://github.com/ForsakenNGS/raspi-plex-transcode.git
RUN cd /opt/raspi-plex-transcode && export APT_INSTALL_PARAMS="-y" && ./compile.sh && ./install.sh
ADD "https://api.github.com/repos/ForsakenNGS/raspi-plex-transcode/git/refs/heads/main" /config/GIT_HEAD
RUN cd /opt/raspi-plex-transcode && git pull && export APT_INSTALL_PARAMS="-y" && ./compile.sh
