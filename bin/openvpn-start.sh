# SPDX-FileCopyrightText: 2020 Joshua Mulliken <joshua@mulliken.net>
# 
# SPDX-License-Identifier: MIT

#!/bin/bash

rm -f /root/auth

echo "$USERNAME" >> /root/auth
echo "$PASSWORD" >> /root/auth

openvpn --config /vpn/vpnconfig.ovpn --auth-user-pass /root/auth