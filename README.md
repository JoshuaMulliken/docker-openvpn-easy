# Easy OpenVPN Docker Connector

[Main Project Page](https://sr.ht/~joshmulliken/docker-openvpn-easy/): Repo, Mailing List, and Issue Tracking.

| Repository                                            | Purpose |
| ----------------------------------------------------- | ------- |
| https://git.sr.ht/~joshmulliken/docker-openvpn-easy   | Primary |
| https://github.com/JoshuaMulliken/docker-openvpn-easy | Mirror  |

This project is designed to provide an easy way to allow your containers to connect to resources that are behind a VPN.

Most other projects that I could find online used config files other than the default `.ovpn` format so I created this to pass in the `.ovpn` and ask for credentials.

**Note:** The username and password are only ever stored in the container during operation. Once the container is removed the credentials go with it. It is also set up to not leak the password to the `.bash_history`

## Usage

To start using this project run:

```bash
git clone https://git.sr.ht/~joshmulliken/docker-openvpn-easy
cd docker-openvpn-easy
./start-openvpn.sh /path/to/ovpn.ovpn USERNAME
```

You should see the following output and it will ask for a password:

```bash
Easy OpenVPN container for connecting containers to services behind a VPN
Password:
```

**Note:** By default the script exposes the port `7797`. You should change this to whatever port you need in order to access your container locally (if that is required for your project).

To use this network with another service run it like this:

```bash
docker run -d --net=container:openvpn-easy -v /path/to/znc-cfg:/znc-data znc
```

The key part is `--net=container:openvpn-easy` which tells docker to utilize the network of the other container so that you can access resources that are behind a vpn from another container.

_I personally use this to access an irc server that is behind a vpn to provide a bouncer on a server so that I can get my messages on my laptop when I log back on every day._

## Contributing

Interested in contributing through sourcehut? Checkout [this intro](https://git-send-email.io) to `git send-email` or feel free to use the GitHub repo.
