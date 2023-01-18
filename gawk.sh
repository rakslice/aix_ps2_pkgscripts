#!/bin/sh
set -e
set -x

pkgname=gawk-3.0.6
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

. common-start.inc

#/usr/local/bin/bash 
./configure
#/u/root/bin/superconf
# --build=i386-ibm-aix
$make

. $pkgscripts/common-end.inc
