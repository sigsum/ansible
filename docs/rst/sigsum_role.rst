
.. Document meta

:orphan:

.. role:: ansible-attribute-support-label
.. role:: ansible-attribute-support-property
.. role:: ansible-attribute-support-full
.. role:: ansible-attribute-support-partial
.. role:: ansible-attribute-support-none
.. role:: ansible-attribute-support-na
.. role:: ansible-option-type
.. role:: ansible-option-elements
.. role:: ansible-option-required
.. role:: ansible-option-versionadded
.. role:: ansible-option-aliases
.. role:: ansible-option-choices
.. role:: ansible-option-choices-default-mark
.. role:: ansible-option-default-bold

.. Anchors

.. _ansible_collections.sigsum.ansible.sigsum_role:

.. Anchors: aliases


.. Title

sigsum.ansible.sigsum role -- The main entry point for the myapp role.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. Collection note

.. note::
    This role is part of the `sigsum.ansible collection <https://galaxy.ansible.com/sigsum/ansible>`_ (version 0.0.5).

    To install it use: :code:`ansible-galaxy collection install sigsum.ansible`.

    To use it in a playbook, specify: :code:`sigsum.ansible.sigsum`.

.. contents::
   :local:
   :depth: 2


.. Entry point title

Entry point ``main`` -- The main entry point for the myapp role.
----------------------------------------------------------------

.. version_added


.. Deprecated


Synopsis
^^^^^^^^

.. Description

- Install and setup the sigsum transparency log service on the host.
- The role requires a reachable mysql database for data storage, see the mariadb role.

.. Requirements


.. Options

Parameters
^^^^^^^^^^

.. rst-class:: ansible-option-table

