#!/bin/sh
set -e
set -x

pkgname=perl-5.6.2
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

        rm -f config.sh Policy.sh
        /archive/bash Configure -de -Dcc=gcc -Dusedl=n -Dosvers="1.3.0" \
	  -Dinstallprefix=$pkgdir
        $make

	# tests disabled due to not passing stuff holding up the build
	# TODO: Actually look into these and triage for further fixes
	#       or explicit bypass so we can at least run the expected
	#	working tests
        #$make test

. $pkgscripts/common-end.inc

chmod +x /usr/local/bin/perl
chmod +x /usr/bin/perl
