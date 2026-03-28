#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Yash Mehta | Reg: 24BCE10638
# Course: Open Source Software (NGMC) | VITyarthi
# Purpose: Loop through key system directories and report
#          their disk usage, owner, group, and permissions.
#          Also check for Git's configuration directories.
# Usage:   bash script3_disk_permission_auditor.sh
# ============================================================

# ── Array of directories to audit ────────────────────────────
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/usr/share")

# ── Display header ────────────────────────────────────────────
echo "================================================================"
echo "           DISK AND PERMISSION AUDITOR"
echo "           Auditing key Linux system directories"
echo "================================================================"
echo ""
printf "%-20s %-12s %-14s %-10s %s\n" "DIRECTORY" "SIZE" "PERMISSIONS" "OWNER" "GROUP"
echo "────────────────────────────────────────────────────────────────"

# ── For loop: iterate over each directory in the array ───────
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        LS_OUTPUT=$(ls -ld "$DIR" 2>/dev/null)
        PERMS=$(echo "$LS_OUTPUT" | awk '{print $1}')
        OWNER=$(echo "$LS_OUTPUT" | awk '{print $3}')
        GROUP=$(echo "$LS_OUTPUT" | awk '{print $4}')
        printf "%-20s %-12s %-14s %-10s %s\n" "$DIR" "$SIZE" "$PERMS" "$OWNER" "$GROUP"
    else
        printf "%-20s %s\n" "$DIR" "[ does not exist on this system ]"
    fi
done

echo "────────────────────────────────────────────────────────────────"
echo ""

# ── Section: Check Git-specific directories ───────────────────
echo "================================================================"
echo "  GIT-SPECIFIC DIRECTORY CHECK"
echo "================================================================"
echo ""
GIT_DIRS=("/usr/share/git-core" "/usr/lib/git-core" "/etc/gitconfig")

for GDIR in "${GIT_DIRS[@]}"; do
    if [ -e "$GDIR" ]; then
        LS_GIT=$(ls -ld "$GDIR" 2>/dev/null)
        GPERMS=$(echo "$LS_GIT" | awk '{print $1}')
        GOWNER=$(echo "$LS_GIT" | awk '{print $3}')
        echo "  Found: $GDIR"
        echo "    Permissions : $GPERMS"
        echo "    Owner       : $GOWNER"
    else
        echo "  Not found: $GDIR (Git may not be installed or path differs)"
    fi
    echo ""
done

# ── Section: Check current directory for a .git repository ───
echo "----------------------------------------------------------------"
echo "  Checking for .git repository in current directory..."
echo "----------------------------------------------------------------"

if [ -d ".git" ]; then
    echo ""
    echo "  A Git repository (.git/) exists in the current directory."
    GIT_SIZE=$(du -sh .git 2>/dev/null | cut -f1)
    GIT_PERMS=$(ls -ld .git | awk '{print $1}')
    echo "  .git/ size        : $GIT_SIZE"
    echo "  .git/ permissions : $GIT_PERMS"
    echo ""
    if [ -f ".git/HEAD" ]; then
        echo "  Current HEAD: $(cat .git/HEAD)"
    fi
else
    echo ""
    echo "  No .git/ directory found here."
    echo "  Run from inside a Git repository to see repository-specific info."
fi

echo ""
echo "================================================================"
echo "  End of Disk and Permission Auditor"
echo "================================================================"
