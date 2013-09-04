EAPI="3"
PYTHON_MODULE="cairoplot"

inherit distutils

MY_PV="${PV/_p/-}"

DESCRIPTION="Python module to plot graphics in an easy and intuitive way"
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Optional/${PN}-${MY_PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-python/pycairo"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${PV%_p*}"

pkg_setup() {
	python_enable_pyc
}
