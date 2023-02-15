#!/bin/sh
set -e
set -x

pkgname=tiff-3.9.1
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

cp $pkgscripts/codefragments/memmove.h libtiff

/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

ENV= SHELL=/archive/bash2 CONFIG_SHELL=/archive/bash2 /archive/bash2 configure --disable-cxx

$make 2>&1 | grep -v "has no section"

prefixvar=DESTDIR

#leave_source=true

. $pkgscripts/common-end.inc
