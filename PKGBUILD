pkgname=dwm-najeeb
basepkgname=dwm
pkgver=6.1
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'st-najeeb' 'dmenu' 'i3lock')
install=dwm.install
source=(
  "http://dl.suckless.org/dwm/$basepkgname-$pkgver.tar.gz"
  "https://dwm.suckless.org/patches/alpha/dwm-alpha-6.1.diff"
  "https://dwm.suckless.org/patches/moveresize/dwm-moveresize-6.1.diff"
  "config.h"
  "dwm.c"
	"dwm.desktop"
	"sleeplock.service"
)
#"https://dwm.suckless.org/patches/xkb/dwm-6.1-xkb.diff"

md5sums=('SKIP')

prepare() {
  cd $srcdir/$basepkgname-$pkgver
  patch -Np1 -i "$srcdir/dwm-alpha-6.1.diff"
  patch -Np1 -i "$srcdir/dwm-moveresize-6.1.diff"
  cp $srcdir/dwm.c dwm.c
  cp $srcdir/config.h config.h
}
#patch -Np1 -F4 -i "$srcdir/dwm-6.1-xkb.diff"

build() {
  cd $srcdir/$basepkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd $srcdir/$basepkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$basepkgname/LICENSE
  install -m644 -D README $pkgdir/usr/share/doc/$basepkgname/README
  install -m644 -D $srcdir/dwm.desktop $pkgdir/usr/share/xsessions/dwm.desktop
}
