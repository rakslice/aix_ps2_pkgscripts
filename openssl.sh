#!/bin/sh
set -e
set -x

pkgname=openssl-1.0.2o
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p2 -i $patches/$pkgname.patch

./Configure BSD-x86 no-threads no-asm no-shared no-dso no-hw-padlock

$make


. $pkgscripts/common-end.inc
