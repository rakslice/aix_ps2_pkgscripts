#!/bin/sh
set -e
set -x

pkgname=make-3.76.1

. gcc-2.7.2.3.inc
. binutils-2.9.1.inc

. common-start.inc

./configure
make CFLAGS=

. $pkgscripts/common-end.inc
