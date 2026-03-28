# The Open Source Audit: Git

**Course:** Open Source Software (NGMC) | VIT Bhopal University | AY 2025-26  
**Student:** Yash Mehta | Registration No. 24BCE10638  
**Email:** yash.24BCE10638@vitbhopal.ac.in  
**License:** GNU General Public License v2.0  
**Submission Date:** 24th March 2026  

---

## Table of Contents

- [Project Overview](#project-overview)
- [Report Summary](#report-summary)
- [Shell Scripts](#shell-scripts)
- [Prerequisites](#prerequisites)
- [How to Run](#how-to-run)
- [Project Structure](#project-structure)
- [References](#references)
- [License](#license)

---

## 💡 Project Overview

Software isn't just about code — it's about who owns the tools we use every day. This project is a deep dive into **Git**, the backbone of modern development. I didn't just want to look at the commands; I wanted to understand why Linus Torvalds built it in a ten-day "rage-code" session back in 2005, how the **GPL v2** license keeps it free, and why it still holds its own against proprietary tools like Perforce.

This repository has my full audit report and a set of **five Bash scripts** I wrote to get hands-on with Linux administration and automation — not just to complete an assignment, but because I genuinely wanted to see how the concepts played out in practice.

---

## Report Summary

**1. The "Rage-Code" Origins**  
Git wasn't born in a corporate boardroom — it was born out of a crisis. In 2005, the Linux kernel team suddenly lost access to BitKeeper (a proprietary VCS) after a licensing fallout. Instead of scrambling for an alternative, Linus Torvalds just... built one. In about ten days. He designed it to be fast, fully decentralized, and cryptographically solid. That emergency side project is now used by over 93% of professional developers worldwide.

**2. The GPL v2: A Shield for Freedom**  
Git stays free because it's legally "locked open" by the GNU General Public License v2. This isn't just fine print — it guarantees four fundamental rights: the freedom to run, study, modify, and share the code. The real magic is the copyleft clause. If someone improves Git, they have to share those improvements back with the community instead of quietly monetizing them.

**3. The Ethics of Open Infrastructure**  
Is it okay to build a billion-dollar business on top of free, community-made tools? This section gets into the complicated ethics of Microsoft's $7.5 billion acquisition of GitHub. It raises a question I kept coming back to: should the plumbing of the entire software industry be owned by a single company? My take is that our shared infrastructure needs to stay open — because if one vendor can pull the plug, that's a problem for everyone.

**4. How Git Lives on Linux**  
This is the "under the hood" part. It covers how Git handles permissions using the principle of least privilege, how it fits into the Linux ecosystem as a lightweight tool (not a heavy background service), and why its open, public security patches are a feature, not a liability. When everyone can audit a fix, the fix tends to actually be good.

**5. The Showdown: Git vs. Perforce**  
I put Git up against Perforce Helix Core — its biggest proprietary rival. Across cost, security, and avoiding vendor lock-in, Git wins most rounds. Perforce has a real niche for massive binary files (think AAA game assets), but for the vast majority of software projects, Git is simply the better, freer choice.

---

## Shell Scripts

I built these five scripts to handle the "heavy lifting" of system administration while tying the concepts back to the open-source philosophy behind them.

### **Script 1: System Identity & The Four Freedoms**  
Think of this as your machine's birth certificate. It pulls live data — kernel version, architecture, uptime — and prints a reminder of the four GPL freedoms that make Linux possible in the first place.  
* **Key Skills:** Command substitution, system variables, formatted shell output.

### **Script 2: The FOSS Package Inspector**  
A "smart" script that doesn't assume which Linux distro you're running. It auto-detects whether you have apt or dnf and checks if a given tool (like Git) is installed. It also drops a short "Philosophy Note" explaining why that package matters to the FOSS community.  
* **Key Skills:** Nested `if-else` logic, cross-distro command detection, `case` statements.

### **Script 3: Disk & Permission Auditor**  
Security starts with knowing who owns what. This script walks through critical system directories and prints a clean, aligned table of disk usage and file permissions. It also checks whether your current working directory is an active Git repository.  
* **Key Skills:** Bash arrays, `for` loops, column-aligned data formatting.

### **Script 4: The Smart Log Analyzer**  
System logs are noisy. This script takes a file and a keyword (like "error") and calculates exactly what percentage of lines match. If you point it at a bad path, it doesn't crash — it loops back and asks you to try again.  
* **Key Skills:** `while read` loops, integer arithmetic, command-line arguments (`$1`, `$2`).

### **Script 5: The Open Source Manifesto Generator**  
The most personal script in the bunch. It walks you through a short interactive interview about your values as a developer and then writes you a proper, personalized philosophy statement — saved as a `.txt` file under your username.  
* **Key Skills:** Interactive `read` prompts, input validation, file redirection (`>>`).

---

## Prerequisites

- A Linux operating system (Ubuntu, Debian, Fedora, Arch, openSUSE — any of them work)
- Bash shell
- Standard core utilities: `grep`, `awk`, `sed`, `df`, `ls`, `stat`, `uptime`, `whoami`, `date`

Nothing extra to install — everything needed ships with a standard modern Linux system.

---

## How to Run

Step 1 — Navigate to the project root and make all scripts executable.

Step 2 — Run each script using the `bash` command followed by the script path.

    Script 1 displays system identity and license information.
    Script 2 inspects the Git package installation on your system.
    Script 3 audits key system directories and Git-specific paths.
    Script 4 takes a log file path and a search keyword as arguments.
    Script 5 runs interactively and saves a manifesto text file on completion.

Detailed usage examples and argument descriptions are in the comments at the top of each script.

---

## Project Structure

    Linux_OSS_Git/
    |
    |-- sh_codes/
    |   |-- script1_system_identity.sh
    |   |-- script2_package_inspector.sh
    |   |-- script3_disk_permission_auditor.sh
    |   |-- script4_log_analyzer.sh
    |   |-- script5_manifesto_generator.sh
    |
    |-- project_report.pdf
    |-- README.md
    |-- LICENSE

---

## References

1. The GNU Project — The core "Free Software Definition" that started the whole movement.
2. Open Source Initiative (OSI) — A deep dive into the official "Open Source Definition" and licensing standards.
3. Eric S. Raymond — *The Cathedral and the Bazaar*, the essay that shaped how most people think about open-source development.
4. Git Source Repository — Looking at the official Git `COPYING` file and source code directly on GitHub.
5. Software Freedom Conservancy — Understanding the legal side of protecting and defending free software.
6. Git Reference Manual — The definitive documentation for every Git command and workflow.
7. SPDX License List — A comprehensive directory for identifying and comparing software licenses.
8. William Shotts — *The Linux Command Line*, my go-to for actually getting comfortable in the terminal.
9. GNU Bash Manual — The technical reference for understanding how Bash actually works under the hood.
10. Stack Overflow Developer Survey — 2023 industry data tracking the global adoption of Git.

---

## License

All shell scripts and report content in this project are licensed under the **GNU General Public License v2.0**.

Full license text: https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html

---

VIT Bhopal University | School of Computer Science and Engineering | Open Source Software (NGMC) | AY 2025-26
