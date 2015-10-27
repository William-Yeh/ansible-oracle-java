
williamyeh.oracle-java for Ansible Galaxy
============


[![Circle CI](https://circleci.com/gh/William-Yeh/ansible-oracle-java.svg?style=shield)](https://circleci.com/gh/William-Yeh/ansible-oracle-java) [![Build Status](https://travis-ci.org/William-Yeh/ansible-oracle-java.svg?branch=master)](https://travis-ci.org/William-Yeh/ansible-oracle-java)

## Summary

Role name in Ansible Galaxy: **[williamyeh.oracle-java](https://galaxy.ansible.com/detail#/role/2851)**

This Ansible role has the following features for Oracle JDK:

 - Install JDK 7 or 8 version.
 - Install for CentOS and Debian/Ubuntu families.

If you prefer OpenJDK, try alternatives such as [smola.java](https://galaxy.ansible.com/list#/roles/1209).


## Role Variables

### Mandatory variables

None.

### Optional variables


User-configurable defaults:

```yaml
# which version?
java_version: 8

# which subversion?
java_subversion: 65

# which directory to put the download file (for CentOS families)?
java_download_path: /tmp

# remove temporary downloaded files?
java_remove_download: true
```

For other configurable internals, read `tasks/set-role-variables.yml` file.


## Usage


### Step 1: add role

Add role name `williamyeh.oracle-java` to your playbook file.


### Step 2: add variables

Set vars in your playbook file.

Simple example:

```yaml
---
# file: simple-playbook.yml

- hosts: all

  roles:
    - williamyeh.oracle-java

  vars:
    java_version: 8
```



## Dependencies

None.


## License

Licensed under the Apache License V2.0. See the [LICENSE file](LICENSE) for details.


## History

Rewritten from my pre-Galaxy version: [server-config-template](https://github.com/William-Yeh/server-config-template).
