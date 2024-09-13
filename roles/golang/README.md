golang
======
An ansible role that installs Go using the system's package manager.

Requirements
------------
Only Debian distributions are supported right now.

Role variables
--------------
See [defaults/main.yml](./defaults/main.yml).  There are, e.g., options for
configuring Debian backports and enforcing Sigsum's minimum Go version.

Dependencies
------------
None.

Example playbook
----------------
See the [molecule converge playbook](../../molecule/golang/converge.yml).
