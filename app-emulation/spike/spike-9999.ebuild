# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 autotools multilib

DESCRIPTION="Spike is RISC-V ISA Simulator"
HOMEPAGE="https://github.com/riscv-software-src/riscv-isa-sim"
LICENSE="BSD"
SLOT="0"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/riscv-software-src/riscv-isa-sim.git"
else
	SRC_URI="https://github.com/riscv-software-src/riscv-isa-sim/archive/${COMMIT}.tar.gz"
	S="${WORKDIR}/${PN}-${PN}-v${PV}"
	KEYWORDS="~amd64"
fi

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
