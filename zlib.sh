#!/bin/sh
set -e
set -x

pkgname=zlib-1.2.11
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

#/usr/local/bin/patch -p1 -i $patches/$pkgname.patch

$pkgscripts/superconf

$make

prefixvar=DESTDIR

createdirs () {
	cur=$1
	dirs=
	while [ $cur != / ]; do
		if [ -d $cur ]; then
			break
		fi
		dirs="$cur $dirs"
		cur=`dirname $cur`
	done

	for dir in $dirs; do
		mkdir $dir
	done
}

for d in $pkgdir/usr/local/share/man/man3 ; do
	createdirs $d
done

. $pkgscripts/common-end.inc
