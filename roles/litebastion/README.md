# litebastion

An ansible role that installs, configures, and manages the [litebastion
software][] as a systemd service.

The litebastion service is restarted on changes to (i) the systemd service file,
(ii) the selected software version, or (iii) the software's runtime options.
The litebastion service is reloaded with SIGHUP if the list of backends change.

Read [C2SP/https-bastion][] to learn more about what a bastion host is.

[litebastion software]: https://github.com/FiloSottile/litetlog?tab=readme-ov-file#litebastion
[C2SP/https-bastion]: https://github.com/C2SP/C2SP/blob/main/https-bastion.md

## Requirements

The target system must have systemd installed and running.  The system's package
manager must also install a recent enough golang compiler (or the playbook will
fail).  On Debian stable, you may set `litebastion_debian_backports: true`.

## Role variables

You will likely want to set the following variables:

* `litebastion_goversion`
* `litebastion_email`
* `litebastion_host`
* `litebastion_listen`
* `litebastion_backends`

See [defaults/main.yml](./defaults/main.yml) for details.

## Dependencies

* sigsum.ansible.golang

You will need to enable backports on Debian bookworm systems, see
[roles/golang](roles/golang).

## Example playbook

See the litebastion [molecule-test](../../molecule/litebastion) for an
example.

Hints:
- `systemctl status litebastion`
- `journalctl -u litebastion.service`
