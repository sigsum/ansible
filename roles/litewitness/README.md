# litewitness

An ansible role that deploys a [transparency-log witness][].  The private key is
accessed using [sigsum-agent][], a tiny ssh-agent signing oracle for various
Ed25519 backends.  All witness state is kept in a `sqlite3` database.

[transparency-log witness]: https://c2sp.org/tlog-witness
[sigsum-agent]: https://git.glasklar.is/sigsum/core/key-mgmt/

## Requirements

Only Debian 12 and later is supported right now.

## Role variables

See [defaults/main.yml](./defaults/main.yml).  See also
[vars/main.yml](./vars/main.yml) for the `sqlite3` database location.

## Dependencies

* sigsum.ansible.golang
* sigsum.ansible.sigsum_agent

You will need to enable backports on Debian bookworm systems, see
[roles/golang](../roles/golang).  You will also need to configure sigsum agent
(preferably with an HSM), see [roles/sigsum_agent](../roles/sigsum_agent).

For information on the Go-installed witness tools, see [torchwood][].

[torchwood]: https://github.com/FiloSottile/torchwood

## Example playbook

See the litewitness [molecule-test](../../extensions/molecule/litewitness) for an example
that deploys this service with a soft key and a localhost listening-address.

## Using several instances of the litewitness role

See [comment in the molecule-test converge.yml
file](../../molecule/litewitness/converge.yml) for an example of how
to use two instances of the litewitness role.
