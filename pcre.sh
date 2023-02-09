#!/bin/sh
set -e
set -x

pkgname=pcre-8.02
tarball=$pkgname.tar.bz2
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p1 -i $patches/$pkgname.patch

cp $pkgscripts/codefragments/memmove.h .
cp $pkgscripts/codefragments/strtoul.c .

./configure --disable-cpp

$make

prefixvar=DESTDIR

. $pkgscripts/common-end.inc
