#!/bin/bash

docker run -d                                  \
    --name pihole                              \
    -p 53:53/tcp                               \
    -p 53:53/udp                               \
    -p 80:80                                   \
    -p 443:443                                 \
    --cap-add=NET_ADMIN                        \
    -v "$(pwd)/etc/pihole/:/etc/pihole/"       \
    -v "$(pwd)/etc/dnsmasq.d/:/etc/dnsmasq.d/" \
    -e ServerIP="$(ipconfig getifaddr en0)"    \
    -e DNS1=1.1.1.1                            \
    -e DNS2=1.0.0.1                            \
    --restart=unless-stopped                   \
    --dns=127.0.0.1 --dns=1.1.1.1              \
    pihole/pihole:latest

sleep 5

docker ps -a
