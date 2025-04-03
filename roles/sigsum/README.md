sigsum
======
An ansible role that deploys Sigsum transparency log servers.  Please
note that only a single primary log or a single secondary log can be
operated on the same target system.

Read more about the Sigsum transparency log server software and its
configuration
[here](https://git.glasklar.is/sigsum/core/log-go/-/tree/main/doc#configuring-and-using-the-log-server-implementation).

Requirements
------------
Only Debian distributions are supported right now.

Role variables
--------------
See [defaults/main.yml](./defaults/main.yml).

Dependencies
------------
* sigsum.ansible.mariadb
* sigsum.ansible.golang (imported by the sigsum role, no action needed)
* sigsum.ansible.yubihsm_connector (optional)
* sigsum.ansible.sigsum_agent (optional)

Example playbook
----------------
See the [molecule converge playbook](../../molecule/default/converge.yml) for
examples that deploy a primary-secondary log setup for database replication, as
well as a standalone primary where the key is accessed using the ssh-agent
protocol.  If you want to use sigsum-agent with the YubiHSM backend, you might
want to install the connector with `role: sigsum.ansible.yubihsm_connector`.
