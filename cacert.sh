#!/bin/sh

set -e
set -x

url=https://curl.se/ca/cacert.pem

openssl_dir_write=/nfs/nfsroot/usr/local/ssl

/usr/local/bin/python -c '
import ssl

ssl._create_default_https_context = ssl._create_unverified_context

import urllib

urllib.urlretrieve("'"$url"'", "cacert.pem")
'

certs=$openssl_dir_write/certs
if [ ! -d $certs ]; then
	mkdir $certs
fi
cp cacert.pem $certs/

$openssl_dir_write/bin/c_rehash $certs

# checking google access

if [ ! -f /etc/resolv.conf ]; then
	echo "nameserver 8.8.8.8" > /etc/resolv.conf
fi

/usr/local/bin/python -c 'import urllib; urllib.urlopen("https://www.google.com").read()'

# ok
