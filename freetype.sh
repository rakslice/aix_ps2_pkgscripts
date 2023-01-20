#!/bin/sh
set -e
set -x

pkgname=freetype-2.4.9
tarball=$pkgname.tar.bz2
make=/usr/local/bin/make

[ -f /archive/bash2 ] || exit 2

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

#/usr/local/bin/patch -p1 -i $patches/$pkgname.patch

cd builds/unix

ENV= SHELL=/archive/bash2 CONFIG_SHELL=/archive/bash2 /archive/bash2 ./configure 

cd ../..

$make

# freetype's top level make tries to run its internal configure again with the wrong settings and
# it fails but the output has already there so it will work

prefixvar=DESTDIR

. $pkgscripts/common-end.inc
