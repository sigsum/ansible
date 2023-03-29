.. _ansible_collections.sigsum.ansible.docsite.changelog:

=========
CHANGELOG
=========

.. contents::
   :local:


v1.0.0
======

Release Summary
---------------

This is the first major release of the ``sigsum.ansible`` collection. Going forward releases will be versioned according
to `SEMVER <https://semver.org/>`_


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
