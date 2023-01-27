#!/bin/sh
set -e
set -x

pkgname=bash-2.05b
make=/usr/local/bin/make

# requirements
[ -f /usr/local/bin/sed ] || exit 1

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p2 -i $patches/$pkgname.patch

SHELL=/archive/bash $pkgscripts/superconf
$make

. $pkgscripts/common-end.inc

if [ ! -d /archive ]; then
        mkdir /archive
fi
cp /usr/local/bin/bash /archive/bash2 || true

