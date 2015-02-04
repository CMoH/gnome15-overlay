EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_MODULE="sensors"

inherit distutils-r1

DESCRIPTION="Python bindings for libsensors.so from the lm-sensors project"
HOMEPAGE="http://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="http://www.cheepee.ro/~cipi/portage/distfiles/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="sys-apps/lm_sensors"
DEPEND="${RDEPEND}"
