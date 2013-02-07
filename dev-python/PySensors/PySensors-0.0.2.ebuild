EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_MODULE="sensors"

inherit distutils-r1

DESCRIPTION="Python bindings for libsensors.so from the lm-sensors project"
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Optional/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="sys-apps/lm_sensors"
DEPEND="${RDEPEND}"
