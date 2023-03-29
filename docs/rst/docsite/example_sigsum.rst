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

To run a primary node one only needs to setup the logname and the appropriate role. There should be an accessible mysql database connection reachable for the instance. If there isn't any database available this role collection includes a basic mariadb role that sets this up properly.

.. code-block:: yaml

    # Example primary configuration

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

When setting up a secondary the *sigsum_external_endpoint* needs to be exposed on the primary node. Sigsum
expects this endpoint to be a TLS terminated connection with a valid TLS certificate.

This is not done by this role collection and the user of this role needs to setup a reverse proxy.

The secondary configuration needs to have the internal endpoint reachable for the primary node to communicate with it.

.. code-block:: yaml

    # Example secondary configuration 

    ---
    sigsum_logname: "sigsum-log"

    sigsum_role: "secondary"

    sigsum_user: sigsum
    sigsum_db_pw: changeme
    sigsum_db_name: "{{ sigsum_logname }}"

    # The externally reachable URL of the primary log
    # Needs to be over a valid TLS connection
    sigsum_primary_url: "primary-log.example.org:14784"

    # Default internal endpoint value
    # Needs to be exposed over a valid TLS connection
    sigsum_internal_endpoint: "127.0.0.1:14785"


Currently Sigsum only supports a setup with one primary and secondary log.

When running the role, ansible will print the generated ssh public key for the secondary node. This is the value we need to use for *sigsum_secondary_pubkey* in our primary node configuraion.

Example output:

.. code-block:: bash

    TASK [sigsum.ansible.sigsum : Read public key] *********************************
    ok: [sigsum-primary]

    TASK [sigsum.ansible.sigsum : Print public key of sigsum log molecule-test] ****
    ok: [sigsum-primary] => {
        "msg": "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJOzTe1ykCAh/CVo8lbpUmE6oEVbGcz3Vcz/ZpkT+8FC sigsum key\n"
    }


Example primary configuration with added secondary node options:

.. code-block:: yaml

    # Example primary configuration with a secondary setup.

    ---
    sigsum_logname: "sigsum-log"

    sigsum_role: "secondary"

    sigsum_user: sigsum
    sigsum_db_pw: changeme
    sigsum_db_name: "{{ sigsum_logname }}"

    sigsum_secondary_url: "secondary-log.example.org:14785"
    sigsum_secondary_pubkey: "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJOzTe1ykCAh/CVo8lbpUmE6oEVbGcz3Vcz/ZpkT+8FC sigsum key"

    # Default external endpoint value
    # Needs to be exposed over a valid TLS connection
    sigsum_external_endpoint: "127.0.0.1:14784"


After setup re-run the role on the node to deploy with the recently included secondary configuration values.


mariadb configuration
---------------------

For sigsum to communicate with mariadb the user and password needs to be set the same user and password in their
respective roles. The easiest way to do this is to use the values already defined by the **sigsum** role.

.. code-block:: yaml

    ---
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
