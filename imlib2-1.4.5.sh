#!/bin/sh
set -e
set -x

pkgname=imlib2-1.4.5
#tarball=$pkgname.tar.bz2
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

cp $pkgscripts/codefragments/memmove.h src/lib/
cp $pkgscripts/codefragments/strtoul.c src/bin/

/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

ENV= CONFIG_SHELL=/archive/bash2 SHELL=/archive/bash2 /archive/bash2 ./configure --enable-shared=no

V=1 $make 

prefixvar=DESTDIR

leave_source=true

. $pkgscripts/common-end.inc
