yubihsm-connector
=================
An ansible role that installs Yubico's [yubihsm-connector][] from the system's
package manager.  Expect the `yubihsm-connector` user and systemd service to be
added.  The yubihsm-connector will be listening on `localhost:12345`.

[yubihsm-connector]: https://developers.yubico.com/yubihsm-connector/

Requirements
------------
Debian bookworm or later.  Note that backports will be used on Debian bookworm.

On Debian, in order to use a specific .deb instead of installing from
backports, define `yubihsm_connector_pkg`. Example:
```
# While waiting for yubihsm-connector > 3.0.5
yubihsm_connector_pkg:
  - name: yubihsm-connector_3.0.7-1_arm64.deb
    arch: aarch64
    url: https://www.glasklarteknik.se/archive/pkg/yubihsm-connector_3.0.7-1_arm64.deb
    checksum: sha256:ade548f674e4b9b795ed43b02c037e9aa8dd863b79e25b70c18870e8c396eee6
  - name: yubihsm-connector_3.0.7-1_amd.deb
    arch: x86_64
    url: https://www.glasklarteknik.se/archive/pkg/yubihsm-connector_3.0.7-1_amd64.deb
    checksum: sha256:8d99dcc676490d7d7e87c73a7f1fa8c7f9620c303c476b940de24875fe4f9db4
```

Role variables
--------------
See [defaults/main.yml](./defaults/main.yml).  In a future version of this role
we may add additional variables that help tune `/etc/yubihsm-connector.yml`.  In
other words, if the defaults are not good enough you need to do that manually.

Dependencies
------------
None.

Example playbook
----------------
See the [molecule converge playbook](../../extensions/molecule/yubihsm_connector/converge.yml).
