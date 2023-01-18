#!/bin/sh
set -e
set -x

#pkgname=grep-2.5.4
pkgname=grep-2.0
#tarball=$pkgname.tar.bz2

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

. common-start.inc

./configure
#make CFLAGS=
make

mkdir $pkgdir
mkdir $pkgdir/bin
mkdir $pkgdir/man
mkdir $pkgdir/man/man1

. $pkgscripts/common-end.inc
