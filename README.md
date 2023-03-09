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
## Included content
### Modules
Name | Description
--- | ---
[sigsum.ansible.sigsum](https://github.com/...)|Setup and run a sigsum log
instance.
[sigsum.ansible.mariadb](https://github.com/...)|Setup a mariadb server for sigsum.

## Release notes

See the [changelog](changelog.md).

## Licensing
See [LICENSE](LICENSE).


