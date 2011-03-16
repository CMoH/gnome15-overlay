EAPI="3"

inherit autotools bzr # python

DESCRIPTION="Based on Impulse screenlet, provides a specturm analyser plugin for Gnome15"
HOMEPAGE="http://www.gnome15.org/"

#EBZR_REPO_URI="lp:gnome15"
EBZR_REPO_URI="/home/cipi/src/g19/gnome15"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="app-misc/gnome15-core
		 sci-libs/fftw:3.0
		 media-sound/pulseaudio"
DEPEND="${RDEPEND}"

MY_SUBPACKAGE="gnome15-impulse15"

src_prepare() {
	cd ${MY_SUBPACKAGE} && eautoreconf || die "eautoreconf failed"
}

src_configure() {
	cd ${MY_SUBPACKAGE} && econf || die "econf failed"
}

src_install() {
	cd ${MY_SUBPACKAGE} && emake DESTDIR="${D}" install || die "emake install failed"
}

# pkg_postinst() {
# 	python_mod_optimize ${PN}
# }

# pkg_postrm() {
# 	python_mod_cleanup ${PN}
# }
