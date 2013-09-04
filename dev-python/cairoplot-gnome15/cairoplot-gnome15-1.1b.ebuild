EAPI="3"
PYTHON_MODULE="cairoplot"

inherit distutils

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

pkg_setup() {
	python_enable_pyc
}
