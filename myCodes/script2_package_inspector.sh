#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Yash Mehta | Reg: 24BCE10638
# Course: Open Source Software (NGMC) | VITyarthi
# Purpose: Check if a FOSS package is installed, display its
#          version and license, and print a philosophical note
#          about the package using a case statement.
# Usage:   bash script2_package_inspector.sh
# ============================================================

# ── Target package — change this to test other packages ──────
PACKAGE="git"

# ── Helper function: check package on apt/dpkg systems ───────
check_package_apt() {
    if dpkg -l "$1" 2>/dev/null | grep -q "^ii"; then
        echo "[INSTALLED] $1 is present on this system."
        echo ""
        echo "  Package details:"
        # dpkg -s gives detailed status; grep -E filters multiple fields
        dpkg -s "$1" 2>/dev/null | grep -E "^(Version|Maintainer|Homepage|Description)"
    else
        echo "[NOT FOUND] $1 is not installed via apt/dpkg."
        echo "  To install: sudo apt install $1"
    fi
}

# ── Helper function: check package on rpm systems ─────────────
check_package_rpm() {
    if rpm -q "$1" &>/dev/null; then
        echo "[INSTALLED] $1 is present on this system."
        echo ""
        echo "  Package details:"
        rpm -qi "$1" | grep -E "^(Version|License|Summary|URL)"
    else
        echo "[NOT FOUND] $1 is not installed via rpm."
        echo "  To install: sudo dnf install $1"
    fi
}

# ── Detect which package manager is available ─────────────────
echo "================================================================"
echo "           FOSS PACKAGE INSPECTOR"
echo "================================================================"
echo ""
echo "  Checking for package: $PACKAGE"
echo "  ───────────────────────────────"

if command -v dpkg &>/dev/null; then
    check_package_apt "$PACKAGE"
elif command -v rpm &>/dev/null; then
    check_package_rpm "$PACKAGE"
else
    echo "  Neither dpkg nor rpm found. Cannot query package database."
fi

echo ""

# ── Also show the git version directly if git command is available ──
if command -v git &>/dev/null; then
    echo "  Direct version check: $(git --version)"
fi

echo ""
echo "================================================================"
echo "  OPEN SOURCE PHILOSOPHY NOTE"
echo "================================================================"
case $PACKAGE in
    git)
        echo "  Git (GPL v2): Born from a licensing crisis in 2005, Git"
        echo "  proved that the best response to proprietary failure is to"
        echo "  build something free and better. Its distributed model is"
        echo "  a philosophical statement: history belongs to everyone."
        ;;
    httpd|apache2)
        echo "  Apache (Apache 2.0): The web server that built the open"
        echo "  internet. Its permissive licence means anyone can build on"
        echo "  it commercially — a deliberate choice to maximise adoption."
        ;;
    mysql|mariadb)
        echo "  MySQL/MariaDB (GPL v2 / Commercial): MySQL's dual-licence"
        echo "  model is a lesson in open-source business. MariaDB forked"
        echo "  when Oracle acquired MySQL — community governance in action."
        ;;
    vlc)
        echo "  VLC (LGPL/GPL): Started by students in Paris who wanted to"
        echo "  stream video on their university network. It plays anything."
        echo "  A reminder that student projects can change the world."
        ;;
    firefox)
        echo "  Firefox (MPL 2.0): A nonprofit browser fighting for an open"
        echo "  web against corporate monocultures. The fact that it exists"
        echo "  is itself an argument for the open-source model."
        ;;
    python3|python)
        echo "  Python (PSF Licence): Shaped entirely by community consensus"
        echo "  and the PEP process. The PSF licence is permissive, enabling"
        echo "  Python to become the most widely taught language on Earth."
        ;;
    *)
        echo "  $PACKAGE: Every FOSS project carries a philosophy in its"
        echo "  licence. Look up the SPDX identifier at spdx.org/licenses"
        echo "  to understand what freedoms its authors chose to grant."
        ;;
esac

echo ""
echo "================================================================"
echo "  End of FOSS Package Inspector"
echo "================================================================"
