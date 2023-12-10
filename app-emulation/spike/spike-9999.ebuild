# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 autotools multilib

DESCRIPTION="Spike is RISC-V ISA Simulator"
HOMEPAGE="https://github.com/riscv-software-src/riscv-isa-sim"
EGIT_REPO_URI="https://github.com/riscv-software-src/riscv-isa-sim.git"

LICENSE="BSD"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
