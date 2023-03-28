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

* Rename the following variables

  * ``sigsum_key`` to ``sigsum_key_file``

  * ``sigsum_secondary_pubkey`` to ``sigsum_secondary_pubkey_file``

  * ``sigsum_rate_limit_config`` to ``sigsum_rate_limit_file``

* New variables

  * ``sigsum_backend`` to specify the sigsum backend. Currently only takes ``trillian`` as a value.

* Removed variables

  * ``sigsum_tree_id`` - internal implementation detail

  * ``sigsum_ephemeral_test_backend``


Minor Changes
-------------

* Dependency updates:

  * ``log-go`` updated to ``v0.9.0``

  * ``sigsum-go`` updated to ``v.0.1.23``
