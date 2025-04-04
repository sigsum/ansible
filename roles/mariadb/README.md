mariadb
=======
An ansible role that sets up the mariadb database, along with users
and table permissions.

Requirements
------------
Only Debian distributions are supported right now.

Role variables
--------------
See [defaults/main.yml](./defaults/main.yml).

Dependencies
------------
Uses the mariadb-server Debian package.

Example usage
-------------
See the [molecule converge playbook](../../molecule/default/converge.yml).
