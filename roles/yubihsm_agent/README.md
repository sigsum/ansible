Use [sigsum-agent][] and [YubHSM Connector][] to let a Sigsum log use
a YubiHSM2 for its signing key.

## Process separation

Using systemd socket-based activation (see daemon(7) and
systemd.socket(5)), the agent is started when the log tries to open
its well known socket.

| program            | user              | socket                          | config                                                              |
|--------------------|-------------------|---------------------------------|---------------------------------------------------------------------|
| sigsum-log-primary | sigsum            |                                 | $SSH_AUTH_SOCK=/run/user/X/sigsum-agent.socket; key-file=logkey.pub |
| sigsum-agent       | sigsum-agent      | /run/user/X/sigsum-agent.socket | -a AUTH -i KEYID -c localhost:5605$N                                |
| yubihsm-connector  | yubihsm-connector | tcp:/localhost:5605$N           | listen: 127.0.0.1:5605$N                                            |

## Systemd unit file examples
```
sigsum@poc:~$ cat ~/.config/systemd/user/yubihsm-agent.service
[Unit]
Description=ssh-agent with YubiHSM support for Sigsum log jellyfish

[Service]
Type=exec
StandardInput=socket
ExecStart=%h/go/bin/yubihsm-agent -a %h/.config/sigsum/jellyfish/yhsm-auth -i 500
KillSignal=SIGHUP

[Install]
WantedBy=default.target
sigsum@poc:~$ cat ~/.config/systemd/user/yubihsm-agent.socket
[Unit]
Description=yubihsm-agent activation socket

[Socket]
ListenStream=%h/.local/run/%n
SocketMode=0600

[Install]
WantedBy=sockets.target
sigsum@poc:~$ cat ~/.config/systemd/user/yubihsm-agent-lite.service
[Unit]
Description=ssh-agent with YubiHSM support for Sigsum log jellyfish, softkey

[Service]
Type=exec
StandardInput=socket
ExecStart=%h/go/bin/yubihsm-agent -k %h/.config/sigsum/jellyfish/logkey
KillSignal=SIGHUP

[Install]
WantedBy=default.target
sigsum@poc:~$ cat ~/.config/systemd/user/yubihsm-agent-lite.socket
[Unit]
Description=yubihsm-agent activation socket, softkey

[Socket]
ListenStream=%h/.local/run/%n
SocketMode=0600

[Install]
WantedBy=sockets.target
```

[sigsum-keymgmt]: https://git.glasklar.is/sigsum/core/key-mgmt
[YubHSM Connector]: https://developers.yubico.com/yubihsm-connector/
