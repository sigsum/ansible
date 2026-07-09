# litewitness

An ansible role that deploys a [transparency-log witness][].  The private key is
accessed using [sigsum-agent][], a tiny ssh-agent signing oracle for various
Ed25519 backends.  All witness state is kept in a `sqlite3` database.

[transparency-log witness]: https://c2sp.org/tlog-witness
[sigsum-agent]: https://git.glasklar.is/sigsum/core/key-mgmt/

## Requirements

Debian trixie / Fedora 43.  This role likely runs on later Debian and Fedora
distributions as well, but it is not part of our testing and so is unsupported.

It is assumed that the target system has `systemd` available, and that
`litewitness` can be installed using the distribution's package manager.  You
will need to configure [Glasklar's package repository][] (or your own) for this.

## Role variables

See [defaults/main.yml](./defaults/main.yml).  Note that you need to set
`litewitness_name` and `litewitness_keygrip` for a working setup. See also
[vars/main.yml](./vars/main.yml) for the `sqlite3` database location.

## Dependencies

* sigsum.tlog.sigsum_agent

## Example playbook

See the litewitness [molecule test](../../extensions/molecule/litewitness) for
an example that deploys this role, including sigsum-agent configuration.
