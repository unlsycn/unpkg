# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit cmake

DESCRIPTION="Espresso is a Multi-valued PLA minimization."
HOMEPAGE="https://github.com/chipsalliance/espresso"

LICENSE="UNKNOWN"
SLOT="0/${PV}"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/chipsalliance/espresso.git"
else
	SRC_URI="https://github.com/chipsalliance/espresso/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

BDEPEND="dev-ruby/asciidoctor"
