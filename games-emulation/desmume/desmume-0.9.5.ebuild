# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils games

DESCRIPTION="Nintendo DS emulator"
HOMEPAGE="http://desmume.org/"
SRC_URI="mirror://sourceforge/desmume/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.8.0:2
	gnome-base/libglade
	x11-libs/gtkglext
	virtual/opengl
	sys-libs/zlib
	dev-libs/zziplib
	media-libs/libsdl[joystick]
	x11-libs/agg"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-sse2-fix.diff"
}

src_configure() {
	egamesconf --datadir=/usr/share || die "egamesconf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake failed"
	dodoc AUTHORS ChangeLog README README.LIN
	prepgamesdirs
}
