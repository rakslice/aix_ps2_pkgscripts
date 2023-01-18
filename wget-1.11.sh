#!/bin/sh
set -e
set -x

pkgname=wget-1.11
tarball=$pkgname.tar.bz2

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

./configure
#/u/root/bin/superconf
#make CFLAGS=
make

. $pkgscripts/common-end.inc
