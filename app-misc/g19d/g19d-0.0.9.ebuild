EAPI="3"
SUPPORT_PYTHON_ABIS="1"

DESCRIPTION="A daemon was added to allow userspace access from the Gnome15 project."
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/G19/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="app-misc/gnome15-core
		 dev-python/pylibg19
		 dev-python/pyusb
		 dev-python/imaging
		 dev-python/python-uinput"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}

pkg_postinst() {
	python_mod_optimize ${PN}
}

pkg_postrm() {
	python_mod_cleanup ${PN}
}