.. list-table::
  :width: 100%
  :widths: auto
  :header-rows: 1

  * - Parameter
    - Comments

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_allow_test_domain"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_allow_test_domain:

      .. rst-class:: ansible-option-title

      **sigsum_allow_test_domain**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_allow_test_domain" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`boolean`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      allow submit tokens from test.sigsum.org


      .. rst-class:: ansible-option-line

      :ansible-option-choices:`Choices:`

      - :ansible-option-choices-entry-default:`false` :ansible-option-choices-default-mark:`← (default)`
      - :ansible-option-choices-entry:`true`


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_backend"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_backend:

      .. rst-class:: ansible-option-title

      **sigsum_backend**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_backend" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      the configured sigsum backend


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"backend"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_db_name"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_db_name:

      .. rst-class:: ansible-option-title

      **sigsum_db_name**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_db_name" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The sigsum database name


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"test"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_db_pw"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_db_pw:

      .. rst-class:: ansible-option-title

      **sigsum_db_pw**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_db_pw" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The sigsum database password


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"changeme"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_ephemeral_test_backend"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_ephemeral_test_backend:

      .. rst-class:: ansible-option-title

      **sigsum_ephemeral_test_backend**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_ephemeral_test_backend" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`boolean`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      if set, enables in-memory backend, with NO persistent storage


      .. rst-class:: ansible-option-line

      :ansible-option-choices:`Choices:`

      - :ansible-option-choices-entry-default:`false` :ansible-option-choices-default-mark:`← (default)`
      - :ansible-option-choices-entry:`true`


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_external_endpoint"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_external_endpoint:

      .. rst-class:: ansible-option-title

      **sigsum_external_endpoint**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_external_endpoint" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      host:port specification of where sigsum-log-primary serves clients


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"127.0.0.1:14784"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_internal_endpoint"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_internal_endpoint:

      .. rst-class:: ansible-option-title

      **sigsum_internal_endpoint**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_internal_endpoint" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      host:port specification of where sigsum-log-primary serves other log nodes


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"192.168.19.1:14785"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_interval"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_interval:

      .. rst-class:: ansible-option-title

      **sigsum_interval**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_interval" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      interval used to rotate the log's cosigned STH


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"30s"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_key"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_key:

      .. rst-class:: ansible-option-title

      **sigsum_key**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_key" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      key string (openssh format), either unencrypted private key, or a public key (accessed via ssh-agent)


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_key_file"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_key_file:

      .. rst-class:: ansible-option-title

      **sigsum_key_file**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_key_file" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      key file path (openssh format), either unencrypted private key, or a public key (accessed via ssh-agent)


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_lib_repo"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_lib_repo:

      .. rst-class:: ansible-option-title

      **sigsum_lib_repo**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_lib_repo" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The sigsum library source repository


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"https://git.glasklar.is/sigsum/core/sigsum-go"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_lib_srcdir"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_lib_srcdir:

      .. rst-class:: ansible-option-title

      **sigsum_lib_srcdir**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_lib_srcdir" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The sigsum library source location


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"/usr/src/sigsum-lib-go"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_lib_version"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_lib_version:

      .. rst-class:: ansible-option-title

      **sigsum_lib_version**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_lib_version" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The sigsum library repository version


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"v0.1.22-22-ged74255"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_log_file"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_log_file:

      .. rst-class:: ansible-option-title

      **sigsum_log_file**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_log_file" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`path`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      file to write logs to


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"stderr"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_log_level"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_log_level:

      .. rst-class:: ansible-option-title

      **sigsum_log_level**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_log_level" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      log level


      .. rst-class:: ansible-option-line

      :ansible-option-choices:`Choices:`

      - :ansible-option-choices-entry:`"debug"`
      - :ansible-option-choices-entry-default:`"info"` :ansible-option-choices-default-mark:`← (default)`
      - :ansible-option-choices-entry:`"warning"`
      - :ansible-option-choices-entry:`"error"`


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_log_repo"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_log_repo:

      .. rst-class:: ansible-option-title

      **sigsum_log_repo**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_log_repo" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The sigsum log source repository


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"https://git.glasklar.is/sigsum/core/log-go"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_log_srcdir"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_log_srcdir:

      .. rst-class:: ansible-option-title

      **sigsum_log_srcdir**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_log_srcdir" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The sigsum log source location


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"/usr/src/sigsum-log-go"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_log_version"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_log_version:

      .. rst-class:: ansible-option-title

      **sigsum_log_version**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_log_version" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The sigsum log repository version


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"v0.8.0-55-g25420cb"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_logname"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_logname:

      .. rst-class:: ansible-option-title

      **sigsum_logname**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_logname" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The sigsum log server name


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"sigsum"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_max_range"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_max_range:

      .. rst-class:: ansible-option-title

      **sigsum_max_range**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_max_range" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`integer`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      maximum number of entries that can be retrived in a single request


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`4096`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_primary_url"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_primary_url:

      .. rst-class:: ansible-option-title

      **sigsum_primary_url**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_primary_url" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      primary node endpoint for fetching leaves (for secondary nodes)


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`""`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_rate_limit_file"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_rate_limit_file:

      .. rst-class:: ansible-option-title

      **sigsum_rate_limit_file**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_rate_limit_file" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      enable rate limiting, based on given config file.

      For detailed documentation see \ https://git.glasklar.is/sigsum/core/log-go/-/blob/main/doc/rate-limit.md\ .


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`""`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_role"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_role:

      .. rst-class:: ansible-option-title

      **sigsum_role**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_role" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The sigsum primary log type


      .. rst-class:: ansible-option-line

      :ansible-option-choices:`Choices:`

      - :ansible-option-choices-entry-default:`"primary"` :ansible-option-choices-default-mark:`← (default)`
      - :ansible-option-choices-entry:`"secondary"`


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_secondary_pubkey"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_secondary_pubkey:

      .. rst-class:: ansible-option-title

      **sigsum_secondary_pubkey**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_secondary_pubkey" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      public key string for secondary node

      needs a file that has a openssh formated public key

      only used when setting up a secondary for the primary node


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_secondary_pubkey_file"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_secondary_pubkey_file:

      .. rst-class:: ansible-option-title

      **sigsum_secondary_pubkey_file**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_secondary_pubkey_file" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      public key file for secondary node

      needs a file that has a openssh formated public key

      only used when setting up a secondary for the primary


      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_secondary_url"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_secondary_url:

      .. rst-class:: ansible-option-title

      **sigsum_secondary_url**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_secondary_url" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      secondary node endpoint for fetching latest replicated tree head


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`""`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_timeout"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_timeout:

      .. rst-class:: ansible-option-title

      **sigsum_timeout**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_timeout" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      timeout for backend requests


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"10s"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_trillian_batch_size"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_trillian_batch_size:

      .. rst-class:: ansible-option-title

      **sigsum_trillian_batch_size**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_trillian_batch_size" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`integer`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      Trillian batch size.

      Number of jobs the trillian server should process when it wakes up for sequencing.

      The option 'sigsum\_trillian\_sequencer\_interval' specifies how often trillian wakes up.


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`512`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_trillian_repo"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_trillian_repo:

      .. rst-class:: ansible-option-title

      **sigsum_trillian_repo**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_trillian_repo" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The trillian source repository


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"https://github.com/google/trillian"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_trillian_rpc_server"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_trillian_rpc_server:

      .. rst-class:: ansible-option-title

      **sigsum_trillian_rpc_server**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_trillian_rpc_server" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      host:port specification of where Trillian serves clients


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"localhost:6962"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_trillian_sequencer_interval"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_trillian_sequencer_interval:

      .. rst-class:: ansible-option-title

      **sigsum_trillian_sequencer_interval**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_trillian_sequencer_interval" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      Trillian sequencer interval.

      This tunes how often trillian wakes up to sequence jobs.

      It proceses the number of jobs specifid in the 'sigsum\_trillian\_batch\_size' option.


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"100ms"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_trillian_srcdir"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_trillian_srcdir:

      .. rst-class:: ansible-option-title

      **sigsum_trillian_srcdir**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_trillian_srcdir" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The trillian source location


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"/usr/src/trillian"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_trillian_version"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_trillian_version:

      .. rst-class:: ansible-option-title

      **sigsum_trillian_version**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_trillian_version" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The trillian source repository version


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"v1.5.1"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_url_prefix"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_url_prefix:

      .. rst-class:: ansible-option-title

      **sigsum_url_prefix**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_url_prefix" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      a prefix that precedes /\<endpoint\>


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`""`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_user"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_user:

      .. rst-class:: ansible-option-title

      **sigsum_user**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_user" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The sigsum user account.


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"sigsum"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--sigsum_witnesses"></div>

      .. _ansible_collections.sigsum.ansible.sigsum_role__parameter-main__sigsum_witnesses:

      .. rst-class:: ansible-option-title

      **sigsum_witnesses**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--sigsum_witnesses" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      comma-separated list of trusted witness public key files


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`""`

      .. raw:: html

        </div>


.. Attributes


.. Notes


.. Seealso




.. Extra links

Collection links
~~~~~~~~~~~~~~~~

.. raw:: html

  <p class="ansible-links">
    <a href="https://git.glasklar.is/sigsum/admin/ansible" aria-role="button" target="_blank" rel="noopener external">Repository (Sources)</a>
    <a href="https://git.glasklar.is/sigsum/admin/ansible" aria-role="button" target="_blank" rel="noopener external">Discussion, Q&amp;A, troubleshooting</a>
    <a href="https://www.sigsum.org/" aria-role="button" target="_blank" rel="noopener external">Homepage</a>
    <a href="./#communication-for-sigsum-ansible" aria-role="button" target="_blank">Communication</a>
  </p>

.. Parsing errors

