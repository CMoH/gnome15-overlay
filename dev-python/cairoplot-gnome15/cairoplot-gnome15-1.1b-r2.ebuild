EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_MODULE="cairoplot"

inherit distutils-r1

DESCRIPTION="Python module to plot graphics in an easy and intuitive way"
HOMEPAGE="http://www.russo79.com/gnome15"
SRC_URI="https://projects.russo79.com/attachments/download/78/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-python/pycairo
		!dev-python/Cairoplot"
DEPEND="${RDEPEND}"
