.. _ansible_collections.sigsum.ansible.docsite.example_sigsum:

********************
Example sigsum setup
********************

This section is intended for new log operators using the sigsum.ansible collection to setup new transparency logs.


.. contents::
   :local:

Installation
============

Currently the collection is only available through the gitlab instance. Use *ansible-galaxy* to install the collection
for use inside your playbooks.

.. code-block:: yaml

    ansible-galaxy collection install git+https://git.glasklar.is/sigsum/admin/ansible.git


Configure your installation
===========================

A sigsum log instance can consist of several nodes, however each log setup needs
exactly one primary and can consist of multiple secondary nodes.

The primary node signs and publishes the log. Secondary nodes works as failover
nodes if the primary node goes down. It is therefor recommended to configure a
secondary node.


Primary configuration
---------------------

.. code-block:: yaml

    ---
    sigsum_logname: "sigsum-log"

    sigsum_role: "primary"
    sigsum_url_prefix: "{{ sigsum_logname }}"

    sigsum_user: sigsum
    sigsum_db_pw: changeme
    sigsum_db_name: "{{ sigsum_logname }}"

.. note::

   Set *sigsum_external_endpoint* to a public interface for the service to be reachable externally.


Secondary configuration
-----------------------

.. code-block:: yaml

    ---
    sigsum_logname: "sigsum-log"

    sigsum_role: "secondary"
    sigsum_url_prefix: "{{ sigsum_logname }}"

    sigsum_key: "keyfile:xxxxx"

    sigsum_user: sigsum
    sigsum_db_pw: changeme
    sigsum_db_name: "{{ sigsum_logname }}"


mariadb configuration
---------------------

For sigsum to communicate with mariadb the user and password needs to be set the same user and password in their
respective roles. The easiest way to do this is to use the values already defined by the **sigsum** role.

.. code-block:: yaml

    mysql_root_user: root
    mysql_root_password: changeme
    mysql_database:
      - "{{ sigsum_logname }}"

    mysql_users:
      - user: "{{sigsum_user}}"
        password: "{{sigsum_db_pw}}"
        database_privs:
          - '{{sigsum_logname}}.*:ALL'


Role setup
----------

The role setup needs to include the namespace and the name of the collection before it can be used.

.. code-block:: yaml

    ---
    - hosts: default
      roles:
        - sigsum.ansible.mariadb
        - sigsum.ansible.sigsum
