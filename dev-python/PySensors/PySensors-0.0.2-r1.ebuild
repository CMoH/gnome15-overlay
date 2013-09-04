EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_MODULE="sensors"

inherit distutils-r1

DESCRIPTION="Python bindings for libsensors.so from the lm-sensors project"
HOMEPAGE="http://www.russo79.com/gnome15"
SRC_URI="https://projects.russo79.com/attachments/download/34/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="sys-apps/lm_sensors"
DEPEND="${RDEPEND}"
