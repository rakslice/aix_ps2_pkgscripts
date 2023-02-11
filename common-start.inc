
[ "$pkgname" != "" ] || exit 1

basedir="/u/root/src"
archivedir="/archive"
nfsarchivedir="/nfs/archive"

if [ "$tarball" = "" ]; then
	tarball="$pkgname.tar.gz"
fi
if [ "$tarballfull" = "" ]; then
	tarballfull="$basedir/$tarball"
fi
if [ ! -f "$tarballfull" ]; then
	tarballfull="$archivedir/$tarball"
fi
if [ ! -f "$tarballfull" ]; then
	tarballfull="$nfsarchivedir/$tarball"
fi

if [ "$srcdir" = "" ]; then
	srcdir="$pkgname"
fi
if [ "$make" = "" ]; then
	make=/bin/make
fi

srcdirfull="$basedir/$srcdir"
pkgdir="/u/root/pkg/$pkgname"

gunzip=/usr/local/bin/gunzip
bunzip2=/usr/local/bin/bunzip2

pkgscripts=`pwd`

patches=$pkgscripts/patches

[ ! -d "$pkgdir" ] || exit 1
[ ! -f "$pkgdir.pkg" ] || exit 1

[ ! -d "$srcdirfull" ] || exit 1

cd "$basedir" || exit 1

if echo "$tarballfull" | fgrep '.tar.gz' > /dev/null; then
	$gunzip -c "$tarballfull" | tar xf -
elif echo "$tarballfull" | fgrep '.tgz' > /dev/null; then
	$gunzip -c "$tarballfull" | tar xf -
elif echo "$tarballfull" | fgrep '.tar.bz2' > /dev/null; then
	$bunzip2 -c "$tarballfull" | tar xf -
else
	tar xf "$tarballfull"
fi

[ -d "$srcdirfull" ] || exit 1

cd "$srcdirfull" || exit 1

