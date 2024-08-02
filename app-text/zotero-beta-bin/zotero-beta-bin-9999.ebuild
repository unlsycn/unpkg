# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

DESCRIPTION="Zotero is a tool to help you collect, organize, cite, and share research."
HOMEPAGE="https://www.zotero.org/"
SRC_URI="https://www.zotero.org/download/client/dl?platform=linux-x86_64&channel=beta -> ${P}.tar.bz2"
S="${WORKDIR}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="-* ~amd64"

IUSE="wayland"

RDEPEND="
	${DEPEND}
	>=app-accessibility/at-spi2-core-2.46.0:2
	>=dev-libs/glib-2.26:2
	media-libs/alsa-lib
	media-libs/fontconfig
	>=media-libs/freetype-2.4.10
	sys-apps/dbus
	virtual/freedesktop-icon-theme
	>=x11-libs/cairo-1.10[X]
	x11-libs/gdk-pixbuf:2
	>=x11-libs/gtk+-3.11:3[X,wayland?]
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libxcb
	>=x11-libs/pango-1.22.0
"
BDEPEND="app-arch/unzip"

QA_PREBUILT="opt/zotero/*"

src_prepare() {
	cd Zotero_linux-x86_64 || die

	# fix desktop-file
	sed -i -e 's#^Exec=.*#Exec=zotero#' zotero.desktop || die
	sed -i -e 's#Icon=zotero.*#Icon=zotero#' zotero.desktop || die

	default
}

src_install() {
	cd Zotero_linux-x86_64 || die

	dodir opt/zotero
	cp -a * "${ED}/opt/zotero" || die

	dosym ../../opt/zotero/zotero usr/bin/zotero

	domenu zotero.desktop

	for size in 32 64 128; do
		newicon -s ${size} icons/icon${size}.png zotero.png
	done
}
