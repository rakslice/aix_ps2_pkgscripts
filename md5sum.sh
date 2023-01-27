#!/bin/sh
set -e
set -x

pkgname=md5sum
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

. common-start.inc

$make

prefixvar=DESTDIR

. $pkgscripts/common-end.inc
