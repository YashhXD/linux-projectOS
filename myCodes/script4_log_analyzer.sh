#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Yash Mehta | Reg: 24BCE10638
# Course: Open Source Software (NGMC) | VITyarthi
# Purpose: Read a log file line by line, count occurrences
#          of a keyword, and print a summary with the last
#          5 matching lines. Accepts arguments from command line.
# Usage:   bash script4_log_analyzer.sh /var/log/syslog error
#          bash script4_log_analyzer.sh /var/log/auth.log warning
#          bash script4_log_analyzer.sh               (interactive retry)
# ============================================================

# ── Command-line arguments ────────────────────────────────────\
LOGFILE=$1\
KEYWORD=${2:-"error"}

# ── Counters (integer variables) ──────────────────────────────
TOTAL_LINES=0
MATCH_COUNT=0

# ── Validate: ensure a log file argument was provided ─────────
if [ -z "$LOGFILE" ]; then
    echo "================================================================"
    echo "  ERROR: No log file specified."
    echo "  Usage: $0 /path/to/logfile [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    echo "================================================================"
    exit 1
fi

# ── do-while style retry loop ─────────────────────────────────
MAX_RETRIES=2
RETRY=0

while [ ! -f "$LOGFILE" ] || [ ! -r "$LOGFILE" ]; do
    RETRY=$((RETRY + 1))
    echo ""
    echo "  [WARNING] File not found or not readable: $LOGFILE"
    if [ $RETRY -ge $MAX_RETRIES ]; then
        echo "  [ERROR] Maximum retries exceeded. Exiting."
        echo ""
        echo "  TIP: Try using /var/log/syslog or creating a test file:"
        echo "       echo 'test error line' > /tmp/test.log"
        echo "       bash $0 /tmp/test.log error"
        exit 1
    fi
    echo "  Please enter a valid log file path (attempt $RETRY of $MAX_RETRIES):"
    read -r LOGFILE
done

# ── Display header ────────────────────────────────────────────
echo ""
echo "================================================================"
echo "  LOG FILE ANALYZER"
echo "  File    : $LOGFILE"
echo "  Keyword : '$KEYWORD' (case-insensitive search)"
echo "================================================================"
echo ""
while IFS= read -r LINE; do
    TOTAL_LINES=$((TOTAL_LINES + 1))
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        MATCH_COUNT=$((MATCH_COUNT + 1))
    fi

done < "$LOGFILE"

# ── Print summary results ─────────────────────────────────────
echo "  SUMMARY"
echo "  ─────────────────────────────────────────────────────────────"
echo "  Total lines in file      : $TOTAL_LINES"
echo "  Lines matching '$KEYWORD' : $MATCH_COUNT"
if [ "$TOTAL_LINES" -gt 0 ]; then
    PERCENT=$(( (MATCH_COUNT * 100) / TOTAL_LINES ))
    echo "  Match percentage         : ${PERCENT}%"
else
    echo "  The file appears to be empty."
fi

echo ""
echo "  LAST 5 MATCHING LINES"
echo "  ─────────────────────────────────────────────────────────────"
LAST_MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" 2>/dev/null | tail -5)

if [ -z "$LAST_MATCHES" ]; then
    echo "  (No lines matching '$KEYWORD' were found in the file)"
else
    echo "$LAST_MATCHES" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
fi

echo ""
echo "================================================================"
echo "  End of Log File Analyzer"
echo "================================================================"
