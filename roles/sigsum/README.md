sigsum
======
An ansible role that deploys Sigsum log servers.  Please note that only a single
primary log or a single secondary log can be operated on the same target system.

Read more about the Sigsum log server software and its configuration
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
* sigsum.ansible.golang (or something else that installs Go)
* sigsum.ansible.yubihsm_connector (optional)
* sigsum.ansible.sigsum_agent (optional)

Example playbook
----------------
See the [molecule converge playbook](../../molecule/default/converge.yml) which
deploys a primary log-server.  If you are using sigsum-agent with the YubiHSM
backend, you would also want to add `role: sigsum.ansible.yubihsm_connector`.
Note that you need to do your own key generation whenever sigsum-agent is used.
