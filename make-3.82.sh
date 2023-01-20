#!/bin/sh
set -e
set -x

pkgname=make-3.82

[ -f /usr/local/bin/make ] || exit 1

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p2 -i $patches/$pkgname.patch

ENV= CONFIG_SHELL=/archive/bash2 /archive/bash2 ./configure --build=i386-ibm-aix

ENV=
export ENV
make CFLAGS=

prefixvar=DESTDIR

. $pkgscripts/common-end.inc
