# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils versionator

DESCRIPTION="Daemon and library for global keyboard shortcuts registration"
HOMEPAGE="http://lxqt.org/"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lxqt/${PN}.git"
else
	SRC_URI="https://downloads.lxqt.org/downloads/${PN}/${PV}/${P}.tar.xz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi

LICENSE="LGPL-2.1+"
SLOT="0/$(get_version_component_range 2)"

RDEPEND="
	dev-libs/libqtxdg:0/3
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	dev-qt/qtxml:5
	lxqt-base/liblxqt:0/$(get_version_component_range 2)
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXext
"
DEPEND="${RDEPEND}
	>=dev-util/lxqt-build-tools-0.5.0
	dev-qt/linguist-tools:5
"

mycmakeargs=( -DPULL_TRANSLATIONS=OFF )