EAPI="3"
SUPPORT_PYTHON_ABIS="1"

DESCRIPTION="Gnome15 desktop service using a GNOME panel applet."
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Desktop/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="app-misc/gnome15-core
		 dev-python/gnome-desktop-python
		 dev-python/gnome-applets-python
		 dev-python/dbus-python
		 dev-python/pygobject"
DEPEND="${RDEPEND}"

src_configure() {
	einfo "Gnome python dependencies have a minor quirk which may cause this build to fail"
	einfo "Please make sure gnome-desktop-python is installed before gnome-applets-python"
	einfo "If you get a configure eror about gnomeapplet, re-emerge gnome-applets-python"
	einfo "after gnome-desktop-python is already emerged"

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


