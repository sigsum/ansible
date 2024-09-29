.. _ansible_collections.sigsum.ansible.docsite.changelog:

=========
CHANGELOG
=========

.. contents::
   :local:

v1.1.1
======

This is bug-fix only release (WIP changelog).

Bug fixes
---------

The dynamic handler names in the sigsum_agent role were not functioning on some
systems (tasks failed).  Now static handler names are used instead.  This means
it is not yet supported to configure more than one sigsum-agent per play.

The sigsum role did not work when omitting the MYSQL root password.  This has
now been fixed by using a UNIX socket instead of the default host and port.

v1.1.0
======

Release summary
---------------

This release adds support for accessing private keys using the ssh-agent
protocol.  See the new sigsum-agent role for further details on how to use the
ssh-agent protocol for process separation and private keys backed by YubiHSMs.

This release also adds support for rate-limit configurations.  It is off by
default, but can be enabled by setting sigsum_allowlist_limit >= 0.  See also
the related settings sigsum_allowlist_keys and sigsum_allowlist_domains.

This release comes with some internal refactoring and includes bug fixing.  Most
notably, the log will no longer restart every time the sigsum role runs.  A few
variables have been dropped in the process of refactoring, but no breakage is
expected.  See the detailed notes if you want to clean-up your sigsum variables.

Documentation and testing have been improved.  There are now molecule tests that
also serve as examples of how to configure a primary-secondary log pair as well
as a stand-alone primary that uses the sigsum-agent role and ssh-agent protocol.

Debian bullseye has reached end of life.  We now target Debian bookworm systems.

Detailed notes
--------------

The target environment for running molecule tests have been changed to podman.
Instructions for running the tests have been migrated and improved, see HACKING.

The distribution that our roles and tests target have been updated from Debian
bullseye to Debian bookworm.  Debian bullseye may work but is not tested by us.

A role that installs and configures sigsum-agent has been added, see
roles/sigsum_agent.  For overview, sigsum-agent is a tiny ssh-agent signing
oracle that works with two backends: unencrypted key-file and YubiHSM.  Use of
this role is optional, i.e., the sigsum role has only been *extended* to work
with configurations that access private keys using the ssh-agent protocol.  A
related role for installing the YubiHSM connector has been added, see details in
roles/yubihsm_connector.  Use of roles/yubihsm_connector is also optional.

Git-clone checkouts of Go tooling (sigsum-go, log-go, and Trillian) have been
deprecated.  The required tools are installed directly using Go's tooling.  No
action is needed by existing users, but these variables are now ignored:

* sigsum_trillian_srcdir (this directory can be deleted on the target host)
* sigsum_trillian_repo
* sigsum_lib_srcdir (this directory can be deleted on the target host)
* sigsum_lib_repo
* sigsum_log_srcdir (this directory can be deleted on the target host)
* sigsum_log_repo

The sigsum role is more idempotent now.  This fixes a bug where the Sigsum log
servers would restart every time the role runs, causing unnecessary downtime.

Diretories and files for the sigsum user are now configured with user-only
permissions.  For example, directory permissions were changed from 0755 to 0700.

Documentation of the sigsum role's default variables have been improved
significantly.  You are encouraged to take a look in defaults/main.yml.

An option to tune Trillian's log verbosity has been added:

* sigsum_trillian_verbosity

The default is WARNING.  This fixes a nit where the system's journal got spammed
with INFO output.

Configuration of rate-limits have been added.  The relevant variables are:

* sigsum_allowlist_limit
* sigsum_allowlist_keys
* sigsum_allowlist_domains

To enable rate limits (off by default), set sigsum_allowlist_limit >= 0.

v1.0.4
======

Release Summary
---------------

Bumped default log-go version from v0.14.0 to v0.14.1.



v1.0.3
======

Release Summary
---------------

Bumped default sigsum-go version from v0.3.4 to v0.6.1.

Bumped default log-go version v0.12.0 to v0.14.0.


v1.0.2
======

Release Summary
---------------

Bumped default trillian version from v1.5.1 to v1.5.2.

Bumped default sigsum-lib-go version from v0.1.23 to v0.3.4.

Bumped default sigsum-log-go version from v0.9.0 to v0.12.0.

Added ``sigsum_witness_config`` option to the ``sigsum.ansible.sigsum`` role to enable witness configuration for the primary node.

Removed the ``sigsum_sth_file`` and ``sigsum_trillian_tree_id_file`` options. The directory component of these were not being used, only the filename component. These filenames are now fixed values (``sth`` and ``tree-id``).


v1.0.1
======

Release Summary
---------------

Added ``no_log`` options to the ``sigsum.ansible.mariadb`` role to hide passwords from showing in the ansible log output.


v1.0.0
======

Release Summary
---------------

This is the first major release of the ``sigsum.ansible`` collection. Going forward releases will be versioned according
to `SEMVER <https://semver.org/>`_


Breaking Changes
----------------

The ``tree-id`` file in deployed installations needs to have ``tree-id=`` prepended the value in the file. If this file is not updated the log will fail to start.

This can be done by locating the installation path (usually under ``/var/sigsum``), finding the ``tree-id`` files and running the below code or similar.

.. code-block:: bash

  $ echo "tree-id=$(cat tree-id)" > tree-id


Changes 
-------


* ``sigsum_key`` now assumes a string with a OpenSSH formated key is passed. The old variable is preserved with ``sigsum_key_file``.

* ``sigsum_secondary_pubkey`` now assumes a string with an OpenSSH formated public key. The old variable is preserved with ``sigsum_secondary_pubkey_file``.

* Rename the following variables

  * ``sigsum_rate_limit_config`` to ``sigsum_rate_limit_file``

* New variables

  * ``sigsum_backend`` to specify the sigsum backend. Currently only takes ``trillian`` as a value.

  * ``sigsum_key_file`` takes a file location for the Sigsum key.

  * ``sigsum_secondary_pubkey_file`` takes a file location for the public key of the secondary node.

* Removed variables

  * ``sigsum_tree_id`` - internal implementation detail

  * ``sigsum_ephemeral_test_backend``


Minor Changes
-------------

* Dependency updates:

  * ``log-go`` updated to ``v0.9.0``

  * ``sigsum-go`` updated to ``v.0.1.23``
