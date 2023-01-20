#!/bin/sh
set -e
set -x

/usr/local/bin/ssh-keygen -t rsa1 -f /usr/local/etc/ssh_host_key -N ""
/usr/local/bin/ssh-keygen -t dsa -f /usr/local/etc/ssh_host_dsa_key -N ""
/usr/local/bin/ssh-keygen -t rsa -f /usr/local/etc/ssh_host_rsa_key -N ""

