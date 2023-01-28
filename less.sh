#!/bin/sh
set -e
set -x

pkgname=less-382
#tarball=$pkgname.tar.bz2
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

#/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

ENV= SHELL=/archive/bash2 /archive/bash2 ./configure
#ENV= /archive/bash2 ./configure

#make CFLAGS=
$make

prefixvar=prefix
#prefixvar=DESTDIR

. $pkgscripts/common-end.inc
