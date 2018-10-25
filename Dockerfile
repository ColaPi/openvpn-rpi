FROM resin/raspberrypi3-alpine

MAINTAINER cola <colachg@gmail.com>

ENV OPENVPN /etc/openvpn
ENV EASYRSA /usr/share/easy-rsa
ENV EASYRSA_PKI $OPENVPN/pki
ENV EASYRSA_VARS_FILE $OPENVPN/var

RUN apk add --update --virtual .build-dependencies curl unzip && \
    curl -sSL https://github.com/kylemanna/docker-openvpn/archive/master.zip -o master.zip && \
    unzip master.zip docker-openvpn-master/bin/* -d ./temp/ && \
    mv ./temp/docker-openvpn-master/bin/* /usr/local/bin/ && \
    rm -rf master.zip ./temp && \
    apk add --no-cache easy-rsa openvpn bash && \
    chmod a+x /usr/local/bin/* && \
    ln -sf /usr/share/easy-rsa/easyrsa /usr/local/bin/easyrsa && \
    apk del .build-dependencies &&\
    rm -rf /tmp/*
    
EXPOSE 1194/udp

CMD ["ovpn_run"]
