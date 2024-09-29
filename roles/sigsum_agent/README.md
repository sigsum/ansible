sigsum-agent
============
A role that installs the [sigsum-agent software][].  For overview, sigsum-agent
is a tiny ssh-agent signing oracle that only works for a few Ed25519 backends:

* Soft key
* [YubiHSM2][]

The main feature of this role is *process separation*: the user that needs to
sign a message can do so without access to the private key or any other soft
credentials to unlock a hardware module.  In other words, only the sigsum-agent
service needs access to soft key-files or passphrases on disk.  This is achieved
using systemd socket-based activation, see `daemon(7)` and ` systemd.socket(5)`.
I.e., the sigsum-agent service is started by systemd when an allowed signer
connects to a well-known UNIX socket using the ssh-agent protocol.  For such a
connection to succeed, the signer must be a member of the sigsum-agent's group.

[sigsum-agent software]: https://git.glasklar.is/sigsum/core/key-mgmt/
[YubiHSM2]: https://developers.yubico.com/YubiHSM2/

Requirements
------------
It is assumed that the system already contains:

* systemd
* Go (you may want to use [roles/golang](../golang) for this)
* yubihsm-connector (only required if [YubiHSM2][] is used as backend -- you may
  want to use [roles/yubihsm_connector](../yubihsm_connector) for this)

Provided that the above requirements are satisfied, the role should work on most
Linux system.  Please note that we only test on Debian distributions though, see
[molecule/sigsum_agent](../../molecule/sigsum_agent/molecule.yml).

It is also assumed that a backend key has already been generated before using
this role.  In other words, this role does not help with any key generation.

While the role is user-scoped (e.g., only writing configuration in the specified
sigsum-agent's home directory and using `systemd --user` for services), it is
not supported to configure more than one sigsum-agent per play yet.

Role variables
--------------
See [defaults/main.yml](./defaults/main.yml).  You will at minimum need to
configure access to the private key by defining *one* of these backends:

* Soft key: `sigsum_agent_soft_key`
* YubiHSM: `sigsum_agent_yubihsm_passphrase`

The `sigsum_agent_socket` variable determines where the UNIX socket is located.

Dependencies
------------
None.

Example playbook
----------------
See the [molecule converge playbook](../../molecule/sigsum_agent/converge.yml).
