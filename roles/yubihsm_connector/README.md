yubihsm-connector
=================
An ansible role that installs Yubico's [yubihsm-connector][] from the system's
package manager.  Expect the `yubihsm-connector` user and systemd service to be
added.  The yubihsm-connector will be listening on `localhost:12345`.

The role also optionally sets up monitoring of a specific YubiHSM USB
device being present.

[yubihsm-connector]: https://developers.yubico.com/yubihsm-connector/

Requirements
------------
Debian bookworm or later.  Note that backports will be used on Debian bookworm.

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
See the [molecule converge playbook](../../molecule/yubihsm_connector/converge.yml).
