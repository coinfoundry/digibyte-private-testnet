FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz /tmp/

RUN apt-get -y update && apt-get -y install git build-essential libssl-dev libboost-all-dev libdb5.3 \
    libdb5.3-dev libdb5.3++-dev libtool automake libevent-dev bsdmainutils git ntp make g++ gcc \
    autoconf cpp ngrep iftop sysstat autotools-dev pkg-config libminiupnpc-dev libzmq3-dev \
    libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev

RUN cd /tmp && git clone https://github.com/digibyte/digibyte && \
    cd digibyte && git checkout tags/v.6.16.1 && ./autogen.sh && ./configure --with-incompatible-bdb && make && make install

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 16101 16102 16103

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
