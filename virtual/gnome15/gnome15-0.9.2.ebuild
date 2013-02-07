EAPI=2

DESCRIPTION="Virtual for gnome15"
HOMEPAGE="http://www.gnome15.org/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~sparc-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE="cairo lg4l-module lm_sensors pulseaudio themes"

DEPEND=""
RDEPEND="      =app-misc/gnome15-core-0.9.2
			   =app-misc/gnome15-plugins-0.9.2
pulseaudio?  ( =app-misc/gnome15-impulse15-0.0.13 )
themes?      ( =app-misc/gnome15-iconpack-0.0.3 )"
