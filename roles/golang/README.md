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

Known limitations
-----------------
If Go is already installed from, e.g., bookworm stable and backports is later
added, then the old (stable) Go installation needs to be purged manually.  I.e.,
otherwise the old Go package stays and the backported Go will not be installed.

Example playbook
----------------
See the [molecule converge playbook](../../extensions/molecule/golang/converge.yml).
