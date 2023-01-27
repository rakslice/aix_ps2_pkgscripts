#!/bin/sh
set -e
set -x

pkgname=sed-4.0.9
make=/usr/local/bin/make

# requirements


. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p1 -i $patches/$pkgname.patch

SHELL=/archive/bash $pkgscripts/superconf
$make

. $pkgscripts/common-end.inc
