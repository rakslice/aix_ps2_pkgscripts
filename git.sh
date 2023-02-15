#!/bin/sh
set -e
set -x

pkgname=git-2.17.0
make=/usr/local/bin/make

. ./gcc-2.7.2.3.inc
#. ./gcc-2.95.3.inc
. ./binutils-2.9.1.inc

. ./createdirs.inc

PATH=/usr/local/bin:$PATH
export PATH

net_scratch=/nfs/u/root/working/src/$pkgname

net_pkg=/nfs/u/root/working/pkg/$pkgname

for d in $net_scratch $net_pkg ; do

if [ -d $d ]; then
	rm -rf $d
fi
createdirs $d

done

. ./common-start.inc

cp -r t $net_scratch/t

rm -rf t
ln -s $net_scratch/t t

ln -s $net_pkg $pkgdir

c99_snprintf_dir=$pkgscripts/codefragments/c99-snprintf

/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

cp $pkgscripts/codefragments/stdint.h .
cp $pkgscripts/codefragments/memmove.h .
cp $pkgscripts/codefragments/strtoul.c .
cp $c99_snprintf_dir/snprintf.c c99_snprintf.c

createdirs perl/build/lib/Git/LoadCPAN/Mail
createdirs perl/build/lib/Git/SVN/Memoize
createdirs perl/build/lib/FromCPAN/Mail
createdirs perl/build/man/man3
createdirs bin-wrappers

#use_shell=/archive/bash2
use_shell=/usr/local/bin/bash

NO_ICONV=1 ENV= CONFIG_SHELL=$use_shell SHELL=$use_shell $use_shell ./configure --without-iconv

make_args="SHELL=$use_shell SHELL_PATH=$use_shell NO_ICONV=1 NO_MSGFMT=1"

$make DESTDIR=$pkgdir $make_args

# XXX testing - remove
exit 1

prefixvar=DESTDIR
make_install_args="$make_args"

. $pkgscripts/common-end.inc
