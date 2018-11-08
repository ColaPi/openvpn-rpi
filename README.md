[![Build Status](https://travis-ci.org/ColaPi/openvpn-rpi.svg?branch=master)](https://travis-ci.org/ColaPi/openvpn-rpi)  [![](https://images.microbadger.com/badges/version/colachen/openvpn-rpi.svg)](https://microbadger.com/images/colachen/openvpn-rpi "Get your own version badge on microbadger.com")  [![](https://images.microbadger.com/badges/image/colachen/openvpn-rpi.svg)](https://microbadger.com/images/colachen/openvpn-rpi "Get your own image badge on microbadger.com")
---
# openvpn-rpi

openvpn with ldap in docker on RaspberryPi3.

# Get Start

1. setup CA
```
        sudo apt install easy-rsa openvpn
        make-cadir ~/opevpn
        cd ~/openvpn
        vim vars
        source vars
        ./clean-all
        ./build-ca
        ./build-key-server server
        ./build-dh
        openvpn --genkey --secret keys/ta.key
        cp ca.crt server.crt server.key ta.key dh2048.pem openvpn
```

2. `docker-compose build` to build or `docker compose up -d` to start.

# More interesting
https://github.com/colachg/cat

