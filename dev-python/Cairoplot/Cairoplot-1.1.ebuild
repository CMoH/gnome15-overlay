EAPI="3"
PYTHON_MODULE="cairoplot"

inherit distutils

DESCRIPTION="Python module to plot graphics in an easy and intuitive way"
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Optional/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="dev-python/pycairo"
DEPEND="${RDEPEND}"

pkg_setup() {
	python_enable_pyc
}
