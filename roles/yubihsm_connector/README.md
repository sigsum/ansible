yubihsm-connector
=================
An ansible role that installs Yubico's [yubihsm-connector][].

The package-provided `yubihsm-connector.service` is disabled.  This role instead
manages one or more connector instances through `yubihsm-connector@.service`.

If you need periodic monitoring of if a given YubiHSM device is (not) plugged
into the system, this can optionally be enabled (see role variables).

[yubihsm-connector]: https://developers.yubico.com/yubihsm-connector/

Requirements
------------
Debian bookworm (backports will be used) / Debian trixie / Fedora 43.  This role
likely runs on later Debian and Fedora distributions as well, but it is not part
of our testing and so is unsupported.  The target system also needs `systemd`.

Role variables
--------------

See [defaults/main.yml](./defaults/main.yml).  Note that you need to specify at
least one YubiHSM connector instance (`yubihsm_connector_instances`).

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
