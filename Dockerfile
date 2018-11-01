FROM ubuntu:16.04

RUN apt update &&\
    export DEBIAN_FRONTEND=noninteractive &&\
    apt install -yqq easy-rsa openvpn openvpn-auth-ldap &&\
    rm -rf /tmp/*  /cache/*

EXPOSE 1194/udp

CMD [ "/usr/sbin/openvpn", "--cd /etc/openvpn", "--config /etc/openvpn/server.conf", "--script-security 2" ]
