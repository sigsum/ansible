# Sigsum ansible collection

This repository contains ansible roles for deploying sigsum
transparency logs and witnesses on Debian-bookworm systems.  Each role
has a slightly more detailed README.

## Install

Checkout the `ansible.sigsum` collection in your ansible repository:

    $ mkdir -p collections
    $ ansible-galaxy collection install git+https://git.glasklar.is/sigsum/admin/ansible.git,main -p collections/

Replace `main` with a git-tag to checkout a fixed version.

Show the installed sigsum collection version using:

    $ ansible-galaxy collection list -p ./collections | grep sigsum

## Usage

See [example playbook](./molecule/default/converge.yml) and its
[configuration](./molecule/default/host_vars/) for two examples:
- Deploy a primary-secondary log setup for database replication
- Deploy a primary log where the key is accessed using the ssh-agent protocol

See the [sigsum-agent](./roles/sigsum_agent) and
[yubihsm-connector](./roles/yubihsm_connector) roles for further details on how
to do similar ssh-agent deployments with keys [protected by YubiHSMs][].

Read more about the Sigsum log server software and its configuration
[here](https://git.glasklar.is/sigsum/core/log-go/-/tree/main/doc#configuring-and-using-the-log-server-implementation).

[protected by YubiHSMs]: https://git.glasklar.is/sigsum/core/key-mgmt/#documentation

## Development

The [HACKING](./HACKING) file describes how to run the tests.

## Releases

See [NEWS](./NEWS).

For release announcements, subscribe to the [sigsum-announce][] mailing list.

[sigsum-announce]: https://lists.sigsum.org/mailman3/hyperkitty/list/sigsum-announce@lists.sigsum.org/

## Licensing
See [LICENSE](./LICENSE).

## Contact

* Homepage https://www.sigsum.org/
* IRC room `#sigsum` (at OFTC.net network)
* Matrix room `#sigsum` (at matrix.org) which is bridged with IRC
* The [sigsum-general][] mailing list

[sigsum-general]: https://lists.sigsum.org/mailman3/hyperkitty/list/sigsum-general@lists.sigsum.org/
