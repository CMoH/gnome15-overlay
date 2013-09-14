EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit python-r1

DESCRIPTION="Based on Impulse screenlet, provides a specturm analyser plugin for Gnome15"
HOMEPAGE="http://www.russo79.com/gnome15"
SRC_URI="https://projects.russo79.com/attachments/download/123/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="app-misc/gnome15-core
		 sci-libs/fftw:3.0
		 media-sound/pulseaudio"
DEPEND="${RDEPEND}"
