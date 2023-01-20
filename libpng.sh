#!/bin/sh
set -e
set -x

pkgname=libpng-1.6.34
make=/usr/local/bin/make

[ -f /archive/bash2 ] || exit 2

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p1 -i $patches/$pkgname.patch

cp $pkgscripts/codefragments/stdint.h .

ENV= CONFIG_SHELL=/archive/bash2 /archive/bash2 ./configure "$@"


$make

prefixvar=DESTDIR

. $pkgscripts/common-end.inc
