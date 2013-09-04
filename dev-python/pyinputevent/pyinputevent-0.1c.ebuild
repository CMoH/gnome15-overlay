EAPI="3"
PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="Python interface to Linux's input subsystem"
HOMEPAGE="http://www.russo79.com/gnome15"
SRC_URI="https://projects.russo79.com/attachments/download/75/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-python/python-uinput-0.9"

pkg_setup() {
	python_set_active_version 2
}
