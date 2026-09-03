#!/bin/bash

cp -a /etc/sssd/sssd.conf "/etc/sssd/sssd.conf.bak.$(date +%F-%H%M%S)"

sed -i -E \
  -e 's|^[[:space:]]*fallback_homedir[[:space:]]*=.*$|fallback_homedir = /home/%u|' \
  -e 's|^[[:space:]]*use_fully_qualified_names[[:space:]]*=.*$|use_fully_qualified_names = False|' \
  /etc/sssd/sssd.conf

chmod 600 /etc/sssd/sssd.conf
sssctl config-check
systemctl restart sssd