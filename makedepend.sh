#!/bin/sh
set -e
set -x

pkgname=makedepend-1.0.0
tarball=$pkgname.tar.bz2
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

touch /usr/local/bin/pkg-config
chmod +x /usr/local/bin/pkg-config

./configure X_LIBS=/usr/bin/X11/X.o X_CFLAGS=-I/usr/include/X11

$make


. $pkgscripts/common-end.inc
