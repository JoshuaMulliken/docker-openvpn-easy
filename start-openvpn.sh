#!/bin/bash
# SPDX-FileCopyrightText: 2021 Joshua Mulliken <joshua@mulliken.net>
# 
# SPDX-License-Identifier: MIT

echo "Easy OpenVPN container for connecting containers to services behind a VPN"

if [ $# -lt 2 ]; then
  echo "Must provide a path to the .ovpn file and a username, i.e., start-openvpn.sh /path/to/ovpn.ovpn USERNAME"
  exit 1
fi

export OVPN_PATH=$1
export USERNAME=$2

# Read password
printf "Password: "
read -r -s PASSWORD
export PASSWORD=$PASSWORD
echo

# If you dont want to expose services remove or modify the -p for the ports to be exposed by other containers locally
# docker run -d --cap-add=NET_ADMIN --device /dev/net/tun -v /home/joshua/irc_bouncer/:/root/ --sysctl net.ipv6.conf.all.disable_ipv6=0 openvpn-easy:0.0.1
docker run -d --name openvpn-easy -p 7797:7797 -e USERNAME -e PASSWORD --cap-add=NET_ADMIN --device /dev/net/tun -v $OVPN_PATH:/vpn/vpnconfig.ovpn --sysctl net.ipv6.conf.all.disable_ipv6=0 joshmull/openvpn-easy

echo "The container has started. You may now utilize it's network to connect other services through the vpn, i.e., docker run -d --net=container:openvpn-easy -v /path/to/znc-cfg:/znc-data znc"