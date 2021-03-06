# Maintainer: Najeeb Rifaat <mohamme89d@gmail.com>

pkgname=dwm-najeeb
basepkgname=dwm
pkgver=6.2
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'st-najeeb' 'dmenu-najeeb')
provides=("${pkgname}")
conflicts=("${basepkgname}")
install=dwm.install

_patches=(
  "https://dwm.suckless.org/patches/activetagindicatorbar/dwm-activetagindicatorbar-6.2.diff"
  "https://dwm.suckless.org/patches/ewmhtags/dwm-ewmhtags-6.2.diff"
  "https://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-6.2.diff"
  "https://dwm.suckless.org/patches/pertag/dwm-pertag-6.2.diff"
  "https://dwm.suckless.org/patches/noborder/dwm-noborder-6.2.diff"
  "https://dwm.suckless.org/patches/focusonnetactive/dwm-focusonnetactive-2017-12-24-3756f7f.diff"
)
source=(
  "http://dl.suckless.org/dwm/$basepkgname-$pkgver.tar.gz"
  "${_patches[@]}"
  "config.h"
  "tcl.c"
  "dwm.desktop"
)

md5sums=('SKIP')

prepare() {
  cd $srcdir/$basepkgname-$pkgver
}

build() {
  cd $srcdir/$basepkgname-$pkgver
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dwm-activetagindicatorbar-6.2.diff"
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dwm-ewmhtags-6.2.diff"
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dwm-fullgaps-6.2.diff"
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dwm-pertag-6.2.diff"
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dwm-noborder-6.2.diff"
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dwm-focusonnetactive-2017-12-24-3756f7f.diff"

  cp $srcdir/config.h config.h
  cp $srcdir/tcl.c tcl.c
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd $srcdir/$basepkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$basepkgname/LICENSE
  install -m644 -D README $pkgdir/usr/share/doc/$basepkgname/README
  install -m644 -D $srcdir/dwm.desktop $pkgdir/usr/share/xsessions/dwm.desktop
}
