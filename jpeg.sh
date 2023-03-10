#!/bin/sh
set -e
set -x

pkgname=jpeg-6b
tarball=jpegsrc.v6b.tar.gz
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

#/usr/local/bin/patch -p1 -i $patches/$pkgname.patch

$pkgscripts/superconf --enable-static

$make
$make test

#prefixvar=prefix
installtargets="install install-lib"

. $pkgscripts/common-end.inc
