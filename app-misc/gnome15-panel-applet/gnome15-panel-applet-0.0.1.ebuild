EAPI="3"
SUPPORT_PYTHON_ABIS="1"

DESCRIPTION="Gnome15 desktop service using a GNOME panel applet."
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Desktop/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

# TODO: remove gnome-base/libgnomeui when gentoo fixes deps
RDEPEND="app-misc/gnome15-core
		 gnome-base/libgnomeui
		 dev-python/gnome-applets-python
		 dev-python/dbus-python
		 dev-python/pygobject"
DEPEND="${RDEPEND}"

src_configure() {
	einfo "Gnome python dependencies have a minor quirk which may cause this ebuild to fail"
	einfo "Please make sure libgnomeui gets installed before gnome-applets-python"
	einfo "If you get a configure eror about a missing gnomeapplet,"
	einfo "run ``emerge -C gnome-applets-python ; emerge -1 libgnomeui gnome-applets-python''"
	einfo "and next retry the original emerge command"

	econf || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}

# pkg_postinst() {
# 	python_mod_optimize ${PN}
# }

# pkg_postrm() {
# 	python_mod_cleanup ${PN}
# }


