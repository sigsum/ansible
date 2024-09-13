sigsum
======
An ansible role that deploys Sigsum log servers.

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

Example playbook
----------------
See the [molecule converge playbook](../../molecule/default/converge.yml) which
deploys a primary log-server.
