sigsum-agent
============
An ansible role that installs [sigsum-agent][], a tiny ssh-agent signing
oracle for Ed25519 keys.  The currently supported backends are:

* Unencrypted file on disk (soft key)
* [YubiHSM2][]

The main feature of this role is *process separation*: the user that needs to
sign a message can do so without access to the private key or any other soft
credentials to unlock a hardware module.  In other words, only the sigsum-agent
service needs access to soft key-files or passphrases on disk.  This is achieved
using systemd socket-based activation, see `daemon(7)` and `systemd.socket(5)`.
I.e., the sigsum-agent service is started by systemd when an allowed signer
connects to a well-known UNIX socket using the ssh-agent protocol.  For such a
connection to succeed, the signer must be a member of the sigsum-agent's group.

[sigsum-agent]: https://git.glasklar.is/sigsum/core/key-mgmt/
[YubiHSM2]: https://developers.yubico.com/YubiHSM2/

Requirements
------------
Debian trixie / Fedora 43.  This role likely runs on later Debian and Fedora
distributions as well, but it is not part of our testing and so is unsupported.

It is assumed that the target system has `systemd` available, and that
`sigsum-agent` can be installed using the distribution's package manager.  You
will need to configure [Glasklar's package repository][] (or your own) for this.

When using a [YubiHSM2][] backend, yubihsm-connector instances must already be
configured, for example with [roles/yubihsm_connector](../yubihsm_connector).

[Glasklar's package repository]: https://git.glasklar.is/glasklar/infra/packages/

Role variables
--------------

See [defaults/main.yml](./defaults/main.yml).  Note that exactly one backend
must be configured: `sigsum_agent_soft_key` or `sigsum_yubihsm_credentials`.

Dependencies
------------
None.

Example playbook
----------------
See the sigsum-agent [molecule test](../../extensions/molecule/sigsum_agent) for
an example that deploys this role.
