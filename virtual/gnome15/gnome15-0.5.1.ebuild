EAPI=2

DESCRIPTION="Virtual for gnome15"
HOMEPAGE="http://www.tanktarta.pwp.blueyonder.co.uk/gnome15/index.html"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~sparc-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE="ayatana g15d g19d gnome lg4l-module pulseaudio systray themes"

DEPEND=""
RDEPEND="      =app-misc/gnome15-core-0.5.1
ayatana?     ( =app-misc/gnome15-indicator-0.0.1 )
g19d?        ( =app-misc/g19d-0.0.9 )
gnome?       ( =app-misc/gnome15-gnome-plugins-0.0.2
			   =app-misc/gnome15-panel-applet-0.0.1 )
lg4l-module? ( =sys-kernel/lg4l-kernel-module-20110316 )
pulseaudio?  ( =app-misc/gnome15-impulse15-0.0.5 )
systray?     ( =app-misc/gnome15-systemtray-0.0.1 )
themes?      ( =app-misc/gnome15-iconpack-0.0.2 )"
