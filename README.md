# sigsum ansible collection

This repository contains the roles for deploying sigsum transparency logs with
ansible.

## Installing this collection

You can install the ``ansible.sigsum`` collection with the Ansible Galaxy CLI:

    ansible-galaxy collection install git+https://git.glasklar.is/sigsum/admin/ansible.git

You can also include it in a `requirements.yml` file and install it with `ansible-galaxy collection install -r requirements.yml`, using the format:

```yaml
---
collections:
  - name: sigsum.ansible

# With the collection name, version, and source options
- name: sigsum.ansible
  source: git+https://git.glasklar.is/sigsum/admin/ansible.git 
```

In order to install a particular branch of the repo, you can append
',BRANCHNAME' to the URL.

## Usage

Below is an example setting up a primary log with a mysql database.


```yaml
---
# Setup primary log
sigsum_logname: "sigsum-log"

sigsum_role: "primary"
sigsum_url_prefix: "{{ sigsum_logname }}"

sigsum_user: sigsum
sigsum_db_pw: changeme
sigsum_db_name: "{{ sigsum_logname }}"

# Setup mysql
mysql_root_user: root
mysql_root_password: changeme
mysql_database:
  - "{{ sigsum_logname }}"

mysql_users:
  - user: "{{sigsum_user}}"
    password: "{{sigsum_db_pw}}"
    database_privs:
      - '{{sigsum_logname}}.*:ALL'
```

### Modules
Name | Description
--- | ---
[sigsum.ansible.sigsum](https://git.glasklar.is/sigsum/admin/ansible/-/blob/main/docs/rst/sigsum_role.rst)|Setup and run a sigsum log instance.
[sigsum.ansible.mariadb](https://git.glasklar.is/sigsum/admin/ansible/-/blob/main/docs/rst/mariadb_role.rst)|Setup a mariadb server for sigsum.

## Testing with molecule

This collection can be tested with molecule. It requires a running docker daemon
on the system and python.

`make converge` sets up the virtualenv and install molecule, then runs the test
suite.

To destroy the containers created for the playbook, use `make destroy`.

## Licensing
See [LICENSE](LICENSE).


