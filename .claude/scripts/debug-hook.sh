#!/bin/bash
set -euo pipefail

# Hook debugging script
LOG_FILE="/tmp/claude-hook-debug.log"

# Initialize log file
if [[ ! -f "$LOG_FILE" ]]; then
    touch "$LOG_FILE"
    chmod 644 "$LOG_FILE"
fi

# Log output
echo "Hook executed at $(date)" >> "$LOG_FILE"
echo "Input data:" >> "$LOG_FILE"
cat >> "$LOG_FILE"
echo "---" >> "$LOG_FILE"
