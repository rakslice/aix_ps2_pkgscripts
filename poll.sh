#!/bin/sh
set -e
set -x

pkgname=poll-release-1.5.1
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

. createdirs.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

#cp $pkgscripts/codefragments/

#ENV= CONFIG_SHELL=/archive/bash2 SHELL=/archive/bash2 /archive/bash2 ./configure --disable-locale --disable-shm

$make CC=gcc 2>&1 | grep -v "has no section"

prefixvar=PREFIX

createdirs $pkgdir/lib
createdirs $pkgdir/include/sys

#leave_source=true

. $pkgscripts/common-end.inc
