#!/bin/sh
set -e
set -x

pkgname=tar-1.12
tarball=$pkgname.tar
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

#/usr/local/bin/patch -p2 -i $patches/$pkgname.patch

ENV= CONFIG_SHELL=/archive/bash2 /archive/bash2 ./configure

#make CFLAGS=
$make

prefixvar=prefix

. $pkgscripts/common-end.inc
