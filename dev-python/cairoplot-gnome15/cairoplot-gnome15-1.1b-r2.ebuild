EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_MODULE="cairoplot"

inherit distutils-r1

DESCRIPTION="Python module to plot graphics in an easy and intuitive way"
HOMEPAGE="http://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="http://www.cheepee.ro/~cipi/portage/distfiles/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-python/pycairo
		!dev-python/Cairoplot"
DEPEND="${RDEPEND}"
