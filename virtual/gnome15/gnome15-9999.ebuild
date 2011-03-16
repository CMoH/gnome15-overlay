EAPI=2

DESCRIPTION="Virtual for gnome15"
HOMEPAGE="http://www.tanktarta.pwp.blueyonder.co.uk/gnome15/index.html"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="ayatana g15d g19d gnome lg4l-module pulseaudio systray themes"

DEPEND=""
RDEPEND="      =app-misc/gnome15-core-${PV}
ayatana?     ( =app-misc/gnome15-indicator-${PV} )
g15d?        ( =app-misc/gnome15-sandbox-plugins-${PV} )
g19d?        ( =app-misc/g19d-${PV} )
gnome?       ( =app-misc/gnome15-gnome-plugins-${PV}
			   =app-misc/gnome15-panel-applet-${PV} )
lg4l-module? ( =sys-kernel/lg4l-kernel-module-${PV} )
pulseaudio?  ( =app-misc/gnome15-impulse15-${PV} )
systray?     ( =app-misc/gnome15-systemtray-${PV} )
themes?      ( =app-misc/gnome15-iconpack-${PV} )"
