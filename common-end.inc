
mkdir "$pkgdir"
"$make" install prefix="$pkgdir"

tar cf "$pkgdir.pkg" "$pkgdir"

cd "$pkgdir"
cp -r * /usr/local
cd ..

rm -rf "$srcdirfull"
rm -rf "$pkgdir"

