#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Yash Mehta | Reg: 24BCE10638
# Course: Open Source Software (NGMC) | VITyarthi
# Purpose: Display a welcome screen summarising key Linux
#          system information and the OS license.
# Usage:   bash script1_system_identity.sh
# ============================================================

# ── Variables ────────────────────────────────────────────────
STUDENT_NAME="Yash Mehta"   # Student's full name
REG_NO="24BCE10638"                   # Registration number
SOFTWARE_CHOICE="Git"                 # Chosen OSS project

# ── Gather system information using command substitution ─────
KERNEL=$(uname -r)
ARCH=$(uname -m)
USER_NAME=$(whoami)
HOME_DIR=$HOME
HOSTNAME=$(hostname)
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%A, %d %B %Y')
CURRENT_TIME=$(date '+%H:%M:%S')

# ── Detect Linux distribution name ───────────────────────────
if [ -f /etc/os-release ]; then
    DISTRO=$(grep "^PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi

# ── Display──────────────────────────────────
echo "================================================================"
echo "           OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT          "
echo "================================================================"
echo ""
echo "  Student : $STUDENT_NAME ($REG_NO)"
echo "  Project : $SOFTWARE_CHOICE — Open Source Software Audit"
echo ""
echo "----------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "----------------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Architecture : $ARCH"
echo "  Hostname     : $HOSTNAME"
echo "  Logged in as : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "----------------------------------------------------------------"
echo "  LICENSE INFORMATION"
echo "----------------------------------------------------------------"
# Note: Most Linux distributions use the GPL v2 licensed kernel.
# Ubuntu and Debian ship with a mixture of free and non-free packages.
echo "  Linux Kernel License : GNU General Public License v2 (GPL v2)"
echo "  This means you have the freedom to:"
echo "    * Run the OS for any purpose"
echo "    * Study and modify the kernel source code"
echo "    * Redistribute copies freely"
echo "    * Share your modifications under GPL v2"
echo ""
echo "================================================================"
echo "  End of System Identity Report"
echo "================================================================"
