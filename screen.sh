#!/bin/sh
set -e
set -x

pkgname=screen-3.9.15
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

. createdirs.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

ENV= CONFIG_SHELL=/archive/bash2 SHELL=/archive/bash2 /archive/bash2 ./configure --prefix=/usr/local

$make CC=gcc 2>&1 | grep -v "has no section"

prefixvar=DESTDIR

leave_source=true

. $pkgscripts/common-end.inc
