#!/bin/sh
set -e
set -x

pkgname=patch-2.5.4

. gcc-2.7.2.3.inc
. binutils-2.9.1.inc

. common-start.inc

./configure
#make CFLAGS=
make

. $pkgscripts/common-end.inc
