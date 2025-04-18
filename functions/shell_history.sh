#!/bin/bash

search_shell_history() {
  local HIST_FILE="${HISTFILE:-$HOME/.zsh_history}"

  [ -f "$HIST_FILE" ] || { echo "❌ No shell history file found."; return 1; }

  cat "$HIST_FILE" | fzf --reverse --prompt="⌨️ Shell History: " | pbcopy
  echo "✅ Command copied to clipboard!"
}
