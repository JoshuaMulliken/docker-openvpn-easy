# SPDX-FileCopyrightText: 2021 Joshua Mulliken <joshua@mulliken.net>
#
# SPDX-License-Identifier: MIT

FROM ubuntu:20.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install openvpn -y

COPY bin /usr/local/bin

CMD openvpn-start.sh