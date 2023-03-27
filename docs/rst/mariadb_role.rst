
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

.. _ansible_collections.sigsum.ansible.mariadb_role:

.. Anchors: aliases


.. Title

sigsum.ansible.mariadb role -- The main entry point for the mariadb role.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. Collection note

.. note::
    This role is part of the `sigsum.ansible collection <https://galaxy.ansible.com/sigsum/ansible>`_ (version 0.0.5).

    To install it use: :code:`ansible-galaxy collection install sigsum.ansible`.

    To use it in a playbook, specify: :code:`sigsum.ansible.mariadb`.

.. contents::
   :local:
   :depth: 2


.. Entry point title

Entry point ``main`` -- The main entry point for the mariadb role.
------------------------------------------------------------------

.. version_added


.. Deprecated


Synopsis
^^^^^^^^

.. Description

- This role setups the mariadb database, along with users and table permissions.

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
        <div class="ansibleOptionAnchor" id="parameter-main--mysql_database"></div>

      .. _ansible_collections.sigsum.ansible.mariadb_role__parameter-main__mysql_database:

      .. rst-class:: ansible-option-title

      **mysql_database**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--mysql_database" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`list` / :ansible-option-elements:`elements=string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The mariadb database


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`["test"]`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--mysql_root_password"></div>

      .. _ansible_collections.sigsum.ansible.mariadb_role__parameter-main__mysql_root_password:

      .. rst-class:: ansible-option-title

      **mysql_root_password**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--mysql_root_password" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The mariadb root user password


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"changeme"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--mysql_root_user"></div>

      .. _ansible_collections.sigsum.ansible.mariadb_role__parameter-main__mysql_root_user:

      .. rst-class:: ansible-option-title

      **mysql_root_user**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--mysql_root_user" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`string`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      The mariadb root user account


      .. rst-class:: ansible-option-line

      :ansible-option-default-bold:`Default:` :ansible-option-default:`"root"`

      .. raw:: html

        </div>

  * - .. raw:: html

        <div class="ansible-option-cell">
        <div class="ansibleOptionAnchor" id="parameter-main--mysql_users"></div>

      .. _ansible_collections.sigsum.ansible.mariadb_role__parameter-main__mysql_users:

      .. rst-class:: ansible-option-title

      **mysql_users**

      .. raw:: html

        <a class="ansibleOptionLink" href="#parameter-main--mysql_users" title="Permalink to this option"></a>

      .. rst-class:: ansible-option-type-line

      :ansible-option-type:`list` / :ansible-option-elements:`elements=any`




      .. raw:: html

        </div>

    - .. raw:: html

        <div class="ansible-option-cell">

      List of mysql\_users and access


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

