# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/libgtop-python/Attic/libgtop-python-2.32.0.ebuild,v 1.9 2014/11/13 11:07:44 pacho dead $

EAPI=5

GCONF_DEBUG="no"
GNOME_ORG_MODULE="gnome-python-desktop"
G_PY_BINDINGS="gtop"

PYTHON_COMPAT=( python{2_6,2_7} )

inherit gnome-python-common-r1

DESCRIPTION="Python bindings for the libgtop library"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=gnome-base/libgtop-2.13.0:2
	!<dev-python/gnome-python-desktop-2.22.0-r10"
DEPEND="${RDEPEND}"
