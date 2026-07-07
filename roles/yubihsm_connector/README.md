yubihsm-connector
=================
An ansible role that installs Yubico's [yubihsm-connector][].

The package-provided `yubihsm-connector.service` is disabled.  Instead, this
role manages one or more YubiHSM connector instances through
`yubihsm-connector@.service`.

Optionally, periodic monitoring of if a given YubiHSM device is plugged in can
be enabled.

[yubihsm-connector]: https://developers.yubico.com/yubihsm-connector/

Requirements
------------
Debian bookworm or later (backports will be used on Debian bookworm) or Fedora.

Role variables
--------------

See [defaults/main.yml](./defaults/main.yml).

Dependencies
------------
None.

Example playbook
----------------
```
- hosts: all
  roles:
    - role: sigsum.tlog.yubihsm_connector
      yubihsm_connector_instances:
        - name: hsm1
          serial_number: 11111111
          port: 12345
```
