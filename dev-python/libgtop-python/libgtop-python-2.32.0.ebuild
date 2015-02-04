# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/libgtop-python/Attic/libgtop-python-2.32.0.ebuild,v 1.9 2014/11/13 11:07:44 pacho dead $

EAPI="3"
GCONF_DEBUG="no"
G_PY_PN="gnome-python-desktop"
G_PY_BINDINGS="gtop"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"

inherit gnome-python-common

DESCRIPTION="Python bindings for the libgtop library"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=gnome-base/libgtop-2.13.0:2
	!<dev-python/gnome-python-desktop-2.22.0-r10"
DEPEND="${RDEPEND}"
