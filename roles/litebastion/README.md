litebastion
===========
An ansible role that installs, configures, and manages the [litebastion
software][] as a systemd service.

The litebastion service is restarted on changes to (i) the systemd service file,
(ii) the selected software version, or (iii) the software's runtime options.
The litebastion service is reloaded with SIGHUP if the list of backends change.

Read [C2SP/https-bastion][] to learn more about what a bastion host is.

[litebastion software]: https://github.com/FiloSottile/litetlog?tab=readme-ov-file#litebastion
[C2SP/https-bastion]: https://github.com/C2SP/C2SP/blob/main/https-bastion.md

Requirements
------------
The target system must have systemd installed and running.  The system's package
manager must also install a recent enough golang compiler (or the playbook will
fail).  On Debian stable, you may set `litebastion_debian_backports: true`.

Role Variables
--------------
You will likely want to set the following variables:

* `litebastion_goversion`
* `litebastion_email`
* `litebastion_host`
* `litebastion_listen`
* `litebastion_backends`

See [defaults/main.yml](./defaults/main.yml) for details.

Dependencies
------------
None

Install the role
----------------
Import the `litebastion` role as `./roles/litebastion`:

    $ ansible-galaxy install git+https://git.glasklar.is/sigsum/admin/litebastion,main -p ./roles

Replace `main` with a git-tag to checkout a fixed version.

Use the `--force` flag to downgrade or upgrade the version.

View installed roles
---------------------
View roles that were installed in the `./roles` directory:

    $ ansible-galaxy role list -p ./roles

Example Playbook
----------------

    ---
    - name: Example playbook
      hosts: all
      become: true
      roles:
        - litebastion

Hints:
- `systemctl status litebastion`
- `journalctl -u litebastion.service`

License
-------
BSD 2-Clause License

Contact
-------
* IRC room `#sigsum`
* Matrix room `#sigsum` which is bridged with IRC
* The [sigsum-general][] mailing list

[sigsum-general]: https://lists.sigsum.org/mailman3/postorius/lists/sigsum-general.lists.sigsum.org/
