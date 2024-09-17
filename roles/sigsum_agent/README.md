sigsum-agent
============
A role that installs the [sigsum-agent software][].  For overview, sigsum-agent
is a tiny ssh-agent signing oracle that only works for a few Ed25519 backends:

* Soft key (unencrypted file on disk)
* TODO: YubiHSM

The main feature of this role is *process separation*: the user that needs to
sign a message can do so without access to the private key or any other soft
credentials like passphrases to unlock a hardware module.  This is achieved
using systemd socket-based activation, see `daemon(7)` and ` systemd.socket(5)`.
I.e., the sigsum-agent service is started by systemd when an allowed signer
connects to a well-known UNIX socket using the ssh-agent protocol.  For such a
connection to succeed, the signer must be a member of the sigsum-agent's group.

[sigsum-agent software]: https://git.glasklar.is/sigsum/core/key-mgmt/

Requirements
------------
It is assumed that the system already contains:

* systemd
* Go

Provided that the above requirements are satisfied, the role should work on most
Linux system.  Please note that we only test on Debian distributions though, see
[molecule/sigsum_agent](../../molecule/sigsum_agent/molecule.yml).

It is also assumed that a backend key has already been generated before using
this role.  In other words, this role does not help with any key generation.

Role variables
--------------
See [defaults/main.yml](./defaults/main.yml).  You will at minimum need to
configure access to the private key by defining *one* of these backends:

* Soft key: `sigsum_agent_soft_key`
* YubiHSM: TODO

The `sigsum_agent_socket` variable determines where the UNIX socket is located.

To have multiple sigum-agent services on the same system, include the role
several times but with different values for the `sigsum_agent_user` variable.

Dependencies
------------
None.

Example playbook
----------------
See the [molecule converge playbook](../../molecule/sigsum_agent/converge.yml)
which installs two instances of the sigsum-agent service on the same system.
