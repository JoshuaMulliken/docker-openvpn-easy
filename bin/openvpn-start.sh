#!/bin/bash

rm -f /root/auth

echo "$USERNAME" >> /root/auth
echo "$PASSWORD" >> /root/auth

openvpn --config /vpn/vpnconfig.ovpn --auth-user-pass /root/auth