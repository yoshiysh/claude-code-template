#!/bin/bash

# Simple continuation check
# If there's no completion phrase, prompt to "resume work"
#
# The completion phrase is a standard completion phrase defined in CLAUDE.md
# Details: Refer to "Work completion reporting rules" in ~/.claude/CLAUDE.md

COMPLETION_PHRASE="May the Force be with you."

# Read JSON passed from stop hook
input_json=$(cat)

# Extract transcript_path
transcript_path=$(echo "$input_json" | jq -r '.transcript_path // empty')

if [ -n "$transcript_path" ] && [ -f "$transcript_path" ]; then
  # Get the entire last message (including error messages)
  last_entry=$(tail -n 1 "$transcript_path")

  # For debugging (enable if needed)
  # echo "Debug: last_entry=$last_entry" >&2

  # Get assistant message text
  last_message=$(echo "$last_entry" | jq -r '.message.content[0].text // empty' 2>/dev/null || echo "")

  # Check various possibilities for error fields
  error_message=$(echo "$last_entry" | jq -r '.message.error // .error // empty' 2>/dev/null || echo "")

  # Check the entire message as a string (regardless of JSON structure)
  full_entry_text=$(echo "$last_entry" | jq -r '.' 2>/dev/null || echo "$last_entry")

  # Check for Claude usage limit reached (multiple methods)
  if echo "$error_message" | grep -qi "usage limit" ||
    echo "$last_message" | grep -qi "usage limit" ||
    echo "$full_entry_text" | grep -qi "usage limit"; then
    # Do nothing for usage limit errors (normal exit)
    exit 0
  fi

  # Detect other error patterns
  if echo "$error_message" | grep -qi "network error\|timeout\|connection refused" ||
    echo "$full_entry_text" | grep -qi "network error\|timeout\|connection refused"; then
    # Do nothing for network errors (normal exit)
    exit 0
  fi

  # Detect /compact related patterns (treat as error messages)
  if echo "$error_message" | grep -qi "Context low.*Run /compact to compact" ||
    echo "$full_entry_text" | grep -qi "Context low.*Run /compact to compact"; then
    # Do nothing for /compact related messages (normal exit)
    exit 0
  fi

  # Detect repetitive patterns of Stop hook feedback
  if echo "$last_message" | grep -qi "Stop hook feedback" &&
    echo "$last_message" | grep -qi "resume work"; then
    # Do nothing for repetitive Stop hook feedback patterns (normal exit)
    exit 0
  fi

  # Plan presentation related pattern check (fix: continue if approved)
  if echo "$last_message" | grep -qi "User approved Claude's plan" ||
    echo "$full_entry_text" | grep -qi "User approved Claude's plan"; then
    # Plan approved → continue work (don't block)
    exit 0
  fi

  # When confirmation is required with y/n
  if echo "$last_message" | grep -qi "y/n" ||
    echo "$full_entry_text" | grep -qi "y/n"; then
    # Plan approved → continue work (don't block)
    exit 0
  fi

  # Check /spec related work patterns
  if echo "$last_message" | grep -qi "spec" ||
    echo "$last_message" | grep -qi "spec-driven" ||
    echo "$last_message" | grep -qi "requirements\.md\\|design\.md\\|tasks\.md"; then
    # Don't prompt continuation during /spec related work (normal exit)
    exit 0
  fi

  # Check completion phrase
  if echo "$last_message" | grep -q "$COMPLETION_PHRASE"; then
    # Do nothing if completion phrase exists (normal exit)
    exit 0
  fi
fi

# Prompt continuation if no completion phrase
cat <<EOF
{
  "decision": "block",
  "reason": "Please resume work.\n  If there is no work to continue, output \`$COMPLETION_PHRASE\` and exit."
}
EOF
